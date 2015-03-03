require 'rails_helper'


RSpec.describe Task do 
  describe 'toggle_complete!' do
    it 'should switch complete to false if it began as true' do
      task = Task.new(:complete => true)
      task.toggle_complete!
      expect(task.complete).to eq(false)
    end

    it 'should switch complete to true if it began as false' do
      task = Task.new(:complete => false)
      task.toggle_complete!
      expect(task.complete).to eq(true)
    end
  end

end