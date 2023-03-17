class JobsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_column, only: %i[index new create]

  def edit
    @job = Job.find(params[:id])
    authorize @job
  end

  def update
    @job = Job.find(params[:id])
    authorize @job
    if @job.update(job_params)
      redirect_to columns_path, notice: "Successfully edited"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @job = Job.find(params[:id])
    authorize @job
    if @job.destroy
      redirect_to columns_path, notice: "Successfully deleted"
    else
      render :edit, notice: "Can't be deleted"
    end
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
    render json: @job
  end

  def new
    @job = Job.new
    authorize @job
  end

  def create
    @job = Job.new(job_params)
    @job.column = @column
    last_job_position = Job.where(column: @column)&.maximum(:position)
    last_job_position ||= 0
    @job.position = last_job_position + 1
    authorize @job
    if @job.save
      redirect_to columns_path, notice: "Successfully created"
    else
      redirect_to columns_path, notice: "Revise your fields"
    end
  end

  def move
    @job = Job.find(params[:id])
    target_column = params[:column_id]
    new_position = params[:new_position].to_i
    authorize @job
  
    if @job.column_id == target_column
      @job.insert_at(new_position)
    else
      @job.update(column_id: target_column, position: new_position)
    end

    render json: { status: :ok }
  end
  
  private

  def job_params
    params.require(:job).permit(:company, :description, :role, :level, :job_type, :salary, :application_link)
  end

  def set_job
    @job = Job.find(params[:id])
  end

  def set_column
    @column = Column.find(params[:column_id])
  end
end
