class Api::V1::StepsController < ApplicationController

    def index
        # write this so that it finds all steps that belong to the recipe id.
        steps = Step.where("preparation_id = ?", params[:preparation_id])
        render json: steps
    end
    
    def show
        step = Step.find_by(id: params[:id])
        render json: step
    end

    def create
        step = Step.create(step_params)
        render json: step 
    end

    def update
        step = Step.find_by(id: params[:id])
        step.update(step_params)
        render json: step
    end

    def destroy
        step = Step.find_by(id: params[:id])
        temp = step
        step.destroy
        render json: temp
    end


    private

    def step_params
        params(:step).permit(:id, :action, :duration, :amount, :order, :directions, :preparation_id)
    end

end
