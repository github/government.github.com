# GitHub and Government

[![screenshot](screenshot.png)](full-screenshot.png)

A government-centric GitHub microsite that lives at [government.github.com](http://government.github.com) and serves educate, connect and inspire those using GitHub in open government.

The site is open source (here's all the code!) and is a tool for and _by_ the community.

Submit [issues](https://github.com/github/government.github.com/issues/new) and [pull requests](https://github.com/github/government.github.com/compare/) for stories, site ideas or copy edits.

### Goals

- Share stories of real world experiences using GitHub in open Government
- Make terms like _open source_, _open data_ and _open government_ less ambigous
- Expose the open government community on GitHub to foster connections and sharing
- Make getting started easier with FAQ, Best Practices, and Project Ideas

### Under the Hood

This site is made with [Jekyll](http://jekyllrb.com), an open source static site generator. This means the Jekyll program takes the content we want to be on the site and turns them into HTML files ready to be hosted somewhere. Awesomely, GitHub provides free web hosting for repositories, called [GitHub Pages](http://pages.github.com/), and that's how this site is hosted. The content for the site is on a branch named [gh-pages](https://github.com/github/government.github.com/tree/gh-pages).  

## Contributing

If what you're thinking about isn't found below, just create an [issue](https://github.com/github/government.github.com/issues/new). 

#### Fix/Edit Content

If you see an error or a place where content should be updated or improved, just fork this repsository to your account, make the change you'd like and then submit a pull request. If you're not able to make the the change, file an [issue](https://github.com/github/government.github.com/issues/new). 

#### Add a Story

Have an open governement story to share? Instructions for contributing a story are in [docs/submit.md](https://github.com/github/government.github.com/blob/master/docs/submit.md).

#### Add Organization

If you know of an organization that should be added to the organization list that generates the matrix of avatars on the [Community](http://government.github.com/community) page: fork this repository, open the `_config.yml` file and add it to the appropate section of the list in the format being used. Commit your change and submit a pull request to us!

---

## To Set up Locally

You can take all the files of this site and run them just on your computer as if it were live online, only it's just on your machine. 

#### Requirements

* [Jekyll](http://jekyllrb.com/) 
* [Ruby](https://www.ruby-lang.org/en/)
* [Git](http://git-scm.com/)

 _If you use [GitHub for Windows](http://windows.github.com) or [GitHub for Mac](http://mac.github.com), Git will install automatically._

At your computer's command line type: 

1. `git clone https://github.com/github/government.github.com.git`
 - This copies all of the repository's files onto your computer.
2. `cd government.github.com`
 - This navigates you inside of the repository's folder on your computer.
3. `script/bootstrap`
 - Intalls styles
4. `script/server`
 - Launches a local server for hosting the site
5. `open http://localhost:4000`
 - Opens the site at the server address, in your browser

## Jekyll Auth

For information on authentication, see the [Jekll-auth readme](https://github.com/benbalter/jekyll-auth)

----

Anything else? Submit an [Issue](https://github.com/github/government.github.com/issues/new) or email [government@github.com](mailto:government.github.com).
