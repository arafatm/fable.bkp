#require File.dirname(__FILE__) + '/../spec_helper'
require 'bacon'

describe Feature do
  describe 'attributes' do
    it 'should have a description' do
      Feature.new.respond_to?(:description).should == true
    end
  end
  
  describe 'associations' do
    before do
      DataMapper::Model.descendants.each {|m| m.all.destroy!}
    end

    it 'should have many stories' do
      r = Release.new(:description => 'Release')
      r.save
      f = Feature.new(:description => 'Feature')
      f.save
      f.stories(:description => 'Story',
              :release => r).new.save.should == true
    end
  end
end
