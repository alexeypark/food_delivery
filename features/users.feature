#language: ru
#Предыстория: для того, чтобы запустить данный сценарий, необходимо засидить тестовую базу seed.rb

Функционал: Управление пользователями
  Как администратор
  Я хочу иметь возможность управлять пользователями

  Сценарий: Администратор создает пользователя через админку
    Допустим залогинен пользователь с email "admin@example.com" и паролем "password"
    Если создаст пользователя с данными:
      | name | address     | phone   | email         | password  | role |
      | user | lorem ipsum | 1234567 | user@user.com | p1assword | None |
    То пользователь "user" видно на главной странице

    Если отредактирует пользователя данными:
      | name        | address     | phone   | email                | password  | password_confirmation | role |
      | edited_user | lorem ipsum | 1234567 | edited_user@user.com | pa1ssword | pa1ssword             | None |
    То отредактированное пользователь "edited_user" видно на главной странице