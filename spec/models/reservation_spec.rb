require "rails_helper"

RSpec.describe Reservation, type: :model do
  it { should belong_to :tutor }
  it { should belong_to :user }

  it { should validate_presence_of(:reservation_date) }
end
