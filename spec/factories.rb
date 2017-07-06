FactoryGirl.define do
  factory(:user) do
    email('K@email.com')
    name('Ken')
    password('000000')
    id 1
  end

  factory :picture do
    user_id 1
    avatar File.new(Rails.root + 'spec/support/default.jpg')
  end
end


# module ValidUserRequestHelper
#   # Signs in a valid user uwing the page.drive.post method
#   def sign_in_as_valid_user_driver
#        @user ||= FactoryGirl.create :user
#       page.driver.post user_session_path, :user => {:email => @user.email, :password => @user.password}
#   end
# end
