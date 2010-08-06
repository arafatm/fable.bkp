#!/usr/bin/ruby

require 'rubygems'
require 'httparty'
require 'shellwords'


class Fable
  include HTTParty
  base_uri 'localhost:4567'
end

def print_help
  helps = <<-END
Valid Inputs:
  --
  f id -> get /feature/:id
  e.g. f 1
  --
  s id -> get /feature/:id/stories
  e.g. s 1
  --
    END
  puts helps
end

def get_feature(id)
  output = Fable.get("/feature/#{id}")
  if output == nil
    puts 'Invalid feature id provided'
  else
    puts output.to_yaml
  end
end

def get_stories(id)
  output = Fable.get("/feature/#{id}/stories")
  if output == nil
    puts 'Invalid feature id provided'
  else
    puts output.to_yaml
  end
end

print '> '
while input = STDIN.gets
  puts '------------'
  args = Shellwords.shellwords(input)

  if args[0] =~ /^h$/
    print_help
  elsif args[0] =~ /^help$/
    print_help
  elsif args[0] == 'f' 
    if args[1] == nil
      puts 'Please provide an id'
      puts 'e.g. f 1'
    else
      get_feature(args[1])
    end
  elsif args[0] == 's' 
    if args[1] == nil
      puts 'Please provide a feature id'
      puts 'e.g. s 1'
    else
      get_stories(args[1])
    end
  end
  puts '============'
  print '> '
end
