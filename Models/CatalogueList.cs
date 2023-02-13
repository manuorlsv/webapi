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

}
