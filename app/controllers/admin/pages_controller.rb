class Admin::PagesController < Admin::Controller
  cache_sweeper :site_sweeper
  def index
      @page = Page.find_or_create_by_slug(:slug => 'home', :nav_title => "Home", :nav_item => true, :nav_position => 1, :tagline => "Do you wish you could sing as naturally and easy as speaking?", :header_title => "Los Angeles Private Singing Lessons", :text => HOME_TEXT, :core_page => true)
      Page.find_or_create_by_slug(:slug => 'lessons', :nav_title => "Lessons",  :nav_item => true, :nav_position => 2,  :tagline => "Take the first step towards fulfilling your singing potential.", :header_title => "Speech Level Singing Vocal Lessons", :text => LESSONS_TEXT, :core_page => true)
      Page.find_or_create_by_slug(:slug => 'speech_level_singing', :nav_title => "Speech Level Singing",  :nav_item => true, :nav_position => 3, :tagline => "Sing like you've always wanted with the \"Technique of Legends.\"", :header_title => "Speech Level Singing Los Angeles", :text => SPEECH_LEVEL_SINGING_TEXT, :core_page => true)
      Page.find_or_create_by_slug(:slug => 'contact', :nav_title => "Contact", :nav_item => true, :nav_position => 4, :tagline => "Contacting the Kelly Kernohan Vocal Studio", :header_title => "Contact the Kelly Kernohan Vocal Studio", :text => CONTACT_TEXT, :core_page => true)
    @pages = Page.find(:all, :order => 'nav_position ASC')
    
  end
  
    def show
      @page = Page.find(params[:id])
    end
    
    def edit_contact_info
      @page = Page.find(params[:id])
    end

    def edit
      @page = Page.find(params[:id])
    end

    def update
      @page = Page.find(params[:id])
      if params[:page][:nav_item] == "1"
        @page.nav_position = Page.nav_items.size+1
      end
      if @page.update_attributes!(params[:page])
        messages(:success) << 'Page was successfully saved.'
        redirect_to admin_pages_path
      else
        errors_for(@page, "There was an error saving this page:", true)
        render :action => :edit
      end
    end


    def update_positions
      pages = params[:page]
      pages.each_with_index {|id, index|
        page = Page.find_by_id(id.to_i)
        if page
          page.nav_position = index
          page.save
        end
      }
      respond_to do |format|
        format.json {
          render :text => "success"
        }
      end
    end
    

    def new
      @page = Page.new
    end
    def create
      @page = Page.new(params[:page])
      if @page.nav_item && !@page.nav_position
        @page.nav_position = Page.nav_items.size+1
      end
      if @page.save
        messages(:success) << 'Page was successfully created.'
        redirect_to admin_pages_path
      else
        errors_for(@page, "There was an error creating this page:", false)
        render :new
      end
    end
   
    def destroy
      @page = Page.find(params[:id])
      if @page.destroy
        messages(:success) << 'Page was successfully deleted.'
        redirect_to admin_pages_path      
      else
        errors_for(@page, "Unable to delete Page:", true)
        render :action => :index
      end
    end
    
end