using System;

namespace Interceptors
{
    public interface ISomeService : IDisposable
    {
        void SomeMethod(string msg);
    }
}