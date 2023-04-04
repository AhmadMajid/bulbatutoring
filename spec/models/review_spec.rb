require "rails_helper"

RSpec.describe Review, type: :model do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:body) }
  it { should validate_presence_of(:rating) }
  it { should belong_to(:reviewable) }
  it { should belong_to(:user) }
  it { should validate_numericality_of(:rating).is_greater_than_or_equal_to(1) }
  it { should validate_numericality_of(:rating).is_less_than_or_equal_to(5) }
  it { should validate_numericality_of(:rating).only_integer }

  describe "#update_average_rating" do
    let(:tutor) { create(:tutor) }
    let(:user) { create(:user) }

    it "updates the tutor's average_rating" do
      Review.create(title: "New Review", body: "New Review Body", rating: 5, reviewable: tutor, user: user)
      expect(tutor.reload.average_rating).to eq 5
    end

    it "updates the tutor's average_rating properly when there are two reviews" do
      Review.create(title: "New Review", body: "New Review Body", rating: 5, reviewable: tutor, user: user)
      Review.create(title: "New Review 2", body: "New Review Body 2", rating: 3, reviewable: tutor, user: user)
      expect(tutor.reload.average_rating).to eq 4
    end
  end
end
