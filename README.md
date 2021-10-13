
# Flutter Project Template

[![Flutter Version](https://img.shields.io/badge/Flutter-V1.22.2-blue)](https://flutter.dev)
[![Dart Version](https://img.shields.io/badge/Dart-v2.10.2-blue)](https://dart.dev)
[![API](https://img.shields.io/badge/API-28%2B-brightgreen.svg?style=flat)](https://android-arsenal.com/api?level=29)
[![Codacy Badge](https://api.codacy.com/project/badge/Grade/a1c9a1b1d1ce4ca7a201ab93492bf6e0)](https://www.codacy.com/app/LDRAlighieri/Corbind?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=LDRAlighieri/Corbind&amp;utm_campaign=Badge_Grade)

## Prerequisites

### MacOS

* MacOS 10.14 or higher to use Homebrew
* XCode command line tools (Required for Homebrew)
    * ```xcode-select --install```
* Homebrew
    * ```/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"```
* Python3
     * ```brew install python3```
* Cookie Cutter
    * ```brew install cookiecutter```

### Linux

* Python3
    * ```sudo apt-get update && sudo apt-get install python3.6```
* Cookie Cutter
    * ```sudo apt-get install cookiecutter```

### Windows

* Python3
    * [Download](https://www.python.org/downloads/)
    * ADD PYTHON TO ENVIORNMENT PATH
* Cookie Cutter
    * ```pip install --user cookiecutter```

### Software and Tools

* **iOS**: [XCode(11.3)](https://apps.apple.com/us/app/xcode/id497799835?mt=12), iOS 13.0+

* **[CocoaPods](http://cocoapods.org/)**: CocoaPods is a dependency manager for Swift and Objective-C Cocoa projects. It has over 66 thousand libraries and is used in over 3 million apps. CocoaPods can help you scale your projects elegantly.

* **Android**: Android Studio(4.0.1),

* **Editor**: [Android Studio](https://developer.android.com/studio), [IntelliJ](https://www.jetbrains.com/idea/download/), [Visual Studio Code](https://code.visualstudio.com/)


## Usage
* Open terminal at your desired location
* Run ```cookiecutter https://github.com/SimformSolutionsPvtLtd/flutter_project_template``` to create template
        * If it asks for "You have .../.cookiecutters/Android_Project_Setup downloaded before. Is it okay to delete and re-download it?" press "yes"

## Required inputs

Input name | Description | Default
--- | --- | --- |
app_name | Application name | App Name
repo_name | Root Folder name | Repository Name
bundle_identifier | Bundle ID of project | com.simformsolutions.app
include_portraitUp_orientation | Include app support for portrait up orientation or not | 1 (y)
include_landscapeLeft_orientation | Include app support for landscape left orientation or not | 1 (y)
include_portraitDown_orientation | Include app support for portrait down orientation or not | 1 (y)
include_landscapeRight_orientation | Include app support for landscape right orientation or not | 1 (y)
minimum_android_sdk_version | Minimum android SDK support | 21
minimum_iOS_sdk_version | Minimum iOS SDK support | 11
target_ios_device | ios device support | iPhone/iPod touch
sentry_dsn_key | Sentry DSN key for crash reporting | Sentry DSN
repo_link | Repository link to connect project with remote | NA
launch_studio | Open Android Studio after project is created. <b>Works only for MacOS</b> | 1 (false)
flutter_sdk_path | Flutter SDK path without spaces before and after <br />(ex-: Directory1/Directory2/flutter) | NA


## Dependencies used in the project with their usage

1. [**retrofit**](https://pub.dev/packages/retrofit): A composable, cross-platform, Future-based API for making HTTP requests.
2. [**mobx**](https://pub.dev/packages/mobx): MobX is a state management library that makes it simple to connect the reactive data of your application with the UI.
3. [**flutter_mobx**](https://pub.dev/packages/flutter_mobx): Provides the **Observer** widget that listens to observables and automatically rebuilds on changes.
4. [**provider**](https://pub.dev/packages/provider): A mixture between dependency injection (DI) and state management, built with widgets for widgets.
5. [**logger**](https://pub.dev/packages/logger): Small, easy to use, and extensible logger which prints beautiful logs.
6. [**flutter_svg**](https://pub.dev/packages/flutter_svg): Draw SVG (and some Android VectorDrawable (XML)) files on a Flutter Widget.
7. [**spider**](https://pub.dev/packages/spider): Used to reference the assets safely anywhere in the flutter app.
8. [**effective_dart**](https://pub.dev/packages/effective_dart): Linter rules corresponding to the guidelines in Effective Dart.


## Architecture used

- [**MobX**](https://mobx.pub/) to manage the state of the widget with [**Provider**](https://pub.dev/packages/provider) to inject the dependencies of MobX stores to widgets.

## Permissions

##### Automatically granted
* `INTERNET`: Requires for accessing the internet.
* `Camera`: Requires to access and take a picture from the device's camera.
* `Photo lib`: Requires to access a picture from the device's photo lib.

##### Requested when needed
* `Storage`: Requires for reading files from the storage.
* `Location`: Requires to access the user's location to connect them with location admin for arranging a seminar.

### Flavors

#### Android


There will be three different `product flavors` available for running the project either in `development`, `uat`, or in `production` environment.

1. **Development** - Set the active Build Variant as `"dev"` to run the project in the Development environment.
2. **UAT** - Set the active Build Variant as `"uat"` to run the project in the UAT environment.
3. **Production** - Set the active Build Variant as `"prod"` to run the project in the Production environment.

```
productFlavors {
dev {
...
}
uat {
...
}
prod {
...
}
}
```

## Beta Testing

#### Android
We are using [App Center](https://docs.microsoft.com/en-us/appcenter/) for downloading the app for beta testing.

To checkout the beta versions of the application using App Center, you’ll need to receive an invitation email from the developer or get access to a public invitation link, and have a device that you can use to test.

#### iOS

We are using [TestFlight](https://developer.apple.com/testflight/) to download the app for beta testing.

To test beta versions of apps using TestFlight, you’ll need to receive an invitation email from the developer or get access to a public invitation link, and have a device that you can use to test.

**Internal testers** Members of the developer’s team in App Store Connect can participate as internal testers and will have access to all builds of the app.

**External testers** Anyone can participate as an external tester and will have access to builds that the developer makes available to them. A developer can invite you to test with an invitation email or a public invitation link. An Apple ID is not required. If you are part of the developer’s team in App Store Connect, you can be added as an external tester if you aren’t already an internal tester.

**Installing a Beta iOS App from an Invitation Email or Public Link**

1. Install [TestFlight]() on the iOS device that you’ll use for testing.
2. Open your invitation email or tap on the public link on your iOS device.
3. Tap View in TestFlight or Start Testing; or tap Accept, Install, or Update for the app you want to test.

## Important credentials

- **Bitrise**: developer@simformsolutions.com
- **Sentry**: developer@simform.com
