class PagesController < ApplicationController
  caches_page :show
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
  
  # def show
  #   if File.exists?(File.join(RAILS_ROOT, "app", "views", "pages", "#{params[:id]}.html.haml"))
  #     render :template => "pages/#{params[:id]}"
  #   else
  #     render_optional_error_file 404
  #   end
  # end
end