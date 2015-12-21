class StringsController < ApplicationController
  def getCookie
    require 'SecureRandom'
    if cookies[:cookie].blank?
      cookie = SecureRandom.hex 4
      cookies.permanent[:cookie] = cookie
      return cookie
    else
      return cookies[:cookie]
    end
  end

  def reply
    newString = SubString.new
    if params[:sub_string][:text].blank? then
      if params[:sub_string][:text].to_s.length <10 then
        render '../../public/string/tooShort.html'
        return
      end
    else
      newString.text = params[:sub_string][:text]
    end

    if not params[:sub_string][:name].blank?
      newString.name = params[:sub_string][:name]
    end

    if not params[:sub_string][:title].blank?
      newString.title = params[:sub_string][:title]
    end

    newString.uptime = Time.now

    if not params[:sub_string][:image].nil?
      newString.image = params[:sub_string][:image]
    else
      newString.image = nil
    end

    newString.cookie = getCookie
    newString.mainString_id = params[:id]
    if newString.save then
      render '../../public/string/succ.html'
    else
      render  '../../public/string/fail.html'
    end
  end

  def show
    id = params[:id].to_i
    @mainString = MainString.find_by(id: id)
    if @mainString.blank?
      render '../../public/error/strings404.html'
    end
    @subString = SubString.new
    params[:page].blank? ? page = 1:page = params[:page].to_i
    @strings = SubString.where("mainString_id = ?",id ).order(:uptime).limit(30).offset(30*(page-1)).all
  end
end
