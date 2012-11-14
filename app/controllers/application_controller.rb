puts "#{__FILE__} is being loaded"

# I added "config.reload_classes_only_on_change = false"
# to config/application.rb to produce the error immediately.
# With reload_classes_only_on_change=true, error can
# be produced by touching this file and reloading.
class ApplicationController < ActionController::Base
  def index
    MyModule
    render :inline => 'Sucess', :layout => true
  end
end
