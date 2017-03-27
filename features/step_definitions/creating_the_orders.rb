When(/^пользователь добавляет блюдо "([^"]*)" в корзину$/) do |name|
  visit('/places/1')
  find("#dish_#{name}").click
end

When(/^блюдо "([^"]*)" видно на странице заведения$/) do |name|
  page.assert_text("× #{name}")
end

When(/^пользователь удаляет блюдо "([^"]*)" из корзины$/) do |name|
  dish = Dish.find_by( name: name)
  destroy_item = LineItem.find_by(dish: dish)
  page.driver.submit :delete, "/line_items/#{destroy_item.id}", {}
end

When(/^блюдо "([^"]*)" не видно на странице заведения$/) do |name|
  page.assert_no_text("× #{name}")
end

When(/^пользователь удаляет корзину$/) do
  click_button 'Empty cart'
end

When(/^корзина пуста$/) do
  page.assert_text("Total 0")
end

When(/^пользователь оформляет заказ$/) do
  click_button 'Order'
end

When(/^заказ видно в списке заказов$/) do
  page.has_css?('div#order_1')
end
