require('sinatra')
require('sinatra/reloader') if development?
require('pry')

require_relative('./models/student')
require_relative('./models/house')

get '/' do
  redirect('/students')
end

get '/students' do
  @students = Student.all()
  erb(:students)
end

post '/students' do
    student = Student.new(params)
    student.save()
    redirect('/students')
end

get '/students/new' do
  @houses = House.all()
  erb(:new)
end

post '/students/delete' do
  # binding.pry
  @student = Student.find(params['student_id'].to_i)
  @student.delete()
  redirect('/students')
end
