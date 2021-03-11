class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :family_name, format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/, message: 'is Full-width characters' }
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/, message: 'is Full-width characters' }
    validates :family_name_kana, format: { with: /\A([ァ-ン]|ー)+\z/, message: 'is must NOT contain any other characters than alphanumerics' }
    validates :first_name_kana, format: { with: /\A([ァ-ン]|ー)+\z/, message: 'is must NOT contain any other characters than alphanumerics' }
    validates :birthday
  end

  validates :password, length: { minimum: 6 }, format: { with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{7,}/, message: 'Including half-width alphanumeric characters' }

  has_many :items
end
