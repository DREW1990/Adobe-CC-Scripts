# Adobe-CC-Scripts

This repository is a collection of bash scripts that are used to manage Adobe Creative Cloud in a macOS environment. These scripts were deployed and executed by JAMF Pro, however most of these scripts should still work by themselves.

## delete_adobe_cc_cache.sh

Deletes all of the cache files in the following Adobe CC directories:
* ~/Library/Caches/Adobe/After\ Effects/
* ~/Library/Application\ Support/Adobe/Common/Media\ Cache\ Files/
* ~/Library/Application\ Support/Adobe/Common/Media\ Cache/

## hide_adobe_cc_apps_tab.sh

Disables the "Apps" tab on the Creative Cloud Desktop app. This prevents updates and installs from the CC desktop app.

More info: [Customize the Creative Cloud Desktop app](https://helpx.adobe.com/enterprise/package/help/customize-creative-cloud-app.html)
