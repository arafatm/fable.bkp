require File.expand_path(File.dirname(__FILE__) + '/../lib/story')

describe Story do
  describe 'attributes' do
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

  describe 'behaviour' do
    before do
      DataMapper.setup(:test, "sqlite3://test.db")
      stories = Story.all
      stories.destroy!
    end

    it 'should default order by priority' do
      Story.new(:description => 'story 01', :points => 5, :priority => '4').save
      Story.new(:description => 'story 02', :points => 5, :priority => '2').save
      Story.new(:description => 'story 03', :points => 5, :priority => '6').save
      stories = Story.all
      stories[0].priority.should.equal 2 
      stories[1].priority.should.equal 4 
      stories[2].priority.should.equal 6 
    end
  end 
end
