class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :first_name,presence: true,format: { with: /\A[ぁ-んァ-ン一-龯]+\z/ }
  validates :last_name,presence: true,format: { with: /\A[ぁ-んァ-ン一-龯]+\z/ }
  validates :first_name_kana,presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :last_name_kana,presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :nickname,presence: true
  validates :date_of_birth,presence: true
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i}

  has_many :items
  has_many :buyers
end
