module Authentication
  def require_authentication
    restore_authentication || request_authentication
  end

  def request_authentication
    redirect_to new_session_path, notice: "You must be signed in to perform that action"
  end

  def restore_authentication
    if session = session_from_cookies
      Current.user = session.user
    end
  end

  def sign_in(user)
    session = user.sessions.create!
    cookies.signed.permanent[:session_id] = { value: session.id, httponly: true }
  end

  def session_from_cookies
    Session.find_by(id: cookies.signed[:session_id])
  end
end
