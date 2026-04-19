---
title: Setting up a parametric modeling pipeline with python
date: 2026-04-19
tags:
  - Pens
categories:
  - 3D Modeling
  - 3D Printing
  - Fusion 360
---
WIP

## Goal

I have a couple of pretty simple 3D models that I want to tweak very many ways. There are a dozen different parameters, I'll be tweaking each one one or two millimeters. When I'm done, I want to wind up with a library of different configurations, and be able to print each without a lot of hassle (finding the files, slicing, etc.). In addition, I want to be able to easily create new configurations quickly and without having to go through a lot of UI clicking. 

Originally I was going to use Fusion360's Configuration Tables but they aren't available on the free version and it's not worth upgrading for just that feature. 

The stack I am going with is:

- DevContainer to simplify the dev environment
- Python with CadQuery to generate the models
- Prussa Slicer CLI to generate the slicing

This post will be about getting a minimal hello world set up end to end. 

## Set Up the Environment

1. Install Cursor/Vs Code - it doesn't really matter which
2. Install [Docker Windows from the store](https://apps.microsoft.com/detail/XP8CBJ40XLBWKX?hl=en-US&gl=US&ocid=pdpshare)
3. Install the [Dev Containers extension](https://marketplace.cursorapi.com/items/?itemName=anysphere.remote-containers)
4. 

