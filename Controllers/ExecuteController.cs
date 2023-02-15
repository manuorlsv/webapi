using System;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Newtonsoft.Json;

using System.Collections.Generic;
using System.Dynamic;
using webapi.Helpers;
using webapi.Models;


namespace webapi.Controllers
{
    [Route("api/[controller]/[Action]")]
    [ApiController]
    public class ExecuteController : ControllerBase
    {
        private readonly DBContext _dbContext;
        public IConfiguration Configuration { get; }

        string sql = "";
        SecurityEncrypt enc = new SecurityEncrypt();

        public ExecuteController(DBContext dbContext, IConfiguration configuration)
        {
            _dbContext = dbContext;
            Configuration = configuration;
        }

        [HttpPost]
        public string Login(RequestLogin datos)
        {
            string result = "";
            string resultnames = null;
            ResponseLogin response = new ResponseLogin();
            try
            {
                if (String.IsNullOrEmpty(datos.user) || String.IsNullOrEmpty(datos.password))
                {
                    result = LoginError(401, "User or password invalid");
                }
                else
                {

                    // se contruye la query
                    sql = "exec [dbo].[Login] ";
                    sql += "@usuario= '" + datos.user + "',@pass = '" + datos.password + "',@devicename = '" + datos.cdeviceName + "'";
                    sql += ",@deviceOSVersion = '" + datos.deviceOSVersion + "',@DeviceOS = '" + datos.cDeviceOS + "',@appVersion = '" + datos.appVersion + "'";
                    //extrae los nombres que se desea coloar a las tablas de resultado

                    if (datos.alias != null)
                    {
                        if (datos.alias.Length > 0 || datos.alias.Trim() != "") resultnames = datos.alias;
                    }


                    var results = multipleresult(sql, true, resultnames);
                    if (results.Count > 0)
                    {
                        result = JsonConvert.SerializeObject(results);
                        var lista = (List<Dictionary<string, Object>>)results[0]["Result0"];

                        foreach (var item in lista)
                        {
                            var resp = new ResponseLogin()
                            {
                                name = item["name"].ToString(),
                                ObjectId = item["ObjectId"].ToString(),
                                empleado = item["empleado"].ToString(),
                                email = item["email"].ToString(),
                                urlimagen = item["urlimagen"].ToString(),
                                endpoint = item["endpoint"].ToString(),
                                mUserId = int.Parse(item["mUserId"].ToString()),
                                cUserId = int.Parse(item["cUserId"].ToString()),
                            };
                            response = resp;


                            var tok = new Token()
                            {
                                mUserId = int.Parse(item["mUserId"].ToString()),
                                cUserId = int.Parse(item["cUserId"].ToString()),
                                cDeviceOS = item["cDeviceOS"].ToString(),
                                deviceOSVersion = item["cDeviceOSVersion"].ToString(),
                                UUID = item["UUID"].ToString(),
                                currentTime = DateTime.Parse(item["currentTime"].ToString()),
                                expiresOn = DateTime.Parse(item["expiresOn"].ToString())
                            };
                            response.Token = enc.Encrypt(JsonConvert.SerializeObject(tok));
                        }
                        result = JsonConvert.SerializeObject(response);

                    }
                    else
                    {
                        result = "[{\"Result\": \"no data\"}]";
                    }
                }
            }
            catch (Exception ex)
            {
                if (ex.Message.ToString().Contains("User or password is incorrect.") || ex.Message.ToString().Contains("Tenant does not exist.") ||
                    ex.Message.ToString().Contains("Unknown error:") || ex.Message.ToString().Contains("ContactId does not exist."))
                    result = LoginError(401, ex.Message.ToString());
                else
                    result = LoginError(500, ex.Message.ToString());
            }
            return result;
        }

        private string LoginError(int code, string message)
        {

            string respuesta = "{\"Code\': " + code + ", \"Message\" : " + message + "}";
            return respuesta;
        }

        [HttpPost]
        public string Post(Parameters param)
        {
            string resultado = "";
            string resultnames = null;
            try
            {
                // se contruye la query
                sql = "exec [dbo].[sp_execute_tsql] ";
                sql += "@tenantId = '" + param.ObjectId + "',@sp_name = '" + param.source + "',@parameters ='" + param.filters + "'";


                //get the names that you want to give to each result
                if (param.alias != null)
                {
                    if (param.alias.Length > 0 || param.alias.Trim() != "") resultnames = param.alias;
                }

                //var result = ListConexion(sql);
                var result = multipleresult(sql, true, resultnames);
                if (result.Count > 0)
                {
                    resultado = JsonConvert.SerializeObject(result);

                    resultado = resultado.Substring(1, resultado.Length - 1);
                    resultado = resultado.Remove(resultado.Length - 1);
                }
                else
                {
                    resultado = "{\"Result\": \"no data\"}";
                }
            }
            catch (Exception ex)
            {
                resultado = "{\"Error\": \"" + ex.Message + "\"}";
            }
            return resultado;
        }


        #region Conexion
        public List<Dictionary<string, Object>> multipleresult(string query, bool retorna, string resultnames = null)
        {
            var cmd = _dbContext.Database.GetDbConnection().CreateCommand();// crea la opcion para agregarle el comando
            List<Dictionary<String, Object>> items = new List<Dictionary<String, Object>>();
            cmd.CommandText = query; // asigna el sql a ejecutar
            string[] tablas = null;
            if (resultnames != null)
                tablas = resultnames.Split(',');

            try
            {
                if (retorna)
                {
                    _dbContext.Database.GetDbConnection().Open();
                    cmd.CommandText = query;
                    var reader = cmd.ExecuteReader();

                    int c = 0;
                    do // para n tablas 
                    {
                        List<Dictionary<string, Object>> table = new List<Dictionary<String, Object>>();
                        while (reader.Read())
                        {
                            Dictionary<string, Object> item = new Dictionary<String, Object>();
                            for (int i = 0; i < reader.FieldCount; i++)
                                if (!item.ContainsKey(reader.GetName(i))) item.Add(reader.GetName(i), reader[i]);

                            table.Add(item);
                        }

                        Dictionary<string, object> result = new Dictionary<string, object>();
                        if (tablas != null && tablas.Length > 0)
                        {
                            try
                            {
                                result.Add(tablas[c], table);
                            }
                            catch
                            {
                                result.Add("Result" + c, table);
                            }

                        }
                        else
                        {
                            result.Add("Result" + c, table);
                        }


                        items.Add(result);
                        c++;
                    } while (reader.NextResult());

                    _dbContext.Database.GetDbConnection().Close();
                }
                else
                {
                    //ejecuta una sentencia insert, update o delete
                    _dbContext.Database.GetDbConnection().Open();
                    int result = cmd.ExecuteNonQuery();
                    Dictionary<string, Object> item = new Dictionary<String, Object>();
                    item.Add("total", result);
                    items.Add(item);
                    _dbContext.Database.GetDbConnection().Close();
                }
            }
            catch (Exception Err)
            {
                //aqui poner el webapi de mails
                _dbContext.Database.GetDbConnection().Close();
            }
            return items;
        }
#endregion
    }
}
