---
layout: post
disqus_identifier: #38
comments: true
categories: 
  - C#
  - interviews
---

When interviewing tech candidates, I don't like prescribe a language or
methodology.  That being said, I've found that it can be helpful to provide a
cheatsheet for C# since that's how I tend to phrase the questions.  This code
tries to provide the basics of how to define and use classes.  


```csharp
public interface IProduct
{
    string Name { get; set; }
    string Id { get; set; }
}

public class Product : IProduct
{
    public Product(string name, string id)
    {
        Name = name;
        Id = id;
        Creation = DateTime.Now;
    }

    public string Name { get; set; }
    public string Id { get; set; }

    public DateTime Creation { get; set; }
}

public interface IProductLoader
{
    IProduct[] Load();
}

public class ProductLoader : IProductLoader
{
    public IProduct[] Load()
    {
        Product[] products = new Product[]
        {
            new Product("DeLorean", "B2TF88-1955"),
            new Product("Beans, Magic", "GNT-42"),
        };

        return products;
    }
}

public class Main
{
    public void Start()
    {
        IProductLoader loader = new ProductLoader();
        IProduct[] products = loader.Load();
        foreach (var product in products)
        {
            Sell(product);
        }
    }

    private void Sell(IProduct product)
    {
        Console.WriteLine($"Selling {product.Name}");
    }
}
```

