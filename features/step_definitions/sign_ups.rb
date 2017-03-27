When(/^гость зарегистрируется со следующими данными:$/) do |table|
  visit('/users/sign_up')
  within("#new_user") do
    fill_in('Name', with: table.hashes[0][:name])
    fill_in('Address', with: table.hashes[0][:address])
    fill_in('Phone', with: table.hashes[0][:phone])
    fill_in('Email', with: table.hashes[0][:email])
    fill_in('user_password', with: table.hashes[0][:password])
    fill_in('user_password_confirmation', with: table.hashes[0][:password])
    click_button 'Sign up'
  end
end

When(/^регистрация пройдет успешно и он увидит свой email "([^"]*)" в меню$/) do |email|
  page.assert_text("#{email}")
end

When(/^пользователь нажмет sign out$/) do
  page.driver.submit :delete, "/users/logout", {}
end

When(/^пользователь выйдет и он не увидит свой email "([^"]*)" в меню$/) do |email|
  page.assert_no_text("#{email}")
end
