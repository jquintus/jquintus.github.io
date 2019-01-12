---
layout: post
disqus_identifier: #34
comments: true
categories: 
  - coding
---

These are the general rules and guidelines I use when developing.  As
with most rules, there are exceptions to all of these.

## Code Quality

1. Prefer composition over inheritance 
1. Small classes and small methods. Anything over 30 lines for a method
  is a smell, over 100 is a NO 
1. Pay attention to code readability. It's been pointed out before, but
  other developers will have to read your code.  And "other
  developers" includes you in 3 months.  You are writing for them, not
  for the compiler.  If they can't understand what's going on, you
  haven't done your job.
1. Comments get out of date very quickly so only add them in cases
  where they bring true value, as opposed to making them a supplement
  for code that has poor readability.  This typically means that you
  shouldn't  be commenting on what your code does.  Whoever is reading
  it should already know what it does.  Comments should elucidate why
  your code is doing what it does.  You may have had to write the code
  in a non-obvious way to avoid a bug.  Explain that.

## C# Coding Style

For most of my career I've been a C# developer. So my more specific
rules apply to that.  Despite that, many of them can be generalized to
other domains.  These rules were adapted and inspired from the [corefx
project](https://github.com/dotnet/corefx/blob/master/Documentation/coding-guidelines/coding-style.md),
the general rule is "use Visual Studio defaults".  

For non code files (XML, JSON, etc.) my best guidance is consistency.
When editing files, keep new code and changes consistent with the
style in the files. For new files, it should conform to the style for
that component. 

1. Use [Allman style](http://en.wikipedia.org/wiki/Indent_style#Allman_style) braces, where each brace begins on a new line. A single line statement block can go without braces but the block must be properly indented on its own line and it must not be nested in other statement blocks that use braces (See issue [#381](https://github.com/dotnet/corefx/issues/381) for examples -- read the resolution, not just the first comment).
1. Use four spaces of indentation.  No tabs.  Never tabs.
1. Use `_camelCase` for internal and private fields and use `readonly` wherever possible.  Prefix instance fields with `_`.  When used on static fields, `readonly` should come after `static` (i.e. `static readonly` not `readonly static`).  
1. Avoid `this.` unless absolutely necessary. 
1. Always specify the visibility, even if it's the default (i.e.  `private string _foo` not `string _foo`). Visibility should be the first modifier (i.e.  `public abstract` not `abstract public`).
1. Namespace imports should be specified at the top of the file, *outside* of `namespace` declarations and should be sorted alphabetically.
1. Avoid more than one empty line at any time. For example, do not have two blank lines between members of a type.
1. Avoid spurious free spaces.  For example avoid `if (someVar == 0)...`, where the dots mark the spurious free spaces.  Consider enabling "View White Space (Ctrl+E, S)" if using Visual Studio, to aid detection.
1. Use language keywords instead of BCL types (i.e. `int, string, float` instead of `Int32, String, Single`, etc) for both type references as well as method calls (i.e. `int.Parse` instead of `Int32.Parse`).  See issue [#391](https://github.com/dotnet/corefx/issues/391) for examples.
1. Use ALL_CAPS to name all constant local variables and fields. The only exception is for interop code where the constant value should exactly match the name and value of the code you are calling via interop.
1. Use ```nameof(...)``` instead of ```"..."``` whenever possible and relevant.
1. Fields should be specified at the top within type declarations.
1. When including non-ASCII characters in the source code use Unicode escape sequences (`\uXXXX`) instead of literal characters. Literal non-ASCII characters occasionally get garbled by a tool or editor.
1. One class per file.  When we have a generic and non-generic definition of a _simple_ class, they can be in defined in the same file.
1. Member fields must be private (who creates public fields anyway?)
1. CamelCasing of all variable and method names; methods and properties start with a capital
1. Avoid #regions
    * Specifically included
        * Regions around common sections of code.  e.g. regions around all fields or properties
    * Exceptions
        * Regions around particularly long constants or literals
        * Regions around auto-generated code
1. Only capitalize the first letter in an abbreviation/initialization when using it in a name. For example: 
    * `DbPool()` ✔️ 
    * `DBPool()` ❌ 
1. Partial classes: you need to have a very good reason to use a partial class.  Tool generated code is one of them.
1. Avoid multiple returns from a single method unless it is very clear.
1. Avoid multiple escape routes from a loop, i.e., excessive use of `break` or `continue`
1. Avoid `while(true)`
1. Avoid structuring code so that it requires casting; consider generics instead.  For example, you have a method that calls another method which returns an instance of an interface.  If you need to cast that returned value to a specific class, then you have made a design mistake.  [Example below](#bad-casting)
1. Do not use [ApplicationException](https://docs.microsoft.com/en-us/dotnet/api/system.applicationexception)
1. Implement the [common constructors](https://docs.microsoft.com/en-us/dotnet/standard/exceptions/how-to-create-user-defined-exceptions) when making a user-defined excption
1. Do not use `goto`

### Example of braces on single line statement blocks

✔️  **GOOD**

```csharp
if (isFriday) Dance();

// OR

if (isFriday)
{
    Dance();
}  
```

❌  **NEVER THIS** 

```csharp
if (isFriday)
    Dance();
```

## Order of items in a class

Note: [Codemaid](http://visualstudiogallery.msdn.microsoft.com/76293c4d-8c16-4f4a-aee6-21f83a571496) will do this automatically using CTRL + M then space

In a given class sort by:

- First the type of item
    - Constants
    - Fields
    - Constructors
    - Events
    - Properties
    - Methods
- Then by accessibility
    - public
    - internal
    - protected Internal
    - protected
    - private
- Then statics vs instance
    - static 
    - instance
- Then alphabeticly

## Bad Casting

❌ **This first version forces the caller to cast**

```csharp
public interface ISomeInterface { }

public class SpecificInstance : ISomeInterface
{
    public string Name {get; set;}
}

public interface IReturnAnInterface
{
    ISomeInterface GetInterface();
}

public class ReturnASpecifcInstance : IReturnAnInterface
{
    public ISomeInterface GetInterface()
    {
        return new SpecificInstance() { Name = "MyName" };
    }
}

public void BadCasting(IReturnAnInterface factory)
{
    ISomeInterface instance = factory.GetInterface();
    OtherMethod(((SpecificInstance) instance).Name);
}
```

✔️ **Using generics allows us to avoid the cast**

```csharp
public interface ISomeInterface { }

public class SpecificInstance : ISomeInterface
{
    public string Name {get; set;}
}

public interface IReturnAnInterface<T> where T:ISomeInterface
{
    T GetInterface();
}

public class ReturnASpecifcInstance : IReturnAnInterface<SpecificInstance>
{
    public SpecificInstance GetInterface()
    {
        return new SpecificInstance() { Name = "MyName" };
    }
}

public void NoNeedForCast(IReturnAnInterface<SpecificInstance> factory)
{
    SpecificInstance instance = factory.GetInterface();
    OtherMethod(instance.Name);
}
```

### Example File:

` SampleClass.cs`

```csharp
using MySampleCode.SubNamespace;
using System.Linq;
using ZSoft.ThirdPartyNamespace;

namespace MySampleCode
{
    public class SampleClass
    {
        private const int DEFAULT_AGE = 0;

        private static readonly string _someStaticValue;

        protected internal int _size;
        protected double _length;
        private readonly string _vision;
        private string _flavor;

        public SampleClass(
            ITrialUserLicenseCreator trialUserLicenseCreator,
            IUserIdentityProvider userIdentityProvider,
            ILoggedInUserInformationFetcher identityFetcher)
        {
            if (trialUserLicenseCreator == null) throw new ArgumentNullException(nameof(trialUserLicenseCreator));
            // ...
        }

        private SampleClass(string vision, IUserIdentityProvider userIdentityProvider)
        {
            _vision = vision;
        }

        public event EventHandler OnFlavorChanged;

        public string Name { get; set; }

        public void Method()
        {
            // ...
        }

        private int GetIntValue(string value)
        {
            if (string.IsNullOrWhiteSpace(value)) return -1;

            if (value.All(c => char.IsDigit(c))
            {
                return int.Parse(value);
            }
            else 
            {
                return 0;
            }
        }
    }
}
```
