require 'rails_helper'

RSpec.describe CreatesProject do
  describe 'initialization' do
    it 'creates a project given a name' do
      creator = CreatesProject.new(name: 'Project Runway')
      creator.build
      expect(creator.project.name).to eq('Project Runway')
    end
  end

  describe 'task string parsing' do
    it 'handles an empty string' do
      creator = CreatesProject.new(name: 'Project Runway', task_string: '')
      tasks = creator.convert_string_to_tasks
      expect(tasks).to be_empty
    end

    it 'handles a single string' do
      creator = CreatesProject.new(name: 'Project Runway', task_string: 'Start Things')
      tasks = creator.convert_string_to_tasks
      expect(tasks.size).to eq(1)
      expect(tasks.first).to have_attributes(title: 'Start Things', size: 1)
    end

    it 'handles a single string with size zero' do
      creator = CreatesProject.new(name: 'Project Runway',
                                   task_string: 'Start Things:0')
      tasks = creator.convert_string_to_tasks
      expect(tasks.size).to eq(1)
      expect(tasks.first).to have_attributes(title: 'Start Things', size: 1)
    end

    it 'handles a single string with malformed size' do
      creator = CreatesProject.new(name: 'Project Runway',
                                  task_string: 'Start Things:')
      tasks = creator.convert_string_to_tasks
      expect(tasks.size).to eq(1)
      expect(tasks.first).to have_attributes(title: 'Start Things', size: 1)
    end

    it 'handles a single string with negative size' do
      creator = CreatesProject.new(name: 'Project Runway',
                                   task_string: 'Start Things:-1')
      tasks = creator.convert_string_to_tasks
      expect(tasks.size).to eq(1)
      expect(tasks.first).to have_attributes(title: 'Start Things', size: 1)
    end

    it 'handles multiple task' do
    end

    it 'attaches tasks to the project' do
    end
  end
end
