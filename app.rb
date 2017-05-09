require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require './lib/survey'
require './lib/question'
require './lib/answer'
also_reload('lib/**/*.rb')

get('/') do
  @surveys = Survey.all
  erb(:index)
end

post('/surveys') do
  survey_title = params.fetch("survey_title")
  survey = Survey.create({:survey_title => survey_title})
  survey.save
  redirect '/'
end
