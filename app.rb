
require('sinatra')
require('sinatra/reloader')
require('pry')
require('./lib/project')
require('./lib/volunteer')
require('pg')

DB = PG.connect({:dbname => "volunteer_tracker"})

also_reload('lib/**/*.rb')

get('/') do
  @projects = Project.all
  erb(:home)
end

get('/home') do
  @projects = Project.all
  erv(:home)
end

get('/project/new') do
  erb(:new_project)
end

post ('/home') do
  title = params[:title]
  project = Project.new({:title => title, :id => nil})
  project.save
  @projects = Project.all
  erb(:home)
end
