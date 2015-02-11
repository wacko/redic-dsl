require "redic"

class Redic::Dsl < Redic

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

end
