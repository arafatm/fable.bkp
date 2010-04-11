require File.dirname(__FILE__) + '/spec_helper'

describe Task do
  describe 'attributes' do
    it 'should have a description' do
      Task.new.respond_to?(:description).should == true
    end
    it 'should have an points' do
      Task.new.respond_to?(:points).should == true
    end
    it 'should have a status' do
      Task.new.respond_to?(:status).should == true
    end
  end
  describe 'associations' do
    before do
      @f = Feature.new(:description => 'feature')
    end
    it 'should belong to a  feature' do
      @f.tasks.new(:description => 'task',
                   :points => 5).save
      @f.tasks.count.should == 1
    end
  end
end
