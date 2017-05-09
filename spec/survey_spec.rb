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
    expect(survey.question).to eq [question1, question2]
  end

  it 'validates the presence of input' do
    survey = Survey.create({:survey_title => ""})
    expect(survey.save).to eq(false)
  end
end
