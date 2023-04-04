
class ReservationPaymentJob < ApplicationJob
  queue_as :default

  def perform(user:, tutor:, payment_params:)
    stripe_customer ||= if user.stripe_id.blank?
      customer = Stripe::Customer.create(email: user.email)
      user.update(stripe_id: customer.id)
      customer
    else
      Stripe::Customer.retrieve(user.stripe_id)
    end

    stripe_card = Stripe::Customer.create_source(
      stripe_customer.id,
      { source: payment_params[:stripeToken] }
    )
    charge = Stripe::Charge.create(
      amount: Money.from_amount(BigDecimal(payment_params[:total])).cents,
      currency: "usd",
      source: stripe_card.id,
      customer: stripe_customer.id
    )
    reservation = Reservation.create(
      tutor: tutor,
      user: user,
      checkin_date: Date.strptime(payment_params[:checkin_date], Date::DATE_FORMATS[:us_short_date]),
      checkout_date: Date.strptime(payment_params[:checkout_date], Date::DATE_FORMATS[:us_short_date])
    )
    payment = Payment.create(
      reservation: reservation,
      subtotal: Money.from_amount(BigDecimal(payment_params[:subtotal])),
      cleaning_fee: Money.from_amount(BigDecimal(payment_params[:cleaning_fee])),
      service_fee: Money.from_amount(BigDecimal(payment_params[:service_fee])),
      total: Money.from_amount(BigDecimal(payment_params[:total])),
      stripe_id: charge.id
    )
  end
end
