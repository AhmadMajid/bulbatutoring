# frozen_string_literal: true

module Host
  class TutorsController < ApplicationController
    before_action :authenticate_user!

    def new
      authorize current_user, policy_class: HostPolicy
      @tutor = Tutor.new(user: current_user)
    end

    def create
      authorize current_user, policy_class: HostPolicy
      @tutor = current_user.tutors.new(tutor_params)

      if @tutor.save
        redirect_to host_dashboard_path
      else
        render :new
      end
    end

    private

    def tutor_params
      params.require(:tutor).permit(
        :name, :headline, :description, :images, :address_1, :address_2, :city,
        :state, :zip_code, :country_code
      )
    end
  end
end
