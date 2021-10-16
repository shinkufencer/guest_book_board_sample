class ApplicationController < ActionController::Base
  helper_method :logged_in?
  helper_method :session_user

  private

  # @return [User] セッション情報に連動するUserオブジェクトを返却する。DBからのSelectを複数回行いたくないのでインスタンス変数化
  def session_user
    @memorize_session_user ||= User.find_by_id(session[:user_id])
  end

  def logged_in?
    !!session_user
  end
end
