require 'rails_helper'

RSpec.describe 'adding a project', type: :system do
  it 'allows a user to create a project with tasks' do
    visit new_project_path
    fill_in 'Name', with: 'Project Runway'
    fill_in 'Tasks', with: "Choose Fabric:3\nMake it Work:5"
    click_on('Create Project')
    visit projects_path
    @project = Project.find_by(name: 'Project Runway')

    expect(page).to have_selector("#project_#{@project.id} .name", text: @project.name)
    expect(page).to have_selector("#project_#{@project.id} .total-size", text: @project.total_size)
  end
end
