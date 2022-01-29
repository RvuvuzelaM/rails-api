# frozen_string_literal: true

class Project < ApplicationRecord
  has_many :groups, dependent: :destroy
  has_many :notes, through: :groups
end
