# 🧱 BlocExample

A minimal Flutter project demonstrating the use of the **BLoC (Business Logic Component)** pattern for state management. Ideal for developers exploring clean architecture and reactive state handling in Flutter.

## 🚀 Getting Started

To run this project locally:

```bash
git clone https://github.com/CaNafo/BlocExample.git
cd BlocExample
flutter pub get
flutter run
```

# 📦 Project Structure

```
lib/
├── core/           # Core utilities, constants, and shared logic
├── data/           # Data sources, repositories, and API clients
├── models/         # Domain models and data classes
├── screens/        # UI screens with Bloc integration
├── utils/          # Helper functions and extensions
├── app.dart        # Root widget and app-level configuration
├── main.dart       # Entry point with dependency setup
└── routes.dart     # Centralized route definitions
```

# 🔧 Features
- Modular architecture for clean separation of layers
- BLoC pattern for reactive state management
- Centralized routing via routes.dart
- Scalable folder structure for future features
- Easy integration of new screens and blocs

# 📚 Resources
- BLoC Library Docs [https://bloclibrary.dev/#/]
- Flutter Architecture Guidelines [https://docs.flutter.dev/data-and-backend/state-mgmt/simple]
