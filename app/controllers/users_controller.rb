class UsersController < ApplicationController
    protect_from_forgery
    #before_action :authenticate_account!
    # layout 'board_users' # 必要に応じて用意
  
    def index
      @users = User.all
      #users = User.where 'account_id == ?', 
          #current_account.id
      #if users[0] == nil then
        #user = User.new
        #user.account_id = current_account.id
        #user.nickname = '<<no name>>'
        #user.index_id = SecureRandom.alphanumeric(5).to_s + current_account.id.to_s
        #user.save
        #users = User.where 'account_id == ?', 
        #    current_account.id
  
      #end
      #@board_user = users[0]

      #@msg = 'id:5-5/4231/'+ @board_user.account_id.to_s  +'id:5-5/4231/'

    end

    def create
      #@user = User.create(account_id:'Ta5lda9UqG2OkmRF',account_name:'kanrinin1',account_mail:'eee@eee')
      @user = User.create(account_id:params['account_id'], account_name:params['account_name'], account_mail:params['account_mail'])
      @user.save!
    end
  
    def show
      #@user = User.find_by(account_id:"1",account_mail:"1")
      #@user = User.find_by(account_id:"Ta5lda9UqG2OkmRF",account_mail:"eee@eee")
      #@user = User.find_by(account_id:'123')
      @user = User.find_by(params[:id])
      #sum = Post.where(account_id:params['account_id'])
      #sum = sum.size
      #if(sum == nil)
       #   sum = 0 
      #end
      #@user.sum = sum
      
    end

    def edit
      #@user = User.find_by(account_id:params["account_id"],account_mail:params["account_mail"])
      #sum = Post.where(account_id:params['account_id'])
      #sum = sum.size

      #@user = User.find_by(account_id:"1",account_mail:"1")
      #@user = User.find_by(account_id:"Ta5lda9UqG2OkmRF")
      @user = User.find_by(account_id:'123')
      #@user.sum = sum
   
      
    end
  
    def update
      #@user = User.find_by(account_id:params["account_id"],account_mail:params["account_mail"])
      user = User.find_by(account_id:"1",account_mail:"1")
      user.update(user_params)
      #@user.account_name = params['account_name']
      #user.memo = params['introduction']
      #@user.town = params['town']
      #@user.birthday = params['birthday']
      #@user.save!
      
    end


    def frozen
        if request.post? then
            @title = 'Result'
            if params['activation'] then
                @board_user.activation = false
            else
                @board_user.activation = true
            end
          else
            @title = 'Index'
            @msg = 'check it...'
        end
    end

    def delete
      obj = User.find(params[:id])
      obj.destroy
      redirect_to '/users'
    end
    
    def delete_all
      @maximum_id = User.maximum(:id)
      @minimum_id = User.minimum(:id)
  
      @data = User.all
      @data.each do |obj|
      obj.destroy
    end  
      redirect_to '/users/index'
      end
  
    private
    def user_params
      params.require(:user).permit(:account_name,:memo,:birthday,:town,:icon1,:icon2,:activation)
      #params.require(:user).permit(:account_name)
    end
  
  end
  