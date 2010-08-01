require File.dirname(__FILE__) + '/../spec_helper'
require 'rack/test'

include Rack::Test::Methods

def app
  Sinatra::Application
end

describe 'Feature service' do
  before do
    DataMapper::Model.descendants.each {|m| m.all.destroy!}
  end

  describe 'get /feature/:id' do
    it 'should return feature with given id' do
      f = Feature.new(:description => 'New Feature')
      f.save

      get "/feature/#{f.id}"

      last_response.body.should == f.to_json
    end
  end

  describe 'get /feature/:id/stories' do
    it 'should return feature with given id' do
      f = Feature.new(:description => 'New Feature')
      f.save

      f.stories.new(:description => '1').save
      f.stories.new(:description => '2').save
      f.stories.new(:description => '3').save

      get "/feature/#{f.id}/stories"

      last_response.body.should == f.stories.to_json
    end
  end

end
