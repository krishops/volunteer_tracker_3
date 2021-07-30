require('sinatra')
require('sinatra/reloader')
require('./lib/project')
require('./lib/volunteer')
also_reload('lib/**/*.rb')
require('pry')
require('pg')

DB = PG.connect({ dbname: 'volunteer_tracker', host: 'db', user: 'postgres', password: 'password' })

get '/' do
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
