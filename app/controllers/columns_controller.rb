class ColumnsController < ApplicationController
  def index
    @column = Column.last
    @job = Job.new
    @columns = policy_scope(Column)
    @jobs = policy_scope(Job)
  end
end
