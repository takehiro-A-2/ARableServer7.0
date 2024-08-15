class PostsController < ApplicationController
    protect_from_forgery 
    #before_action :authenticate_account!, only: [:add,:delete_all]
  
    def index
      @posts = Post.all 
      @maximum_id = Post.maximum(:id)
      @minimum_id = Post.minimum(:id)
          
      @msg = ' ,, ' + @maximum_id.to_s + ' ,, ' + @minimum_id.to_s + ' ,, '
    end
  
    def show
      @post = Post.find(params[:id])
      @msg = ' //-/// ' + @post.image.url.to_s + ' //-/// ' + @post.x.to_s + ' //-/// ' + @post.y.to_s + ' //-/// ' + @post.z.to_s + ' //-/// ' + @post.text.to_s + 
      ' //-/// '  + @post.size.to_s + ' //-/// ' + @post.activation.to_s + 
      ' //-/// ' + @post.account_id.to_s + ' //-/// ' + @post.object_id.to_s + ' //-/// ' + @post.volume.to_s + ' //-/// '
    end
    
    def create
      #@post = Post.create(filename:params['filename'],account_id:params['account_id'],object_id:params['object_id'],
       # image:params['image'],extension:params['extension'],size:params['size'],volume:params['volume'],
       # x:params['x'],y:params['y'],z:params['z'],text:params['text'],
       # activation:params['activation'])                                                                      #Unityから投稿
        
      #@post = Post.new(permit_params)  ###ブラウザから投稿2024/2/23変更
      @post = Post.create(permit_params)  ###ブラウザから投稿2024/2/23変更

      if(@post.account_id.to_s != "" and @post.object_id.to_s != "" and @post.x.to_s != "" and @post.y.to_s != "" and @post.z.to_s != "" and @post.activation.to_s != "")
      if(@post.image.url.to_s != "")

        @post.size = @post.image.file.size
        #@post.extension = @post.image.file.extension  ###Unity上で動作

        if(@post.size.to_i < 20000000)
          @post.save!
        end
      else
        @post.save!
      end
    end
      #redirect_to action: 'index'
    end

    def delete
      obj = Post.find_by(object_id:params["object_id"])
      if(obj.account_id == params['account_id'])
        obj.destroy
      end
    end
  
    def delete_index
      obj = Post.find(params[:id])
      obj.destroy
      redirect_to '/posts'
    end
    
    def delete_all
      @maximum_id = Post.maximum(:id)
      @minimum_id = Post.minimum(:id)
  
      @data = Post.all
      @data.each do |obj|
      obj.destroy
    end  
      redirect_to '/posts'
      end
    
private
    def permit_params
      params.require(:post).permit(:filename,:account_id,:object_id,:image,:extension,:size,:volume,:x,:y,:z,:text,:activation)
    end
  
end
