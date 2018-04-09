class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # before_action :correct_user


  # GET /jobs
  # GET /jobs.json
  def index
    redirect_to(root_url) unless current_user

    @user = current_user
    @jobs = Job.where(user_id: @user).order("created_at DESC")

    @jobs = if params[:term]
      Job.where('company LIKE ?', "%#{params[:term]}%")
    else
      Job.where(user_id: @user).order("id DESC")
    end

  end

  # GET /jobs/1
  # GET /jobs/1.json
  def show
    redirect_to(root_url) unless current_user.id == @job.user.id

    @user = current_user
    @job = Job.find(params[:id])
    @comments = Comment.where(job_id: @job).order("created_at DESC")
  end

  # GET /jobs/new
  def new
    redirect_to(root_url) unless current_user

    @user = current_user
    @job = current_user.jobs.build
  end

  # GET /jobs/1/edit
  def edit
    @user= User.find(current_user.id)
    redirect_to(root_url) unless current_user.id == @job.user.id
  end

  # POST /jobs
  # POST /jobs.json
  def create
    redirect_to(root_url) unless current_user

    @job = current_user.jobs.build(job_params)

    respond_to do |format|
      if @job.save
        format.html { redirect_to @job, notice: 'Job was successfully created.' }
        format.json { render :show, status: :created, location: @job }
      else
        format.html { render :new }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jobs/1
  # PATCH/PUT /jobs/1.json
  def update
    respond_to do |format|
      if @job.update(job_params)
        format.html { redirect_to @job, notice: 'Job was successfully updated.' }
        format.json { render :show, status: :ok, location: @job }
      else
        format.html { render :edit }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jobs/1
  # DELETE /jobs/1.json
  def destroy

    @user= User.find(current_user.id)
     redirect_to(root_url) unless current_user.id == @job.user.id

    @job.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Job was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    ## Confirms the correct user.
    # def correct_user
    #  @user= User.find(current_user.id)
    #   redirect_to(root_url) unless current_user.id == @job.user.id
    # end

    # Use callbacks to share common setup or constraints between actions.
    def set_job
      @job = Job.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_params
      params.require(:job).permit(:company, :position, :skills, :state, :salary, :site, :term)
    end
end
