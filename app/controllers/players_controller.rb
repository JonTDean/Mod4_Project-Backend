class PlayersController < ApplicationController
    skip_before_action :authorized, only: [:create, :index, :show]

    # GET /users
    def index
        @players = Player.all

        render json: @players
    end

    def show
        @player = Player.find_by(id: params[:id])
        render json: @player
    end

    # POST /users
    def create
        player = Player.create(player_params)

        if player
            render json: player
        else
            render json: { message: player.errors.full_messages }, status: :bad_request
        end
    end

    private
    def player_params
        params.require(:player).permit(:name, :hp, :mp, :phys, :mag, :def, :res, :luck);
      end
end
