require "rails_helper"

RSpec.describe "Profiles", type: :request do
  let(:user) { create(:user) }
  let(:profile) { user.profile }

  before { sign_in user }

  describe "GET show" do
    context "with valid profile id" do
      it "succeeds" do
        get profile_path(profile)
        expect(response).to be_successful
      end
    end

    context "with invalid profile id" do
      it "fails" do
        expect { get profile_path(0) }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end

  describe "PUT update" do
    context "with valid update params" do
      it "succeeds" do
        profile.update! first_name: "Foo", last_name: "Bar"

        put profile_path(profile), params: {
          profile: {
            first_name: "John"
          }
        }
        expect(profile.reload.first_name).to eq("John")
        expect(response).to be_redirect
      end
    end

    context "with invalid update params" do
      it "does not update the user_id" do
        profile.update! first_name: "Foo", last_name: "Bar"

        put profile_path(profile), params: {
          profile: {
            user_id: nil
          }
        }
        expect(profile.reload.user_id).to_not be nil
      end
    end
  end
end
