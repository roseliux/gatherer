class CreatesProject
  attr_accessor :name, :project, :task_string

  def initialize(name: '', task_string: '')
    @name        = name
    @task_string = task_string
    @success     = false
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
    size_string.to_i <= 0 ? 1 : size_string.to_i
  end

  def create
    build
    @success = project.save
  end

  def success?
    @success
  end
end
