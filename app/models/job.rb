# == Schema Information
#
# Table name: jobs
#
#  id               :integer          not null, primary key
#  title            :string
#  description      :text
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  wage_upper_bound :integer
#  wage_lower_bound :integer
#  contact_email    :string
#  is_hidden        :boolean          default(TRUE)
#

class Job < ApplicationRecord
  has_many :resumes

# ----------
  validates :title, presence: true
  validates :wage_upper_bound, presence: true
  validates :wage_lower_bound, presence: true
  validates :wage_lower_bound, numericality: { greater_than: 0}


# ----------
  scope :published, -> { where(is_hidden: false) }
  scope :recent , -> { order('created_at DESC') }

# --已投履历--
  has_many :resume_relationship
  has_many :postmens, through: :resume_relationship, source: :user

# -----收藏----
  has_many :collects
  has_many :members, through: :collects, source: :user

# -----------
  def publish!
    self.is_hidden = false
    self.save
  end

  def hide!
    self.is_hidden = true
    self.save
  end
end
