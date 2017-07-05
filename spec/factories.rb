FactoryGirl.define do
  factory(:user) do
    email('K@email.com')
    name('Ken')
    encrypted_password('$2a$11$H7PkLol1detReEvH2M68Pu6p6Qw9eK7x6KiOFaOOyWEAmaMUFL47K')
    
  end
end


module ValidUserRequestHelper
  # Signs in a valid user uwing the page.drive.post method
  def sign_in_as_valid_user_driver
       @user ||= FactoryGirl.create :user
      page.driver.post user_session_path, :user => {:email => @user.email, :password => @user.password}
  end
end
