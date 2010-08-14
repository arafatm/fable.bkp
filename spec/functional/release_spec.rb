require File.dirname(__FILE__) + '/../spec_helper'
require 'rack/test'

include Rack::Test::Methods

def app
  Sinatra::Application
end

describe 'Release service' do
  before do
    DataMapper::Model.descendants.each {|m| m.all.destroy!}
  end

  describe 'get /release/:id' do
    it 'should return release with given id' do
      f = Release.new(:description => 'New Release')
      f.save

      get "/release/#{f.id}"

      last_response.body.should == f.to_json
    end
  end

#  describe 'get /release/:id/stories' do
#    it 'should return release with given id' do
#      f = Release.new(:description => 'New Release')
#      f.save
#
#      f.stories.new(:description => '1').save
#      f.stories.new(:description => '2').save
#      f.stories.new(:description => '3').save
#
#      get "/release/#{f.id}/stories"
#
#      last_response.body.should == f.stories.to_json
#    end
#  end
#
  describe 'post /release' do
    it 'should accept a new release with a description' do
      post '/release', params={:description => 'new description'}
      f = Release.last
      last_response.body.should == f.to_json
    end
  end

#  describe 'post /release/:id with description' do
#    it 'should update the release description for the given id' do
#      f = Release.new(:description => 'Existing Release')
#      f.save
#
#      post "release/#{f.id}", params={:description => 'new existing description'}
#
#      f = Release.first(:id => f.id)
#      last_response.body.should == f.to_json
#    end
#  end
#
#  describe 'delete /release/:id' do
#    it 'should return true when successfully deleting the release with the given id' do
#      f = Release.new(
#        :description => "Release #{Time.now.strftime('%Y%m%d.%H%M%S')}")
#
#      f.save
#
#      delete "release/#{f.id}"
#      last_response.body.should == "true"
#    end
#
#    it 'should return false when successfully deleting the release with the given id' do
#      delete "release/1" # This release should not exist
#      last_response.body.should == "false"
#    end
#  end
end
