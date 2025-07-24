class SchoolsController < ApplicationController

  # GET /schools or /schools.json
  def index
    @schools = School.all
  end
end
