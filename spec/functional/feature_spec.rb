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

  describe 'post /feature' do
    it 'should accept a new feature with a description' do
      post '/feature', params={:description => 'new description'}
      f = Feature.last
      last_response.body.should == f.to_json
    end
  end

  describe 'post /feature/:id with description' do
    it 'should update the feature description for the given id' do
      f = Feature.new(:description => 'Existing Feature')
      f.save

      post "feature/#{f.id}", params={:description => 'new existing description'}

      f = Feature.first(:id => f.id)
      last_response.body.should == f.to_json
    end
  end

  describe 'delete /feature/:id' do
    it 'should return true when successfully deleting the feature with the given id' do
      f = Feature.new(
        :description => "Feature #{Time.now.strftime('%Y%m%d.%H%M%S')}")

      f.save

      delete "feature/#{f.id}"
      last_response.body.should == "true"
    end

    it 'should return false when successfully deleting the feature with the given id' do
      delete "feature/1" # This feature should not exist
      last_response.body.should == "false"
    end
  end
end
