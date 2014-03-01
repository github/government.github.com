---
layout: story
author: James Stewart, UK Government Digital Service
title: How GDS uses Git and Github
description: There's more to managing the code for a system that simply creating a repository. This is how GDS has considered collaboration patterns and risk management.
image: /images/answers.jpg
category: open source

---

For development teams in the [UK Government Digital Service](https://gds.blog.gov.uk), it's always been obvious that
[we needed to use version control](https://www.gov.uk/service-manual/making-software/version-control) and git was a 
natural choice for a variety of reasons: the distributed model and cheap branching fit the way we want to work.
There's a lot more to consider than just the underlying tool, though.

Making sure we've got the right tools for collaboration is really important for us--which is where github comes
in--but there are also a range of other risk-based decisions to be made. How important is it that we're able to
deploy an urgent fix even if github.com were down? Can we trust our most sensitive configuration details to a
multi-tenant system? Even whether there's a need to keep the identities of contributors confidential. The answers
to those sorts of questions vary from service to service, but asking them is vital to make sure you can run your 
service responsibly.

In order to help others who are making these decisions and to contribute to a wider conversation about appropriate
approaches, we've written up [some more details on our blog](https://gdstechnology.blog.gov.uk/2014/01/27/how-we-use-github/).
