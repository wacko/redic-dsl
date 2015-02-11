require "redic"

class Redic::Dsl < Redic

  class Queue

    def initialize connection
      @connection = connection
    end

    def method_missing name, *arguments, &block
      command = name.to_s
      self.class.send(:define_method, name) do |*args|
        @connection.queue command, *args
      end
      send name, *arguments
    end

  end

  alias_method :connection, :client
  undef :client

  def method_missing name, *arguments, &block
    command = name.to_s
    response = call command, *arguments

    unless response.is_a? RuntimeError
      self.class.send(:define_method, name) do |*args|
        call command, *args
      end
    end

    response
  end

  def pipelined(&block)
    yield Redic::Dsl::Queue.new(self)
    commit
  end

end
