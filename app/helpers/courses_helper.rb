module CoursesHelper
  def render_course_list(student, courses)
    return content_tag(:p, "No Courses") if courses.blank?

    content_tag(:ul) do
      courses.map { |course| content_tag(:li, link_to(course.name, school_student_term_course_path(student.school, student, course.term, course))) }.join.html_safe
    end
  end
end
