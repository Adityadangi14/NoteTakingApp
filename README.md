# NoteTakingApp



![image 1](https://user-images.githubusercontent.com/31379541/156937077-7e782ad6-f877-4024-9a9e-4c4126c0fbb9.jpg)
![image 2](https://user-images.githubusercontent.com/31379541/156937118-5a9eef88-a2cd-4873-9b5e-6538b2a881ed.jpg)

![image 3](https://user-images.githubusercontent.com/31379541/156937081-04fddd23-de08-4bd5-b6b8-02e094fa3563.jpg)
![image 4](https://user-images.githubusercontent.com/31379541/156937089-ddbf1b7d-2720-412a-9b65-4e38929e5e18.jpg)

## Features

- Adding notes
- Updating notes
- Deleting all notes at once
- Can save notes into memory
- Gives warning if any form field is empty.
- Shows "Opps! you don't have any notes" screen if user dosen't have any notes saved.

## Plugins

- [Shared Prefrences](https://pub.dev/packages/shared_preferences) to save notes into memory.

## File Structure

```\lib``` has following file structure.
- services
  - ```helper_functions.dart``` contains functions to save notes by calling shared prefrences functions. 
  - ```sharedPrefrencesFunctions.dart``` contains fuctions of sharedPrefrences which will finally save notes into memory.
- views
  - ```editarea.dart``` whare notes will get created .
  - ```helperwidgets.dart``` contains common widgets to build editarea and update_area
  - ```homepage.dart``` where all the notes are shown and can be deleted.
  - ```update_area.dart``` where notes can be modified and updated.

