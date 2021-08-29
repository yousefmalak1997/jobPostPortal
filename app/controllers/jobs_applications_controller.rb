class JobsApplicationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_jobs_application, only: %i[ show edit update destroy ]
  before_action :correct_user, only: [:create , :destroy]
  before_action :no_permission, only: [:update , :edit]

  # GET /jobs_applications or /jobs_applications.json
  def index
    @jobs_applications = JobsApplication.all
    # @jobs_applications = JobsApplication.joins(Users).where("users_id = users.id")
    # @jobs_applications = JobsApplication.joins(:users).select("users.*,jobs_application.*").all
  end

  # GET /jobs_applications/1 or /jobs_applications/1.json
  def show
  end

  # GET /jobs_applications/new
  def new
    @jobs_application = JobsApplication.new
  end

  # GET /jobs_applications/1/edit
  def edit
  end

  # POST /jobs_applications or /jobs_applications.json
  def create
    @jobs_application = JobsApplication.new(jobs_application_params)

    respond_to do |format|
      if @jobs_application.save
        format.html { redirect_to jobs_path, notice: "Jobs application was successfully created." }
        format.json { render :show, status: :created, location: @jobs_application }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @jobs_application.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jobs_applications/1 or /jobs_applications/1.json
  def update
    respond_to do |format|
      if @jobs_application.update(jobs_application_params)
        format.html { redirect_to @jobs_application, notice: "Jobs application was successfully updated." }
        format.json { render :show, status: :ok, location: @jobs_application }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @jobs_application.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jobs_applications/1 or /jobs_applications/1.json
  def destroy
    @jobs_application.destroy
    respond_to do |format|
      format.html { redirect_to jobs_applications_url, notice: "Jobs application was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def correct_user 
    @user = current_user.role
    puts @user.inspect
    if @user == 1
      redirect_to jobs_path, notice: "Un-auth Access"
    end  
  end

  def no_permission
    redirect_to jobs_path, notice: "Un-auth Access"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_jobs_application
      @jobs_application = JobsApplication.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def jobs_application_params
      params.require(:jobs_application).permit(:users_id, :jobs_id, :status)
    end
end
