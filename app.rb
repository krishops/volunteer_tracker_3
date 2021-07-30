require('sinatra')
require('sinatra/reloader')
require('./lib/project')
require('./lib/volunteer')
also_reload('lib/**/*.rb')
require('pry')
require('pg')

DB = PG.connect({ dbname: 'volunteer_tracker', host: 'db', user: 'postgres', password: 'password' })

get '/' do
  redirect to '/projects'
end

get '/projects' do
  @projects = Project.all
  erb(:main)
end

get '/projects/new' do
  erb(:new_project)
end

post '/projects' do
  title = params[:title]
  project = Project.new({:title => title, :id => nil})
  project.save()
  redirect to '/'
end

get '/projects/:id' do
  @project = Project.find(params[:id].to_i())
  erb(:project)
end

get '/projects/:id/edit' do
  @project = Project.find(params[:id].to_i())
  erb(:edit_project)
end

patch '/projects/:id' do
  @project = Project.find(params[:id].to_i())
  @project.update(params[:title])
  redirect to('/projects')
end

delete '/projects/:id' do
  @project = Project.find(params[:id].to_i())
  @project.delete()
  redirect to('/projects')
end

post '/projects/:id/volunteers' do
  @project = Project.find(params[:id].to_i())
  volunteer = Volunteer.new({:name => params[:volunteer_name], :project_id => @project.id, :id => nil})
  volunteer.save()
  erb(:project)
end

