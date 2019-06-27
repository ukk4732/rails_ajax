class Contact < ApplicationRecord
  belongs_to :group

  validates :name, :email, presence: true
  validates :name, length: {minimum: 2}

  paginates_per 10

  def gravatar
    hash = Digest::MD5.hexdigest(email)
    "https://www.gravatar.com/avatar/#{hash}"
  end
end
