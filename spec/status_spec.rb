require File.expand_path(File.dirname(__FILE__) + '/../lib/status')

describe Status do

  it 'should have a name' do
    Status.new.respond_to?(:name).should == true
  end
end
