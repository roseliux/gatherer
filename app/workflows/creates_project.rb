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
    @task_string.split(/\n/).map do |one_task|
      title, size = one_task.split(':')
      Task.new(title: title, size: size_as_integer(size))
    end
  end

  def size_as_integer(size_string)
    size = size_string.to_i
    size = size <= 0 ? 1 : size
  end

  def create
    build
    project.save
  end
end
