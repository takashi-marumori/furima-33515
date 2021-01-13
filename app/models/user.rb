class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :nickname, presence: true 
         validates :first_name, format: {with:/\A[ぁ-んァ-ン一-龥]/ , message: "には漢字、カナ、かなのどれかでの入力が必要です。", presence: true}
         validates :last_name, format: {with:/\A[ぁ-んァ-ン一-龥]/ , message: "には漢字、カナ、かなのどれかでの入力が必要です。", presence: true}
         validates :read_first_name, format: { with: /\A[ァ-ヶー－]+\z/, message: "にはカタカナでの入力が必要です。", presence: true}
         validates :read_last_name, format: { with: /\A[ァ-ヶー－]+\z/, message: "にはカタカナでの入力が必要です。", presence: true}
         validates :date, presence: true
         validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: "には半角英数字が必要です。"}
end