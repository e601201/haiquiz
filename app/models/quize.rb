class Quize < ApplicationRecord
  enum :status, { first_line: 0, second_line: 1, third_line: 2 }, prefix: false, scopes: false
end
