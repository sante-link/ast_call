# AstCall

TODO: Write a gem description

## Installation

Run:

    $ gem install ast_call

## Usage

Configure `ast_call` in one of the following files (only the first one found is read):
* `$HOME/.config/ast-call/config.yml`
* `/usr/local/etc/ast-call.yml`
* `/etc/ast-call.yml`

Use the following snippet as a starter:
~~~yaml
manager:
  host: 127.0.0.1
  port: 5038

login:
  username: john
  secret: password

originate:
  channel: SIP/100
  context: internal
  priority: 1
  callerid: ast-call
~~~

Originating calls is now as easy as:

    $ ast-call '*1'

## Contributing

1. Fork it ( https://github.com/sante-link/ast_call/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
