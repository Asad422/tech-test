# Tech App — Flutter Test Assignment

Тестовое задание для ORB IT

##  Архитектура
Проект построен на **Clean Architecture** с разделением на слои:
```
lib/
├── core/               # DI, роутер, темы, локализация, ошибки
├── features/
│   ├── auth/           # Авторизация
│   │   ├── data/       # DataSource, Repository реализация
│   │   ├── domain/     # Entities, Repository абстракция,юзкейсы
│   │   └── presentation/ # BLoC, Pages
│   ├── home/           # Главная страница
│   ├── settings/       # Настройки
│   └── main/           # Bottom Navigation
```

## 🛠 Стек
- **Flutter 3** / **Dart 3**
- **BLoC** — стейт менеджмент
- **get_it** — Dependency Injection
- **auto_route** — навигация с guard
- **dartz** — Either для обработки ошибок
- **flutter_secure_storage** — хранение токена
- **google_sign_in** + **Firebase** — авторизация через Google
- **flutter_dotenv** — `GOOGLE_SERVER_CLIENT_ID` из `.env` (шаблон: `.env.example`)
- **shared_preferences** — тема и язык


##  Функционал

### Авторизация
- Вход по email и паролю (мок)
- Вход через Google (реальный)
- Сохранение токена в FlutterSecureStorage
- Валидация форм
- Guard — защита роутов от неавторизованного доступа

### Главная страница
- Информация о пользователе с сервера
- Список бизнесов пользователя

### Настройки
- Смена темы (светлая / тёмная / системная)
- Смена языка (русский / english)
- Выход из аккаунта

- Все данные на моках — `MockDataSource` симулирует ответы сервера через delay
- Для подключения реального API достаточно заменить `MockDataSource` 
  на `RemoteDataSource` в `injection.dart` — остальной код не меняется
- Google Sign In: скопируйте `.env.example` → `.env` и укажите **Web client ID** в `GOOGLE_SERVER_CLIENT_ID`
