# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

default_password = 'password'
user = User.create(first_name: 'John', last_name: 'Doe', email: 'john@doe.com', password: default_password, password_confirmation: default_password)
9.times do
  User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: default_password, password_confirmation: default_password)
end

project = Project.create(name: 'Project 1', user: user)
4.times do
  Project.create(name: 'Project ' + Faker::Company.industry, user: User.all.shuffle.first)
end

Priority.find_or_create_by(name: 'Low')
normal_priority = Priority.find_or_create_by(name: 'Normal')
Priority.find_or_create_by(name: 'High')
Priority.find_or_create_by(name: 'Urgent')

Issue.create(
  subject: 'Task',
  description: 'Text',
  project: project,
  priority: normal_priority,
  start_date: Date.current,
  due_date: Date.current + 7.days,
  status: 1,
  estimated_hours: 10,
  done_ratio: 0,
  user: user,
  assigned_to: user
)
20.times do |index|
  Issue.create(
    subject: 'Task ' +  Faker::Company.name,
    description: Faker::Lorem.paragraph(sentence_count: 3),
    project: Project.all.shuffle.first,
    priority: Priority.all.shuffle.first,
    start_date: Date.current + index.days,
    due_date: Date.current + 7.days + index.days,
    status: Issue.statuses.values.shuffle.first,
    estimated_hours: (10..100).to_a.shuffle.first,
    done_ratio: 0,
    user: User.all.shuffle.first,
    assigned_to: User.all.shuffle.first
  )
end


2.times do |index|
  issue1 = Issue.first
  issue2 = Issue.last
  user1 = User.first
  user2 = User.last

  TimeEntry.create(project: issue1.project, issue: issue1, user: user1, spent_on: 2.days.ago.to_date, hours: 1, comments: 'text')
  TimeEntry.create(project: issue1.project, issue: issue1, user: user1, spent_on: 1.days.ago.to_date, hours: 1, comments: 'text')
  TimeEntry.create(project: issue2.project, issue: issue2, user: user2, spent_on: 2.days.ago.to_date, hours: 2, comments: 'text')
  TimeEntry.create(project: issue2.project, issue: issue2, user: user2, spent_on: 1.days.ago.to_date, hours: 2, comments: 'text')
end
