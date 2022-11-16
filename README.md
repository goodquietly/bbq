# BBQ

Ruby on Rails приложение для организиции мероприятий.

Пользователи приложения (реализована регистрация) могут создавать события, приглашать на события друзей.
Реализована возможность подписки на событие, размещение комментириев и фотографий.

Посмотреть работу приложения на [VPS](https://bbqgp.site/)

### Версии Ruby и Rails:

```
ruby '3.0.1'

rails '~> 7.0.2'
```

### Реализовано в приложении:

- Аутентификация с использованием гема `devise`;

- Аутентификация через аккаунты Vkontakte, GitHub, Yandex, Google с помощью `omniauth`;

- Авторизация с помощью `pundit`;

- Локализация и интернационализация с помощью `i18n`;

- Загрузка изображений с помощью `Active Storage` и хранение `AWS S3 Yandex Cloud`;

- Фронтенд с помощью `bootstrap 5`, карусель `fslightbox`, иконки `bootstrap-icons`, `flag-icons`;

- Отображение мероприятия на `Yandex.Maps`;

- `ActionMailer`, `Mailjet` для отправки email уведомлений с помощью `ActiveJob` и `Resque`;

- Тестирование `polycies` с помощью `rspec-rails`;

- Деплой на VPS с помощью `Capistrano`.

### Установка приложения:

Установите `Bundler`:

```
gem install bundler
```

Склонируйте репозиторий:

```
git clone https://github.com/goodquietly/bbq.git
```

Находясь в папке с игрой `cd bbq`, установите библиотеки:

```
bundle install
```

Выполните миграции БД

```
bundle exec rake db:migrate
```

Установите `yarn` :

```
yarn install
```

Соберите библиотеки с помощью `yarn`:

```
yarn build
yarn build:css
```

### Добавьте ключи сервисов:

Добавьте в проект в файл `.env` с содержимым (см. файл примера `.env.example`):

### Запустите тестирование программы:

```
bundle exec rspec
```

### Запустите программу:

```
bundle exec rails s
```

В браузере перейдите по ссылке:

```
http://localhost:3000
```
