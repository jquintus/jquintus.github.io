---
title: "Setting Up Pages CMS for Jekyll"
date: 2026-04-13
layout: post
categories:
  - Jekyll
  - GitHub Pages
---

My blog has been running on Jekyll and GitHub Pages for close to a decade now.
The workflow has always been the same: write markdown in vim, commit, push.
That works great when I'm at my computer, but not so much when I want to jot
something down from my phone or when I move around from computer to computer.  
[Pages CMS](https://pagescms.org/) solves that.
It's a free and open-source CMS that sits on top of your GitHub repo and gives you
a web-based editor for your content.

## Getting Started

Setup is straightforward. Go to [app.pagescms.org](https://app.pagescms.org),
sign in with GitHub, and authorize it to access your repo. Then add a
`.pages.yml` file to the root of your repo to configure it.

## The Config

Here's the config I ended up with after quite a bit of trial and error:

```yaml
media:
  - name: images
    input: images/posts
    output: /images/posts
    extensions: [png, jpg, webp]

content:
  - name: posts
    label: Posts
    type: collection
    path: _posts
    format: yaml-frontmatter
    filename: "{year}/{year}-{month}-{day}-{fields.title}.md"
    media: images
    view:
      fields: [title, date]
      default:
        sort: date
        order: desc
    fields:
      - name: title
        label: Title
        type: string
        required: true
      - name: date
        label: Date
        type: date
        required: true
      - name: tags
        label: Tags
        type: select
        list: true
        required: false
        options:
          values:
            - Pens
            - Pi Project
      - name: categories
        label: Categories
        type: select
        list: true
        required: false
        options:
          values:
            - .NET
            - Jekyll
            - GitHub Pages
            # ... full list of your categories
      - name: body
        label: Content
        type: rich-text
        options:
          media: images
```

## Pitfalls

Of course nothing is easy. So here are some of the issues that I learned along the way.

### `type: list` Does Not Exist

This was the biggest one. I originally had my tags and categories configured as:

```yaml
- name: tags
  type: list
```

This silently fails. Pages CMS's valid field types are `string`, `number`,
`date`, `boolean`, `select`, `rich-text`, `text`, `code`, `image`, `file`,
`object`, and a few others. There is no `list` type.

To make a field repeatable (an array), you use the `list` **property** on any
field type:

```yaml
- name: tags
  type: string
  list: true
```

Or, if you want a dropdown with predefined values:

```yaml
- name: tags
  type: select
  list: true
  options:
    values: [Pens, Arduino, Recipes]
```

The really frustrating part is that `type: list` doesn't produce a config error.
The field just silently doesn't work. If you combine it with `hidden: true`
(say, to auto-tag posts), you get a validation error on save
("Please fix the errors before saving") with no indication of what's wrong
because the broken field is hidden.

### `path: "."` Doesn't Work for Collections

I tried to set up a "Pages" collection to edit files in the repo root
(`index.html`, `about/index.md`, etc.):

```yaml
- name: pages
  type: collection
  path: .
```

Pages CMS doesn't accept `.` as a path. The fix is to use `type: file` entries
for individual files instead:

```yaml
- name: about
  label: About Page
  type: file
  path: about/index.md
  format: yaml-frontmatter
```

### Subdirectory-Organized Posts Show as Folders

If your posts are organized in year subdirectories (`_posts/2024/`,
`_posts/2025/`, etc.), Pages CMS displays them as a folder tree rather than a
flat sorted list. I tried `view.layout: list` but it didn't help. This
appears to be a limitation since the folder view is driven by the filesystem
structure.

It's annoying to have a blog list posts in chronological order, but it's still worlds better than what I had before.

### Hidden Fields with Bad Types Break Silently

I tried creating a separate "Project: Pens" collection that would auto-tag
posts. This didn't work as expected which is why I wound up going with the
dropdown (`type: select`) on the main posts collection instead.

## Bonus: Enforcing Tag Consistency

After a decade of free-form typing, my categories were a mess, e.g., `c#` vs `C#`,
`docker` vs `Docker`, `tools` vs `Tools`. Using `type: select` with an explicit
list of values fixes this going forward. No more typos, no more casing
inconsistencies.
