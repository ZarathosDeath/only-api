class Job < ApplicationRecord
  before_destroy :destroy_submissions

  belongs_to :recruiter
  has_many :submissions

  private

  def destroy_submissions
    self.submissions.destroy_all
  end
end
