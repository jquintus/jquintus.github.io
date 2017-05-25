using System;

namespace Interceptors
{
    [Disposable]
    public abstract class ADisposable : IDisposable
    {
        public ADisposable()
        {
            IsDisposed = false;
        }

        ~ADisposable()
        {
            Dispose(false);
        }

        internal bool IsDisposed { get; private set; }

        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }

        protected abstract void OnDispose();

        private void Dispose(bool disposing)
        {
            if (IsDisposed) return;

            if (disposing)
            {
                OnDispose();
            }

            IsDisposed = true;
        }
    }
}