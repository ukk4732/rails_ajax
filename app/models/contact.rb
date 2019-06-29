class Contact < ApplicationRecord
  belongs_to :group

  validates :name, :email, presence: true
  validates :name, length: {minimum: 2}

  has_attached_file :avatar, styles: { medium: "150x150>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  paginates_per 10

  def gravatar
    hash = Digest::MD5.hexdigest(email)
    "https://www.gravatar.com/avatar/#{hash}"
  end
end
