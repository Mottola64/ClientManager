class StrategistsController < ApplicationController

    def new
    end
    
    def index
        @strategists = Strategist.all
    end

    def show
        @strategist = Strategist.find_by(id: params[:id])
    end

end
