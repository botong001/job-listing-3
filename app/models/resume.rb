# == Schema Information
#
# Table name: resumes
#
#  id         :integer          not null, primary key
#  job_id     :integer
#  user_id    :integer
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  attachment :string
#

class Resume < ApplicationRecord
  belongs_to :job
  belongs_to :user
  

  mount_uploader :attachment, AttachmentUploader

  validates :content, presence: true
end
