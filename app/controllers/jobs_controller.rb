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
    @jobs = policy_scope(Job)
    jobs = current_user.jobs
    @wishes = []
    @applications = []
    @interviews = []
    @tests = []
    @replies = []

    jobs.each do |job|
      @wishes << job if job.status == "Wishes"
      @applications << job if job.status == "Applications"
      @interviews << job if job.status == "Interviews"
      @tests << job if job.status == "Tests"
      @replies << job if job.status == "Replies"
    end
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
