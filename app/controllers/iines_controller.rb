class IinesController < ApplicationController
  def create
    current_user.iines.create(tweet_id: params[:tweet_id])
    #Iineインスタンスを生成している。カラム情報を集めてくる。
    redirect_to tweets_path

  end

  def destroy
    # iine = Iine.find_by(tweet_id: params[:tweet_id],user_id: current_user)
    # tweet_id とuser_idを両方紐付けしないとログインユーザーが何回でも消せる。良いね100を０にできてしまう。
    # iine.destroy
    current_user.iines.find_by(tweet_id: params[:tweet_id]).destroy!
    redirect_to tweets_path
  end
end
