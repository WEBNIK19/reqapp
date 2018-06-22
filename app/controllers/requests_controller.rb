class RequestsController < ApplicationController
  before_action :set_request, only: [:show, :edit, :update, :destroy]

  # GET /requests
  # GET /requests.json
  def index
    @requests = Request.where(:trap_id=>params[:trap_id]).order('created_at DESC')
  end

  # GET /requests/1
  # GET /requests/1.json
  def show
    @request = Request.find(params[:id]);
  end

  # GET /requests/new
  def new
    @request = Request.new
  end

  # GET /requests/1/edit
  def edit
  end

  # POST /requests
  # POST /requests.json
  def create
    @trap = Trap.find(params[:trap_id])
    @my_request = @trap.requests.create(:trap_id => params[:trap_id], 
      :remote_ip => request.remote_ip, 
      :method => request.method, 
      :params => request.parameters, 
      :scheme => request.scheme,
      :headers => Hash.new(request.headers),
      :cookies => cookies.to_a,
      :request_env => request.env)


    if @my_request.save
      Pusher.trigger("my_channel", 'new-request', foo: 'bar' )
      head :no_content
    else
      render :nothing => true, :status => 400
    end
    # respond_to do |format|
    #   if @my_request.save
    #     format.html { redirect_to :trap, notice: 'Request was successfully created.' }
    #     format.json do 
    #       Pusher.trigger("my_channel", 'new-request', data: @my_request )
    #       render :nothing => true, :status => 200
    #     end
    #   else
    #     format.html { render :new }
    #     format.json { render json: @my_request.errors, status: :unprocessable_entity }
    #   end
    # end
  end  

  # DELETE /requests/1
  # DELETE /requests/1.json
  def destroy
    @trap = Trap.find(params[:trap_id])
    @request = Request.find(params[:id])
    @request.destroy
    respond_to do |format|
      format.html { redirect_to trap_path(@trap), notice: 'Request was successfully destroyed.' }
      format.json do 
        Pusher.trigger("my_channel", 'new-request', foo: bar)
        head :no_content
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request
      @request = Request.find(params[:id])
    end

end
