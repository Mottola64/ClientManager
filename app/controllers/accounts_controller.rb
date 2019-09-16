class AccountsController < ApplicationController

    def new
        @account = Account.new
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
