require File.expand_path(File.dirname(__FILE__) + '/../lib/status')

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
  end

end
