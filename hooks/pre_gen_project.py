import re
import sys

# Check the app name

CRED = '\033[91m'
CGREEN = '\033[92m'
CEND = '\033[0m'

APP_NAME_REGEX = r'[^A-Za-z0-9 ]'

app_name = '{{ cookiecutter.app_name }}'

if re.search(APP_NAME_REGEX, app_name):
    print(CRED + 'ERROR: please avoid using any special characters in your app name!')
    print(CRED + 'Include only alphanumeric characters and spaces.')

    # Exits with status 1 to indicate failure
    sys.exit(1)

# Check the repo name

REPO_NAME_REGEX = r'^\w+$'

repo_name = '{{ cookiecutter.repo_name }}'

if (not re.search(REPO_NAME_REGEX, repo_name)):
    print(CRED + '\nERROR: please avoid using any special characters and space in your repo name!' + CEND)
    print(CRED + 'Include only alphanumeric characters and underscore in repo name.\n' + CEND)

    # Exits with status 1 to indicate failure
    sys.exit(1)

# Check the package name

PACKAGE_REGEX = r'[^A-Za-z0-9.]'

package_name = '{{ cookiecutter.bundle_identifier }}'

if re.search(PACKAGE_REGEX, package_name):
    print(CRED + 'ERROR: %s is not a valid Android package name!'% package_name + CEND )
    print(CRED + 'Avoid using any special characters. Only alphanumeric characters are allowed.' + CEND)

    # Exits with status 1 to indicate failure
    sys.exit(1)

REPO_LINK_REGEX = r'((git@|http(s)?:\/\/)([\w\.@]+)(\/|:))([\w,\-,\_]+)\/([\w,\-,\_]+)(.git){0,1}((\/){0,1})'

repo_link = '{{ cookiecutter.repo_link }}'

if repo_link != 'NA' :
    if (not re.search(REPO_LINK_REGEX, repo_link)):
        print(CRED + '\n ERROR: %s is not a valid repository URL! \n' % repo_link + CEND)

        # Exits with status 1 to indicate failure
        sys.exit(1)

print (CGREEN + 'Proceeding with app name: {}, package name: {}'.format(app_name, package_name) + CEND)
