# GitHub for Government

*The [gov.github.com](http://gov.github.com) of the future, here today.*

## Vision

A microsite that lives at [gov.github.com](http://gov.github.com).

**High-level ideas:**

* Excite and encourage government adoption of open source
* Educate public servants about the open source ethos and its benefits
* Showcase successful use cases to give the agencies some love (and excite the developer community)
* FAQ / Best Practices (ideally collaborative) to lower barrier to getting started

**Prior art:**

* https://github.com/github/government
* http://www.google.com/enterprise/apps/government/
* http://aws.amazon.com/federal/
* http://ben.balter.com/open-source-for-government

See [github/gov/#2](https://github.com/github/gov/issues/2) for more background. The goal is the site to be entirely static (Jekyll/GitHub Pages) and open source so governmenty types can contribute.

This could also serve as a vehicle to crowd source a collaborative list of government organizations on GitHub while we figure out a better way to collect that info on our end.

## Requirements

* Jekyll (ruby)
* CoffeeScript (node, npm)

## Setup

1. `Git clone https://github.com/github/gov.github.com.git`
2. `cd gov.github.com`
3. `script/bootstrap`
4. `script/server`
5. `open http://localhost:4000`
6. Profit.

## Roadmap

Check out the [current issues](https://github.com/github/gov.github.com/issues) to see what's in the pipeline.

## How to contribute

1. Create a new feature branch
2. Push changes
3. Submit a pull request

## Compiling

The site uses CoffeeScript to generate the `/community` page dynamically. To recompile the CoffeeScript, simply `script/build`. *Note:* This will fire automatically before `script/server` as well. 

## Contributing to the agency list

Simply edit the list in `_config.yml`. Everything else is dynamic.

## Jekyll Auth

For information on authentication, see the [Jekll-auth readme](https://github.com/benbalter/jekyll-auth)