#!/bin/bash

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

flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
cd ios/
pod install
cd ..
flutter format lib
initialize_git
{%- if cookiecutter.repo_link != "NA" -%}
connect_git_repo
{% endif %}
update_project_permissions
attempt_to_launch_studio
