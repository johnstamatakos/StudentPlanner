using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(StudentPlanner.Startup))]
namespace StudentPlanner
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
