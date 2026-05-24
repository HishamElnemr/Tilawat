# 🤖 AI Agent Flutter Development Guidelines

Welcome! As an AI agent working on this Flutter project, your primary goal is to maintain clean, scalable, and highly readable code. You must strictly adhere to the following architecture, styling, and structural guidelines.

## 🏗️ 1. Architecture & Folder Structure
This project follows a **Feature-First Clean Architecture** utilizing the **MVVM pattern** for the presentation layer.

### Directory Breakdown
The `lib/` folder is divided into two main sections: `core` and `features`.

- **`lib/core/`**: Contains globally shared resources, configurations, and generic components.
  - `/constants/`: App-wide constants.
  - `/errors/`: Exception and failure models.
  - `/routes/`: App navigation routing configuration.
  - `/services/`: Global services (e.g., API clients, local storage, DI).
  - `/theme/`: Theming and color configurations.
  - `/utils/`: Helper classes, extension methods, and asset managers.
  - `/widgets/`: **CRITICAL:** Any UI widget used in more than one place must be placed here.

- **`lib/features/`**: Contains isolated feature modules. Each feature has its own layered architecture: `data/`, `domain/`, and `presentation/`.

## 🚦 2. Routing & Navigation Rules
When creating a new screen or view, you MUST follow this strict two-step registration process:
1. **Route Name Definition**: Register the unique string identifier or route name constant inside `lib/core/routes/routes_name.dart`.
2. **Route Mapping**: Define the actual route generation, arguments parsing, and page binding inside `lib/core/routes/app_routes.dart`.

*Never hardcode route strings inside views; always reference the constants from `routes_name.dart`.*

## 💉 3. Dependency Injection (DI)
We utilize the `get_it` package for service location and dependency injection.
- All global singletons, factories, repositories, network clients, and Cubits/ViewModels must be registered inside `lib/core/services/getit_services.dart`.
- Whenever you introduce a new data source, repository, or state manager that requires registration, you MUST update `getit_services.dart` immediately to prevent runtime dependency issues.

## 🎨 4. Theming, UI, and Assets
This app supports **Dark and Light modes**. Hardcoded colors/styles are strictly forbidden.

- **Colors & Theming**: Always use context-based theme colors: `Theme.of(context).colorScheme.[colorProperty]`. Color definitions are in `lib/core/theme/app_colors.dart`, and configurations are in `lib/core/theme/app_theme.dart`.
- **Typography**: Always use predefined styles from `lib/core/utils/app_styles.dart`.
- **Images & Assets**: Always reference assets via the `lib/core/utils/app_images.dart` class.

## 🌐 5. Networking & API
- **Retrofit**: All API clients must be generated using the `retrofit` package. Create abstract classes and trigger the build runner to generate `.g.dart` files.

## ♻️ 6. Code Quality & Refactoring Rules
- **Keep it Small**: Files and widgets must be refactored continuously. Split large build methods into smaller private or dedicated widgets.
- **Shared Components**: If a local widget from a feature is needed elsewhere, move it to `lib/core/widgets/`.

## 📝 7. Agent Workflow Execution
1. **Analyze**: Check the folder structure and determine the layers needed.
2. **Register Dependencies & Routes**: Before implementing the UI, declare the route names in `routes_name.dart`, map them in `app_routes.dart`, and set up any required DI factories/singletons in `getit_services.dart`.
3. **Implement**: Write the feature code using `Retrofit`, `Theme.of(context)`, and `app_styles.dart`.
4. **Refactor**: Automatically split large components into readable chunks.