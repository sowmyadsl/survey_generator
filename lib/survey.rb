class Survey < ActiveRecord::Base
  has_many :question
  before_save :capitalize_title
  validates(:survey_title, :presence => true)
private

  def capitalize_title
    self.survey_title = survey_title.titleize
  end
end
