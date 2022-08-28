# frozen_string_literal: true

class TutorsController < ApplicationController
  def show
    @tutor = Tutor.find(params[:id])
  end
end
