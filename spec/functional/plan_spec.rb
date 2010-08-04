require File.dirname(__FILE__) + '/../spec_helper'
require 'rack/test'

include Rack::Test::Methods

def app
  Sinatra::Application
end

describe 'Planner' do
  before do
    DataMapper::Model.descendants.each {|m| m.all.destroy!}
  end

  it 'should return true in the test' do
    true.should.be.true
  end
end
