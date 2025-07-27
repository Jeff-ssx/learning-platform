module TermsHelper
  def render_term_list(student, terms)
    return content_tag(:p, "No terms available") if terms.blank?

    content_tag(:ul) do
      terms.map { |term| content_tag(:li, link_to(term.name, school_student_term_path(term.school, student, term))) }.join.html_safe
    end
  end
end
