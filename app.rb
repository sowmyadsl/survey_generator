require 'sinatra'
require 'pry-byebug'
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
  @survey = Survey.create({:survey_title => survey_title})
  @surveys = Survey.all
  if @survey.save
    erb :index
  else
    erb :errors
    # redirect '/'
  end
end

get("/surveys/:id") do
  @survey = Survey.find(params.fetch('id').to_i)
  @questions = Question.all
  erb :survey
end

post '/questions' do
  survey_id = params.fetch('survey_id').to_i()
  @survey = Survey.find(survey_id)
  @question = Question.create({:question => params['question'], :survey_id => survey_id})
  @questions = Question.all
  if @question.save
    #   # redirect '/surveys/' + survey_id.to_s
    erb :survey
  else
    erb :errors
  end
end

patch '/surveys/:id' do
  survey_title = params.fetch("survey_title")
  id = params.fetch('id').to_i()
  @survey = Survey.find(id)
  @survey.update({:survey_title => survey_title})
  erb(:survey)
end

delete '/surveys/:id' do
  @survey = Survey.find(params.fetch('id').to_i())
  @survey.delete
  @surveys = Survey.all
  erb(:index)
end

get '/questions/:id/edit' do
  @question = Question.find(params['id'].to_i)
  erb :questions_edit
end

patch '/questions/:id' do
  @question = Question.find(params['id'])
  @question.update({:question => params['question']})
  erb :questions_edit
end
