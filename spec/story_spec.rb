require 'sinatra'
require 'dm-core'
require File.expand_path(File.dirname(__FILE__) + '/../lib/story')

describe Story do
  describe 'attributes' do
    before do
      Story.all.destroy!
    end
    it 'should have a description' do
      Story.new.respond_to?(:description).should == true
    end

    it 'should have points' do
      Story.new.respond_to?(:points).should == true
    end

    it 'should have a position' do
      Story.new.respond_to?(:position).should == true
    end

    it 'should have a status' do
      Story.new.respond_to?(:status).should == true
    end

  end

  describe 'behaviour' do
    before do
      stories = Story.all
      stories.destroy!
      Story.new(:description => 'story 01', :points => 5, 
                :status => Story::STATUSES[0]).save
      Story.new(:description => 'story 02', :points => 5, 
                :status => Story::STATUSES[0]).save
      Story.new(:description => 'story 03', :points => 5, 
                :status => Story::STATUSES[0]).save
    end

    it 'should default order by position' do
      stories = Story.all
      stories[0].move 3
      stories[0].description.should.equal 'story 02'
    end

    it 'should assign a default position' do
      s = Story.new(:description => 'story 01', :points => 5)
      s.save
      s.position.should.not.be.nil

    end

    it 'should require a description' do
      s = Story.new
      s.save
      s.errors.on(:description).should.include "Description must not be blank"
    end

    it 'should allow assignment of a status' do
      s = Story.new(:description => 'story')
      s.status = s.statuses[0]
      s.save
      s.status.should == Story::STATUSES[0]
    end

    it 'should allow finding of stories by status' do
      stories = Story.by_status(Story::STATUSES[0])
      stories.count.should == 3
    end
  end 
end
