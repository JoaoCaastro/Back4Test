class ClientsController < ApplicationController
  before_action :set_client, only: %i[ show update destroy ]

  # GET /clients
  def index
    @clients = Client.all

    render json: @clients
  end

  # GET /clients/1
  def show
    render json: @client
  end

  # POST /clients
  def create
    @clients = Client.new(client_params)

    if @clients.save
      render json: @clients, status: :created, location: @clients
    else
      render json: @clients.errors, status: :unprocessable_entity
    end
  end

  
  # PATCH/PUT /clients/1
  def update
    if @client.update(client_params)
      render json: @client
    else
      render json: @client.errors, status: :unprocessable_entity
    end
  end

  # DELETE /clients/1
  def destroy
    @client.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client
      @client = Client.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def client_params
      params.require(:client).permit(:name, :cpf, :brithday, :gender, :telephone, :email, :education_level, :medical_informations, :medicines_in_use, :processing_information, :cep, :street, :number, :neighborhood, :city, :state, :complement,  parents_attributes: [:id, :nome, :cpf, :email, :grau_parentesco, :telefone, :_destroy])
    end

end
