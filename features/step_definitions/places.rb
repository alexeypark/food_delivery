When(/^залогинен пользователь с email "([^"]*)" и паролем "([^"]*)"$/) do |email, password|
  visit('/users/login')
  within("#new_user") do
    fill_in('Email', with: email)
    fill_in('Password', with: password)
    click_button 'Log in'
  end
end

When(/^создаст место с данными:$/) do |table|
  visit('/admin/places/new')
  within("#new_place") do
    fill_in('Name', with: table.hashes[0][:name])
    fill_in('Description', with: table.hashes[0][:description])
    click_button 'Create Place'
  end
end

When(/^место "([^"]*)" видно на главной странице$/) do |name|
  visit(root_path)
  page.assert_text("#{name}")
end

Если(/^отредактирует место данными:$/) do |table|
  visit('/admin/places')
  edit_place = Place.find_by(name: 'New Restaurant')
  find(:xpath, "//a[@href='/admin/places/#{edit_place.id}/edit']").click
  fill_in('Name', with: table.hashes[0][:name])
  fill_in('Description', with: table.hashes[0][:description])
  click_button 'Update Place'
end

When(/^отредактированное место "([^"]*)" видно на главной странице$/) do |name|
  visit(root_path)
  page.assert_text("#{name}")
end

When(/^удаляет место с данными:$/) do |table|
  visit('/admin/places')
  destroy_place = Place.find_by(name: table.hashes[0][:name])
  page.driver.submit :delete, "/admin/places/#{destroy_place.id}", {}
end

When(/^удаленное место "([^"]*)" не видно на главной странице$/) do |name|
  page.assert_no_text("#{name}")
end

