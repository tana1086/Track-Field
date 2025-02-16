class Sprint < ApplicationRecord
  belongs_to :competition_result, dependent: :destroy
end
