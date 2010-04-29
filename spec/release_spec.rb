require 'sinatra'
require 'dm-core'
require File.expand_path(File.dirname(__FILE__) + '/../lib/release')

describe Release do
  describe 'attributes' do
    it 'should have a description' do
      Release.new.respond_to?(:description).should == true
    end
    it 'should have a date' do
      Release.new.respond_to?(:date).should == true
    end
  end
end
