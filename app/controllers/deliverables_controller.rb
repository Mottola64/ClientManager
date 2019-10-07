class DeliverablesController < ApplicationController
    def edit
        set_deliverable
    end

    def index
        @deliverables = Deliverable.all
        @deliverable = Deliverable.find_by(params[:id])
    end

    def new
        if params[:account_id] && !Account.exists?(params[:account_id])
            redirect_to account_path(current_user)
        else
        @deliverable = Deliverable.new(account_id: params[:account_id])
        @account = Account.find(params[:account_id])
        end
    end

    def create
        @deliverable = Deliverable.new(deliverable_params)
        @account = @deliverable.account
        return render :new unless @deliverable.save
        redirect_to account_path(@account)
    end

    def show
        set_deliverable
    end

    def update
        set_deliverable
        if @deliverable.update(deliverable_params)
            redirect_to accounts_path
        else
            render :edit
        end
    end

    def destroy
        set_deliverable
        @deliverable.destroy
        redirect_to deliverables_path
    end

    private

    def set_deliverable
        @deliverable = Deliverable.find_by(id: params[:id])
        if !@deliverable
            redirect_to deliverables_path
        end
    end
    
    def deliverable_params
        params.require(:deliverable).permit(:report_type, :description, :date_assigned, :due_date, :account_id)
    end

end