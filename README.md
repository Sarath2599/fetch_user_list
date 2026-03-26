# User Data Fetch

A Flutter application that fetches and displays a list of users from a REST API, with live search filtering and clean architecture.

---

## Features

- Fetches user data from a configurable REST API endpoint
- Displays users in a scrollable list with name and email
- Live search bar to filter users by name or email
- Loading spinner while fetching data
- Error message displayed on fetch failure

---

## Architecture

The project follows **Clean Architecture** with a clear separation of concerns across three layers:

```
lib/
├── main.dart
└── features/
    └── user_list/
        ├── data/
        │   ├── data_source/       # HTTP calls to the API
        │   ├── models/            # JSON deserialization models
        │   └── repository/        # Repository implementation
        ├── domain/
        │   ├── entity/            # Core data entities
        │   ├── repository/        # Abstract repository contract
        │   └── use_case/          # Business logic
        └── presentation/
            ├── cubit/             # State management (flutter_bloc)
            └── screens/           # UI screens
```

**Data flow:** `DataSource → RepositoryImpl → UseCase → Cubit → Screen`

---

## State Management

Uses **flutter_bloc** (`Cubit`):

| State | Description |
|---|---|
| `UserListInitial` | Default state before any fetch |
| `UserListLoading` | Emitted when `fetchUsers()` is called |
| `UserListLoaded` | Fetch succeeded; holds the full list and optional filtered subset |
| `UserListError` | Fetch failed; holds the error message |

The cubit exposes two methods:
- **`fetchUsers()`** — fetches users from the API
- **`searchUsers(query)`** — filters the loaded list in memory without re-fetching

---

## Tech Stack

| Package | Version | Purpose |
|---|---|---|
| `flutter_bloc` | ^9.1.1 | State management |
| `bloc` | ^9.2.0 | Core BLoC library |
| `http` | ^1.6.0 | HTTP networking |
| `equatable` | ^2.0.8 | Value equality for entities/states |

---

## Getting Started

### Prerequisites

- Flutter SDK `^3.11.3`
- Dart SDK `^3.11.3`

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd user_data_fetch
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app** (pass the base URL via `--dart-define`)
   ```bash
   flutter run --dart-define-from-file=env/app_env.json
   ```

> The base URL is configured in `env/app_env.json` and injected at build time using `String.fromEnvironment("baseUrl")`.

---

## Data Model

Each user returned from the API contains the following fields:

- `id`, `name`, `username`, `email`, `phone`, `website`
- `address` — `street`, `suite`, `city`, `zipcode`, `geo` (`lat`, `lng`)
- `company` — `name`, `catchPhrase`, `bs`
