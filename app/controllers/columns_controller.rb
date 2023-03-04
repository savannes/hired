class ColumnsController < ApplicationController
  def index
    @columns = policy_scope(Column)
  end
end
