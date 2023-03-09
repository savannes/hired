class ColumnsController < ApplicationController
  def index
    @columns = policy_scope(Column)
    @jobs = policy_scope(Job)
  end
end
