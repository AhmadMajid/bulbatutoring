# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @tutors = Tutor.all
  end
end
