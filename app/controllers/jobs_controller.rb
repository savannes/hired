class JobsController < ApplicationController
  before_action :authenticate_user!

  def edit
    @job = Job.find(params[:id])
    authorize @job
  end

  def update
    @job = Job.find(params[:id])
    @job.update(job_params)
    authorize @job
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    authorize @job
  end

  def index
    @jobs = Job.all
    @jobs = policy_scope(Job)
  end

  def show
    @job = Job.find(params[:id])
    authorize @job
  end

  def new
    @job = Job.new
    authorize @job
  end

  def create
    @job = Job.new(job_params)
    @job.user = current_user
    authorize @job
    if @job.save!
      redirect_to jobs_path
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
