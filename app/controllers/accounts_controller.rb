class AccountsController < ApplicationController
    before_action :check_for_logged_in, except: [:index]

    def edit
        set_account
    end

    def index
        @accounts = Account.all
        @account = Account.find_by(params[:id])
        #@deliverables = Deliverable.all
    end

    def new
        if params[:user_id] && user = User.find_by_id(params[:user_id])
            @account = user.accounts.build
        else
        @account = Account.new
        @account.build_user
        end
    end

    def create

        @account = current_user.accounts.new account_params
        if @account.save
            redirect_to account_path(@account)
        else
            render action: :new
        end

    end

    def show
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
        params.require(:account).permit(:name, :tier, :acv, :industry, :strategist)
    end

end