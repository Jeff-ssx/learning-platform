module SetSchoolAndStudent
  extend ActiveSupport::Concern

  private

  def set_school
    @school = School.find(school_id_param)
  end

  def set_student
    @student = @school.students.find(student_id_param)
  end

  def school_id_param
    params.require(:school_id)
  end
  
  def student_id_param
    params.require(:student_id)
  end
end
