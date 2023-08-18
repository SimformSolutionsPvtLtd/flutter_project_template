# Flutter Project Template

[![Flutter Version](https://img.shields.io/badge/Flutter-v3.10.6-blue)](https://flutter.dev)
[![Dart Version](https://img.shields.io/badge/Dart-v3.0.6-blue)](https://dart.dev)
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
    * ADD PYTHON TO ENVIRONMENT PATH
* Cookie Cutter
    * ```pip install --user cookiecutter```

### Software and Tools

* **iOS**: [XCode(11.3)](https://apps.apple.com/us/app/xcode/id497799835?mt=12), iOS 13.0+

* **[CocoaPods](http://cocoapods.org/)**: CocoaPods is a dependency manager for Swift and
  Objective-C Cocoa projects. It has over 66 thousand libraries and is used in over 3 million apps.
  CocoaPods can help you scale your projects elegantly.

* **Android**: Android Studio(4.0.1),

* **Editor**: [Android Studio](https://developer.android.com/studio), [IntelliJ](https://www.jetbrains.com/idea/download/), [Visual Studio Code](https://code.visualstudio.com/)

## Usage

* Open terminal at your desired location
* Run ```cookiecutter https://github.com/SimformSolutionsPvtLtd/flutter_project_template``` to
  create template

> NOTE: If it asks "You have .../.cookiecutters/flutter_project_template downloaded before. Is it
> okay to delete and re-download it?" then type "yes".

## Required inputs

| Input name                         | Description                                                            | Default                  |
|------------------------------------|------------------------------------------------------------------------|--------------------------|
| app_name                           | Application name                                                       | App Name                 |
| repo_name                          | Root Folder name                                                       | repository_name          |
| bundle_identifier                  | Bundle ID of project                                                   | com.simformsolutions.app |
| include_portraitUp_orientation     | Include app support for portrait up orientation or not                 | y                        |
| include_landscapeLeft_orientation  | Include app support for landscape left orientation or not              | y                        |
| include_portraitDown_orientation   | Include app support for portrait down orientation or not               | y                        |
| include_landscapeRight_orientation | Include app support for landscape right orientation or not             | y                        |
| minimum_android_sdk_version        | Minimum android SDK support                                            | 21                       |
| minimum_iOS_sdk_version            | Minimum iOS SDK support                                                | 11                       |
| target_ios_device                  | ios device support                                                     | iPhone/iPod touch        |
| sentry_dsn_key                     | Sentry DSN key for crash reporting                                     | Sentry DSN               |
| repo_link                          | Repository link to connect project with remote                         | NA                       |
| launch_studio                      | Open Android Studio after project is created. **Works only for MacOS** | y                        |
| launch_studio                      | Open Android Studio after project is created. **Works only for MacOS** | y                        |

## Dependencies used in the project with their usage

1. [**provider**](https://pub.dev/packages/provider): A mixture between dependency injection (DI)
   and state management, built with widgets for widgets.
2. [**logging**](https://pub.dev/packages/logging): Provides APIs for debugging and error logging,
   similar to loggers in other languages, such as the Closure JS Logger and
   java.util.logging.Logger.
3. [**intl**](https://pub.dev/packages/intl): Used for localization and other date-time utils.
4. [**connectivity_plus**](https://pub.dev/packages/connectivity_plus): Flutter plugin for
   discovering the state of the network (WiFi & mobile/cellular) connectivity.
5. [**shared_preferences**](https://pub.dev/packages/shared_preferences): Flutter plugin for reading
   and writing simple key-value pairs. Wraps NSUserDefaults on iOS and SharedPreferences on Android.
6. [**json_annotation**](https://pub.dev/packages/json_annotation): Classes and helper functions
   that support JSON code generation via the `json_serializable` package.
7. [**flutter_svg**](https://pub.dev/packages/flutter_svg): Draw SVG (and some Android
   VectorDrawable (XML)) files on a Flutter Widget.
8. [**sentry_flutter**](https://pub.dev/packages/sentry_flutter): Sentry SDK for Flutter. This
   package aims to support different Flutter targets by relying on the many platforms supported by
   Sentry with native SDKs.
9. [**retrofit**](https://pub.dev/packages/retrofit): A composable, cross-platform, Future-based API
   for making HTTP requests.
10. [**mobx**](https://pub.dev/packages/mobx): MobX is a state management library that makes it
    simple to connect the reactive data of your application with the UI.
11. [**flutter_mobx**](https://pub.dev/packages/flutter_mobx): Provides the **Observer** widget that
    listens to observables and automatically rebuilds on changes.
12. [**flutter_secure_storage**](https://pub.dev/packages/flutter_secure_storage): Flutter Secure
    Storage provides API to store data in secure storage.
13. [**dio**](https://pub.dev/packages/dio): A powerful HTTP networking package, supports
    Interceptors, Aborting and canceling a request, Custom adapters, Transformers, etc.
14. [**json_serializable**](https://pub.dev/packages/json_serializable): Automatically generate code
    for converting to and from JSON by annotating Dart classes.
15. [**flutter_gen**](https://pub.dev/packages/flutter_gen): Used to reference the assets safely
    anywhere in the flutter app.
16. [**very_good_analysis**](https://pub.dev/packages/very_good_analysis): Linter rules
    corresponding to the guidelines in very good analysis.

## Architecture used

- [**MobX**](https://mobx.pub/) to manage the state of the widget with [**Provider**](https://pub.dev/packages/provider) to inject the dependencies of MobX stores to widgets.

## Git Hooks Configuration

* Open **set-githooks.bash** file and Run it as highlighted in screenshot.

![Screenshot](https://raw.githubusercontent.com/SimformSolutionsPvtLtd/flutter_project_template/develop/preview/githooks_preview.png)

## Using intl for localization

* Install flutter_intl plugin from android studio plugin market-place.
* Run `flutter pub global activate intl_utils` command (required only once).
* Hover over any string and click on the light-bulb. Then click on the extract to arb file.
* Generated string can be used with `Str.of(context).stringName` or `Str.current.stringName`
* Locate and add `.arb` file to git

> Tip: To generate none-generated strings, press enter at the end of the .arb file and save, it wil
> generate all strings.

## Permissions

##### Automatically granted

* `INTERNET`: Requires for accessing the internet.
* `Camera`: Requires to access and take a picture from the device's camera.
* `Photo lib`: Requires to access a picture from the device's photo lib.

##### Requested when needed

* `Storage`: Requires for reading files from the storage.
* `Location`: Requires to access the user's location to connect them with location admin for
  arranging a seminar.

### Flavors

#### Android

There will be three different `product flavors` available for running the project either
in `development`, `uat`, or in `production` environment.

1. **Development** - Set the active Build Variant as `"dev"` to run the project in the Development
   environment.
2. **UAT** - Set the active Build Variant as `"uat"` to run the project in the UAT environment.
3. **Production** - Set the active Build Variant as `"prod"` to run the project in the Production
   environment.

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

We are using [App Center](https://docs.microsoft.com/en-us/appcenter/) for downloading the app for
beta testing.

To checkout the beta versions of the application using App Center, you’ll need to receive an
invitation email from the developer or get access to a public invitation link, and have a device
that you can use to test.

#### iOS

We are using [TestFlight](https://developer.apple.com/testflight/) to download the app for beta
testing.

To test beta versions of apps using TestFlight, you’ll need to receive an invitation email from the
developer or get access to a public invitation link, and have a device that you can use to test.

**Internal testers** Members of the developer’s team in App Store Connect can participate as
internal testers and will have access to all builds of the app.

**External testers** Anyone can participate as an external tester and will have access to builds
that the developer makes available to them. A developer can invite you to test with an invitation
email or a public invitation link. An Apple ID is not required. If you are part of the developer’s
team in App Store Connect, you can be added as an external tester if you aren’t already an internal
tester.

**Installing a Beta iOS App from an Invitation Email or Public Link**

1. Install [TestFlight](https://apps.apple.com/us/app/testflight/id899247664/) on the iOS device
   that you’ll use for testing.
2. Open your invitation email or tap on the public link on your iOS device.
3. Tap View in TestFlight or Start Testing; or tap Accept, Install, or Update for the app you want
   to test.

## Important credentials

- **Bitrise**: developer@simformsolutions.com
- **Sentry**: developer@simform.com
