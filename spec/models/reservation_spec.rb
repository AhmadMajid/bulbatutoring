require "rails_helper"

RSpec.describe Reservation, type: :model do
  it { should belong_to :tutor }
  it { should belong_to :user }
end
