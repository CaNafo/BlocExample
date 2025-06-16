# Navigate to the Flutter project directory
#cd /path/to/flutter/myproject

# Flutter clean project
flutter clean

# Perform dependency resolution
flutter pub get

#Generate models
dart run build_runner clean
dart run build_runner build --delete-conflicting-outputs

# Build the Flutter app for Android
# flutter run

#flutter build apk

#read -p "Press enter to continue"
# Build the Flutter app for iOS
#flutter build ios --release