#!/bin/sh

echo "tasks 4"
rails generate scaffold User first_name:string last_name:string email:string
rails generate scaffold project name:string description:text user:references
rails generate scaffold priority name:string
rails generate scaffold issue subject:string description:text start_date:date due_date:date status:integer estimated_hours:integer done_ratio:integer priority:references user:references project:references assigned_to_id:integer:index
rails generate model time_entries spent_on:date hours:float comments:string project:references user:references issue:references

echo "tasks 5"
rails generate model journal issue:references user:references notes:text
rails generate model journal_details journal:references property:string old_value:string value:string
rails generate model watchers issue:references user:references
rails g controller dashboard index

echo "tasks 6"
rails g controller time_entries index

echo "tasks 7"
rails generate mailer issue send_journal
