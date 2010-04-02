require File.expand_path(File.dirname(__FILE__) + '/../lib/status')
require File.expand_path(File.dirname(__FILE__) + '/../lib/story')

describe Status do
  describe 'attributes' do
    it 'should have a name' do
      Status.new.respond_to?(:name).should == true
    end
    it 'should have a position' do
      Status.new.respond_to?(:position).should == true
    end
  end

  describe 'behaviour' do
    before do
      DataMapper.setup(:test, "sqlite3://test.db")
      statuses = Status.all
      statuses.destroy!
    end

    it 'should require a name' do
      s = Status.new
      s.save
      s.errors.on(:name).should.include "Name must not be blank"
    end
    
    it 'should assign a default position' do
      s = Status.new(:name => 'status 01')
      s.save
      s.position.should.not.be.nil
    end

    it 'should default order by position' do
      Status.new(:name => 'status 01').save
      Status.new(:name => 'status 02').save
      Status.new(:name => 'status 03').save

      s = Status.all[0]
      s.move 10
      Status.all[0].name.should == 'status 02'
    end
  end

  describe 'associations' do
    before do
      DataMapper.setup(:test, "sqlite3://test.db")
      Status.all.destroy!
      Story.all.destroy!
    end

    it 'should have many stories' do
      status = Status.new(:name => 'Ready')
      status.save

      Story.new(:description => 'story 01', :status => status.id).save
      Story.new(:description => 'story 02', :status => status.id).save
      Story.new(:description => 'story 03', :status => status.id).save

      status.stories.count.should == 3
    end



  end

end
