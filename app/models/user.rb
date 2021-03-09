class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :encrypted_password, :password_confirmation, length: { minimum: 6 },
                                                         format: { with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{7,}/, message: 'Including half-width alphanumeric characters' }
  validates :family_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'is Full-width characters' }
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'is Full-width characters' }
  validates :family_name_kana, presence: true,
                               format: { with: /\A([ァ-ン]|ー)+\z/, message: 'is must NOT contain any other characters than alphanumerics' }
  validates :first_name_kana, presence: true,
                              format: { with: /\A([ァ-ン]|ー)+\z/, message: 'is must NOT contain any other characters than alphanumerics' }
  validates :birthday, presence: true
end
