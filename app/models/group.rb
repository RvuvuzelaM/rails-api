# frozen_string_literal: true

class Group < ApplicationRecord
  has_many :notes, dependent: :destroy
  belongs_to :project
end
