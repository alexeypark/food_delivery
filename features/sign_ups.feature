#language: ru

Функционал: Регистрация пользователя и редактирование профиля
  Как гость
  Я хочу иметь возможность зарегистрироваться и выйти

  Сценарий: Гость регистрируется и выходит
    Если гость зарегистрируется со следующими данными:
      | name | address     | phone   | email         | password |
      | user | lorem ipsum | 1234567 | user@user.com | password |
    То регистрация пройдет успешно и он увидит свой email "user@user.com" в меню
    Если пользователь нажмет sign out
    То пользователь выйдет и он не увидит свой email "user@user.com" в меню

  Сценарий: Пользователь редактирует профиль
    Допустим залогинен пользователь с email "user@example.com" и паролем "password"
    Если пользователь редактирует профиль данными:
      | name        | address     | phone   | email                | password  | current_password |
      | edited_user | lorem ipsum | 1234567 | edited_user@user.com | password1 |    password      |
    То отредактированный email "edited_user@user.com" видно в меню
