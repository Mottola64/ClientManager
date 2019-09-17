class StrategistsController < ApplicationController

    def index
        @strategists = Strategist.all.include(:users)
    end

    def show
        @strategist = Strategist.find_by(id: params[:id])
    end

end
