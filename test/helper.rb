require 'simplecov'
require 'coveralls'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
SimpleCov.start

require 'minitest/autorun'
begin
  require 'turn/autorun'
  Turn.config.format = :pretty
  Turn.config.trace = 5
rescue LoadError
end
require 'shoulda/context'
require 'seqtkrb'
