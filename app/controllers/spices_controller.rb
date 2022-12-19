class SpicesController < ApplicationController

    def index
        spices = Spice.all 
        render json: spices, status: :ok
    end

    def create
        spice = Spice.create(spice_params)
        render json: spice, status: :created
    end

    # def show
    #     spice = Spice.find_by(id: params[:id])
    #     if spice
    #         render json: spice, status: :ok
    #     else
    #         render json: { error: 'spice not found '}, status: :not_found
    #     end
    # end

    def update
        spice = Spice.find_by(id: params[:id])
        spice.update(spice_params)
        render json: spice, status: :created
    end

    def destroy
        spice = Spice.find_by(id: params[:id])
        spice.destroy
        head :no_content
    end

    private

    def spice_params
        params.permit(:title, :image, :description, :notes, :rating)
    end
end
