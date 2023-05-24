# OARE SQL

This repository stores the various SQL triggers, stored procedures, and functions for the Old Assyrian Research Environment project at BYU. This repository should be considered the "source-of-truth" for these various SQL operations for the project. As such, all additions, updates, or deletions of triggers, stored procedures, and functions should be made here. Changes made here will automatically propogate to the live production MySQL database without any intervention.

A basic guide for use can be found below.

## Root Directory Structure

At the root of this repository, you can find three main things:

1. **Configuration Files**: These files exist to support Node.js, TypeScript, and GitHub actions. Changes will hardly ever need to be made here.
2. **`src` Folder**: This folder contains TypeScript files used to connect to the database and perform update operations. They will also hardly need to be changed.
3. **`sql` Folder**: This folder contains all of the `.sql` files that make up the various triggers, stored procedures, and functions used in the project. The overwhelming majority of changes made will be made here.

The `sql` directory is split into three folders that correspond to the three different types of SQL operations stored here: `triggers`, `stored_procedures`, and `functions`. Furthermore, the `triggers` directory is split into six folders that correspond to the six different types of triggers: `before_insert`, `after_insert`, `before_update`, `after_update`, `before_delete`, and `after_delete`.

When adding new files, editing existing ones, or deleting files, make sure to do so in the correct directory as the file structure is used to determine how to update the operations on production.

## Making Changes

#### Via Command Line

Of course, as with any git repository, changes can be made in any code editor by cloning the project and using `git` operations to push changes to GitHub. I haven't included instructions on how to do that here, but feel free to ask if needed.

#### Via GitHub

For those that don't work with `git` often, changes can also be made directly within GitHub. You can navigate to any file, click the "Edit" button, and make changes as necessary, or even copy in entirely new contents. Simply commit the changes to the `main` branch and everything will be updated. However, these edits are limited to one file per commit. This isn't a big deal, but could potentially be annoying.

#### Via VS Code Online

Perhaps the easiest way to make bulk edits is to use the web-version of VS Code that is built directly into GitHub. From the repository home page, you can simply press the `.` key on your keyboard and an interactive online version of VS Code will appear with the repository opened for you.

From there, you can simply make changes to any files that you need to. As you do so, you will notice that a badge will appear on the "Git" toolbar on the left, indicating that there are files changed that have not been committed.

When you are ready to commit your changes, click on the "Git" toolbar. There you will see a list of the files that you have changed.

Next, simply click the "+" icon to stage all changes. You can also do this individually if desired.

Once the changes have been staged, simply type a commit message into the box at the top of the "Git" toolbar. This can be anything, but should generally be a brief description of any changes you made.

Finally, press the "Commit & Push" button. This will commit your changes and "push" them to GitHub. The badge on the toolbar will disappear, indicating that there are no uncommitted changes.

## Deploying to Production

Changes made to this repository are automatically deployed to the production MySQL database. However, only changes made to the `main` branch are automatically deployed. Generally speaking, you won't need to use other branches, so this won't be a problem. However, if you do use branches in the future, remember to merge the branch into `main` in order for the changes to be deployed.

As noted above, make sure that all changes are made in the correct folders as this is used to determine how to best deploy changes to production.

Deployment usually takes less than one minute. If desired, you can watch the progress of the updates by clicking on the "Actions" tab on GitHub and selecting the currently running actions. When all steps have completed, you can know that the changes were pushed to production successfully.

**NOTE: ** This repository should be considered the "source-of-truth" for all changes. Any changes made elsewhere will not automatically appear here and will be overwritten by this repo once changes are made here. As such, be sure to make all changes here.
