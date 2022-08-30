require "rails_helper"

RSpec.describe "Host::Tutors", type: :request do
  let(:user) { create(:user, role: "host") }

  before { sign_in user }

  describe "GET new" do
    it "succeeds" do
      get new_host_tutor_path
      expect(response).to be_successful
    end
  end
end
