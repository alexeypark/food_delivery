When(/^создаст блюдо с данными:$/) do |table|
  visit('/admin/dishes/new')

  within("#new_dish") do
    select(table.hashes[0][:place], from: 'Place')
    fill_in('Name', with: table.hashes[0][:name])
    fill_in('Description', with: table.hashes[0][:description])
    fill_in('Price', with: table.hashes[0][:price])
    click_button 'Create Dish'
  end
end

When(/^блюдо "([^"]*)" видно на главной странице$/) do |name|
  visit('/places/1')
  page.assert_text("#{name}")
end

When(/^отредактирует блюдо данными:$/) do |table|
  visit('/admin/dishes')
  edit_dish = Dish.find_by(name: 'New Dish')
  find(:xpath, "//a[@href='/admin/dishes/#{edit_dish.id}/edit']").click
  select(table.hashes[0][:place], from: 'Place')
  fill_in('Name', with: table.hashes[0][:name])
  fill_in('Description', with: table.hashes[0][:description])
  fill_in('Price', with: table.hashes[0][:price])
  click_button 'Update Dish'
end

When(/^отредактированное блюдо "([^"]*)" видно на главной странице$/) do |name|
  visit('/places/1')
  page.assert_text("#{name}")
end

When(/^удаляет блюдо с данными:$/) do |table|
  visit('/admin/dishes')
  destroy_dish = Dish.find_by(name: table.hashes[0][:name])
  page.driver.submit :delete, "/admin/dishes/#{destroy_dish.id}", {}
end

When(/^удаленное блюдо "([^"]*)" не видно на главной странице$/) do |name|
  page.assert_no_text("#{name}")
end
