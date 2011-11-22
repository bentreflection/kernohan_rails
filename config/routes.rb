ActionController::Routing::Routes.draw do |map|
  
  map.namespace(:admin) do |a|
    a.root :controller => "snippets", :action => "index"
    a.resources :snippets
    a.resources :pages, :collection => {:update_positions => :post}    
    a.resources :contact_infos
  end
  
  map.root :controller => 'pages', :action => 'show', :id => "home", :conditions => { :method => :get }
  map.connect '/lessons', :controller => 'pages', :action => 'show', :id => "lessons", :conditions => { :method => :get }
  map.connect '/speech_level_singing', :controller => 'pages', :action => 'show', :id => "speech_level_singing", :conditions => { :method => :get }
  map.connect '/contact', :controller => 'pages', :action => 'contact', :id => "contact", :conditions => { :method => :get }
  
  
  
  map.connect '/pages/:id', :controller => 'pages', :action => 'show', :id => /[a-z0-9\-_\+]+/, :conditions => { :method => :get }

  map.connect '/:page', :controller => 'pages', :action => 'show', :page => /[a-z0-9\-_\+]+/, :conditions => { :method => :get }
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
