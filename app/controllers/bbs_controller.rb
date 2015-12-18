class BbsController < ApplicationController
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

  def show
    @mainString  = MainString.new
    if params[:type].blank? or not $category.has_key?(params[:type])
      render '../../public/error/plate404.html'
    end

  end

  def addNew
    newString = MainString.new
    if params[:main_string][:text].blank? then
      if params[:main_string][:text].to_s.length <10 then
        render '../../public/string/tooShort.html'
        return
      end
    else
      newString.text = params[:main_string][:text]
    end

    if not params[:main_string][:name].blank?
      newString.name = params[:main_string][:name]
    end

    if not params[:main_string][:title].blank?
      newString.title = params[:main_string][:title]
    end

    newString.uptime = Time.now
    newString.modtime = newString.uptime

    if not params[:main_string][:image].nil?
      newString.image = params[:main_string][:image]
    else
      newString.image = nil
    end

    newString.cookie = getCookie
    if $category.has_key?(params[:type])
      newString.type_id = $category[params[:type]]
    end
    if newString.save then
      render '../../public/string/succ.html'
    else
      render  '../../public/string/fail.html'
    end
  end

  def index

  end
end
