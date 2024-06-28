using Repository.Interfaces;
using Repository;
using BussinesLogic.Interfaces;
using BussinesLogic;

namespace services
{
    public static class ServiceExtensions
    {
        public static void ConfigureRepositoryManager(this IServiceCollection services, string connectionString)
        {
            services.AddScoped<IRutaRepository, RutaRepository>();
            services.AddScoped<IReservaRepository, ReservaRepository>();
        }

        public static void ConfigureServicesManager(this IServiceCollection services)
        {
            services.AddScoped<IRutaBL, RutaBL>();
            services.AddScoped<IReservaBL, ReservaBL>();
        }
    }
}
