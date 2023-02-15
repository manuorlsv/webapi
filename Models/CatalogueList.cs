using System;

namespace webapi.Models
{
    public class Parameters
    {
        public string ObjectId { set; get; } //tenant
        public string token { set; get; } //encrytado para convertir en la clase token
        public string source { set; get; }// sp
        public dynamic filters { set; get; }
        public string alias { set; get; }// alias para cada tabla  cada resultado separado por comas
    }

    public class RequestLogin
    {
        public string user { get; set; }
        public string password { get; set; }
        public string cdeviceName { get; set; }//chrome,mozila ,appandroid,appios
        public string cDeviceOS { get; set; } // windows,android,ios
        public string deviceOSVersion { get; set; } // version del navegador , version android o version ios
        public string appVersion { get; set; } // version del software, version app android , ios
        public string alias { set; get; } // alias para cada tabla  cada resultado separado por comas
    }

    public class ResponseLogin
    {
        public string name { get; set; }
        public string ObjectId { get; set; } // Base de datos del cliente
        public string empleado { get; set; }
        public string email { set; get; }
        public string urlimagen { set; get; }
        public string endpoint { get; set; }  // dado caso se conecte a otros endpoint 
        public Nullable<int> mUserId { get; set; }// master user id
        public Nullable<int> cUserId { get; set; }//client user id
        public string Token { set; get; }

    }

    public class Token
    {
        public Nullable<int> mUserId { get; set; }// master user id
        public Nullable<int> cUserId { get; set; }//client user id
        public string cdeviceName { get; set; } //npi
        public string cDeviceOS { get; set; } // web(),android,ios
        public string deviceOSVersion { get; set; } // version del navegador , version android o version ios
        public string UUID { get; set; } // unico retornado por la database // cambia al momento de loguearse si no coincide con el de la base local es porque se ha logueado en otra parte (caso mobiles)
        public Nullable<DateTime> currentTime { get; set; } // momento en el que se hizo la peticion
        public Nullable<DateTime> expiresOn { get; set; }  // momento en el que vence el uuid y requerira loguearse nuevamente 

    }

}
