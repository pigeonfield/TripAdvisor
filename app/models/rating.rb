class Rating < ApplicationRecord
    belongs_to :destination
    belongs_to :redactor
end
