require File.expand_path(File.dirname(__FILE__) + '/../lib/story')

describe Story do
  describe 'attributes' do
    it 'should have a description' do
      Story.new.respond_to?(:description).should == true
    end

    it 'should have points' do
      Story.new.respond_to?(:points).should == true
    end

    it 'should have a position' do
      Story.new.respond_to?(:position).should == true
    end
  end

  describe 'behaviour' do
    before do
      DataMapper.setup(:test, "sqlite3://test.db")
      stories = Story.all
      stories.destroy!
    end

    it 'should default order by position' do
      Story.new(:description => 'story 01', :points => 5).save
      Story.new(:description => 'story 02', :points => 5).save
      Story.new(:description => 'story 03', :points => 5).save
      stories = Story.all
      stories[0].move 3
      stories[0].description.should.equal 'story 02'
    end

  end 
end
