class BoardController < ApplicationController
    before_action :authenticate_user!, except: [:sign_off, :comment]
    
    def sign_on
        @mPost = Post.all.reverse
        @mUser = User.all
        @mPost_T = 0
        @mUser_T = 0
        @mUser.each do |u|
            @mUser_T= @mUser_T + 1
        end
        @mPost.each do |p|
            @mPost_T= @mPost_T + 1
        end

    end
    
    def sign_off
        @mPost = Post.all
        @mUser = User.all
        @mPost_T = 0
        @mUser_T = 0
        @mUser.each do |u|
            @mUser_T= @mUser_T + 1
        end
        @mPost.each do |p|
            @mPost_T= @mPost_T + 1
        end
        reset_session
    end
    
    
    def create
        Post.create(content: params[:content], writer: current_user.username)
        redirect_to "/board/sign_on"
    end
    
    def edit
        @edit = Post.find(params[:id])
    end
    
    def update
        if params[:writer] == current_user.username
            update = Post.find(params[:id])
            update.content = params[:content]
            update.save
        else
            nil
        end
        redirect_to "/board/sign_on"
    end
        
        
    def destroy
        destroy = Post.find(params[:id])
        destroy.destroy
        
        redirect_to "/board/sign_on"
    end
    
    
    def feature_up
        fUp = Post.find(params[:id])
        fUp.like = fUp.like + 1
        fUp.save
        session[current_user.id.to_s + " like " + params[:id]] = 1
        redirect_to (:back)
    end
    
    
    def feature_down
        fDown = Post.find(params[:id])
        fDown.hate = fDown.hate + 1
        fDown.save
        session[current_user.id.to_s + " hate " + params[:id]] = 1
        redirect_to (:back)
    end
    
    
    def feature_share
    end
    
    
    def comment
        @mComment = Comment.all
        @cPost = Post.find(params[:id])
    end
    
    def write_comment
        @pid = params[:pid]
        if Comment.create(comment: params[:comment], pid: params[:pid])
            cPost = Post.find(params[:pid])
            cPost.share = cPost.share + 1
            cPost.save
        end
        redirect_to :back
    end

end

