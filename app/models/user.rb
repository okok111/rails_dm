class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable
          has_many :posts, dependent: :destroy #追記 ユーザーが削除されたら、ツイートも削除されるようになります。すでに書いてある場合は追記しなくて大丈夫です。
          validates :name, presence: true #追記
          validates :profile, length: { maximum: 200 } #追記
          has_many :messages, dependent: :destroy
          has_many :entries, dependent: :destroy
end
