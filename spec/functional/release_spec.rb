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

  describe 'get /release/:id/stories' do
    it 'should return release with given id' do
      r = Release.new(:description => 'New Release')
      f = Feature.new(:description => 'New Feature')

      r.save
      f.save

      r.stories.new(:description => '1', :feature => f).save
      r.stories.new(:description => '2', :feature => f).save
      r.stories.new(:description => '3', :feature => f).save

      get "/release/#{r.id}/stories"

      last_response.body.should == r.stories.to_json
    end
  end

  describe 'post /release' do
    it 'should accept a new release with a description' do
      post '/release', params={:description => 'new description'}
      f = Release.last
      last_response.body.should == f.to_json
    end
  end

  describe 'post /release/:id with description and date' do
    it 'should update the release description and date for the given id' do
      d = Date.today
      r = Release.new(:description => 'Existing Release', :date => d)
      r.save

      post "release/#{r.id}", params={
        :description => 'new existing description',
        :date => d + 14}

      r = Release.first(:id => r.id)
      r.description.should == 'new existing description'
      r.date.to_s.should == (d + 14).to_s
      last_response.body.should == r.to_json
    end
  end

  describe 'delete /release/:id' do
    it 'should return true when successfully deleting the release with the given id' do
      f = Release.new(
        :description => "Release #{Time.now.strftime('%Y%m%d.%H%M%S')}")

      f.save

      delete "release/#{f.id}"
      last_response.body.should == "true"
    end

    it 'should return false when attempting to delete a nonexistent release' do
      delete "release/1" # This release should not exist
      last_response.body.should == "false"
    end
  end
end
