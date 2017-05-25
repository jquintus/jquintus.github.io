using System;

namespace Interceptors
{
    public class MyService : ADisposable, ISomeService
    {
        public void SomeMethod(string msg)
        {
            Console.WriteLine(msg);
        }

        protected override void OnDispose()
        {
            Console.WriteLine("Disposing MyService");
        }
    }
}