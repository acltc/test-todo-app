class List < ActiveRecord::Base
  has_many :tasks

  def complete_all_tasks!
    tasks.each do |task|
      task.update(:complete => true)
    end
  end

  def snooze_all_tasks!
    tasks.each do |task|
      task.snooze_hour!
    end
  end

  def total_duration
    total = 0
    tasks.each do |task|
      total += task.duration
    end
    return total
  end

  def incomplete_tasks
    incomplete_tasks = []
    tasks.each do |task|
      if !task.complete
        incomplete_tasks << task
      end
    end
    return incomplete_tasks
  end

  def favorite_tasks
    favorite_tasks = []
    tasks.each do |task|
      if task.favorite
        favorite_tasks << task
      end
    end
    return favorite_tasks
  end
end
