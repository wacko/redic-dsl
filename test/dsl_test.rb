require "cutest"
require_relative "../lib/redic/dsl"

setup do
  Redic::Dsl.new("redis://localhost:6379")
end

test "DSL usage" do |r|
  r.set("foo", "bar")
  assert_equal "bar", r.get("foo")
  r.set("foo", "baz")
  assert_equal "baz", r.get("foo")
end

test "DSL define_method" do |r|
  r.set("foo", "bar")
  assert r.respond_to?(:set)
end

test "Pipeline usage" do |redis|
  response = redis.pipelined do |r|
    r.set "baz", 1
    r.incr "baz"
    r.get "baz"
  end
  assert_equal ["OK", 2, "2"], response
end
