class AddDescriptionToQuestions < ActiveRecord::Migration[5.1]
  def change
    add_column(:questions, :question, :string)
    add_column(:answers, :answer, :string)
  end
end
