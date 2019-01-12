---
layout: post
disqus_identifier: #28
comments: true
categories: 
  - GitHub Pages
  - SSL
---

Adding a certificate to your GitHub Pages site so that all of your traffic can
use HTTPS is easy... if you don't use a custom domain name.  If you do have a custom domain, then you need to do a little work and a (free) [Cloud Flare](https://www.cloudflare.com) account to get it going.

1. Create your free acount on https://www.cloudflare.com
1. Enter your site's address in the setup bar
1. Head over to your DNS provider and add the Clod Flare servers as your custom domain servers.  e.g. [On NameCheap](https://ap.www.namecheap.com/domains/domaincontrolpanel/quintussential.com/domain)
1. Optionally, you can head back to Cloud Flare and set up a page rule to redirect all HTTP pages to redirect to HTTPS. Just add a rule to match `http://*quintussential.com/*`
1. Wait.  DNS has to happen now.

Thanks to [Hacker Noon](https://hackernoon.com/set-up-ssl-on-github-pages-with-custom-domains-for-free-a576bdf51bc) for pointing this out.
