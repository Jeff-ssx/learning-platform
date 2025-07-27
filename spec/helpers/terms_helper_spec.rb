require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the TermsHelper. For example:
#
# describe TermsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe TermsHelper, type: :helper do
  let(:school) {create(:school) }
  let(:student) { create(:student, school: school) }


  describe "#render_term_list" do
    context 'when terms are present' do
      let(:term_1) { create(:term, school: school)}
      let(:term_2) { create(:term, school: school)}

      it "renders a list of term names as <li>" do
        terms = [term_1, term_2]

        html = helper.render_term_list(student, terms)

        expect(html).to include(term_1.name)
        expect(html).to include(term_2.name)
        expect(html).to include(school_student_term_path(school, student, term_1))
        expect(html).to include(school_student_term_path(school, student, term_2))
      end
    end
    it "shows a message if terms is nil or empty" do
      expect(helper.render_term_list(student, nil)).to include("No terms available")
      expect(helper.render_term_list(student, [])).to include("No terms available")
    end
  end
end
