# TableTime!

A web app for practising times tables. TableTime will time and rank your performance, and keeps a hi score table.

Built with [Harp](https://github.com/sintaxi/harp) using [CoffeeScript](https://github.com/jashkenas/coffeescript/), [Jade](https://github.com/pugjs/pug) and [Less](https://github.com/less/less.js).

## Compile

Harp requires a little extra work with GitHub Pages - when compiling, it'll wipe a README.md file in the target directory. The _compile script in _harp will run the compiler and then copy _README.md to the target. Run _compile before committing to generate a Pages-ready site. This is adapted from a script at https://stackoverflow.com/a/26801763/929069.