HPDM206Z Git Tutorial

Introduction to Git on command line
===================================

Git is a *distributed* **version control** system [1]

[1] <a href="http://git-scm.com/about">http://git-scm.com/about</a>

Getting Git
-----------

This tutorial assumes you have Git installed, (hopefully >= 1.7.0). It is recommended to work on your OpenStack instance where Git is already installed. 

 

You can also install Git on your own computer by downloading the installer from the Git website. Instructions for doing this will not be given in this workshop and all examples will assume you are working on your OpenStack instance. 


Setup
-----

The first thing to do is setup your git credentials. To start with, setup your identity. This identifies you to other people who download Git projects that you’ve worked on. To set your name and email, type this in the command line: 

    $ git config --global user.name "Your Name"
    $ git config --global user.email your.email@example.com

As a helpful step, if you're run Linux, you may want to set Git to use your favourite editor

    $ git config --global core.editor vim

You may choose any available editor, but the ones we’ve covered in this course are nano and vim, so you may want to change this to one of those (the example command uses vim).

First steps - starting with Git on command line
-----------------------------------------------

First, clone this repository:

    $ git clone https://github.com/rnbeaumont/git-workshop.git

You may want to fork (create your own copy of) the project on github and
clone from your own repo. You can find the fork button at the top right of
the screen on a github repository, or more help about doing that [here](https://help.github.com/articles/fork-a-repo/).

Once you have cloned your repository, you should now see a directory
called `git-workshop`. This is your `working directory`

Now try to run this command:
    $ git add

This will cause an error because we have not navigated into the git repository folder yet:

![image](https://github.com/user-attachments/assets/e040f572-f5ca-437d-a990-cdfed7005552)

Next, move into the git repository folder and list the contents, by using these commands:

    $ cd git-workshop
    $ ls

![image](https://github.com/user-attachments/assets/09d9d9ce-97fb-4ded-b804-277595754665)

To explore further, you can also check to see if there are also hidden files.

    $ ls /a:h

![image](https://github.com/user-attachments/assets/8636fc9d-e724-4daa-b85e-4c280349dad1)

You should also see hidden the `.git` subdirectory. This is
where all your repository’s data and history is kept.

    $ cd .git
    $ ls

You will see :

    branches  config  description  HEAD  hooks  info  objects  refs

Now you can navigate back to the parent folder. 

    $ cd ..

If you no longer wanted to have this cloned repository on your 
local machine, you can simply delete the whole folder. That won't
have any effect on the remote server's copy of the repository.
You could then clone the repository again later on if you wanted to
by using the same method we have just done.

The staging area
----------------

Now, let’s try adding some files into the project. Create a couple of
files.

Let’s create two files named `test.txt` and `file2.txt`.

    $ echo hello > text.txt
    $ echo file contents > file2.txt

To verify that the files have been created, type:

    $ file2.txt

This should open up one of the new text files and show some text inside it.

Let’s use a mail analogy.

In Git, you first add content to the `staging area` by using `git add`.
This is like putting the stuff you want to send into a cardboard box.
You finalize the process and record it into the git index by using
`git commit`. This is like sealing the box - it’s now ready to send.

Let’s add the files to the staging area

    $ git add test.txt file2.txt

Committing
----------

You are now ready to commit. The `-m` flag allows you to enter a message
to go with the commit at the same time.

    $ git commit -m "I am adding two new files"

Let’s see what just happened
----------------------------

We should now have a new commit. To see all the commits so far, use
`git log`

    $ git log

The log should show all commits listed from most recent first to least
recent. You would see various information like the name of the author,
the date it was commited, a commit SHA number, and the message for the
commit.

You should also see your most recent commit, where you added the two new
files in the previous section. However git log does not show the files
involved in each commit. To view more information about a commit, use
`git show`.

    $ git show

You should see something similar to:

    commit 5a1fad96c8584b2c194c229de7e112e4c84e5089
    Author: NeilVaughan
    Date:   Sun Jul 16 13:13:42 2024 +0100

        I am adding two new files

        diff --git a/file2.txt b/file2.txt
        new file mode 100644
        index 0000000..be1d686
        --- /dev/null
        +++ b/file2.txt
        @@ -0,0 +1 @@
        +file contents
        diff --git a/test.txt b/test.txt
        new file mode 100644
        index 0000000..f2aa86d
        --- /dev/null
        +++ b/test.txt
        @@ -0,0 +1 @@
        +hello

![image](https://github.com/user-attachments/assets/b6a832b9-35ab-487b-be9b-79a6f19512bd)


Another feature of git
----------------------

In this section, we are going to add more changes, and try to recover
from mistakes.

We will need to add some content to test.txt.

Open `test.txt` in notepad and add some text and then save and close it.
If using notepad, remember to **save** the file.

Alternatively, use the command below, to add any new text into the file.

    $ echo This is a new line of text in the test file. > test.txt

Now we may want to see what has changed in the file. A very useful command is `git diff`.
This is very useful to see exactly what changes you have done.

    $ git diff

You should see something like the following:

    diff --git a/test.txt b/test.txt
    index f2aa86d..7ca0bdf 100644
    --- a/test.txt
    +++ b/test.txt
    @@ -1 +1 @@
    -hello
    +This is a new line of text in the test file.

![image](https://github.com/user-attachments/assets/591cf27b-0429-4de8-8c31-4c1e1c06f895)


Staging area again
------------------

Now let’s add our modified file, `test.txt` to the staging area. Do you
remember how? Use the git add command shown below.

    $ git add test.txt

Next, check the `status` of `test.txt`. Is it in the staging area now?
Status can be checked using the git status command.

    $ git status

You should see something like this:

C:\Users\nv266\git-workshop>git status
On branch main
Your branch is ahead of 'origin/main' by 1 commit.
  (use "git push" to publish your local commits)

Changes to be committed:
  (use "git restore --staged <file>..." to unstage)
        modified:   test.txt

![image](https://github.com/user-attachments/assets/17c29467-1edd-4482-b778-d6639b36c7b8)


Undoing changes
---------------

Let’s say we changed our mind about putting the new text into `test.txt`. One
advantage of a staging area is to enable us to back out before we
commit - which is a bit harder to back out of. Remembering the mail
analogy - it’s easier to take mail out of the cardboard box before you
seal it than after.

Here’s how to back out of the staging area :

    $ git reset HEAD test.txt

You should see this message:
    Unstaged changes after reset:
    M   test.txt

![image](https://github.com/user-attachments/assets/3127466e-3797-4efb-bcfa-43c0208b24c1)

Compare the `git status` now to the git status from the previous
section. How does it differ?

    $ git status

Now there should be no changes, so it shows this message:

"no changes added to commit (use "git add" and/or "git commit -a")"

Your staging area should now be empty. 

But what’s happened to the new text changes that we added? 
It’s still there. We are now back to the state just
before we added this file to staging area. Going back to the mail
analogy, we just took our letter out of the box.

Open the 'test.txt' file to check the contents:

    $ test.txt

You will see that the new text that was added to the file is still there:

This is a new line of text in the test file. 

Undoing changes part 2
----------------------

Sometimes we did not like what we have done and we wish to go back to
the last *recorded* state. In this case, we wish to go back to the state
just before we added the new text to `test.txt`.

To accomplish this, we use `git checkout`, like so:

    $ git checkout test.txt

You have now un-done your changes. Open the file to verify that the changes have gone.

    $ test.txt

You will see that the test.txt file now has reverted to the original text 'hello'.

Branching
---------

Most large code bases have at least two branches - a ‘live’ branch and a
‘development’ branch. The live branch is code which is OK to be deployed
on to a website, or downloaded by customers. The development branch
allows developers to work on features which might not be bug free. Only
once everyone is happy with the development branch would it be merged
with the live branch.

Creating a branch in Git is easy. The `git branch` command, when used by
itself, will list the branches you currently have

    $ git branch

The `*` should indicate the current branch you are on, which is
`main`.

![image](https://github.com/user-attachments/assets/0e61002f-fcca-4349-86e2-080951a6004b)

If you wish to start another branch, use
`git checkout -b (new-branch-name)` :

    $ git checkout -b exp1

Try git branch again to check which branch you are currently on:

    $ git branch
    * exp1
      main

The new branch is now created. Now let’s work in that branch. To switch
to the new branch:

    $ git checkout exp1

`git checkout (branch-name)` is used to switch branches.

Let’s perform some commits now,

    $ echo 'experimental content' > exp.txt
    $ git add exp.txt
    $ git commit -m "Added experimental txt"

Now, let’s compare them to the main branch. Use `git diff`

    $ git diff main

![image](https://github.com/user-attachments/assets/0f7b48ea-8048-40b1-af0a-78dd7d16f301)

Basically what the above output says is that `exp.txt` is present on
the `exp1` branch, but is absent on the `master` branch.

Disappearing Files between branches
-----------------------------------

Git is good enough to handle your files when you switch between
branches. Switch back to the `master` branch

Try switching back to the main branch (Hint: It’s the same command we
used to switch to the exp1 branch above)

    $ git checkout main

Now, where’s our `exp.txt` file ?

    $ ls
    README.md  text.txt   file2.txt

As you can see the new file 'exp.txt' you created in the other 'exp1' branch has
disappeared. 

Even if you open the folder in windows explorer, the file is still disappeared:

$ start C:\Users\nv266\git-workshop

Not to worry, the exp.txt file is safely tucked away, and will re-appear
when you switch back to that branch.

Now, switch back to the exp1 branch, and check that the `test.txt` is
now present.

    $ git checkout exp1
    $ ls

    README.md  text.txt   file2.txt   exp.txt

Note that if you create a new file in one branch but do not use 
git add and git commit, then the file will be visible from other branches.

Merging
-------

We now try out merging. Eventually you will want to merge two branches
together after the conclusion of work.\
`git merge` allows you to do that.

Git merging works by first switching into the branch you want to
merge *into*, and then running the command to merge the other branch in.

We now want to merge our `exp1` branch into `main`. First, switch to
the `master` branch.

    git checkout main

Next, we merge the `exp1` branch into `main` :

    $ git merge exp1

Do you see something like the following output ?

    Merge made by recursive.
     test.txt |    1 +
     1 files changed, 1 insertions(+), 0 deletions(-)
     create mode 100644 test.txt

If one of the other files in exp1 branch had also been modified
as well, the message may be showing 2 file changes instead of 1.

![image](https://github.com/user-attachments/assets/00e0bb89-2d94-4e48-88b7-c9ad1f83768d)

You have to be in the branch you want merge *into* and then you always
specify the branch you want to merge.

At this point, you can also try out `gitk` to visualize the changes and
how the two branches have merged. This may be available on linux but 
may need to be installed seperately, so you can skip this 'gitk' step.

If you wanted to you could now remove the experimental 'exp1' branch,
but there’s no harm in keeping it. You may need to look back at it in future.


Merge Conflicts
---------------

Git is pretty good at merging automatically, even when the same file is
edited. There are however, some situations where the same line of code
is edited there is no way a computer can figure out how to merge.\
This will trigger a conflict which you will have to fix.

We'll now practise fixing merge conflicts. Recall that conflicts are caused
by merges which affect the same line of code edited in two different ways.
To demonstrate, let's modify code.txt differently in two branches.

Create 2 new branches called b1 and b2. 

    $ git checkout -b b1
    $ git checkout -b b2

We are currently in branch b2, modify the code.txt file.

    $ code.txt

For example, modify the addition line:
Swap "sum = num1 + num2;" for "sum = num2 + num1;"
Close and save the code.txt file.

Next run these two commands to commit the changes to code.txt in the branch b2

    $ git add code.txt
    $ git commit -m "modified the code.txt in b2"

Now we'll do a similar but slightly different change to the same line of 
code in the other branch b1. First swap over into branch b1:

    $ git checkout b1

Now you can modify the code.txt file by modifying the addition line.

    $ code.txt

For example, this time change it differently:
Swap "sum = num1 + num2;" for "sum = num1 + num2 + num2;"
Close and save the code.txt file.

Next run these two commands to commit the changes to code.txt in the branch b2

    $ git add code.txt
    $ git commit -m "modified the code.txt in b1"

![image](https://github.com/user-attachments/assets/faa3db97-21d8-4952-81a1-f0e95041e7eb)

When you use git diff to compare the two versions of code.txt you can see your changes:

    $ git diff b2

![image](https://github.com/user-attachments/assets/702a26d3-3bd9-4b40-b591-67d45523fd23)

Now we will try to merge branch b1 into the current branch b2, which should fail:

    $ git merge b2

Now you will see this merge error. It was not able to automatically merge:
Because the same line of code was modified in two different ways at the same time.

![image](https://github.com/user-attachments/assets/b6997208-d29b-461c-923b-02b2e6229ace)

    Auto-merging code.txt
    CONFLICT (content): Merge conflict in code.txt
    Automatic merge failed; fix conflicts and then commit the result.

Fixing a conflict
-----------------

Now you can open the code.txt to see the conflict that git has found:

    $ code.txt

You should see a `conflict` and somethng like <<<<<<< HEAD in code.txt.
Git has added this into the code.txt file to show which line has a conflict.
You can now choose which version to keep, and delete the other lines from the file.
When you have deleted the line of code you don't want to keep, close and save the code.txt file.

If you open the `code.txt` file, you will see something similar as
below:

    $ code.txt
    // Perform addition
    <<<<<<< HEAD
    sum = num1 + num2+num2;
    =======
    sum = num2 + num1;
    >>>>>>> b2

Git uses pretty much standard conflict resolution markers. The top part
of the block, which is everything between `<<<<<< HEAD` and `======` is
what was in your current b1 branch.\
The bottom half is the version that is present from the b2 branch.
To resolve the conflict, you either choose one side or merge them as you
see fit.

For example, I might decide to choose the version from the b2
branch.

Now, try to **fix the merge conflict**. Pick the text that you think is
better. In this example, you can choose to keep either version.

Once I have done that, I can then mark the conflict as fixed by using
`git add` and `git commit`.

    $ git add code.txt
    $ git commit -m "Fixed conflict"

Congratulations. You have fixed the conflict. All is good in the world.

The End
-------

You have learnt :

1.  Clone a repository
2.  Commit files
3.  Check status
4.  Check diff
5.  Undoing changes
6.  Branching and merging
7.  Fixing conflicts


Now You can choose two tracks, either Part II which covers reverting files 
to previous state by using  git history, or Part III which covers GitHub pull
requests.

Part II
=======

Check out the `revert` branch on this repository for further instructions!
You can always get back to this version of the readme by checking out the master
branch.

Part III
========

GitHub
------
So far we have used Git itself. In this section will look at GitHub, which is
a server for distributed sharing of your projects using Git.

To be able to share, we’ll need a server to host our git repositiories.
GitHub (<a href="https://github.com/">github.com</a>) is probably the
easiest place to begin with.

Login or sign up with GitHub
----------------------------

If you've already got an account you can skip on to creating the repo on
github, or forking this repository and cloning it down to your local machine.

Otherwise...

Go <a href="https://github.com/signup">sign up for an account</a> at
GitHub; Or login into your GitHub account if you had previously signed
up.

Hint: You may need to setup git cache your GitHub password - see
<a href="https://help.github.com/articles/set-up-git">https://help.github.com/articles/set-up-git</a>

Create your first GitHub repository
-----------------------------------

A repository (repo) is a place where you would store your code. You were
practising on your very own repo just now in Part 1!

The following <a href="https://help.github.com/articles/create-a-repo">
tutorial</a> will show you how to create a GitHub repo - which you can
then share with others.

Fork a repo
-----------

Go to [this tutorial](https://help.github.com/articles/fork-a-repo)

Pull Request
------------

Have a look at `pull_request` branch on this repository for further instructions!
You can always get back to this version of the readme by checking out the master branch.

The End
-------

You have learnt:

1.  Forking a repo at GitHub
2.  Git push
3.  Git pull

### References and Further reading

Here are some recommended  resources to continue Git practice:

-   <a href="http://try.github.com">http://try.github.com</a> Another
    beginners tutorial for git
-   <a href="http://git-scm.com">http://git-scm.com</a> Official
    website, with very useful help, book and videos
-   <a href="http://gitref.org">http://gitref.org</a>
-   <a href="http://www.kernel.org/pub/software/scm/git/docs/everyday.html">http://www.kernel.org/pub/software/scm/git/docs/everyday.html</a>


