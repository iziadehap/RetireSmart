# Firebase Integration Guide for RetireSmart

Setting up Firebase requires access to the Google Firebase Console. Follow these steps to complete the integration.

## 1. Create a Firebase Project

1. Go to the [Firebase Console](https://console.firebase.google.com/).
2. Click **Add project** and name it `RetireSmart`.

## 2. Register Android App

1. Click the **Android** icon in the project overview.
2. Package name: `com.axon.retiresmart`
3. Download `google-services.json`.
4. Place it in `android/app/` directory of this project.

## 3. Register iOS App

1. Click **Add app** and select **iOS**.
2. Bundle ID: `com.axon.retiresmart`
3. Download `GoogleService-Info.plist`.
4. Place it in `ios/Runner/` directory.

## 4. Dependencies Already Added

The following dependencies have been prepared in `pubspec.yaml`:

- `firebase_core`
- `firebase_analytics`
- `firebase_crashlytics`

## 5. Final Initialization

Once you've added the configuration files, I can help you initialize Firebase in `main.dart`.
