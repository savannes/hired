class JobsController < ApplicationController
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
    @job = Job.new(params[:job])
    # @job = Job.new(job_params)
    redirect_to job_path(@job)
  end

  private

  def job_params
    params.require(:job).permit(:role, :level, :status, :type, :applycation_link)
  end

  def set_job
    @job = Job.find(params[:id])
  end
end
