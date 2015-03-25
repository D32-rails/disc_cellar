class User < ActiveRecord::Base
  has_and_belongs_to_many :dvds
  has_many :borrowings, class_name: "Borrowship", foreign_key: :borrower_id
  has_many :lendings, class_name: "Borrowship", foreign_key: :lender_id

  enum role: [:null_user, :member, :admin]

  def set_default_role
    self.role ||= :member
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.email = auth.info.email
      user.image = auth.info.image
      user.oauth_token = auth.credentials.oauth_token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.set_default_role
      user.save!
    end
  end
end
