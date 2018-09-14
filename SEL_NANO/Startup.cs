using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(SEL_NANO.Startup))]
namespace SEL_NANO
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
