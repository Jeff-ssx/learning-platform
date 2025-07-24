require "rails_helper"

RSpec.describe SchoolsController, type: :routing do
  describe "routing" do
    it "routes to root" do
      expect(get: "/").to route_to("schools#index")
    end

    it "routes to #index" do
      expect(get: "/schools").to route_to("schools#index")
    end
  end
end
