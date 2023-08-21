#!/bin/bash

fetch_splash_image() {
  fileName=$(basename "{{ cookiecutter.splash_image_path }}")
  fileExtension=".${fileName##*.}"

  # Removing existing splash image 
  rm -f "assets/images/splash.png"

  mv -f {{ cookiecutter.splash_image_path }} "assets/images/splash$fileExtension"

  # Check if the moved was successful
  if [ $? -eq 0 ]; then
      echo "File moved successfully."
  else
      echo "Error while moving the file."
  fi
}

initialize_git() {
    git init
    git add -A
}

connect_git_repo() {
    git remote add origin {{ cookiecutter.repo_link }}
}

update_project_permissions() {
    cd ..
    chmod -R 777 "{{ cookiecutter.repo_name }}"
    cd "{{ cookiecutter.repo_name }}"
}

attempt_to_launch_studio() {
    if [[ -z ${CI+x} ]]; then
        check_for_launch_flag
    else
        echo "Skipping the launching of Android Studio because we're building on CI..."
    fi
}

check_for_launch_flag() {
    if [[ "{{ cookiecutter.launch_studio }}" = true ]]; then
        launch_studio
    else
        echo "Skipping the launching of Android Studio..."
    fi
}

launch_studio() {
    if [[ "$OSTYPE" == "darwin"* ]]; then
        /Applications/Android\ Studio.app/Contents/MacOS/studio .
        echo "Android Studio should now be running, have fun with your new project!"
    else
        echo "Unsupported operating system: skipping the launching of Android Studio..."
    fi                                                                      
}

check_theme_flag() {
  # Remove theme related file if theme is not enabled
  if [ "{{ cookiecutter.is_theme_enable }}" = False ]; then
     rm -f "lib/values/app_theme.dart"
     rm -f "lib/values/app_theme_store.dart"
  fi
}

check_theme_flag
fetch_splash_image
flutter pub get
flutter pub global activate flutter_gen
flutter pub run flutter_launcher_icons
dart run build_runner build --delete-conflicting-outputs
cd ios/
pod install
cd ..
dart format lib
initialize_git
{ %- if cookiecutter.repo_link != "NA" -% }
connect_git_repo
{ % endif % }
git config core.hooksPath .githooks/
update_project_permissions
attempt_to_launch_studio
