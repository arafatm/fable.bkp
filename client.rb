#!/usr/bin/ruby

# TODO: Verify server is running


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
  f :id 
    get /feature/:id
  --
  f :id s 
    get /feature/:id/stories
  --
  f -c "some description" 
    post /feature/ {description: "some description"}
  --
  f -u :id "some description" 
    post /feature/:id {description: "some description"}
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

def new_feature(description)
  puts description
  feature = Fable.post("/feature", 
                       {:body => {:description => description}})
  puts feature.to_yaml
end

def update_feature(id, description)
  puts id, description
  feature = Fable.post("/feature/#{id}", 
                       {:body => {:description => description}})
  puts feature.to_yaml
end

print '> '
while input = STDIN.gets
  puts '------------'
  args = Shellwords.shellwords(input)

  if args[0] == 'q'
    exit
  elsif args[0] == 'f' 
    if args[1] == nil
      print_help
    elsif args[1].to_i != 0
      if args[2] == nil
        get_feature(args[1])
      elsif args[2] == 's'
        get_stories args[1]
      end
    elsif args[1] == '-c'
      if args[2] == nil
        print_help
      else
        new_feature args[2]
      end
    elsif args[1] == '-u'
      if args[2] == nil || args[2].to_i == 0 || args[3] == nil
        print_help
      else
        update_feature(args[2], args[3])
      end
    else
      print_help
    end
  else
    print_help
  end
  puts '============'
  print '> '
end
