# coding: utf-8

class SessionsController < ApplicationController
  def create
    member = Member.authenticate(params[:name], params[:password])
    if member
      session[:member_id] = member.id
      #session[:cart_id] = cart.id 
      
    else
      flash.alert = "名前とパスワードが一致しません"
    end
    redirect_to params[:from] || :root
  end

  def destroy
    session.delete(:member_id)
    #session.delete(:cart_id)
    redirect_to :root
  end
end
