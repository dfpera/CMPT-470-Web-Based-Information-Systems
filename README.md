CMPT470 Final Project
Group 14

After a “vagrant up” the server is available at the following URL:
http://localhost:8080/


There is an account preloaded with data. This account can be accessed with the following credentials:
Username: test
Password: test123


Implemented Features
NOTES AND TAGS
- From the dashboard notes can be added, modified or deleted. During creation a user can specify the title of their note and optionally add text content or tags. NOTE: When adding tags to a newly created note, PRESS ENTER after each tag to add successfully to the form.

- When a note has been created, that note will appear in the left hand column and by default be sorted by last updated.

- If a note has a tag associated with it, then it will not only appear in the left hand column, but also on the right hand of the screen. The right column is organized by tag groups. If a note has a tag then it will be grouped together with all other notes that have that tag.

- Tags can also be created without a note. When doing this a user can decide whether or not they want to pin a tag. A pinned tag can be then be sorted so that only pinned tags appear at the top of the right column.

- Tag Groups can be coloured using a colour picker in the right column. By colouring the tag groups one can organize their notes further allowing them to custom groupings that are easy to distinguish.

SORTING
- Notes can be sorted ascending/descending using the following fields:
    Alphabetically, Last Updated, Created Date, Tagged/Untagged
- Tag groups can also be sorted ascending/descending using the following fields:
    Alphabetically, Last Updated, Created Date, Pinned/Unpinned

ACCOUNTS
- Only Notes/Tags belonging to the account holder is accessible by that account. Attempting to access a note not belonging to one’s account will be denied access to the page.

- Accounts have session expiration, once the time has passed a user will then need to re-login to their account. NOTE: the session expiration is set to 5 minutes for marking purposes, in a real environment 24 hours would be more reasonable for our application.

- Session time extends each time the user interacts with the application. However, after the time is expired the user will be automatically redirected to the login screen.

OTHER
- Mobile, Tablet, and Desktop versions of the site are available. The mobile version is made to show a simplified view as to be mainly used for only adding notes, while the desktop/tablet view are used for organizing and editing notes.

- Operations such as Create/Delete/Pinning/Tagging for Notes/Tags utilizes JavaScript to allow changes to be made without refreshing the entire page.

PRODUCTION ENVIRONMENT
- Server: Unicorn and NGINX

- Database: MySQL, secured using an administrator account

IN PROGRESS
- Database columns and basic CRUD operations were added for use with permalink, to make the notes available for sharing publically, however, we did not get around to finishing this feature, so the code was disabled to not interfere with the production version.
