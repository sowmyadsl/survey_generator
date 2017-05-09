require('spec_helper')

describe(Survey) do
  it("Capitalizes the first letter of survey title") do
    survey = Survey.create({:survey_title => 'personality test'})
    expect(survey.survey_title).to eq 'Personality Test'
  end

  it 'returns questions assigned to survey' do
    survey = Survey.create({:survey_title => 'personality test'})
    question1 = Question.create({:survey_id => survey.id})
    question2 = Question.create({:survey_id => survey.id})
    expect(survey.questions).to eq [question1, question2]
  end
end
