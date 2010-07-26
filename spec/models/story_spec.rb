require File.dirname(__FILE__) + '/../spec_helper'

describe Story do
  describe 'attributes' do
    it 'should have a description' do
      Story.new.respond_to?(:description).should == true
    end
    it 'should have an points' do
      Story.new.respond_to?(:points).should == true
    end
    it 'should have a status' do
      Story.new.respond_to?(:status).should == true
    end
  end
  describe 'associations' do
    before do
      DataMapper::Model.descendants.each {|m| m.all.destroy!}
    end
    it 'should belong to a feature' do
      r = Release.new(:description => 'release')
      f = Feature.new(:description => 'feature')
      f.stories.new(:description => 'story',
                  :points => 5,
                  :release => r).save.should == true
    end
    it 'should belong to a release' do
      r = Release.new(:description => 'Release')
      f = Feature.new(:description => 'feature')
      r.stories.new(:description => 'story',
                  :points => 5,
                  :feature => f).save.should == true
    end
    it 'should not be required to belong to a release' do
      r = Release.new(:description => 'Release')
      f = Feature.new(:description => 'feature')
      f.stories.new(:description => 'story',
                  :points => 5,
                  :release => nil).save.should == true
    end
  end
end
