# frozen_string_literal: true

class ReservationPaymentsController < ApplicationController
  before_action :authenticate_user!

  def create
    ReservationPaymentJob.perform_later(user: user, tutor: tutor, payment_params: payment_params)
    redirect_to root_path
  end

  private

  def payment_params
    params.permit(:stripeToken, :tutor_id, :user_id, :checkin_date, :checkout_date,
                  :subtotal, :cleaning_fee, :service_fee, :total)
  end

  def user
    @user ||= User.find(payment_params[:user_id])
  end

  def tutor
    @tutor ||= Tutor.find(payment_params[:tutor_id])
  end
end
