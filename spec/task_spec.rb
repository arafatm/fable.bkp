require 'sinatra'
require 'dm-core'
require File.expand_path(File.dirname(__FILE__) + '/../lib/task')

describe Task do
  describe 'attributes' do
    it 'should have a description' do
      Task.new.respond_to?(:description).should == true
    end
    it 'should have an estimate' do
      Task.new.respond_to?(:estimate).should == true
    end
    it 'should have a status' do
      Task.new.respond_to?(:status).should == true
    end
  end
end
