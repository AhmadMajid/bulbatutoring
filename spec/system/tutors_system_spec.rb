require "rails_helper"

RSpec.describe "Tutors page", type: :system do
  before do
    driven_by(:rack_test)
    create_list(:tutor, 5)
    allow_any_instance_of(Tutor).to receive(:default_image).and_return(
      "https://thumbs.dreamstime.com/b/default-avatar-profile-icon-vector-social-media-user-portrait-176256935.jpg"
    )
  end

  it "enables me to create widgets" do
    visit root_path

    Tutor.find_each do |tutor|
      expect(page).to have_text(tutor.city)
    end
  end
end
