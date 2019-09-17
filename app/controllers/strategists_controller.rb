class StrategistsController < ApplicationController

    def new
        @strategist = Strategist.new
    end

    def create
        @strategist = Strategist.new(strategist_params)
        @strategist.save
        redirect_to strategists_path
    end

    def index
        @strategists = Strategist.all.include(:users)
    end

    def show
        @strategist = Strategist.find_by(id: params[:id])
    end

    private
    def strategist_params
        params.require(:strategist).permit(:name, :location)
    end
    

end
