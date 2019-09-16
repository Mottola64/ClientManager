class StrategistsController < ApplicationController

    def index
    end

    def show
        @strategist = Strategist.find_by(id: params[:id])
    end



end
