require "rails_helper"

RSpec.describe "Tutors::Reservations", type: :request do
  let(:tutor) { create(:tutor) }
  let(:user) { create(:user) }

  before { sign_in user }

  describe "GET new" do
    it "succeeds" do
      get new_tutor_reservation_path(tutor), params: {
        checkin_date: "07/12/2022",
        checkout_date: "07/14/2022"
      }
    end
  end
end
