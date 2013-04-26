# Jekyll Auth

*A simple way to use Github Oauth to serve a protected jekyll site to your organization*

## Requirements

1. A GitHub account (one per user)
2. A GitHub Organization (of which members will have access to the Jekyll site)
3. A GitHub Application (You can always [register one](https://github.com/settings/applications/new) for free)
4. A heroku account

## How it works

1. Set up your Jekyll site (see below)
2. Give Heroku you apps Oauth Credentials, and the name of your org
3. Profit

## Setup

To setup your site to work with Heroku, simply copy the contents of this repository (sans `readme.md` over to your existing (or new) Jekyll site.

*Note:* This repo contains a single-file test site to get you started and make sure it works. If you don't need that, just go ahead and delete the `index.md` file before you copy things over.

## Configuring Heroku 

You'll need to tell heroku a bit about your setup. You can find these on [your application page](https://github.com/settings/applications). First:

`heroku config:set GITHUB_CLIENT_ID=[your github app client id]`

then:

`heroku config:set GITHUB_CLIENT_SECRET=[your github app client secret]`

finally:

`heroku config:set GITHUB_ORG_ID=[org id]`

(where orgid is the *name* of your organization)

## Running locally

1. `script/bootsrap`
2. Configure as above, except use `EXPORT` rather than `heroku config:set`
3. `script/server` (or `bundle exec jekyll --server` for unauthenticated site)

*note:* You may need to have two apps, one with a local callback, and one for production