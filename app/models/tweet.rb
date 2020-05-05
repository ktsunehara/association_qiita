class Tweet < ApplicationRecord
    belongs_to :user
    has_many :iines
    has_many :iined_users, through: :iines, source: :user
    has_many :comments, dependent: :destroy
    # tweet.iined_users でいいねしているユーザー一覧を取り出せる。

    # def iined_by?(user)
    #     #Tweetのインスタンスメソッド。
    #     iines.where(user_id: user.id).exists?
    #     # .ixists?含まれているか？
    # end
end
