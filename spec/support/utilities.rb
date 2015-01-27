include ApplicationHelper

def sign_up_with(email, password)
  visit sign_up_path
  fill_in 'Email', with: email
  fill_in 'Password', with: password
  click_button 'Sign up'
end

def sign_in(user, options={})
  if options[:no_capybara]
    #Sign in when not using Capybara.
    remember_token = User.new_remember_token
    cookies[:remember_token] = remember_token
    user.update_attribute(:remember_token, User.digest(remember_token))
  else
    visit signin_path
    fill_in "Email",  with: user.email
    fill_in "Password", with: user.password 
    click_button "Sign in"
  end
end

def sign_out
  first(:link, "Sign Out").click
end