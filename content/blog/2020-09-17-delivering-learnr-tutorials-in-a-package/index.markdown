---
title: How to deliver learnr tutorials in a package
author: Desirée De Leon
date: '2020-09-28'
slug: delivering-learnr-tutorials-in-a-package
categories:
  - package
  - teach
tags:
  - rmarkdown
  - teach
  - learnr
description: |
  A step by step guide to create a package for a learnr tutorial.
photo:
  url: https://unsplash.com/photos/sxNt9g77PE0
  author: Erda Estremera
---




Packages are not just for functions and data -- you can create a package to deliver interactive tutorials to an audience, too.

If you want to share your [learnr tutorial](https://rstudio.github.io/learnr/) with a large group of users (e.g. large courses where many students will likely run the same tutorials simultaneously), putting your tutorial inside of a package may actually be one of the best ways to get your content to your audience. Why? Because after the package has been installed, users can run your tutorial *locally*-- which means that *you* don't have to worry about potential bandwidth limits and issues that might otherwise arise when learnr tutorials are hosted on external servers.

Putting your learnr tutorial in a package is also free-- and always will be, which means you can also sidestep costs associated with hosting services! Your package doesn't have to be on CRAN, and it doesn't have to contain functions or data (but it can if you want).

Never made a package before? No sweat! In this post, we'll guide you through the process.



## tl;dr

Here's how you put an interactive learnr tutorial in a package:

1. In a GitHub-connected RStudio project, run `usethis::create_package("<path_to_folder/name_of_package>")` to make a basic package.

1. Run `usethis::use_tutorial("<name-of-learnr-file>", "<Title You'd Like the User to See>")` to create the learnr tutorial. Customize with your content. Repeat for additional tutorials.

1. Go to *Build* > *Install and Restart*.

1. Optionally, run `usethis::use_dev_package("gradethis")` to add package dependencies for in-development packages, like gradethis.

1. Optionally, run `usethis::use_package("palmerpenguins")` to add package dependencies for packages that are on CRAN, like palmerpenguins.

1. Optionally, edit the `DESCRIPTION` file.

1. Run `usethis::use_readme_rmd()` to add a README. Knit when you're done.

1. Push to GitHub and have folks install with `devtools::install_github("<your-repo>/<package-name>")`

1. Go to *Tutorial pane* of IDE to run the tutorial.

1. Repeat steps 2, 3, and 7 anytime you update your tutorial package.  


<div class="figure" style="text-align: center">
<img src="pkg-illo.jpg" alt="Creating a tutorial package in a nutshell" width="100%" />
<p class="caption">Figure 1: Creating a tutorial package in a nutshell</p>
</div>

## How to make a package for a learnr tutorial


We will walk through the steps for creating the bare-minimum package that you can use to house and deliver your interactive learnr tutorials to your users. This post is not meant to be a comprehensive guide for creating a package nor a guide for creating a tutorial package that is CRAN-ready. However, it *is* meant to get you up and running with a working tutorial package in a fuss-free way, so that you can share your package *now* and fine tune *later*.

Our final goal is to create a package that is "downloadable" by users. The most straightforward way to do this is to host the package in a GitHub repository; however, it is also possible to achieve the same outcome using other hosting services like GitLab or by distributing the package source code via other means. One caveat is that if students wanted to, they’d be able to find the source code and solutions in your repository (or, with some spelunking, in the folder that houses all their R packages locally). But this would take some extra effort on the part of students.

If a solution like this works for your purposes, then read onwards!


### Pre-requisites

We assume the following:

* You have a GitHub account and are comfortable [using GitHub from within RStudio](https://happygitwithr.com) (but you don't need to be more than a GitHub novice)
* You are comfortable with the basics of using R and RStudio
* You understand how R projects work
* You are already familiar with creating learnr tutorials


Now let's get set up all to create a learnr tutorial package!


### Packages

Make sure you've installed and loaded the following packages:


```r
#install.packages(c("devtools", "roxygen2", "learnr"))
library(devtools)
library(usethis)
library(roxygen2)
library(learnr)
```


### Create a GitHub repository

If you're already familiar with the ins and outs of connecting an R Project to a GitHub repository, you can skip this section.

There are two workflows to choose from for getting started:

#### Workflow 1 

We recommend following the tips on [Happy Git with R](https://happygitwithr.com/new-github-first.html#make-a-repo-on-github-2) and starting in GitHub before switching to RStudio.

1. [**Create a new repository on GitHub**](https://happygitwithr.com/new-github-first.html#make-a-repo-on-github-2) for your work.

    * The repository name you choose will also end up being the name of your package, so choose wisely! For the examples in this guide, we'll go with "tutorialpackage".

1. **Copy the repository URL** to your clipboard.

    * Do this by clicking the green Clone or Download button.
    * Copy the HTTPS URL (looks like: `https://github.com/{yourname}/{yourrepo}.git`).

1. **Open RStudio** and [create a new RStudio Project via git clone](https://happygitwithr.com/new-github-first.html#new-rstudio-project-via-git-clone).

    * Do this by clicking File > New Project > Version Control > Git.

    * Paste the copied URL.

    * Be intentional about where you tell RStudio to create this new Project.

1. **Click Create Project.**

    * Your R Project is now connected to GitHub!


#### Workflow 2

It is possible to first make a package project in RStudio and then connect it to GitHub afterwards. This workflow requires that you have a [Git Personal Access Token (PAT)](https://usethis.r-lib.org/articles/articles/usethis-setup.html) established:

1. Click *File* > *New Project* > *New Directory*
1. Scroll down and select *R Package*
1. Select a package name and click *Create Project*
1. Then run:
    
    ```r
    usethis::use_git()
    usethis::use_github() # you have to have a PAT setup
    ```

The files and directories necessary for a package are now in place, and you've connected your project with GitHub. You can skip the next section of this post and go directly to "Add files and directories for a tutorial".


### Add files and directories for a package

Now we'll create the infrastructure to turn this R project into a *package*. A handful of new files need to be created, but luckily we can outsource this heavy lifting to the `create_package()` function from the [usethis](https://usethis.r-lib.org/) package.

<div class="figure" style="text-align: center">
<a href="https://www.allisonhorst.com/" target="_blank"><img src="usethis.png" alt="Illustration by Allison Horst" width="65%" /></a>
<p class="caption">Figure 2: Illustration by Allison Horst</p>
</div>

1.  **Create the necessary package infrastructure** when you run the following code to make a basic package in your current working directory:

    
    ```r
    usethis::create_package("<path_to_folder/name_of_package>")
    ```
    
    * Not sure what your current working directory is? You can always run `getwd()` to check. 
    
2. The console output will ask if you’d like to overwrite the pre-existing R project. __Select *No*__.

    <img src="pkg-overwrite.png" width="50%" style="display: block; margin: auto;" />

3. A second session of RStudio will open – this session has a *Build* tab in the pane which also has the tabs Environment, History, etc. This tab is specific for building packages, and we will use it later. **You can close the first RStudio instance**.

    <img src="pkg-build.png" width="50%" style="display: block; margin: auto;" />

    * Your project directory should end up looking something like this:

    <img src="pkg-directory.png" width="50%" style="display: block; margin: auto;" />



### Add files and directories for a tutorial

Now that the package structure is in place, it's time to add tutorial content. Again, the usethis package will do the dirty work for us to create the folders and files we need for a learnr tutorial within our package.

1. **Create the learnr tutorial** and open it for editing when you run `usethis::use_tutorial("<tutorial-name>", "<Tutorial Title>")`:

    
    ```r
    usethis::use_tutorial("lesson1", "Your First Lesson", open = interactive())
    ```

    * The first argument is the filename for the learnr R Markdown file you are creating without the `.Rmd` extension.

    *  The second argument is what you want the user-facing title of the tutorial to be.

    * This creates an `inst/` directory with some subfolders. If you're not new to creating learnr tutorials, the folder structure here will look familiar to you -- there's nothing different about learnr tutorial directories inside and outside of packages.

      You can open up `inst/` and its subsequent subfolders until you reach the `.Rmd` file you created:

      ```
      /inst/tutorials/<tutorial-name>/<tutorial-name.Rmd>
      ```

    <img src="pkg-inst.png" width="50%" style="display: block; margin: auto;" />

1. **Edit the open `.Rmd` file** and write your tutorial as you normally would.

1. **Repeat** for each additional tutorial you want to include in this package.



### Build, install, and use your tutorial package

Time to build the package and install it in your R system library.

1. __Navigate to the *Build* pane__ of your RStudio IDE. Then __click *Install and Restart*__. 

    * Alternatively, run:

      
      ```r
      devtools::install()
      ```

    * Believe it or not, you've now made a package with a learnr tutorial inside of it!

    * You should test that your package has been properly created by loading your tutorial from your installed package:
    
1. __Navigate to the *Tutorial* pane__ of your RStudio IDE. All installed learnr tutorials in your R Library will be automatically indexed and displayed here. 

    <img src="pkg-run-tutorial.png" width="90%" style="display: block; margin: auto;" />
    
    
1. __Click Start Tutorial__ to open the tutorial from inside the tutorial pane (which can then be made bigger or popped out to a browser window) -- 🎉 woot!
  

    * Alternatively, you can run your tutorial by using `learnr::run_tutorial("<tutorial-name>", "<package-name>")`.

        
        ```r
        learnr::run_tutorial("lesson1", "tutorialpackage")
        ```

    * The tutorial name here refers to the name of the `.Rmd` file, not the user-facing title.
    * The live tutorial will open up in a local browser window.
    

### (Optionally) Add dependencies

If your tutorial uses external packages (for example, packages for exercise-checking like [gradethis](https://rstudio-education.github.io/gradethis/)), or external packages that need to be made available to learners as they complete exercises (for example, data packages like palmerpenguins), you'll need to make sure this package gets installed along with your custom package. 

#### External packages in development 

If the package you want to use is not on CRAN (as gradethis currently is not), the development version of the package will need to be included as a `Remotes` dependency in the `DESCRIPTION` file. (*Note:* Including external packages that are still in development does complicate matters if you plan on submitting your tutorial package to CRAN.)

Once again, the usethis package will make this easier for us to do:


1. **Run** `usethis::use_dev_package("<external-package>")`

    
    ```r
    usethis::use_dev_package("gradethis")
    ```
  
    This function is even smart enough to figure out the `OWNER/REPO` of the GitHub remote that the external package comes from if you have it install locally. See the [usethis pkgdown site](https://usethis.r-lib.org/reference/use_package.html) for optional arguments.
    
2. You can confirm the package has been added under `Remotes` when you open the `DESCRIPTION` file in your project root.

#### External packages on CRAN

If you're using other packages in your tutorial that *are* on CRAN (e.g. tidyverse or palmerpenguins), these must also added to the `DESCRIPTION` file, but they need only be listed under `Imports`: 

1. **Run** `usethis::use_package("<external-package>")`

    
    ```r
    usethis::use_dev_package("palmerpenguins")
    ```
  
2. You can confirm the package has been added under `Imports` when you open the `DESCRIPTION` file in your project root.



### (Optionally) Edit your package metadata

This step is not necessary to have a working, usable package, but it creates a nicer experience for users interested in learning more about the contents of your package and how to use them.


1. **Open the `DESCRIPTION` file** in your project root.


2. **Edit the file** with your own information. Not sure what to write for each field? See [this resource](https://r-pkgs.org/description.html#pkg-description) for suggestions.

3. Finally, make sure to __*Build* > *Install and Restart*__ your package again to include these changes.



### Getting your tutorial to your audience

Your tutorial package has (finally!) been built, now it's time to get it out there!

1. **[Commit](https://happygitwithr.com/rstudio-git-github.html#make-local-changes-save-commit) and [push](https://happygitwithr.com/rstudio-git-github.html#push-your-local-changes-online-to-github)** to GitHub to share your tutorial package with the world.

1. **Have users *install* your package** from GitHub with: `devtools::install_github(“<your-repo>/<package-name>")`. (They will also need to install the learnr package.)

    
    ```r
    devtools::install_github("dcossyleon/tutorialpackage")
    ```

1. **Have users *run* your tutorial** by navigating to the *Tutorial pane* of their RStudio IDE and clicking *Start Tutorial*. 

    * Alternatively, users could also run the following code to open the tutorial: `learnr::run_tutorial("<tutorial-name>", "<package-name>")`

      
      ```r
      learnr::run_tutorial("lesson1", "tutorialpackage")
      ```

We recommend including these latter two instructions in a README file, which we introduce below.



### Create a README file

You can include additional information in a `README.Rmd` file for your package. At a minimum, we recommend you include a line about how users can install and load the tutorials.

1. **Run** `use_readme_rmd()` to create and open a README file.

    
    ```r
    use_readme_rmd()
    ```

1. **Edit** the README to meet your needs. Need ideas of what to include? Check out [this resource](https://r-pkgs.org/whole-game.html#use_readme_rmd).

1. **Click Knit** so that it creates a corresponding `README.md` file.

    * Or, alternatively, run:

    
    ```r
    usethis::build_readme()
    ```

1. **Commit and push** your changes to GitHub.



### Updating your package

After your package has been installed by your users, you can continue to update or add tutorials. Each time you make changes to the contents of your package, you must *Build* then *Install and Restart* the package locally before pushing your changes to GitHub.

Users can then access the updated content by simply re-installing your package.


## That's a wrap!

Congratulations, you've created a tutorial package!

From here, there are many ways to extend what you've done. For example, you could decide to bundle up custom data sets in your package, as explained in the [R Packages](https://r-pkgs.org/data.html#data-sysdata) book. And you might consider adding [package documentation](https://r-pkgs.org/man.html#man-packages). It's also worth mentioning that if you are teaching using RStudio Cloud or RStudio Server,  you can install the tutorial package in your workspace or project as the instructor, and make the student experience even simpler --  all students would need to do is go to the website, push a button, and start the tutorial.

If you'd like to see an example of a tutorial package "in the wild", check out the GitHub repository for the [learntidymodels package](https://github.com/tidymodels/learntidymodels) or the companion R package for the [Data Science Course in a Box](https://github.com/rstudio-education/dsbox).

Finally, you may also be interested in exploring mybinder.org as a platform for delivering interactive learnr tutorials to users, which you can learn more about with this [helpful post](http://laderast.github.io/2020/09/15/getting-learnr-tutorials-to-run-on-mybinder-org/) by [Ted Laderas, PhD.](https://education.rstudio.com/trainers/people/laderas+ted/)

Happy tutorial-ing!



