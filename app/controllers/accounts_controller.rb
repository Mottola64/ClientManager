class AccountsController < ApplicationController
    before_action :check_for_logged_in, except: [:index]

   def new
    #check if it's nested & it's a proper id
    if params[:strategist_id] && @strategist = Strategist.find_by_id(params[:strategist_id])
      #nested route
      @account = strategist.accounts.build #has_many
    else
      #unnested
      @account = Account.new
      @account.build_strategist  #belongs_to
    end
  end


    def create
        @account = current_user.accounts.build(account_params)
        if @account.save
            redirect_to account_path(@account)
        else
            @account.build_strategist unless @account.strategist
            render :new
        end
    end

    def index
        @accounts = Account.all
        if params[:strategist_id] && strategist = strategist.find_by_id(params[:strategist_id])
          #nested route
          @accounts = strategist.accounts
        end
      end

    def show
        set_account
    end

    def edit
        set_account
    end

    def update
        set_account
        if @account.update(account_params)
            redirect_to account_path(@account)
        else
            render :edit
        end
    end

    def destroy
        set_account
        @account.destroy
        redirect_to accounts_path
    end

    private

    def set_account
        @account = Account.find_by(id: params[:id])
        if !@account
            redirect_to accounts_path
        end
    end
    
    def account_params
        params.require(:account).permit(:name, :tier, :acv, :industry, :strategist_id)
    end

end
