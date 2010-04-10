require 'sinatra'
require 'dm-core'
require File.expand_path(File.dirname(__FILE__) + '/../lib/feature')

describe Feature do
  describe 'attributes' do
    it 'should have a description' do
      Feature.new.respond_to?(:description).should == true
    end
  end
end
