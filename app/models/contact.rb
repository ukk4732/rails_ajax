class Contact < ApplicationRecord
  belongs_to :group

  def gravatar
    hash = Digest::MD5.hexdigest(email)
    "https://www.gravatar.com/avatar/#{hash}"
  end
end
