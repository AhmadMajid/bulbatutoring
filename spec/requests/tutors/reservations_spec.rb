require "rails_helper"

RSpec.describe "Tutors::Reservations", type: :request do
  let(:tutor) { create(:tutor) }
  let(:user) { create(:user) }

  before { sign_in user }

  describe "GET new" do
    it "succeeds" do
      get new_tutor_reservation_path(tutor)
    end
  end
end
