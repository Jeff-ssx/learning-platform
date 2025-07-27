require "rails_helper"

RSpec.describe CourseEnrollmentsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/course_enrollments").to route_to("course_enrollments#index")
    end

    it "routes to #new" do
      expect(get: "/course_enrollments/new").to route_to("course_enrollments#new")
    end

    it "routes to #show" do
      expect(get: "/course_enrollments/1").to route_to("course_enrollments#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/course_enrollments/1/edit").to route_to("course_enrollments#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/course_enrollments").to route_to("course_enrollments#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/course_enrollments/1").to route_to("course_enrollments#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/course_enrollments/1").to route_to("course_enrollments#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/course_enrollments/1").to route_to("course_enrollments#destroy", id: "1")
    end
  end
end
