require 'juggalo'
require 'rack'
require 'pry'

run ->(env) { [200, {'Content-Type'=>'text/html'}, [Juggalo.fetch('foo')]] }

