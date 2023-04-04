require 'rails_helper'

RSpec.describe ReservationPaymentJob, type: :job do
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

  before do
    allow(Stripe::Customer).to receive(:retrieve).and_return(double(id: "user_id"))
    allow(Stripe::Customer).to receive(:create_source).and_return(double(id: "card_id"))
    allow(Stripe::Charge).to receive(:create).and_return(double(id: "charge_id"))
  end

  subject(:perform_job) do
    described_class.new.perform(user: user, tutor: tutor, payment_params: payment_params)
  end

  describe "#perform" do
    it "creates a Reservation" do
      expect { perform_job }.to change { Reservation.count }.by(1)
    end

    it "creates a Payment" do
      expect { perform_job }.to change { Payment.count }.by(1)
    end
  end
end
