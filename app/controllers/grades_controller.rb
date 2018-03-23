class GradesController < ApplicationController
  def create
    @grade = Grade.new(grade_params)
    unless @grade.save
      flash[:error] = "Błąd"
    end
    redirect_back fallback_location: root_path
  end

  def add_grade
    respond_to do |format|
      format.html
      format.json
      format.js
    end
  end

  private def grade_params
    params.require(:grade).permit(:grade, :info, :obtainedDate, :subject_id, :student_id, :user_id)
  end
end