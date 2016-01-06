class CepsController < ApplicationController
  before_action :set_cep, only: [:show, :update, :destroy]

  # GET /ceps
  def index
    @ceps = Cep.all

    render json: @ceps
  end

  def busca
    @numero = Cep.find_by(cep: params[:cep])
    @num = params[:cep]
    if @num.size < 9 || @num.size > 9
      render :json => {
          :status => :ERRO,
          :message => "O CEP informado é inválido",
      }.to_json
    elsif @numero == nil
        render :json => {
           :status => :ERRO,
           :message => "O CEP informado não foi encontrado",
        }.to_json

    else
      render :json => { :status   => :SUCESSO,
                        :cep      => @numero.cep,
                        :endereco => @numero.endereco,
                        :bairro   => @numero.bairro,
                        :cidade   => @numero.cidade,
                        :estado   => @numero.estado
                      }.to_json
    end
  end

  # GET /ceps/1
  def show
    render json: @cep
  end

  # POST /cadastro
  def create
    @cep = Cep.new(cep_params)
    @numero = Cep.find_by(cep: params[:cep])
    if @numero == nil
        if @cep.save
          render :json => {
             :status => :SUCESSO,
            :message => "O endereço foi cadastrado com sucesso.",
          }.to_json

        else
          render json: @cep.errors, status: :unprocessable_entity
        end
      else
      if @cep.cep == @numero.cep
        render :json => {
           :status => :ERRO,
           :message => "O endereço ja existe.",
        }.to_json
      elsif @cep.save
          render :json => {
             :status => :SUCESSO,
            :message => "O endereço foi cadastrado com sucesso.",
          }.to_json

        else
          render json: @cep.errors, status: :unprocessable_entity
      end
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
