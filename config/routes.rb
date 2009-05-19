ActionController::Routing::Routes.draw do |map|
  map.resources :triples, :collection => { :search => :get }
  map.resources :predicates
  map.resources :domains
  map.root :controller => "triples", :action => 'index'
  map.entity '/:id', :controller => 'entities', :action => 'show'
end
