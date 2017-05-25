using Ninject;
using Ninject.Extensions.Interception.Infrastructure.Language;
using System;

namespace Interceptors
{
    public class Program
    {
        public static void Main(string[] args)
        {
            TestResolvingInterface();

            Console.WriteLine();

            TestResolvingConcreteClass();
        }

        private static void TestResolvingConcreteClass()
        {
            Console.WriteLine("Testing resolving a Concrete Class from the Ninject Kernel");
            using (var kernel = new StandardKernel())
            {
                kernel.Bind<MyService>().ToSelf().Intercept();

                MyService service = kernel.Get<MyService>();

                TestService(service);
            }
        }

        private static void TestResolvingInterface()
        {
            Console.WriteLine("Testing resolving an Interface from the Ninject Kernel");
            using (var kernel = new StandardKernel())
            {
                kernel.Bind<ISomeService>().To<MyService>();

                ISomeService service = kernel.Get<ISomeService>();

                TestService(service);
            }
        }

        private static void TestService(ISomeService service)
        {
            // Prints out "ISomeServiceProxy" or "MyServiceProxy"
            Console.WriteLine("    " + service.GetType().Name);

            // Prints out "Hello World"
            service.SomeMethod("    Hello World");

            // Prints out "Disposing MyService"
            service.Dispose();

            try
            {
                // If you see this print out, the interceptor wasn't called
                service.SomeMethod("    Failure.  Public method called after dispose was called");
            }
            catch (ObjectDisposedException odex)
            {
                Console.WriteLine(odex.Message);
            }
        }
    }
}