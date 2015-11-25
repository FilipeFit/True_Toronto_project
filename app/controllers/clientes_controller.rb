class ClientesController < ApplicationController
  before_action :authenticate_user!

  def show
    @cliente = @user.cliente
  end

  def new
    @cliente = Cliente.new
  end

  def edit
    @cliente = current_user.cliente
  end

  def create
    @cliente = Cliente.new(cliente_params)
    @cliente.user_id = current_user.id
    respond_to do |format|
      if @cliente.save
        format.html { redirect_to current_cart_path, notice: 'Dados de sua viagem salvos, prossiga para finalizar sua compra!' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      @cliente = current_user.cliente
      if @cliente.update(cliente_params)
        format.html { redirect_to root_path, notice: 'Dados de sua viagem atualizados!' }
      else
        format.html { render :edit }
      end
    end
  end

  private 

  def set_cliente
    @cliente = Cliente.find(params[:id])
  end

  def cliente_params
    params.require(:cliente).permit(:id, :user_id, :nome_completo, :endereco_toronto, :data_chegada, :data_hora_voo, :numero_voo, :tempo_permanencia, :data_nascimento, :nome_escola, :obs, :concordo_termos_uso)
  end
end



