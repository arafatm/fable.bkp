require File.expand_path(File.dirname(__FILE__) + '/../lib/story')

describe Story do
  it 'should have a description' do
    Story.new.respond_to?(:description).should == true
  end

  it 'should have points' do
    Story.new.respond_to?(:points).should == true
  end

  it 'should have a priority' do
    Story.new.respond_to?(:priority).should == true
  end
end
