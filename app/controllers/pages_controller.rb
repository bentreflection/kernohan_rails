class PagesController < ApplicationController
  caches_page :show, :contact
  def show
    @page = Page.find(:first, :conditions => {:slug => params[:id]})
    unless @page
      render_optional_error_file 404
    end
  end

  def contact
    @page = Page.find(:first, :conditions => {:slug => params[:id]})
    unless @page
      render_optional_error_file 404
    end
  end
end