# frozen_string_literal: true

# Changelog of Applicants' statuses
class StatusChangelog < ApplicationRecord
  validates :previous_status, :next_status, :reason, presence: true

  belongs_to :applicant

  # Tried to set both fields as enum but there's a recent bug in Rails that affects all 7.0.x versions.
  # The error is discussed in depth here: https://github.com/rails/rails/issues/44842
  # There's no solution from Rails team yet.
  # enum previous_status: { applied: 0, initial_review: 1, more_information_required: 2, declined: 3, approved: 4 }
  # enum next_status: { applied: 0, initial_review: 1, more_information_required: 2, declined: 3, approved: 4 }
end
