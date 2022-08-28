class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_one :profile, dependent: :destroy

         has_many :favorites, dependent: :destroy
         has_many :favorited_tutors, through: :favorites, source: :tutor
         has_many :reservations, dependent: :destroy
         has_many :reserved_tutors, through: :reservations, source: :tutor

         after_create :create_profile
         def create_profile
           self.profile = Profile.new
           save!
         end
end
