# Taival

**Taival** is a shared calendar application built with Flutter Web and Dart. The application is designed to help two people coordinate their everyday schedules in one place.

## Project status

**Version:** 0.1.0 (initial development)

The project is currently in its setup phase.

## Planned features

- Shared calendar for two users
- Personal events for each user
- Work shift scheduling
- Shared events and activities
- Monthly and daily calendar views
- Event creation, editing and deletion
- Real-time synchronization
- Responsive interface for mobile and desktop browsers

## Tech stack

| Technology | Purpose |
|---|---|
| Flutter | Application framework |
| Dart | Programming language |
| Firebase Authentication | Planned user authentication |
| Cloud Firestore | Planned database and synchronization |
| Firebase Hosting | Planned web hosting |
| Git & GitHub | Version control |

## Getting started

## Current Features

Taival is currently in active development.

Implemented functionality:

- Flutter Web application
- Feature-based project architecture
- Material 3 light and dark themes
- System theme preference support
- Responsive mobile and desktop layouts
- Adaptive NavigationBar and NavigationRail
- URL-based routing using go_router
- Calendar, Events and Settings navigation
- Custom error page
- Automated widget tests

Calendar event management, authentication and
cloud synchronization are planned features.

## Navigation

Taival supports the following routes:

| Route | Description |
|---|---|
| `/calendar` | Calendar view |
| `/events` | Events view |
| `/settings` | Settings view |

The application uses path-based URLs and
supports browser navigation.

## Running Locally

```bash
flutter pub get
flutter run -d chrome
```

## Testing

Run static analysis:

```bash
flutter analyze
```

Run automated tests:

```bash
flutter test
```


### Prerequisites

- Flutter SDK
- Dart SDK
- Visual Studio Code
- Chrome or Edge
- Git

### Installation

```bash
git clone https://github.com/USERNAME/taival.git
cd taival
flutter pub get
flutter run -d chrome
```

Replace `USERNAME` with the repository owner's GitHub username.

## Documentation

- [Project Plan](docs/PROJECT_PLAN.md)
- [Architecture](docs/ARCHITECTURE.md)
- [Changelog](CHANGELOG.md)

## Future development

Potential future improvements include Apple Calendar import, event reminders, recurring events and additional calendar views.

## Author

Independent software development and portfolio project.

## License

No open-source license has been selected yet.