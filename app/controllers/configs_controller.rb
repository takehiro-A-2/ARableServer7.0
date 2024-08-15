class ConfigsController < ApplicationController
    protect_from_forgery
    #before_action :authenticate_account!
    # layout 'board_users' # 必要に応じて用意
  
    #def add
     # @user = Config.new 
    #end
  
    def index
      @users = Config.all
    
    end
  
    def create
      @user = Config.create(account_id:params['account_id'],account_name:params['account_name'],account_mail:params['account_mail'])
      @user.sum = 0
      @user.save!
    end
  
    def show_index
      @user = Config.find(params[:id])
  
      sum = Config.where(account_id:params['account_id']).size
      if(sum == nil)
          sum = 0 
          @user.save!
      end
      @user.sum = sum
      @user.save!
  
      @msg = ' ////-/// ' + @user.account_id.to_s + ' ////-/// ' + @user.account_name.to_s + ' ////-/// ' + @user.account_mail.to_s + ' ////-/// ' +
      @user.introduction.to_s + ' ////-/// ' + @user.sum.to_s + ' ////-/// ' + @user.town.to_s + ' ////-/// ' + 
      @user.birthday.to_s + ' ////-/// ' + @user.activation.to_s + ' ////-/// '
      
    end
  
    def show
      @user = Config.find_by(account_id:params["account_id"], account_mail:params["account_mail"])
      sum = Config.where(account_id:params['account_id']).size
      if(sum == nil)
          sum = 0 
          @user.save!
      end
      @user.sum = sum
      @user.save!
    
      @msg = ' ////-/// ' + @user.account_id.to_s + ' ////-/// ' + @user.account_name.to_s + ' ////-/// ' + @user.account_mail.to_s + ' ////-/// ' +
      @user.introduction.to_s + ' ////-/// ' + @user.sum.to_s + ' ////-/// ' + @user.town.to_s + ' ////-/// ' + 
      @user.birthday.to_s + ' ////-/// ' + @user.activation.to_s + ' ////-/// '
      
    end
  
    def update
    #user = Config.find_by(account_id:params['account_id'],account_name:params['account_name'],account_mail:params['account_mail'])
      user = Config.find_by(account_id:params['account_id'],account_mail:params['account_mail'])
      #user.update(introduction:params['introduction'],town:params['town'],account_name:params['account_name'])
      user.update(account_name:params["account_name"], introduction:params['introduction'],town:params['town'], account_name:params['account_name'])
      #@user.save!
      
    end
  
    def delete
      obj = Config.find(params[:id])
      obj.destroy
      redirect_to '/configs/index'
    end
    
    def delete_all
      @maximum_id = Config.maximum(:id)
      @minimum_id = Config.minimum(:id)
  
      @data = Config.all
      @data.each do |obj|
      obj.destroy
    end  
      redirect_to '/configs/index'
      end
  
    private
    def config_params
      #params.require(:config).permit(:account_id,:account_name,:account_mail,:introduction,:birthday,:town,:icon1,:icon2,:activation)
      params.require(:config).permit(:introduction,:birthday,:town,:icon1,:icon2,:activation)
    end
  
  end
  