class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :last_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :user_birthday, presence: true
  # VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[\w-]+\z/i.freeze
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[\w-]+\z/i, message: 'Include both letters and numbers' }
  validates :password, presence: true
end
