# Taival – Software Architecture

## 1. Overview

Taival is a shared calendar application developed using Flutter Web and Dart.

The application allows two users to manage their personal schedules, work shifts, and shared events through a common calendar interface.

The architecture aims to support maintainability, scalability, testability, and future development.

## 2. Technology Stack

| Technology | Purpose |
|---|---|
| Flutter Web | User interface framework |
| Dart | Programming language |
| Firebase Authentication | Planned user authentication |
| Cloud Firestore | Planned database and real-time synchronization |
| Firebase Hosting | Planned web application hosting |
| Git | Version control |
| GitHub | Source code repository |
| Visual Studio Code | Development environment |

## 3. Project Structure

The following directory structure represents the planned architecture. Some directories will be created during later development phases.

```text
taival/
├── lib/
│   ├── main.dart
│   ├── app/
│   │   ├── app.dart
│   │   └── theme/
│   ├── core/
│   ├── features/
│   │   ├── calendar/
│   │   ├── events/
│   │   └── auth/
│   └── shared/
├── test/
├── web/
├── assets/
├── docs/
│   ├── PROJECT_PLAN.md
│   └── ARCHITECTURE.md
├── .gitignore
├── analysis_options.yaml
├── pubspec.yaml
├── pubspec.lock
├── README.md
└── CHANGELOG.md
```

## 4. Directory Responsibilities

### lib/main.dart

The application's entry point.

Responsible for initializing the Flutter application and starting the main application widget.

### lib/app/

Contains application-level configuration, including:

- Main application widget
- Application theme
- Navigation and routing
- Global application settings

### lib/core/

Contains shared technical functionality, such as:

- Constants
- Error handling
- Utilities
- Common services

### lib/features/

Contains application features organized into independent modules.

**calendar/**

- Monthly calendar view
- Daily calendar view
- Calendar navigation
- Event visualization

**events/**

- Event data models
- Event creation
- Event editing
- Event deletion
- Event categories

**auth/**

- User authentication
- Login and logout
- User session management

### lib/shared/

Contains reusable user interface components and functionality shared between features.

### test/

Contains automated tests, including unit tests and widget tests.

### web/

Contains Flutter Web platform files, including the application entry HTML and web-specific assets.

### assets/

Contains application-specific assets, such as icons and images.

### docs/

Contains technical documentation, project plans, and architectural decisions.

## 5. Architectural Approach

Taival follows a feature-based project organization.

Each feature is responsible for a specific part of the application. Shared functionality is extracted into reusable components when necessary.

The initial implementation will use local sample data. Backend integration will be introduced in a later development phase.

The architecture will evolve as the application's requirements become clearer.

## 6. Data Management

The initial version uses local sample data.

Future versions will use Cloud Firestore to store and synchronize calendar events between users.

Planned event information includes:

- Event ID
- Calendar ID
- Title
- Description
- Start date and time
- End date and time
- Event category
- Event owner
- Event creator

Four event categories are planned:

1. Work shifts
2. First user's personal events
3. Second user's personal events
4. Shared events

## 7. Authentication and Security

Firebase Authentication is planned for user authentication.

Only authorized calendar members should be able to access calendar data.

Authorization will be enforced using Firestore Security Rules rather than relying solely on client-side checks.

## 8. Testing Strategy

The planned testing strategy includes:

- Unit tests for application logic
- Widget tests for user interface components
- Integration tests for calendar workflows
- Manual testing on Android and iOS browsers

## 9. Future Development

Potential future improvements include:

- Apple Calendar event import
- Recurring events
- Event notifications
- Offline support
- Progressive Web App enhancements
- Native Android and iOS applications

## 10. Architectural Principles

The following principles guide the development of Taival:

- Separation of concerns
- Reusable components
- Readable and maintainable code
- Incremental development
- Testability
- Clear documentation
- Secure data handling

### Application Theme

The application uses Material 3 with centralized theme configuration.

**Files:**
- `lib/app/theme/app_theme.dart` – light and dark themes
- `lib/app/theme/app_colors.dart` – application colors and event category colors

The application supports light and dark themes based on the system's appearance preference.

Calendar event categories use distinct colors to improve visual identification.

Theme configuration is tested using automated unit and widget tests.

### Responsive Application Layout

Taival uses a responsive application shell based on Flutter's `LayoutBuilder`.

The layout adapts according to the available screen width:

- Below 800 logical pixels: Material 3 `NavigationBar`
- At or above 800 logical pixels: Material 3 `NavigationRail`

**Components:**

- `responsive_scaffold.dart` – responsive layout and navigation controls
- `taival_shell.dart` – selected view state and application shell
- `calendar_screen.dart` – calendar-specific user interface

Navigation currently uses placeholder views. Full routing and additional screens will be implemented in future development phases.

Responsive layout behavior is verified with widget tests at different viewport sizes.


## Application Routing

### Overview

Taival uses the go_router package for declarative,
URL-based navigation in Flutter Web.

The routing system supports:

- Direct navigation to application routes
- Browser Back and Forward navigation
- Synchronization between the URL and navigation controls
- Shared layouts across application views
- Custom error handling for unknown routes

### Route Configuration

The routing configuration is centralized in:

`lib/app/router/app_router.dart`

Available routes:

| Path | View |
|---|---|
| `/` | Redirects to `/calendar` |
| `/calendar` | Calendar view |
| `/events` | Events view |
| `/settings` | Settings view |

### Architectural Components

**AppRouter**

Defines the application's routes, redirects,
shared shell and error handling.

**TaivalShell**

Connects the current route to the selected
navigation destination.

The active destination is derived from the
current URL instead of local widget state.

**ResponsiveScaffold**

Provides adaptive navigation components:

- NavigationBar for narrow screens
- NavigationRail for wider screens

**MaterialApp.router**

Integrates the GoRouter configuration with
the Flutter application.

### Navigation Flow

1. The user selects a navigation destination.
2. TaivalShell calls context.go() with the target path.
3. GoRouter resolves the requested route.
4. The corresponding view is displayed.
5. The selected navigation destination is updated.

### URL Strategy

Taival uses Flutter's path URL strategy.

Example:

`/calendar`

instead of:

`/#/calendar`

The URL strategy is configured in `lib/main.dart`
using `usePathUrlStrategy()`.

Production hosting must support SPA fallback
rewrites so that direct navigation to application
routes works correctly.

### Error Handling

Unknown routes display a custom error page.

The error page provides a navigation action
that returns the user to the calendar view.

### Testing

Routing is covered by automated widget tests
in `test/app_routing_test.dart`.

Tests verify:

- Calendar route rendering
- Events route rendering
- Selected navigation destination
- Navigation between routes
- Unknown route handling
- Navigation from the error page

Browser navigation behavior is also verified
through manual testing.

### Future Development

Potential improvements include:

- Authentication-protected routes
- Event detail routes
- Route parameters
- Deep linking to individual events


### Calendar Event Data Model

Calendar events are represented using an immutable
CalendarEvent class.

The model is located in:

`lib/features/events/models/calendar_event.dart`

Event categories are defined separately in:

`lib/features/events/models/event_category.dart`

The model supports:

- Unique event IDs
- Titles and optional descriptions
- Start and end timestamps
- Four event categories
- All-day events
- Time range validation

Event time intervals use an exclusive end boundary.

The model is independent of Flutter UI components.

Monthly and weekly calendar views will share
the same CalendarEvent model.

Model validation is covered by automated unit tests.
