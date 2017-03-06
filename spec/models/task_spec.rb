require 'rails_helper'

RSpec.describe Task, type: :model do
  describe '#toggle_complete!' do 
    it "should switch complete to false if it began as true" do
      task = Task.new(complete: true)
      task.toggle_complete!
      expect(task.complete).to eq(false)
    end

    it "should switch complete to true if it began as false" do 
      task = Task.new(complete: false)
      task.toggle_complete!
      expect(task.complete).to eq(true)
    end
  end

  describe '#toggle_favorite!' do
    it "should switch complete to false if it began as true" do
      task = Task.new(favorite: true)
      task.toggle_favorite!
      expect(task.favorite).to eq(false)
    end

    it "should switch complete to true if it began as false" do 
      task = Task.new(favorite: false)
      task.toggle_favorite!
      expect(task.favorite).to eq(true)
    end
  end

  describe '#overdue?' do
    it "should return true if the deadline is less than Time.now" do
      task = Task.new(deadline: Time.now - 1.hour)
      expect(task.overdue?).to eq(true)
    end

    it "should return false if the deadline is greater than Time.now" do
      task = Task.new(deadline: Time.now + 1.hour)
      expect(task.overdue?).to eq(false)
    end
  end

  describe '#increment_priority!' do
    it "should return true if the priority is equal to priority plus one" do
      task = Task.new(priority: 4)
      expect(task.increment_priority!).to eq(true)
    end
  end

  describe '#decrement_priority!' do
    it "should return true if the priority is equal to priority minus one" do
      task = Task.new(priority: 4)
      expect(task.decrement_priority!).to eq(true)
    end
  end

  describe 'snooze_hour!' do
    it "should return true if the snooze_hour is equal to the deadline plus one hour" do
      task = Task.new(deadline: Time.now)
      expect(task.snooze_hour!).to eq(true)
    end
  end
end
