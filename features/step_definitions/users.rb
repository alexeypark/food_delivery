When(/^создаст пользователя с данными:$/) do |table|
  visit('/admin/users/new')
  within("#new_user") do
    fill_in('Name', with: table.hashes[0][:name])
    fill_in('Address', with: table.hashes[0][:address])
    fill_in('Phone', with: table.hashes[0][:phone])
    fill_in('Email', with: table.hashes[0][:email])
    fill_in('user_password', with: table.hashes[0][:password])
    fill_in('user_password_confirmation', with: table.hashes[0][:password])
    choose(table.hashes[0][:role])
    click_button 'Create User'
  end
end

When(/^пользователь "([^"]*)" видно на главной странице$/) do |name|
  visit('/admin/users')
  page.assert_text("#{name}")
end

When(/^отредактирует пользователя данными:$/) do |table|
  visit('/admin/users')
  edit_user = User.find_by(email: 'user@example.com')
  find(:xpath, "//a[@href='/admin/users/#{edit_user.id}/edit']").click
  fill_in('Name', with: table.hashes[0][:name])
  fill_in('Address', with: table.hashes[0][:address])
  fill_in('Phone', with: table.hashes[0][:phone])
  fill_in('Email', with: table.hashes[0][:email])
  fill_in('user_password', with: table.hashes[0][:password])
  fill_in('user_password_confirmation', with: table.hashes[0][:password])
  choose(table.hashes[0][:role])
  click_button 'Update User'
end

When(/^отредактированное пользователь "([^"]*)" видно на главной странице$/) do |name|
  visit('/admin/users')
  page.assert_text("#{name}")
end
