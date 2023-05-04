# gallium_flutter

A new Flutter project.

## Task list

* 1. Add empty screen when there are no files in directory with supported file extensions and tutorial  
* 2. Last task index

## Assumptions

* quality is utmost concern
* disk space is not limited
* formats jpg. and .png are supported
* app can be browsed when services are running

### Base directory

* is supplied by end user
* base directory is source of truth and is read only
* base directory can contain unlimited duplicates

### Processed files

* are created by an app
* are stored in **processed** folder
* does not contain duplicates
* correspond 1 to 1 with base directory files

### Person profiles

* are created by end user
* profiles are stored in **profiles** folder as folders named with **Name.LastName** pattern
* contain profile avatar image with strict purpose
* contain face cutouts
* contain txt file with profile metadata (like. isHidden, ) not related to AI face recognition
* face cutout is used for training AI
* Can be disconnected from original files, if source file is lost the face is still valid learning material

### Hashes

* are created by an app
* are stored in db
* are identified by source file name with extension only
* correspond 1 to 1 to source file
* dangling hashes are deleted on detection

### When the app starts

* it creates hash for every concrete photo in base directory or reuses the old ones
* compares files by hashes for similarity,
  * ones above 90% are resolved automatically in favor of the [older one],
  * ones with similarity of over 98% are resolved by end user
  * results are stored in **processed** folder

## CMDs

flutter packages pub run build_runner build --delete-conflicting-outputs
