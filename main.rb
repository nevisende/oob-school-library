#!/usr/bin/env ruby
require './init'
require_relative './store'

# Opener
puts "---------------------------------\n
 Welcome to School Library App!\n
------------------------------"
store = Store.new

init(store)
