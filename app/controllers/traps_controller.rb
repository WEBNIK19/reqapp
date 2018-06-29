class TrapsController < ApplicationController
  before_action :set_trap, only: [:show, :edit, :update, :destroy]

  # GET /traps
  # GET /traps.json
  def index
    @traps = Trap.all
  end

  # GET /traps/1
  # GET /traps/1.json
  def show
    @trap = Trap.find(params[:id]);
  end

  # GET /traps/new
  def new
    @trap = Trap.new
  end

  # GET /traps/1/edit
  def edit
  end

  # POST /traps
  # POST /traps.json
  def create
    @trap = Trap.new(trap_params)

    respond_to do |format|
      if @trap.save
        format.html { redirect_to @trap, notice: 'Trap was successfully created.' }
        format.json { render :show, status: :created, location: @trap }
      else
        format.html { render :new }
        format.json { render json: @trap.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /traps/1
  # PATCH/PUT /traps/1.json
  def update
    respond_to do |format|
      if @trap.update(trap_params)
        format.html { redirect_to @trap, notice: 'Trap was successfully updated.' }
        format.json { render :show, status: :ok, location: @trap }
      else
        format.html { render :edit }
        format.json { render json: @trap.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /traps/1
  # DELETE /traps/1.json
  def destroy
    @trap.destroy!
    respond_to do |format|
      format.html { redirect_to traps_url, notice: 'Trap was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trap
      @trap = Trap.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def trap_params
      params.require(:trap).permit(:id)
    end
end
