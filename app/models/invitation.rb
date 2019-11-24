# frozen_string_literal: true

class Invitation < ApplicationRecord
  belongs_to :event
  belongs_to :inviter, class_name: 'User', foreign_key: 'inviter_id'
  belongs_to :invited, class_name: 'User', foreign_key: 'invited_id'

  validates :event, uniqueness: { scope: %i[inviter invited] }
end
