class DeliverablesController < ApplicationController
    def edit
        set_deliverable
    end

    def index
        @deliverables = Deliverable.all
        @deliverable = Deliverable.find_by(params[:id])
    end

    def new
        if params[:account_id] && account = Account.find_by_id(params[:account_id])
            @deliverable = account.deliverables.build
        else
        @deliverable = Deliverable.new
        @deliverable.build_account
        end
    end

    # def create
    #     @deliverable = current_user.accounts.Deliverable.new(deliverable_params)
    #     if @deliverable.save
    #         redirect_to @deliverable
    #     else
    #         render action: :new
    #     end

    #end

    def create
        binding.pry
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
            redirect_to deliverable_path(@deliverable)
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
        params.require(:deliverable).permit(:type, :description, :date_assigned, :due_date)
    end

end

