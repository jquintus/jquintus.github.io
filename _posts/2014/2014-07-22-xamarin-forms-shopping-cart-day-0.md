---
layout: post
disqus_identifier: #16
comments: true
categories:
   - .NET
   - Android
   - C#
   - Shopping Cart
   - Windows Phone 8
   - XF
   - Xamarin
   - iOS
title: "Xamarin.Forms: Setup"
---

This will be the first in a series where I create a shopping cart application using Xamarin.Forms  While I have experience using Xamarin and [MVVMCross](https://github.com/MvvmCross/MvvmCross) to create applications, I have never used Forms before.  This series is intended as a journal of my learning experience where I will point out stumbling blocks and tricks I pick up along the way.

Setting out, I plan to build a cross-platform shopping cart application using XAML using the MVVM design pattern.  I’ll focus my tests on Windows Phone because it’s much easier and faster to test but I will also verify that the app works on Android whenever it makes sense.  Sadly I don’t have the equipment necessary to test on iPhone.

The source code for this article can be downloaded from [Git:  ShoppingCart-Day0.zip](https://github.com/jquintus/ShoppingCartXF/)

## Quickly, What is Xamarin.Forms?
Traditionally Xamarin has let you write a WindowsPhone, iOS, and Android apps in C#, letting you share all app logic.  You would only need to rewrite your views for each platform, using the device specific controls and paradigms.

With Forms is Xamarin has added a cross platform UI framework.  It allows you to define your UI with device agnostic names for common controls.  For instance, in Forms you’d use an Entry object instead of the WindowsPhone TextBox or the Android EditText.  When run, the app still renders 100% native controls.  So even though they share a common UI definition, buttons on  WindowsPhone look like WindowsPhones butons; buttons on Android look like Android buttons; Buttons on iPhone look like iPhone buttons.

## Getting Started
With all the preliminaries out of the way, let’s create our first app.  Fire up Visual Studio (you can use Xamarin Studio if you like, but VS is my home). Go to File-> New-> Project and pick **Blank App (Xamarin.Forms Portable)**.  You can use the filter in the top right to find the project template more easily.  I’m calling it ShoppingCart.

![](/images/posts/2014/2014-07-22-xamarin-forms-shopping-cart-day-0/image_thumb.png)

This will take a second to generate 4 projects for you:

* ShoppingCart
* ShoppingCart.Android
* ShoppingCart.iOS
* ShoppingCart.WindowsPhone

![](/images/posts/2014/2014-07-22-xamarin-forms-shopping-cart-day-0/image_thumb1.png)

ShoppingCart is your main project.  It is referenced by the other three.  At this point you can set any of the device projects (ShoppingCart.Android, ShoppingCart.iOS, ShoppingCart.WindowsPhone) as the startup object and deploy the app to your device or emulator.

ShoppingCart only has one code file in it, App.cs. All this does is create an instance of a Page and return it.

```csharp
public class App
{
    public static Page GetMainPage()
    {
        return new ContentPage
        {
            Content = new Label
            {
                Text = "Hello, Forms !",
                VerticalOptions = LayoutOptions.CenterAndExpand,
                HorizontalOptions = LayoutOptions.CenterAndExpand,
            },
        };
    }
}
```

So it seems the Page class is the base of every view, analogous to a WindowsPhone PhoneApplicationPage, iOS UIViewController, or Android  Activity.  The device specific startup logic grabs the Forms Page object and sets it as it’s startup object.  Pretty straight forward.

## Starting out with XAML
All I want to accomplish today is to change the definition of that view from C# to XAML.  In the ShoppingCart project, I’ll create a new folder called “Views” an add a Forms.Xaml Page named “MainPage”

![](/images/posts/2014/2014-07-22-xamarin-forms-shopping-cart-day-0/image_thumb2.png)

![](/images/posts/2014/2014-07-22-xamarin-forms-shopping-cart-day-0/image_thumb3.png)

This is a new item template that you get with the Forms projects.  Similar to the PhoneApplicationPage, it’s a XAML file with a code behind.  You can see that it inherits from ContentPage, the same type that App.GetMainPage creates.

At this point, I’m starting to notice that Visual Studio is starting to slow down. Switching between tabs and making edits to the .xaml file is sluggish.  Now, this may just be my machine.  It’s fast, but only has 4GB or RAM.  It’s also been acting up in other ways lately and I’ve been meaning to reformat.  Since I don’t seem to be getting intellisense in the xaml file, I’ll just switch to an alternative text editor instead.  I’ve already set up VS to open files in vim when I hit Ctrl-Alt-V so this isn’t really a big annoyance for me.

This view is supposed to be a simple copy of the one defined in App.cs, so I’ll delete the default Label they give me from the template and replace it with one with some static text.  Although, it is nice to note that the sample uses a simple binding for the text property.  I wonder where we set what we bind against, but I’ll worry about that later.

```xml
<?xml version="1.0" encoding="utf-8" ?>
<ContentPage xmlns="http://xamarin.com/schemas/2014/forms"
                       xmlns:x="http://schemas.microsoft.com/winfx/2009/xaml"
                       x:Class="ShoppingCart.Views.MainPage">
  <Label Text = "Hello, XAML Forms!"
         VerticalOptions = "CenterAndExpand"
         HorizontalOptions = "CenterAndExpand" />
</ContentPage>
```

OK, my first bit of Form xaml done and it wasn’t too painful.  Now to wire it up.  Going back to App.cs, instead of creating a new ContentPage, I new up an instance of MainPage and return that.

```csharp
public static Page GetMainPage()
{
    return new MainPage();
}
```

Firing up the emulator, it looks like it works.  I changed the text in the label ever so slightly to make it easy to ensure that I know that I’m seeing my changes.

So that’s enough for me to call it a victory and go reward myself with some XBox One.

The source code for this article can be downloaded from [Git:  ShoppingCart-Day0.zip](https://github.com/jquintus/ShoppingCartXF/raw/master/Archive/ShoppingCart-Day0.zip).  Note how it is stunningly close to the default template.  Not much changed.


_this post was originally on the [MasterDevs Blog](http://blog.masterdevs.com/xamarin-forms-shopping-cart-day-0/)_
