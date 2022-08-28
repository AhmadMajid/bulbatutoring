require "rails_helper"

RSpec.describe "Tutors", type: :request do
  describe "GET show" do
    let(:tutor) { create(:tutor) }

    it "succeeds" do
      get tutor_path(tutor)
      expect(response).to be_successful
    end
  end
end
