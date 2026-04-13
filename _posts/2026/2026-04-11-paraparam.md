---
layout: post
title: Fusion360 and ParaParam
date: 2026-04-11
tags:
  - Pens
---

When I'm chasing tolerances on your 3D designs, I will print the same design with 1mm differences. [ParaParam](https://github.com/hanskellner/Fusion360ParaParam) is great at scripting generating STL files with changes to a specific parameter.

To install the add in, download the zipped code from GitHub, extract it, and put it in the `%appdata%\Autodesk\Autodesk Fusion 360\API\Scripts` folder. You may need to create the `Scripts` folder.

The file structure should be

```
API\
  Scripts\
    ParaParam\
      ParaParam.py
      ParaParam.manifest
      ...
```

Fusion360 and ParaParam
