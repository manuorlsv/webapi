using Microsoft.EntityFrameworkCore;

namespace webapi.Models
{
    public class DBContext : DbContext
    {
        public DBContext(DbContextOptions<DBContext> options) : base(options) { }
    }
}
