require 'rubygems'
require 'bundler/setup'
require 'lotus/setup'
require_relative '../lib/datsu-lotus'
require_relative '../apps/datsu/application'

Lotus::Container.configure do
  mount Datsu::Application, at: '/'
end
