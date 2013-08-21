# Jekyll Auth

*A simple way to use Github Oauth to serve a protected jekyll site to your GitHub organization*

## The problem

[Jekyll](http://github.com/mojombo/jekyll) and [GitHub Pages](http://pages.github.com) are awesome, right? Static site, lighting fast, everything versioned in Git. What else could you ask for?

But what if you only want to share that site with a select number of people? Before, you were SOL. Now, simply host the site on a free, [Heroku](http://heroku.com) Dyno, and whenever someone tries to access it, it will oauth them against GitHub, and make sure they're a member of your Organization. Pretty cool, huh?

## Requirements

1. A GitHub account (one per user)
2. A GitHub Organization (of which members will have access to the Jekyll site)
3. A GitHub Application (You can always [register one](https://github.com/settings/applications/new) for free)
4. A heroku account

## Getting Started

### Create a GitHub Application

1. Navigate to [the GitHub app registration page](https://github.com/settings/applications/new)
2. Give your app a name
3. Tell GitHub the URL you want the app to eventually live at
4. The Callback Url is your apps's URL + `/auth/github/callback`
5. Hit Save, but leave the page open, you'll need some of the information in a moment

### Add Jekyll Oauth to your site

#### Copy/Paste

To setup your site to work with Heroku, simply copy the contents of this repository (sans `readme.md`) over to your existing (or new) Jekyll site. If you've got an existing `_config.yml` file, you'll want to merge this repository's `exclude` values with your own to avoid any conflicts.

#### The Git Way

The fastest way to add Jekyll Auth to your site is to run the following command from your project directory (assuming it's already in Git):

```
git remote add jekyll-auth https://github.com/benbalter/jekyll-auth && git pull -s ours jekyll-auth master
```
### Configuring Heroku

You'll need to tell Heroku a bit about yourself. You can find these on [your application page](https://github.com/settings/applications).

#### The easy way

Run the command `script/setup` from your project's root director. Jekyll Auth will run you through everything you need to set up your site with Jekyll Auth.

#### The manual way

First:

`heroku config:set GITHUB_CLIENT_ID=[your github app client id]`

then:

`heroku config:set GITHUB_CLIENT_SECRET=[your github app client secret]`

finally do one (or both) of these 2 options:

* `heroku config:set GITHUB_ORG_ID=[org id]`
* `heroku config:set GITHUB_TEAM_ID=[team id]`

Where `[org id]` is the *name* of your organization, just like in the URL and `[team id]` is an integer (found in the URL when looking at the team)

### Did it work?

You should be asked to authenticate, and then see your site's content. If this is a new site, check out `/jekyll-auth-test.html`, which should let you see if Jekyll Auth is working correctly.

## Running locally

Want to run it locally? `./script/` is here to help!

1. `script/bootstrap`
2. Configure as above, except use `EXPORT` rather than `heroku config:set`
3. `script/server --auth` for an authenticated site, or just `script/server` for plain-Jane Jekyll

*note:* For sanity sake, and to avoid problems with your callback URL you may want to have two apps, one with a local oauth callback, and one for production if you're going to be testing auth locally.

## Under the hood

Every time you push to Heroku, we take advantage of the fact that Heroku automatically runs the `rake assets:precompile` command (normally used for Rails sites) to build our Jekyll site and store it statically, just like GitHub pages would.

Anytime a request comes in for a page, we run it through [Sinatra](http://www.sinatrarb.com/) (using the `_site` folder as the static file folder, just as `public` would be normally), and authenticate it using [sinatra_auth_github](https://github.com/atmos/sinatra_auth_github).

If they're in the org, they get the page. Otherwise, all they ever get is [the bouncer](http://octodex.github.com/bouncer/).
