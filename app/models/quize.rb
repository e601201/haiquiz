class Quize < ApplicationRecord
  validates :title, length: {maximum: 10}
  validates :content, length:{maximum: 20}
  
  validates :first_line, presence: {message:"上の句が書かれていません"} , length: {maximum: 7}
  validates :second_line, presence: {message:"中の句が書かれていません"}, length: {maximum: 9}
  validates :third_line, presence: {message:"下の句が書かれていません"}, length: {maximum: 7}
  validates :status,presence: true
  validates :answer_word,presence: true, length: {maximum: 7}
  enum :status, { first_line: 0, second_line: 1, third_line: 2 }, prefix: false, scopes: false

  def select_answer_word_line(quize)
    p quize.status
    p second_line
    if quize.status == "first_line"
      word = quize.first_line
    elsif quize.status == "second_line"
      word = quize.second_line
    elsif quize.status == "third_line"
      word = quize.third_line
    end
    p word
    return word
  end
end