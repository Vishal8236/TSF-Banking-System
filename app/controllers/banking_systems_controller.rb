class BankingSystemsController < ApplicationController
  before_action :set_banking_system, only: %i[ show edit update destroy ]

  # GET /banking_systems or /banking_systems.json
  def index
    @banking_systems = BankingSystem.all
  end

  # GET /banking_systems/1 or /banking_systems/1.json
  def show
  end

  # GET /banking_systems/new
  def new
    @banking_system = BankingSystem.new
  end

  # GET /banking_systems/1/edit
  def edit
  end

  # POST /banking_systems or /banking_systems.json
  def create
    @banking_system = BankingSystem.new(banking_system_params)

    respond_to do |format|
      if @banking_system.save
        format.html { redirect_to banking_systems_url, notice: "Customer was successfully created." }
        format.json { render :show, status: :created, location: @banking_system }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @banking_system.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /banking_systems/1 or /banking_systems/1.json
  def update
    respond_to do |format|
      if @banking_system.update(banking_system_params)
        format.html { redirect_to banking_systems_url, notice: "Customer was successfully updated." }
        format.json { render :show, status: :ok, location: @banking_system }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @banking_system.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /banking_systems/1 or /banking_systems/1.json
  def destroy
    @banking_system.destroy
    respond_to do |format|
      format.html { redirect_to banking_systems_url, notice: "Customer was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def make_transaction
    @u_data = BankingSystem.find(params[:user_id])  
    @all_user = BankingSystem.all.map(&:email)
    respond_to do |format|
      format.js { render 'banking_systems/make_transaction' }
    end
  end
  
  def do_transaction
    @banking_systems = BankingSystem.all
    amount = params[:amount]
    from = BankingSystem.find_by(email: params[:from])
    to = BankingSystem.find_by(email: params[:to])

    from_balance = (from.current_balance).to_i
    to_balance = (to.current_balance).to_i
    
    from.update(current_balance: (from_balance-amount.to_i))
    to.update(current_balance: (to_balance+amount.to_i))
    respond_to do |format|
      format.html { redirect_to banking_systems_url }
    end
  end
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_banking_system
      @banking_system = BankingSystem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def banking_system_params
      params.require(:banking_system).permit(:name, :email, :current_balance)
    end
end
