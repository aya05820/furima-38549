class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/}
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/}
  validates :last_name_kana, presence: true, format: { with: /\A[ァ-ヴ]+\z/u}
  validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヴ]+\z/u}
  validates :birth_date, presence: true
  validates :password,:password_confirmation, presence: true,
              length: { minimum: 6 },
              format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i}

  has_many :item_infos
  has_many :purchase_records,dependent: :destroy
  has_many :comments,dependent: :destroy

end
