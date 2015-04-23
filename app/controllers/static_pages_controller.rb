class StaticPagesController < ApplicationController
  before_filter CASClient::Frameworks::Rails::Filter
  def home
  end

  def about
  end

  def logout
   CASClient::Frameworks::Rails::Filter.logout(self)
  end

end
