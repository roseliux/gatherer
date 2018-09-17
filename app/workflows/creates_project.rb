class CreatesProject
  attr_accessor :name, :project

  def initialize(name: '', task_string: '')
    @name = name
    @task_string = task_string
  end

  def build
    self.project = Project.new(name: name)
    project.tasks = convert_string_to_tasks
    project
  end

  def convert_string_to_tasks
    tasks = []
    @task_string.split(/\n/).each do |string|
      task = convert_string_to_task(string)
      tasks << task if task
    end
    tasks
  end

  def convert_string_to_task(string)
    title = string.split(':')[0]
    return if title.nil?
    size = string.split(':')[1].to_i
    size = size.to_i <= 0 ? 1 : size
    Task.new(title: title, size: size)
  end

  def create
    build
    project.save
  end
end
