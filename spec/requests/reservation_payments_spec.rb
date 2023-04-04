require "rails_helper"

RSpec.describe "ReservationPayments", type: :request do
  let(:user) { create(:user, stripe_id: SecureRandom.uuid) }
  let(:tutor) { create(:tutor) }
  let(:payment_params) do
    {
      stripeToken: SecureRandom.uuid,
      tutor_id: tutor.id,
      user_id: user.id,
      checkin_date: "07/12/2022",
      checkout_date: "08/12/2022",
      subtotal: "100",
      cleaning_fee: "50",
      service_fee: "12.24",
      total: "162.24"
    }
  end

  before { sign_in user }

  describe "POST create" do
    it "queues up the ReservationPaymentJob" do
      allow(ReservationPaymentJob).to receive(:perform_later).and_return(true)
      expect(ReservationPaymentJob).to receive(:perform_later)
      post reservation_payments_path, params: payment_params
      expect(response).to be_redirect
    end
  end
end
