module HeaderHelper
  def become_a_tutor_url
    return "#" if user_signed_in?

    new_user_registration_path
  end
end
