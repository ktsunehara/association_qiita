class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :tweets
  has_many :iines
  has_many :iined_tweets, through: :iines, source: :tweet
  has_many :comments, dependent: :destroy
  # @user.iined_tweets で ユーザーが良いねしたツイートを取得できる
  has_many :actives, class_name: "Relation", foreign_key: :following_id
  has_many :followings, through: :actives, source: :follower
  
  has_many :passives, class_name: "Relation", foreign_key: :follower_id
  has_many :followers, through: :passives, source: :following

  def followed_by?(user)
    passives.find_by(following_id: user.id).present?
  end
end
