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

Of course, as with any git repository, changes can be made in any code editor by cloning the project and using `git` operations to push changes to GitHub. I haven't included instructions on how to do that here, but feel free to ask if needed.

For those that don't work with `git` often, changes can also be made directly within GitHub. You can navigate to any file, click the "Edit" button, and make changes as necessary, or even copy in entirely new contents. Simply commit the changes to the `main` branch and everything will be updated. However, these edits are limited to one file per commit. This isn't a big deal, but could potentially be annoying.

Perhaps the easiest way to make bulk edits is to use the web-version of VS Code that is built directly into GitHub. From the repository home page, you can simply press the `.` key on your keyboard and an interactive online version of VS Code will appear with the repository opened for you.

From there, you can simply make changes to any files that you need to. As you do so, you will notice that a badge will appear on the "Git" toolbar on the left, indicating that there are files changed that have not been committed.

When you are ready to commit your changes, click on the "Git" toolbar. There you will see a list of the files that you have changed.

Next, simply click the "+" icon to stage all changes. You can also do this individually if desired.

Once the changes have been staged, 
