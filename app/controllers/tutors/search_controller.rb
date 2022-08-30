# frozen_string_literal: true

module Tutors
  class SearchController < ApplicationController
    def index
      @tutors = Tutor.all

      if search_params[:city].present?
        @tutors = @tutors.city(search_params[:city])
      end

      if search_params[:country_code].present?
        @tutors = @tutors.country_code(search_params[:country_code])
      end

      tutors_without_reservations = @tutors.includes(:reservations).select { |tutor| tutor.reservations.size.zero? }

      if search_params[:checkin_date] && search_params[:checkout_date]
        @tutors = @tutors.between_dates(search_params[:checkin_date], search_params[:checkout_date])
      end

      @tutors = Tutor.where(id: tutors_without_reservations.map(&:id) + @tutors.ids)
    end

    private

    def search_params
      params.permit(:city, :country_code, :checkin_date, :checkout_date)
    end
  end
end
