class OpinionsController < ApplicationController
  before_action :set_opinion, only: %i[show edit update destroy]
  before_action :authenticate_user!

  # GET /opinions or /opinions.json
  def index
    @opinions = Opinion.all
  end

  # POST /opinions or /opinions.json
  def create
    @opinion = current_user.opinions.build(opinion_params)
    @opinion.save
    redirect_to root_path
  end

  private

  # Only allow a list of trusted parameters through.
  def opinion_params
    params.require(:opinion).permit(:opinion)
  end
end
