# GitHub for Government

*A proof of concept microsite showcasing how GitHub can make government more awesomer*

## Requirements

* Jekyll (ruby)
* CoffeeScript (node, npm)

## Setup

1. `Git clone [URL to Repo]`
2. `cd [path to repo]`
3. `script/bootstrap`
4. `script/server`
5. `open http://localhost:4000`
6. There is no step 6.

## How to contribute

1. Create a new feature branch
2. Push changes
3. Submit a pull request

## Compiling

The site uses CoffeeScript to generate the `/community` page dynamically. To recompile the CoffeeScript, simply `script/build`. *Note:* This will fire automatically before `script/server` as well. 

## Contributing to the agency list

Simply edit the list in `_config.yml`. Everything else is dynamic.