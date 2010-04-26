require 'rubygems'
require 'sinatra'
require 'dm-core'
require File.expand_path(File.dirname(__FILE__) + '/../lib/feature')
require File.expand_path(File.dirname(__FILE__) + '/../lib/task')

set :environment, :test

describe Feature do
  describe 'attributes' do
    it 'should have a description' do
      Feature.new.respond_to?(:description).should == true
    end
  end
  
  describe 'associations' do
    before do
      Feature.all.destroy!
      Task.all.destroy!
    end

    it 'should have many tasks' do
      f = Feature.new(:description => 'Feature').save
      puts f.tasks.new.save
    end
  end
end
