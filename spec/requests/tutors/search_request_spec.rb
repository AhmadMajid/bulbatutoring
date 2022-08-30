require "rails_helper"

RSpec.describe "Tutors::Search", type: :request do
  let(:tutors) { create_list(:tutor, 3) }

  describe "GET index" do
    it "succeeds" do
      get tutors_search_path
      expect(response).to be_successful
    end
  end
end
