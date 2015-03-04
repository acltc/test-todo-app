require 'rails_helper'


RSpec.describe List do
  describe 'complete_all_tasks!' do

    it 'should mark all tasks as complete' do
      list = List.create(:name => "Todos")
      task_1 = Task.create(:name => "Take out trash", :complete => false, :list_id => list.id)
      task_2 = Task.create(:name => "Mow the lawn", :complete => false, :list_id => list.id)
      list.complete_all_tasks!
      task_1.reload
      task_2.reload
      expect(task_1.complete).to eq(true)
      expect(task_2.complete).to eq(true)
    end
  end

  describe 'snooze_all_tasks!' do

    it 'should push deadlines of all tasks by one hour' do
      deadline = DateTime.new(2001,2,3)
      list = List.create(:name => "Todos")
      task_1 = Task.create(:name => "Take out trash", :deadline => deadline, :list_id => list.id)
      task_2 = Task.create(:name => "Mow the lawn", :deadline => deadline, :list_id => list.id)
      list.snooze_all_tasks!
      task_1.reload
      task_2.reload
      expect(task_1.deadline).to eq(deadline + 1.hour)
      expect(task_2.deadline).to eq(deadline + 1.hour)
    end
  end

  describe 'total_duration' do
    it 'should return the sum of the duration of all tasks' do
      list = List.create(:name => "Todos")
      task_1 = Task.create(:name => "Take out trash", :duration => 2, :list_id => list.id)
      task_2 = Task.create(:name => "Mow the lawn", :duration => 3, :list_id => list.id)
      expect(list.total_duration).to eq(5)
    end
  end

  describe 'incomplete_tasks' do
    it 'should return all incomplete tasks from list' do
      list = List.create(:name => "Todos")
      task_1 = Task.create(:name => "Take out trash", :complete => true, :list_id => list.id)
      task_2 = Task.create(:name => "Mow the lawn", :complete => false, :list_id => list.id)

      expect(list.incomplete_tasks).to be_a(Array)
      expect(list.incomplete_tasks.count).to eq(1)
      expect(list.incomplete_tasks.first.name).to eq("Mow the lawn")
    end
  end

  describe 'favorite_tasks' do
    it 'should return all favorite tasks from list' do
      list = List.create(:name => "Todos")
      task_1 = Task.create(:name => "Take out trash", :favorite => true, :list_id => list.id)
      task_2 = Task.create(:name => "Mow the lawn", :favorite => false, :list_id => list.id)
      
      expect(list.favorite_tasks).to be_a(Array)
      expect(list.favorite_tasks.count).to eq(1)
      expect(list.favorite_tasks.first.name).to eq("Take out trash")
    end
  end

  describe 'prioritized_tasks' do
    it 'should return array of all overdue tasks' do
      list = List.create(:name => "Todos")
      task_1 = Task.create(:name => "Take out trash", :priority => 5, :list_id => list.id)
      task_2 = Task.create(:name => "Mow the lawn", :priority => 3, :list_id => list.id)
      task_3 = Task.create(:name => "Feed the cat", :priority => 10, :list_id => list.id)

      expect(list.prioritized_tasks.first.name).to eq("Feed the cat")
      expect(list.prioritized_tasks.last.name).to eq("Mow the lawn")
    end

  end

  

end 