class Api::V1::PreparationsController < ApplicationController

    def index
        @preparations = Preparation.all
        # render json: {preparations: PreparationSerializer.new(@preparations)}
        render json: @preparations
    end

    def show
        preparation = Preparation.find(params[:id])
        render json: preparation
    end

    private

    def prep_params
        params(:preparation).permit(:id, :device, :coffee_brand, :coffee_name, :coffee_amount, :coffee_grind, :total_water, :total_time, :water_temp, :notes, :user_id)
    end
end
