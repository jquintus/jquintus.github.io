using Ninject;
using Ninject.Extensions.Interception;
using Ninject.Extensions.Interception.Attributes;
using Ninject.Extensions.Interception.Request;
using System;

namespace Interceptors
{
    [AttributeUsage(AttributeTargets.Class)]
    public class DisposableAttribute : InterceptAttribute
    {
        public override IInterceptor CreateInterceptor(IProxyRequest request)
        {
            return request.Kernel.Get<DisposableInterceptor>();
        }
    }
}