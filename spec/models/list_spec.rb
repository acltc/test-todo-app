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

  

end 