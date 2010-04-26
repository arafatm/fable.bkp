require File.dirname(__FILE__) + '/spec_helper'

describe Feature do
  describe 'attributes' do
    it 'should have a description' do
      Feature.new.respond_to?(:description).should == true
    end
  end
  
  describe 'associations' do
    before do
      Feature.all.destroy!
      Task.all.destroy!
    end

    it 'should have many tasks' do
      f = Feature.new(:description => 'Feature')
      f.save
      f.tasks.new.save.should == true
    end
  end
end
