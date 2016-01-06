class CepsController < ApplicationController
  before_action :set_cep, only: [:show, :update, :destroy]

  # GET /ceps
  def index
    @ceps = Cep.all

    render json: @ceps
  end

  def busca
    @numero = Cep.find_by(params[:cep])
    render json: @numero
    binding.pry
  end

  # GET /ceps/1
  def show
    binding.pry
    render json: @cep
  end

  # POST /ceps
  def create
    @cep = Cep.new(cep_params)

    if @cep.save
      render json: @cep, status: :created, location: @cep
    else
      render json: @cep.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /ceps/1
  def update
    if @cep.update(cep_params)
      render json: @cep
    else
      render json: @cep.errors, status: :unprocessable_entity
    end
  end

  # DELETE /ceps/1
  def destroy
    @cep.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cep
      @cep = Cep.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def cep_params
      params.permit(:cep, :endereco, :bairro, :cidade, :estado)
    end
end
