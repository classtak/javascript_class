class SessionsController < ApplicationController

  def signin
    
  end

  def user_signin
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      # flash[:notice] = "로그인에 성공!"
      redirect_to '/', notice: "로그인에 성공!"
    else
      # flash[:notice] = "등록되지 않은 이메일 이거나 비밀번호가 틀렸습니다."
      redirect_to '/signin', notice: "등록되지 않은 이메일 이거나 비밀번호가 틀렸습니다."
    end
  end

  def signup

  end

  def user_signup
    User.create(
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )
    redirect_to '/signin'
  end

  def signout
    session.delete(:user_id)
    redirect_to '/', notice: "로그아웃 성공!"
  end
end
