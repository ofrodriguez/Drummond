class WorkersController < ApplicationController
  before_action :set_worker, only: [:show, :edit, :update, :destroy, :fire, :contract]
  before_action :authenticate_user!
  before_action :authenticate_admin!
  # GET /workers
  # GET /workers.json
  def index
    @workers = Worker.all
  end

  # GET /workers/1
  # GET /workers/1.json
  def show
  end

  # GET /workers/new
  def new
    @worker = Worker.new
  end

  # GET /workers/1/edit
  def edit
  end

  # POST /workers
  # POST /workers.json
  def create
    @worker = Worker.new(worker_params)

    respond_to do |format|
      if @worker.save
        format.html { redirect_to @worker, notice: 'Worker was successfully created.' }
        format.json { render :show, status: :created, location: @worker }
      else
        format.html { render :new }
        format.json { render json: @worker.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /workers/1
  # PATCH/PUT /workers/1.json
  def update
    respond_to do |format|
      if @worker.update(worker_params)
        format.html { redirect_to @worker, notice: 'Worker was successfully updated.' }
        format.json { render :show, status: :ok, location: @worker }
      else
        format.html { render :edit }
        format.json { render json: @worker.errors, status: :unprocessable_entity }
      end
    end
  end

  def fire
    respond_to do |format|
      if @worker.update({status: "despedido"})
        format.html { redirect_to workers_path, notice: 'Worker was successfully updated.' }
        format.json { render :show, status: :ok, location: workers_path }
      else
        format.html { render :edit }
        format.json { render json: workers_path.errors, status: :unprocessable_entity }
      end
    end
  end

  def contract
    respond_to do |format|
      if @worker.update({status: "trabajando"})
        format.html { redirect_to workers_path, notice: 'Worker was successfully updated.' }
        format.json { render :show, status: :ok, location: workers_path }
      else
        format.html { render :edit }
        format.json { render json: workers_path.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /workers/1
  # DELETE /workers/1.json
  def destroy
    @worker.destroy
    respond_to do |format|
      format.html { redirect_to workers_url, notice: 'Worker was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_worker
      @worker = Worker.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def worker_params
      params.require(:worker).permit(:first_name, :last_name, :cc, :code)
    end
end
