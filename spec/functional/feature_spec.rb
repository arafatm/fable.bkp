require File.dirname(__FILE__) + '/../spec_helper'
require 'rack/test'

include Rack::Test::Methods

def app
  Sinatra::Application
end

describe 'get /feature/:id' do

  before do
    DataMapper::Model.descendants.each {|m| m.all.destroy!}
  end

  it 'should return feature with given id' do
    f = Feature.new(:description => 'New Feature')
    f.save
    f = Feature.first
    get "/feature/#{f.id}"
    last_response.should.be.ok
  end
end
