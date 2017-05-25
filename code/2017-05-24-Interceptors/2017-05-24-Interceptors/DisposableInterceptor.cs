using Ninject.Extensions.Interception;
using System;

namespace Interceptors
{
    public class DisposableInterceptor : SimpleInterceptor
    {
        protected override void BeforeInvoke(IInvocation invocation)
        {
            base.BeforeInvoke(invocation);

            var disposable = invocation.Request.Target as ADisposable;

            if (disposable != null && invocation.Request.Method.IsPublic)
            {
                if (disposable.IsDisposed)
                {
                    string methodName = invocation.Request.Method.Name;
                    throw new ObjectDisposedException(disposable.GetType().Name, $"{methodName} called after object was disposed");
                }
            }
        }
    }
}