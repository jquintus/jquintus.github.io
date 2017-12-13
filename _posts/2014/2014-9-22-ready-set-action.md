---
layout: post
disqus_identifier: #12
comments: true
categories: [ .NET, Android, C#, MvvmCross, Xamarin, ActionbarSherlock, AppCompat, MvvmCross ]
---


I just had the need to style the search box in the actionbar of my Xamarin Android application. For those of you who don’t know, Xamarin lets you write native Android apps in .Net, specifically C#.

Here’s the search box before styling:

![](/images/posts/2014/2014-9-22-ready-set-action/image_thumb7.png)

Here’s the look I was going for:

![](/images/posts/2014/2014-9-22-ready-set-action/image_thumb8.png)

I was using [ActionBarSherlock](http://actionbarsherlock.com/) to create the actionbar.  After searching for a while, I came to the conclusion that the only way to customize the actionbar using the Android style system was to switch to [AppCompat.](https://developer.android.com/tools/support-library/features.html)  So now the steps seem pretty clear and easy:

Migrate from ActionBarSherlock to AppCompat
Create a style for my search box
Apply style in just the right place.
I ran into more bumps along the way than expected, so I wanted to write down exactly what I had to do to get this working.

## Migrating to from Sherlock to AppCompat

Before really considering using AppCompat, I checked to see how well it was supported by Xamarin and found a [useful post](http://blog.xamarin.com/android-support-library-v7-hello-actionbarcompat/) on their blog with some sample code.  This looked promising and I was able to get it to compile locally, so full steam ahead.  Back in my project, I deleted the [ActionBarSherlock Xamarin component](http://components.xamarin.com/view/xamarinactionbarsherlock) and added in the [AppCompat component](https://components.xamarin.com/view/xamandroidsupportv7appcompat).  I then walked through my code changing all code referencing Sherlock to AppCompat.  Wolram Rittmeyer has an excellent post on the step by step process to do this.

My first concern was that I also use [MvvmCross](https://github.com/MvvmCross/MvvmCross), which requires that all Activity classes implement IMvxEventSourceActivity and IMvxAndroidView.  So months ago (almost a year ago according to my commit history) I created the  MvxActionBarSherlockFragmentActivity base class that inherits from SherlockFragmentActivity and implements the MvvmCross interfaces.  Not remembering what went into creating the class I was concerned it would be tedious to replace it with an AppCompat version.  Turns out it was trivial.  All I had to do was inhert from ActionBarActivity instead.  It was literally a one word change. Here’s my new MvxActionBarActivity:

```csharp
using Android.App;
using Android.Content;
using Android.OS;
using Android.Support.V7.App;
using Cirrious.CrossCore.Core;
using Cirrious.CrossCore.Droid.Views;
using Cirrious.MvvmCross.Binding.BindingContext;
using Cirrious.MvvmCross.Binding.Droid.BindingContext;
using Cirrious.MvvmCross.Droid.Views;
using Cirrious.MvvmCross.ViewModels;
using System;
 
namespace Masterdevs.Droid.Views
{
    public class MvxActionBarActivity : ActionBarActivity, IMvxEventSourceActivity, IMvxAndroidView
    {
        protected MvxActionBarActivity()
        {
            BindingContext = new MvxAndroidBindingContext(this, this);
            this.AddEventListeners();
        }
 
        public event EventHandler<MvxValueEventArgs<MvxActivityResultParameters>> ActivityResultCalled;
        public event EventHandler<MvxValueEventArgs<Bundle>> CreateCalled;
        public event EventHandler<MvxValueEventArgs<Bundle>> CreateWillBeCalled;
        public event EventHandler DestroyCalled;
        public event EventHandler DisposeCalled;
        public event EventHandler<MvxValueEventArgs<Intent>> NewIntentCalled;
        public event EventHandler PauseCalled;
        public event EventHandler RestartCalled;
        public event EventHandler ResumeCalled;
        public event EventHandler<MvxValueEventArgs<Bundle>> SaveInstanceStateCalled;
        public event EventHandler<MvxValueEventArgs<MvxStartActivityForResultParameters>> StartActivityForResultCalled;
        public event EventHandler StartCalled;
        public event EventHandler StopCalled;
 
        public IMvxBindingContext BindingContext { get; set; }
 
        public object DataContext
        {
            get { return BindingContext.DataContext; }
            set { BindingContext.DataContext = value; }
        }
 
        public IMvxViewModel ViewModel
        {
            get { return DataContext as IMvxViewModel; }
            set
            {
                DataContext = value;
                OnViewModelSet();
            }
        }
 
        public void MvxInternalStartActivityForResult(Intent intent, int requestCode)
        {
            base.StartActivityForResult(intent, requestCode);
        }
 
        public override void SetContentView(int layoutResId)
        {
#if DEBUG // This try catch is super useful when debugging bad layouts.  No real need for it in prod.
            try
            {
#endif
                var view = this.BindingInflate(layoutResId, null);
                SetContentView(view);
#if DEBUG
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);  // Because of the JNI layers, this is the easiest way to reliably get the message from the exception when debugging.  The watch window isn't as reliable/timely
                throw;
            }
#endif
        }
 
        public override void StartActivityForResult(Intent intent, int requestCode)
        {
            StartActivityForResultCalled.Raise(this, new MvxStartActivityForResultParameters(intent, requestCode));
            base.StartActivityForResult(intent, requestCode);
        }
 
        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                DisposeCalled.Raise(this);
            }
            base.Dispose(disposing);
        }
 
        protected override void OnActivityResult(int requestCode, Result resultCode, Intent data)
        {
            ActivityResultCalled.Raise(this, new MvxActivityResultParameters(requestCode, resultCode, data));
            base.OnActivityResult(requestCode, resultCode, data);
        }
 
        protected override void OnCreate(Bundle bundle)
        {
            CreateWillBeCalled.Raise(this, bundle);
            base.OnCreate(bundle);
            CreateCalled.Raise(this, bundle);
        }
 
        protected override void OnDestroy()
        {
            DestroyCalled.Raise(this);
            base.OnDestroy();
        }
 
        protected override void OnNewIntent(Intent intent)
        {
            base.OnNewIntent(intent);
            NewIntentCalled.Raise(this, intent);
        }
 
        protected override void OnPause()
        {
            PauseCalled.Raise(this);
            base.OnPause();
        }
 
        protected override void OnRestart()
        {
            base.OnRestart();
            RestartCalled.Raise(this);
        }
 
        protected override void OnResume()
        {
            base.OnResume();
            ResumeCalled.Raise(this);
        }
 
        protected override void OnSaveInstanceState(Bundle outState)
        {
            SaveInstanceStateCalled.Raise(this, outState);
            base.OnSaveInstanceState(outState);
        }
 
        protected override void OnStart()
        {
            base.OnStart();
            StartCalled.Raise(this);
        }
 
        protected override void OnStop()
        {
            StopCalled.Raise(this);
            base.OnStop();
        }
 
        protected virtual void OnViewModelSet()
        {
        }
    }
}
```

With that done, all my MvvmCross worries were over and my app should compile.  Not quite.  On either score.  It turns out that the version of MvvmCross I was using was referencing the old **Mono**.Android.Support.v4.dll while the AppCompat library referenced the new **Xamarin**.Android.Support.v4.dll.  These are essentially the same library, but with different names.  There is an excellent summary on [Xamarin’s bugzilla](https://bugzilla.xamarin.com/show_bug.cgi?id=15205).  Finally after carefully reading through all of the bug report, at the very bottom, I found Stuart’s comment saying that he’d already released a fixed version.  All I had to do was update to the latest version of MvvmCross in NuGet.  And now my code actually compiled and my MvvmCross concerns were over.

## Fixing the Null SearchView

While my code happily compiled, it wasn’t quite as happy about actually running.

```csharp
public override bool OnCreateOptionsMenu(IMenu menu)
{
    MenuInflater.Inflate(Resource.Menu.ManageUsers, menu);
    var searchItem = menu.FindItem(Resource.Id.action_search);
 
    var view = MenuItemCompat.GetActionView(searchItem);
    var searchView = view.JavaCast<Android.Support.V7.Widget.SearchView>();
 
    searchView.QueryTextChange += (s, e) => ViewModel.Filter = e.NewText;
 
    return base.OnCreateOptionsMenu(menu);
}
```

Whenever I tried to get the action view from the search menu item, it was null.   My first instinct was to double check my menu definition:

```xml
<?xml version="1.0" encoding="utf-8"?>
<menu xmlns:android="http://schemas.android.com/apk/res/android"
      xmlns:app="http://schemas.android.com/apk/res-auto" >
  <item android:id="@+id/action_search"
        android:title="Search Friends"
        android:icon="@android:drawable/ic_menu_search"
        app:showAsAction="ifRoom|collapseActionView"
        app:actionViewClass="android.support.v7.widget.SearchView" />
</menu>
```

It looked right.  I had remembered to use the AppCompat search view.  After some digging on the inter-tubes, I found a post on StackOverflow explaining that my themes had to specifically derive from AppCompat themes.  Ok, so a trip to the [style generator](http://jgilfelt.github.io/android-actionbarstylegenerator/ )and I’m using the correct themes.

## Styling Search

So now it’s been a while, and I have a lot of checked out code.  But I’ve finally gotten back to where I was when I started.  An app that compiles, runs, and has an ugly search box.

The trick, (thanks to Andreas Nilsson for [explaining it](http://www.jayway.com/2014/06/02/android-theming-the-actionbar/#comment-42164)) is to set your own style  searchViewAutoCompleteTextView in the Theme.AppCompat style.

```xml
<resources>
    <style name="AppTheme" parent="@style/Theme.AppCompat.Light.DarkActionBar">
        <item name="android:actionBarWidgetTheme">@style/ActionBarWidget.actionbar</item>
    </style>
 
    <style name="ActionBarWidget.actionbar" parent="Theme.AppCompat.Light.DarkActionBar">
        <item name="searchViewAutoCompleteTextView">@style/AutoCompleteTextView.actionbar</item>
    </style>
 
    <style name="AutoCompleteTextView.actionbar" parent="Widget.AppCompat.Light.AutoCompleteTextView">
        <item name="android:textColor">#FFFFFF</item>
        <item name="android:textCursorDrawable">@null</item>
    </style>
</resources>
```

## Thanks and Resources

Thanks to Wolfram Rittmeyer for his methodical description on how to [migrate from Sherlock to AppCompat](http://www.grokkingandroid.com/migrating-actionbarsherlock-actionbarcompat/).  Another thanks to Andreas Nilsson for his blog post showing that it was even possible to [customize the the search box using styles](http://www.jayway.com/2014/06/02/android-theming-the-actionbar/#comment-42164).  I encourage you to read both blog posts, since they go into far greater detail.

Happy Coding.


_this post was originally on the [MasterDevs Blog](http://blog.masterdevs.com/ready-set-action/)_
