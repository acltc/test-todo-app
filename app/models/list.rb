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

  def prioritized_tasks
    tasks.order(:priority => :desc)
  end

  def task_to_do_next
    ordered_tasks = tasks.order(:deadline)
    ordered_tasks.each do |task|
      return task if task.overdue?
    end
    ordered_tasks = tasks.order(:priority => :desc)
    return ordered_tasks.first    
  end
end
