# frozen_string_literal: true

class User < ApplicationRecord
  has_many :hosted_events, class_name: 'Event', foreign_key: 'creator_id'

  has_many :attendances
  has_many :attended_events, through: :attendances, source: :event

  has_many :sent_invitations, class_name: 'Invitation', foreign_key: 'inviter_id'
  has_many :received_invitations, class_name: 'Invitation', foreign_key: 'invited_id'

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  
end