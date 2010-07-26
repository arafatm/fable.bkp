require File.dirname(__FILE__) + '/../spec_helper'

describe Release do
  describe 'attributes' do
    it 'should have a description' do
      Release.new.respond_to?(:description).should == true
    end
    it 'should have a date' do
      Release.new.respond_to?(:date).should == true
    end
  end
  describe 'associations' do
    before do
      DataMapper::Model.descendants.each {|m| m.all.destroy!}
    end

    it 'should have many stories' do
      r = Release.new(:description => 'Release')
      f = Feature.new(:description => 'Feature')
      r.save
      f.save
      r.stories(:description => 'Story',
              :feature => f).new.save.should == true
    end
  end
end
