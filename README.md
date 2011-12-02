Hightail bootstraps a pretty looking Rails app in a jiff.


## Installation

First install the hightail Gem:

    gem install hightail

Then run:

    hightail APP_NAME

This will create a Rails 3.1 app in `APP_NAME`. This script creates a new
new git repository. It is not meant to be used against an existing repository.


## What's Included

Here are a few of the differences you can expect to find between the default
Rails generator and what Hightail generates for you:

  * PostgreSQL as the default database
  * RSpec instead of Test::Unit
  * a customized form builder
  * default Sass style sheets
  * a Haml application layout
  * simplified and unified generated files
  * a directory under lib for app-specific code


## Credits

Hightail is a derivative work of [Suspenders][] by [thoughtbot][].

  [suspenders]: https://github.com/thoughtbot/suspenders
  [thoughtbot]: http://thoughtbot.com/


## License

Hightail is Copyright © 2011 Tyler Hunt. It is free software, and may be
redistributed under the terms specified in the LICENSE file.
