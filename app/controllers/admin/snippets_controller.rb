class Admin::SnippetsController < Admin::Controller
  cache_sweeper :site_sweeper
  def index    
    Snippet.find_or_create_by_slug(:slug => 'head_snippet', :text => "<p>Kelly Kernohan is a <b>Speech Level Singing</b> Certified vocal instructor located in Los Angeles, California. Her students include singers of pop music, R&amp;B, musical theater, jazz, country, folk, and rock.</p>")
    Snippet.find_or_create_by_slug(:slug => 'schedule_snippet', :text => "To schedule a lesson with Kelly please email <a href='mailto:kellykernohan@hotmail.com' title='Contact Kelly Kernohan'>kellykernohan@hotmail.com</a>")
    @snippets = Snippet.find(:all, :order => 'slug ASC', :conditions => {:type => nil})
  end
  
  def show
    @snippet = Snippet.find(params[:id])
  end

  def edit
    @snippet = Snippet.find(params[:id])
  end

  def update
    @snippet = Snippet.find(params[:id])
    if @snippet.update_attributes!(params[:snippet])
      messages(:success) << 'Snippet was successfully saved.'
      redirect_to admin_snippets_path
    else
      errors_for(@snippet, "There was an error saving this snippet:", true)
      render :action => :edit
    end
  end
  
  def destroy
    @snippet = Snippet.find(params[:id])
    if @snippet.destroy
      messages(:success) << 'Snippet was successfully deleted.'
    else  
      errors_for(@snippet, "There was an error deleting this snippet:", false)
    end
    redirect_to admin_snippets_path
  end
end