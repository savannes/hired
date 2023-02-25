class JobsController < ApplicationController
  def edit
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])
    @job.update(job_params)
    #redirect_to pool_path(@pool)
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy
  end

  private

  def job_params
    params.require(:job).permit(:role, :level, :status, :type, :applycation_link [])
  end

  def set_job
    @job = Job.find(params[:id])
  end
end
