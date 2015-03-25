$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'middleware_variadic'

# Do not buffer output
$stdout.sync = true
$stderr.sync = true

# Configure RSpec
RSpec.configure do |c|
end