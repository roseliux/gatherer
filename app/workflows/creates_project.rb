class CreatesProject
  attr_accessor :name, :project

  def initialize(name: '', task_string: '')
    @name = name
  end

  def build
    self.project = Project.new(name: name)
  end
end
