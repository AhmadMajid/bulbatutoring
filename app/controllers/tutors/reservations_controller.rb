# frozen_string_literal: true

module Tutors
  class ReservationsController < ApplicationController
    before_action :authenticate_user!

    def new
      @tutor = Tutor.find(params[:tutor_id])
      @reservation = @tutor.reservations.new
    end

    private

    def new_reservation_params
      params.permit(
        :checkin_date, :checkout_date, :subtotal, :cleaning_fee,
        :service_fee, :total
      )
    end
  end
end
