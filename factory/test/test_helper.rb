require 'minitest'
require 'minitest/spec'
require 'minitest/autorun'
require 'stringio'

module Kernel

def capture
  out = StringIO.new
  $stdout = out
  yield
  return out

  ensure
    $stdout = STDOUT
  end

end
