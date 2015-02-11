# redic-dsl

DSL wrapper for Redic

## Description

Add some DSL around [redic][redic], a lightweight [Redis][redis] client.

[redic]: https://github.com/amakawa/redic
[redis]: http://redis.io/documentation

## Installation

```bash
$ gem install redic-dsl
```

## Usage

```ruby
require "redic/dsl"

redis = Redic::Dsl.new("redis://localhost:6379")

redis.set "foo", "bar"
# => "OK"
redis.get "foo"
# => "bar"
```
