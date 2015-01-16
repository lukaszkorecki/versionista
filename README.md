# Versionista

Simple `VERSION` file manager

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'versionista'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install versionista

## Usage

```
$ versionista --init --version-file VERSION

I, [2015-01-16T16:25:32.986654 #15963]  INFO -- : Initializing /home/lukasz/work/versionista/VERSION with version: 1.0.0

$ versionista --bump minor --version-file VERSION

I, [2015-01-16T16:25:41.912433 #15998]  INFO -- : Moving from 1.0.0 to 1.1.0 (in /home/lukasz/work/versionista/VERSION)
I, [2015-01-16T16:25:41.912701 #15998]  INFO -- : Done

$ versionista --bump patch --version-file VERSION

I, [2015-01-16T16:25:46.154216 #16030]  INFO -- : Moving from 1.1.0 to 1.1.1 (in /home/lukasz/work/versionista/VERSION)
I, [2015-01-16T16:25:46.154477 #16030]  INFO -- : Done

$ versionista --bump major --version-file VERSION

I, [2015-01-16T16:25:51.195717 #16064]  INFO -- : Moving from 1.1.1 to 2.1.1 (in /home/lukasz/work/versionista/VERSION)
I, [2015-01-16T16:25:51.196019 #16064]  INFO -- : Done

$ cat VERSION
2.1.1
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/versionista/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
