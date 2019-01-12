---
layout: post
source: 2017-05-24-Interceptors
disqus_identifier: #2
comments: true
categories: 
  - .net 
  - code 
  - ninject 
  - c# 
  - dependency injection 
  - IoC
---

* [Background](#background)
* [Walkthrough](#walkthrough)
    * [ADisposable](#adisposable)
    * [DisposableAttribute](#disposableattribute)
    * [DisposableInterceptor](#disposableinterceptor)
    * [Resolving an Interface](#resolving-an-interface)
    * [Resolving a Concrete Class](#resolving-a-concrete-class)
* [Summary](#summary)

## Background

Okay, so I don't really know why I'd use this, but I just came across [Ninject.Extensions.Interception](https://github.com/ninject/Ninject.Extensions.Interception).  Basically it allows you to intercept an arbitrary method call and run code before and after the call.  Even replace the method entirely.  

You could use this to achieve many things you would use [Aspect Oriented Programming](https://en.wikipedia.org/wiki/Aspect-oriented_programming) to do.  Post Sharp has a [great breakdown](http://www.postsharp.net/blog/post/Anders-Hejlsberg-Dead-Body) on what those use cases are and why it's a valid approach to solving certain problems.  

The canonical use case for this is the ability to easily add logging when you enter and exit a method.

For example, the following code would log all calls to the `SomeSuperImportantMehod`

```csharp
[LogAllMethods]
public class CanonicalLogging
{
  public virtual int SomeSuperImportantMehod(string input, int maxItems)
  {
    return CalcualteReallyImportantThing(input, maxItems);
  }
}
```

And here's an example of what the output could be

```
2017-05-05 13:45:54.64723 CanonicalLogging.SomeSuperImportantMehod called with parameters:  {input:  "Hello World", maxItems: 34 }
2017-05-05 13:56:56.94949 CanonicalLogging.SomeSuperImportantMehod returned "42" after running for 11:02:30226
```

## Walkthrough

For the example I'm going to build an implementation of the [Dispose Pattern](https://msdn.microsoft.com/en-us/library/b1yfkh5e(v=vs.110).aspx) with a base class that will handle all of the actual disposing logic.  I'll use a custom interceptor to ensure that once my objec thas been disposed all future calls to it will throw an `ObjectDisposedException`. 

To get started you first need to be using [Ninject](http://www.ninject.org/).  I'm going to assume you have a bit of a background with Ninject.  Just in case you don't, the quick version is that it's a .Net IoC container.  Basically that means that after doing a little configuration you can ask it for an instance of any type you want and it will give it to you, creating it and its dependencies if it needs to.

Another thing to be aware of is that there are two options, either use [LinFu](https://github.com/philiplaureano/LinFu) or [CastleCore](http://www.castleproject.org/) for the proxy generation.  As far as I can tell, this decision doesn't really impact much.  Just pick whichever framework you like, or one at random.  I already use CastleCore in other projects (the [Ninject factory extension](https://github.com/ninject/Ninject.Extensions.Factory) depends on it), so I'm going with that one. 

```posh
Install-Package Ninject.Extensions.Interception.DynamicProxy
```

### ADisposable

Next I'll create the base `ADisposable` that all of my custom disposable objects will inherit from.

```csharp
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

```

There two things worth pointing out here.  First, the internal `IsDisposed` property.  This will be used by our interceptor later to determine if the object has been disposed.  The other thing worth noting is the `Disposable` attribute.  That's a custom attribute I defined.  It inherits from `Ninject.Extensions.Interception.Attributes.InterceptAttribute`.  This is the first step into using interceptors, so let's take a look.

### DisposableAttribute

```csharp
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
```

There's only one method that we have to worry about `CreateInterceptor`.  This just lets the system know what interceptor to use when creating the implementation of ADisposable.  You can see here that I added the AttributeUsage to specifically target only classes.  Be default InterceptAttributes can be put on anything, although they really only make sense on method (including properties) and class definitions.  When the attribute is placed on the class, it impacts all of the methods.  In fact there is a neat `DoNotIntercept` attribute that you can use to exclude certain methods from the class wide interceptor.

In my example, I used the request to get an instance of the Kernel so I could resolve the interceptor I wanted.  That was mostly just to illustrate that you can get a hold of the kernel.  In this instance, I could have just as easily newed up the DisposableInterceptor.  Speaking of which, DisposableInterceptor is where the most interesting code is.  We'll look at that next.

### DisposableInterceptor

```csharp
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
```

It inherits from `SimpleInterceptor` and overrides `BeforeInvoke`.  As you may guess, there's an `AfterInvoke` as well.  If you wanted to, you could set the return value of the method by setting `invocation.ReturnValue` in `BeforeInvoke`.  Or in `AfterInvoke` you could check to see if it's within certain limits.

Anyway, in this example all I care about is overriding `BeforeInvoke` to check if 
1. The instance being invoked is an instance of ADisposable
1. The method being called is public (no need to worry about private methods being called since they'd have to be called from public ones to begin with)
1. If the instance had already been disposed.

In order to do all of those things, I just need to inspect sub-properties of the passed in instance of `IInvocation`.  If all of those things are true, then we just throw an exception.  

Now that we see the interception code is straight forward, let's put it all together so that we can use it.

### Sample Service

```csharp
public interface ISomeService : IDisposable
{
    void SomeMethod(string msg);
}

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
```

The first thing to look at is the sample service interface and implementation.  `ISomeService` is just a simple interface that inherits from IDisposable and has a single method to implement.  `MyService` inherits from `ADisposable` and `ISomeService` and pretty much does the minimum it needs to do to implement them.

Notice though that neither of them are aware of either Ninject or any of the interceptors.  They are [bog standard](http://www.bbc.co.uk/worldservice/learningenglish/radio/specials/1728_uptodate/page25.shtml) C# classes.

### Resolving an Interface

```csharp
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
    Console.WriteLine("    " + service.GetType().Name); // Prints out "ISomeServiceProxy"
    service.SomeMethod("    Hello World");
    service.Dispose();

    try
    {
        service.SomeMethod("    This call should fail");
    }
    catch (ObjectDisposedException odex)
    {
        Console.WriteLine(odex.Message);
    }
}
```

In the first method, `TestResolvingInterface`, we do some very standard Ninject setup.  Create a standard kernel, add some bindings, and then resolve our interface.  Again, none of this is even aware of the interceptors. Ninject picked up on it from the attribute and that was enough.

The output for this is:

```
Testing resolving an Interface from the Ninject Kernel
    ISomeServiceProxy
    Hello World
Disposing MyService
SomeMethod called after object was disposed
Object name: 'MyService'.
```

You'll notice that `service` is an instance of `ISomeServiceProxy`, not `MyService`.  Ninject wrapped our instance of `MyService`, adding the extra functionality to the proxy without actually impacting our class.

You'll also see that the second call to `SomeMethod` does indeed fail with an `ObjectDisposedException`.  

### Resolving a Concrete Class

Now that worked all well and good.  But what if we resolved just a class instead of an interface?  Well that's where this starts to break down as we'll see in the code below.

```csharp
private static void TestResolvingConcreteClass()
{
    Console.WriteLine("Testing resolving a Concrete Class from the Ninject Kernel");
    using (var kernel = new StandardKernel())

    {
        MyService service = kernel.Get<MyService>();
        TestService(service);
    }
}

private static void TestService(ISomeService service)
{
    Console.WriteLine("    " + service.GetType().Name); // Prints out "MyServiceProxy"
    service.SomeMethod("    Hello World");
    service.Dispose();

    try
    {
        service.SomeMethod("    This call should fail");
    }
    catch (ObjectDisposedException odex)
    {
        Console.WriteLine(odex.Message);
    }
}
```

So now we're resolving a `MyService` directly and passing it to the same test function as the previous example.  Let's look at the output.

```
Testing resolving a Concrete Class from the Ninject Kernel
    MyServiceProxy
    Hello World
Disposing MyService
    This call should fail
```

We're getting a proxy wrapping our class again (`MyServiceProxy`), which is a good sign, but then we see that the second call to `SomeMethod` actually succeeds.  Why is this?

This is probably the biggest caveat in the entire thing.  The interceptors can only impact virtual methods.  Interface methods are by nature virtual so they are no problem.  But when it comes to concrete classes, unless the method is explicislty marked as `abstract` or `virtual` it can't touch them.  As I mentioned above, Ninject is dynamically creating an implementation of the requested object with custom implementations of all the methods.  If `MyService` had been sealed, Ninject would have thrown a `TypeLoadException` when it was resolved because it couldn't subclass the type.  

## Summary

As mentioned above, the major caveat is that it **only** works with virtual methods.  If you always use interfaces, then you will be just fine, but if you don't the interceptors will silently fail to be called.

Other than that, this is a pretty easy to use tool that can provide a lot of power.  Another obvious use case for this is automating INotifyPropertyChanged.  It's so obvious that it comes premade.  Just check out the `NotifyOfChanges` attribute.

