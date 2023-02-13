class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/}
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/}
  validates :last_name_kana, presence: true, format: { with: /\A[ァ-ヶ一]+\z/u}
  validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶ一]+\z/u}
  validates :birth_date, presence: true
  validates :password,:password_confirmation, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i}

  has_many :item_infos
  has_many :purchase_records,dependent: :destroy
  # has_many :comments,dependent: :destroy

end
