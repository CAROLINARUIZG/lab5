class Treatment < ApplicationRecord
  belongs_to :appointment

  has_rich_text :clinical_notes

  validates :date, :reason, :status, presence: true
end