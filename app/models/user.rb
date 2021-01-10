class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :items
         has_many :personals

         
         validates :name, presence: true
         validates :email, presence: true

         PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
         validates_format_of :password, with: PASSWORD_REGEX, message: 'Include both letters and numbers'

         validates :full_width_last_name,presence: true,format: {with: /\A[ぁ-ん一-龥]/}
         validates :full_width_first_name,presence: true,format: {with: /\A[ぁ-ん一-龥]/}
         validates :kana_last_name,presence: true,format: {with: /\A[ァ-ヶー－]+\z/}
         validates :kana_first_name,presence: true,format: {with: /\A[ァ-ヶー－]+\z/}
         validates :birthday,presence: true
end