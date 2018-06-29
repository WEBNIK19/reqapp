class RequestsController < ApplicationController
  
  # GET /requests
  # GET /requests.json
  def index
    @trap = Trap.find(params[:trap_id])
    @requests = Request.where(:trap_id=>params[:trap_id]).order('created_at DESC')
  end

  # GET /requests/1
  # GET /requests/1.json
  def show
    @request = Request.find(params[:id]);
  end
  
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

    if @my_request.persisted?
      Pusher.trigger('my-channel', 'new-request', {
        request_id:  @my_request.id,
        remote_ip:   @my_request.remote_ip,
        method:      @my_request.method, 
        params:      @my_request.params,
        scheme:      @my_request.scheme,
        headers:     @my_request.headers,
        cookies:     @my_request.cookies,
        created_at:  @my_request.created_at.strftime('%F %T')
      })
      head :no_content
    else
      head :forbidden
    end
  end  

  # DELETE /requests/1
  # DELETE /requests/1.json
  def destroy
    @trap = Trap.find(params[:trap_id]);
    @request = @trap.requests.find(params[:id]);
    @request.destroy!
    respond_to do |format|
      format.html { redirect_to trap_path(@trap), notice: 'Request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

end
