## Exe : master
Commit and push the file on master. <br>
Use : 
1. git commit -m " " 
2. git push

## Exe : commit-one-file
Stage only one file and then commit the changes.
Use : 
1. git add A.txt
2. git commit -m " "

## Exe : commit-one-staged-file
Remove one file from staging area by using git reset and commit.
Use : 
1. git reset A.txt
2. git commit -m "Commit B.txt file"

## Exe : ignore-them
Create and update .gitignore and then commit it.

## Exe : chase-branch
Use git merge to merge the two branches.
Use : git merge escaped

## Exe : merge conflict
First use git merge, then we would get an error msg as it results in a merge conflict. Update the file so as to accomodate the changes made in the file in the 2 different branches, add and commit.

## Exe : save your work
First use git stash to save the current working dir, then do changes, add and commit. Use git stash pop to do the inverse operation of git stash. Update the ifile, add and commit the changes.

## Exe : change-branch-history
Use git rebase command to apply commits of the hot-bugfix branch in between the commits of current branch.
Use : git rebase hot-bugfix change-branch-history

## Exe : remove ignored
Use git rm ignored.txt to remove the file from staging area and commit the changes.

## Exe : case-sensitive-filename
Change file name using git mv command and then commit.

## Exe : fix-typo
Make typo changes to the file, add to staginf area and then use git commit --amend command which opens text editor, do the req changes and save.

## Exe : forge date
Use git commit --amend --date=1987 to change the date of the commit.

## Exe : fix-old-typo
Check prev commits, use interactive rebase ( git rebase -i ). Change 'pick' to 'edit' and edit the file with the typo. Add the file to staged area, commit and continue the rebase ( git rebase --continue )

