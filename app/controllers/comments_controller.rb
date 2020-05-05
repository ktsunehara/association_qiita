class CommentsController < ApplicationController
  def create
    # commentテーブルに入れる。body と user_id とtweet_id を１箇所にまとめてクリエイト
    tweet = Tweet.find(params[:tweet_id])
    comment = current_user.comments.build(comment_params)
    comment.tweet_id = tweet.id 
    comment.save
    redirect_to tweet_path(tweet.id)
    
  end
  private
  def comment_params
    params.require(:comment).permit(:body)
  end
end
