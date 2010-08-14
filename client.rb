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
  --
  f -d :id  
    delete /feature/:id

  --
  r :id 
    get /release/:id
  --
  r :id s 
    get /release/:id/stories
  --
  r -c "some description" "2010-01-01" 
    post /release/ {description: "some description", date: "2010-01-01"}
  --
  r -ud :id "some description" 
    post /release/:id {description: "some description"}
  --
  r -ut :id 2010-01-01
    post /release/:id {date: 2010-01-01}
  --
  r -d :id  
    delete /release/:id

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

def get_feature_stories(id)
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

def delete_feature(id)
  puts "Deleting Feature(#{id})"
  resp = Fable.delete("/feature/#{id}")
  puts resp
end

def get_release(id)
  output = Fable.get("/release/#{id}")
  if output == nil
    puts 'Invalid release id provided'
  else
    puts output.to_yaml
  end
end

def get_release_stories(id)
  output = Fable.get("/release/#{id}/stories")
  if output == nil
    puts 'Invalid release id provided'
  else
    puts output.to_yaml
  end
end

def new_release(description)
  puts description
  release = Fable.post("/release", 
                       {:body => {:description => description}})
  puts release.to_yaml
end

def update_release_description(id, description)
  puts id, description
  release = Fable.post("/release/#{id}", 
                       {:body => {:description => description}})
  puts release.to_yaml
end
def update_release_date(id, date)
  puts id, date
  release = Fable.post("/release/#{id}", 
                       {:body => {:date => date}})
  puts release.to_yaml
end

def delete_release(id)
  puts "Deleting Release(#{id})"
  resp = Fable.delete("/release/#{id}")
  puts resp
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
        get_feature_stories args[1]
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
    elsif args[1] == '-d'
      if args[2] == nil
        print_help
      else
        delete_feature args[2]
      end
    else
      print_help
    end
  elsif args[0] == 'r' 
    if args[1] == nil
      print_help
    elsif args[1].to_i != 0
      if args[2] == nil
        get_release(args[1])
      elsif args[2] == 's'
        get_release_stories args[1]
      end
    elsif args[1] == '-c'
      if args[2] == nil
        print_help
      else
        new_release args[2]
      end
    elsif args[1] == '-ud'
      if args[2] == nil || args[2].to_i == 0 || args[3] == nil
        print_help
      else
        update_release_description(args[2], args[3])
      end
    elsif args[1] == '-ut'
      if args[2] == nil || args[2].to_i == 0 || args[3] == nil
        print_help
      else 
        update_release_date(args[2], args[3])
      end
    elsif args[1] == '-d'
      if args[2] == nil
        print_help
      else
        delete_release args[2]
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
