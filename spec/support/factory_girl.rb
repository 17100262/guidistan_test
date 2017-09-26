RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
  
  
#   config.before(:suite) do
#     begin
#       DatabaseCleaner.start
#     #   FactoryGirl::InvalidFactoryError
#       # FactoryGirl.lint

#     ensure
#       DatabaseCleaner.clean
#     end
#   end
  
end
