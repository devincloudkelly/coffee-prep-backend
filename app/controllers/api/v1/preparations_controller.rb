class Api::V1::PreparationsController < ApplicationController
    skip_before_action :authorized, only: [:show]

    def index
        preparations = Preparation.all
        render json: preparations
    end

    def show
        @preparation = Preparation.find(params[:id])
        totalWater = 0
        totalTime = 0
        @preparation.steps.map {|step| 
        totalTime += step.duration
        totalWater += step.amount
    }
        @preparation.total_time = totalTime
        @preparation.total_water = totalWater
        # byebug
        render json: @preparation
    end

    def create
        preparation = Preparation.create(prep_params)
        render json: preparation
    end

    def update
        preparation = Preparation.find_by(id: params[:id])
        preparation.update(prep_params)
        render json: preparation
    end

    def destroy
        preparation = Preparation.find_by(id: params[:id])
        temp = preparation
        preparation.destroy
        render json: temp
    end

    private

    def prep_params
        params.require(:preparation).permit(:id, :device, :coffee_brand, :coffee_name, :coffee_amount, :coffee_grind, :total_water, :total_time, :water_temp, :notes, :user_id)
    end
end
