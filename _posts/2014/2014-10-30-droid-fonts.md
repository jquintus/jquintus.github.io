---
layout: post
disqus_identifier: #15
comments: true
categories: [.NET, Android, C#, MvvmCross, Xamarin]
title: "Xamarin.Droid and MvvmCross: Setting Fonts in XML"
---

In Android, your options are kind of small for setting a font purely in XML.

![](/images/posts/2014/2014-10-30-droid-fonts/image_thumb7.png)

In this post, I’ll create a converter so we can specify the font in an MvvmCross binding.

## Getting a font

Before going any further, you need to actually get and include a font in your android app.  For this example I will be using [Fontin](http://www.exljbris.com/fontin.html).  The main reason I’m using it is because it was easy to find and is free. Download the TTF versions and and include them in your project.  Add a new subdirectory to the Assets folder in your android project named “font”.  Drop the files into that folder and include them in your project.  Make sure that the build action is set to `AndroidAsset`.

![](/images/posts/2014/2014-10-30-droid-fonts/image_thumb8.png)        ![](/images/posts/2014/2014-10-30-droid-fonts/image_thumb9.png)

If you get the following error, make sure that the font names are spelled exactly the same as the folder and file names, including capitalization.

```
java.lang.RuntimeException: native typeface cannot be made
```

In the example from my screenshots, my font name should be:  `font/Fontin-Italic.ttf`.

And again, **capitalization matters**.

## Binding to Typeface

The first step is to use [MvvmCross](https://github.com/MvvmCross/MvvmCross).  Next all you really need to do is bind directly to the Typeface property on the [TextView](http://developer.android.com/reference/android/widget/TextView.html).  They Typeface property is an instance of of [Typeface](http://developer.android.com/reference/android/graphics/Typeface.html) (nothing surprising there) which meanst that you’ll need a converter.

```xml
<TextView
      android:layout_width="fill_parent"
      android:layout_height="wrap_content"
      local:MvxBind="Text Hello; Typeface StringToFont(FontName)" />
```

The converter is pretty straight forward:

```csharp
public class StringToFontConverter : MvxValueConverter<string, Typeface>
{
    private static Dictionary<string, Typeface> _cache = new Dictionary<string, Typeface>();
 
    protected override Typeface Convert(string fontName, Type targetType, object parameter, System.Globalization.CultureInfo culture)
    {
        try
        {
            if (!fontName.StartsWith(@"font/")) fontName = @"font/" + fontName;
            if (!fontName.EndsWith(".ttf")) fontName += ".ttf";
 
            if (!_cache.ContainsKey(fontName))
            {
                _cache[fontName] = Typeface.CreateFromAsset(Application.Context.Assets, fontName);
            }
 
            return _cache[fontName];
        }
        catch (Exception e)
        {
            Android.Util.Log.Error("AndroidFont", e.ToString());
 
            return Typeface.Default;
        }
    }
}
```

First thing the converter does is to clean the input, ensuring that the font name starts with the directory and ends with the ttf extension. This makes the binding a bit easier in that we don’t have to remember to get the full font path correct.

It then check its static cache to see if it already has an instance of the the font, if not it creates one by calling Typeface.CreateFromAsset.  If creation fails it does some logging and return the default typeface.  This is important because in my testing VisualStudio hang pretty hard under some circumstances where errors were ignored.

Fire this up, and you’ll see that the font is in fact set.

One problem with this example is that we are forcing the ViewModel to know the correct name for the font.  In some cases that’s ok, in others, we won’t want to handle font in the VM layer.  Luckily we can use [Tibet binding](https://github.com/MvvmCross/MvvmCross/wiki/Databinding#tibet) and just bind to a static string in the xml.  Just remember to surround it with single quotes.

```xml
<TextView
    android:layout_width="fill_parent"
    android:layout_height="wrap_content"
    local:MvxBind="Text Hello; 
                   Typeface StringToFont('Fontin-Bold')" />
```

## Sample

Here’s a sample layout putting everything together.

```xml
<?xml version="1.0" encoding="utf-8"?>
<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:local="http://schemas.android.com/apk/res-auto"
    android:orientation="vertical"
    android:layout_width="fill_parent"
    android:layout_height="fill_parent">
    <EditText
        android:layout_width="fill_parent"
        android:layout_height="wrap_content"
        android:layout_marginBottom="24dp"
        android:textSize="40dp"
        local:MvxBind="Text Hello; Typeface StringToFont('Fontin-Bold')" />
 
<!-- Binding to the View Model -->
    <TextView
        android:layout_width="fill_parent"
        android:layout_height="wrap_content"
        android:textSize="16dp"
        android:text="Bind to Typeface:  " />
    <TextView
        android:layout_width="fill_parent"
        android:layout_height="wrap_content"
        android:layout_marginLeft="24dp"
        android:textSize="24dp"
        local:MvxBind="Text Hello; Typeface StringToFont(SelectedFont)" />
    <MvxSpinner
        android:layout_width="fill_parent"
        android:layout_height="wrap_content"
        android:layout_marginBottom="24dp"
        android:textSize="24dp"
        local:MvxBind="SelectedItem SelectedFont; ItemsSource FontNames;" />
 
<!-- Binding to a constant -->
    <TextView
        android:layout_width="fill_parent"
        android:layout_height="wrap_content"
        android:textSize="16dp"
        android:text="Constant Typeface:  " />
    <TextView
        android:layout_width="fill_parent"
        android:layout_height="wrap_content"
        android:layout_marginLeft="24dp"
        android:layout_marginBottom="24dp"
        android:textSize="24dp"
        local:MvxBind="Text Hello; Typeface StringToFont('Fontin-Bold')" />
 
<!-- Error -->
    <TextView
        android:layout_width="fill_parent"
        android:layout_height="wrap_content"
        android:textSize="16dp"
        android:text="Error Handling:  " />
    <TextView
        android:layout_width="fill_parent"
        android:layout_height="wrap_content"
        android:layout_marginLeft="24dp"
        android:layout_marginBottom="24dp"
        android:textSize="24dp"
        local:MvxBind="Text Hello; Typeface StringToFont('Not a font name')" />
</LinearLayout>
```

The edit box and first text box are bound to the value in the spinner.  The second text box is staticly bound to the bold font.  The last text box is bound to a value that is not a valid font and defaults to the default Android font.

![](/images/posts/2014/2014-10-30-droid-fonts/FontBindingSample_thumb.gif)

Here’s a link to the [working project](https://github.com/jquintus/spikes/tree/master/AndroidFont) on git.

Happy Coding


_this post was originally on the [MasterDevs Blog](http://blog.masterdevs.com/droid-fonts/)_
