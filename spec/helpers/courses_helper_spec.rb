require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the CoursesHelper. For example:
#
# describe CoursesHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe CoursesHelper, type: :helper do
  let(:school) { create(:school) }
  let(:student) { create(:student, school: school) }
  let(:term) { create(:term) }


  describe "#render_course_list" do
    context 'when courses are present' do
      let(:course_1) { create(:course, term: term)}
      let(:course_2) { create(:course, term: term)}

      it "renders a list of course names as <li>" do
        courses = [course_1, course_2]

        html = helper.render_course_list(student, courses)

        expect(html).to include(course_1.name)
        expect(html).to include(course_2.name)
        expect(html).to include(school_student_term_course_path(school, student, term, course_1))
        expect(html).to include(school_student_term_course_path(school, student, term, course_2))
      end
    end
    it "shows a message if courses is nil or empty" do
      expect(helper.render_course_list(student, nil)).to include("No Courses")
      expect(helper.render_course_list(student, [])).to include("No Courses")
    end
  end
end
