require 'spec_helper'

describe Question do
  it 'returns the survey a question belongs to' do
    survey1 = Survey.create({:survey_title => 'personality test'})
    question1 = Question.create({:survey_id => survey1.id, :question => 'are you more like a dog or a cat?'})
    expect(question1.survey_id).to eq survey1.id
  end
end
