class JobsController < ApplicationController
  skip_before_action :authenticate_user!
  def edit
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])
    @job.update(job_params)
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy
  end

  def index
    @jobs = Job.all
  end

  def show
    @job = Job.find(params[:id])
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    @job.user = current_user
    if @job.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def job_params
    params.require(:job).permit(:user_id, :company, :description, :role, :level, :status, :job_type, :salary, :application_link)
  end

  def set_job
    @job = Job.find(params[:id])
  end
end
