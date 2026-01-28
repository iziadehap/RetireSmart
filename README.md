# RetireSmart 🚀

A premium financial planning and investment tracking application built with Flutter. **RetireSmart** empowers users to visualize their future wealth, calculate retirement needs, and monitor live assets like gold with a state-of-the-art interactive experience.

## ✨ Key Features

- **Retirement Wizard**: A smart, multi-step planning tool that calculates monthly savings targets based on inflation, current age, and desired lifestyle.
- **Dynamic Projections**: Interactive charts showing inflation impact and investment growth over time.
- **Gold Price Tracker**: Real-time tracking of gold prices for various karats (24k, 21k, 18k) with detailed buy/sell insights.
- **Asset Allocation**: Personalized investment distributions including Stocks, Gold, and Certificates.
- **Risk Assessment**: Integrated risk quiz to tailor investment strategies to user profiles.
- **Reactive Theming**: A beautiful, unified design system supporting both **Light** and **Dark** modes with seamless switching.
- **Bi-directional Support**: Full localization for **English** and **Arabic**, including RTL support.

## 🛠 Tech Stack

- **Framework**: [Flutter](https://flutter.dev)
- **State Management**: [GetX](https://pub.dev/packages/get)
- **Caching & Storage**: Hive
- **Localization**: Flutter Intl (ARB)
- **Architecture**: Clean Architecture (Data, Domain, Presentation layers)
- **Theming**: Custom `ThemeExtension` for semantic reactive colors

## 🏗 Architecture Overview

The project follows a modular Clean Architecture pattern to ensure scalability and maintainability:

- **`lib/core`**: Shared services (Caching, API), custom painters, and the global `AppThemeColors` system.
- **`lib/RetireSmart`**: The core retirement calculator module featuring wizard logic and result visualizations.
- **`lib/GoldPrice`**: Live asset tracking and karat-specific display components.
- **`lib/Onboarding` & `Splash`**: High-fidelity entry flows with custom animations and glows.
- **`lib/l10n`**: Centralized localization files.

## 🎨 Design System

RetireSmart uses a custom reactive theme system extending Flutter's `ThemeExtension`.

### Key Colors:

- **Accent Cyan**: Used for primary calls to action and progress indicators.
- **Primary Gold**: Dedicated to asset highlights and premium cards.
- **Surface & Cards**: Optimized with theme-aware shadows and gradients to ensure a premium feel across all brightness levels.

## 🚀 Getting Started

1. **Prerequisites**: Ensure you have Flutter installed.
2. **Environment**: Create a `.env` file in the root directory (refer to `.env.example`).
3. **Dependencies**:
   ```bash
   flutter pub get
   ```
4. **Run**:
   ```bash
   flutter run
   ```

---

_Built with ❤️ for Future Wealth Planning._
