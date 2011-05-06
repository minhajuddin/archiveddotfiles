def log_to_console
  ActiveRecord::Base.logger = Logger.new(STDOUT)
  ActionController::Base.logger = Logger.new(STDOUT)
end
