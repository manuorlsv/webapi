using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using webapi.Models;

namespace webapi.Controllers
{
    [Route("api/[controller]/[Action]")]
    public class ExecuteController : ControllerBase
    {
        private readonly DBContext _dbContext;
        public IConfiguration Configuration { get; }

        string sql = "";

        public ExecuteController(DBContext dbContext, IConfiguration configuration)
        {
            _dbContext = dbContext;
            Configuration = configuration;
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
