class User < ActiveRecord::Base
  has_and_belongs_to_many :dvds
  has_many :borrowings, class_name: "Borrowship", foreign_key: :borrower_id
  has_many :lendings, class_name: "Borrowship", foreign_key: :lender_id
  before_validation :set_default_role

  enum role: [:null_user, :member, :admin]

  def set_default_role
    self.role ||= :member
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.assign_attributes(name: auth.info.name,
                             email: auth.info.email,
                             image: auth.info.image,
                             oauth_expires_at: Time.at(auth.credentials.expires_at))
    end
  end
end
