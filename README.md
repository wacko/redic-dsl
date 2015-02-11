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

redis.pipelined do |r|
  r.set "baz", 1
  r.incr "baz"
  r.get "baz"
end
# => ["OK", 2, "2"]
```
