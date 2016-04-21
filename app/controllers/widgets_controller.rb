class Obj
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming
  attr_accessor :title

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end
  
  def persisted?
    false
  end
end

class WidgetsController < ApplicationController
  def index
    session[:title] = 'Listing Widgets'
    @obj = Obj.new title: 'test string' 
  end


  def edit_title
  end

  def show_title
  end

  def change_title
    session[:title] = obj_params[:title] if params[:commit]=='Change'
    redirect_to show_title_url
  end

private
  def obj_params
    params.require(:obj).permit(:title)
  end
end
