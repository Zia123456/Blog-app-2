ENV["BUNDLE_GEMFILE"] ||= File.expand_path("../Gemfile", __dir__)

require_relative "bundler/setup" # Set up gems listed in the Gemfile.
require_relative "bootsnap/setup" # Speed up boot time by caching expensive operations.
