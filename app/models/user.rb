class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  with_options presence: true do
    validates :last_name
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  end

  with_options presence: true do
    validates :last_name_kana
    validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
  end
  validates :user_birthday, presence: true
  # VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[\w-]+\z/i.freeze
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[\w-]+\z/i, message: 'Include both letters and numbers' }
  validates :password, presence: true
end
