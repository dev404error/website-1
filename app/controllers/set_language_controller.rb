class SetLanguageController < ApplicationController
  def french
    I18n.locale = :fr
    set_session_and_redirect
  end

  def english
    I18n.locale = :en
    set_session_and_redirect
  end

  private

  def set_session_and_redirect
    session[:locale] = I18n.locale
    redirect_to :back
    rescue ActionController::RedirectBackError
      redirect_to :root
  end
end