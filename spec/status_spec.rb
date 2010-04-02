require File.expand_path(File.dirname(__FILE__) + '/../lib/status')

describe Status do
  describe 'attributes' do
    it 'should have a name' do
      Status.new.respond_to?(:name).should == true
    end
  end

  describe 'behaviour' do
    it 'should require a name' do
      s = Status.new
      s.save
      s.errors.on(:name).should.include "Name must not be blank"
    end
  end

end
