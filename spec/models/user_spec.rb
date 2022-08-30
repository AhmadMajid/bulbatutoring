require "rails_helper"

RSpec.describe User, type: :model do
  it { should have_one(:profile).dependent(:destroy) }
  it { should have_many(:favorites).dependent(:destroy) }
  it { should have_many(:favorited_tutors).through(:favorites).source(:tutor) }
  it { should have_many(:reservations).dependent(:destroy) }
  it { should have_many(:payments).through(:reservations) }
  it { should have_many(:reserved_tutors).through(:reservations).source(:tutor) }
  it { should have_many(:reviews).dependent(:destroy) }
  it { should have_many(:tutors).dependent(:destroy) }
  it { should have_many(:receiving_payments).through(:tutors).source(:payments) }
end
