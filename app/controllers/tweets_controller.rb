class TweetsController < ApplicationController
  before_action :authenticate_user!, except: [:index]  # deviseのメソッドで「ログインしていないユーザーをログイン画面に送る」メソッド
  
  def new
    @tweet = Tweet.new  # 新規投稿用の空のインスタンス
  end

  def create

    current_user.tweets.create(tweet_params)
    redirect_to tweets_path

  end

  def index
    @tweets = Tweet.includes(:user)
    @user_iine_ids = current_user.iines.pluck(:tweet_id)
    # 自分が良いねしたtweet_idの配列を取得している
  end

  def show
    @tweet = Tweet.find(params[:id])
    @user = @tweet.user
    @comment = current_user.comments.new
    @comments = @tweet.comments
  end

  private
    def tweet_params
      params.require(:tweet).permit(:body) # tweetモデルのカラムのみを許可
    end

end