---
title: Teaching online with RStudio Cloud
description: |
  Q&A from the Teaching online with RStudio Cloud webinar.
date: '2020-04-01'
slug: teaching-with-rstudio-cloud-q-a
categories:
  - teach
tags:
  - rstudio-cloud
  - teach
author: 
  - mine
photo:
  url: https://unsplash.com/photos/80sv993lUKI
  author: Alex Machado
---

Thanks to everyone who participated in last week's webinar on Teaching online with RStudio Cloud. We weren't able to answer all of the questions that were asked during the webinar while we were online, so here are answers to all of them. If you have any other questions, please don't hesitate to post on [RStudio Community](http://community.rstudio.com/).

🖥 [Slides](https://rstd.io/rscloud-webinar)  
📽 [Video](https://resources.rstudio.com/webinars/teaching-r-online-with-rstudio-cloud)

## Course administration

> Does rstudio.cloud integrate well with Moodle?

There is currently no learning management system (LMS) integration, however this is something the engineering team has on their radar. See below for how students can submit their work on your LMS.

> How do students download files from RStudio.Cloud? For example, how do they submit assignments to the learning management system we use?

One option is is to export and download the file from rstudio.cloud. In the example below, I've checked the csv file I want to download, clicked "More", then Export. If multiple files are selected, they are combined into a zip file. 

<img src="file-export.jpg" width="690" />

You might have other options to submit homework, for example submitting the cloud project, or if you want to get advanced, ask students to push to a Git repository. 

> Do I need a separate space for each group of students if I have more than one? 

This depends on what you mean by "group". I recommend keeping students who are exposed to the same material and assignments in a single workspace, even if the course has multiple sections (e.g. multiple lab/workshops sections but same lectures, assignments, assessments).

For different courses (covering different materials and with different assignments) use separate spaces.

I think about it as one workspace for each course I teach.

> Should I want to assign a different project to each different group of students, should I create different workspaces or could I have one workspace and create different projects within it with different access privileges so that students can access only the project assigned to them?

It is currently possible to open project access to a subset of students in a workspace. If you wanted to do this you can either create separate workspaces (as described in the previous question) or use the share a single project option for specific groups of students.

> Is it possible to correct homework automatically? Or do we need to visualize each student's answers?

There is no autograding on RStudio Cloud currently.

> In the 2nd option (shared workspace), is it possible to share a link with students to the specific project being assigned within the class workspace so they don't have to go looking for it? I'm thinking of the idea of including the URL in my LMS.

Yes, you can do this. The student will need to be enrolled in the workspace first. Then, create the project and make it an assignment. Then, you can add a link to the project, and when the student clicks on that link it will be equivalent to starting an assignment. Student can then leave and come back, and they will see a Continue instead of Start button for the assignment.


## How to

> How do you load a data set or existing files into the cloud?
> {related} What's the process for sharing data files, just load them into the workspace?

In the Files pane, click on upload, then browse your computer to find and upload the file.

<img src="rscloud-upload-file.png" width="755" />

> You said that for sharing a project with students there are two main ways. In the first way they have to make a copy of the project in order to not to lose the changes. Can you show how to do this?

When a student goes to your shared project they'll see a blinking red text that says "TEMPORARY COPY" and next to it is a button to "Save a Permanent Copy".

<img src="rscloud-save-permanent-copy.png" width="1358" />

> How can you SET the base project?

[This video](https://youtu.be/Fz9UR6uxAG4) walks you through the steps for setting a base project. Briefly,

- Create a new project and install any packages, add any files, etc. you want in your base project. 
- Name this project something you'll recognise (I like naming them `base`).
- While in the project, click on the gear icon on the top right, then on Access, and set the project to be visible to everyone in the workspace.
- Then, go back the homepage of your workspace.
- Click on the gear icon on the top right, and you will see a menu where you can set your base project. Click on the three dots to pop open a window where you can select the project you want to set as base.


## Collaboration / assistance

> When peeking into a student's project, can the instructor directly edit and run code?

Yes! The only thing to be aware of is that two people can't be in the same project at the same time. So my recommendation is to ping your student before you peek into their project.

> Can a student also have their workspace open when me (instructor) "peeking" in?  My experience is that having me in their workspace crashes their session.

Two people can't be in the same project at the same time, so my recommendation is to ping your student before you peek into their project.

> Can you suggest any sources I can read/see that can help me to use rstudio.cloud with my **research group** instead of my class? e.g. start large experiments, reproducibility...

I'm not aware of something official written about this but a few ideas come to mind:

- I would create a workspace for the group, if anything, to keep things organised and in one place.
- I imagine you would want members of your research group to make their work visible to others, so you can relax the permissions for members to change visibility of their projects.
- The assignment feature might not be relevant, you can make projects visible to others without making them into assignments.
- RStudio Cloud projects are great for collaboration, but note that two people cannot work on the project at the same time. So people will either need to take turns editing a project, or if your research group uses version control, they can of course use a service like GitHub for the collaboration aspect. 

> Can students collaborate on projects?

There is no concurrent collaborative editing of projects -- so your students couldn't collaborate like they might do on a Google doc -- so this is important to note. But there are a few approaches to collaboration:

- If you also teach version control, you can have a single repo on GitHub that all students in a group has access to and they clone this repo on their individual RStudio Cloud accounts within your course workspace and they can push their changes to the repo. This is the approach I use in my data science courses. You can read more about [here](https://datasciencebox.org/infrastructure/github/) and [here](https://arxiv.org/abs/2001.01988). 

- If not, one possible approach is to have you (instructor) or students in a team create an RStudio Project outside of a workspace and share with team members. Currently, there is no way to share a project with specific individuals within a workspace.

> Is there an integrated chat system in rstudio.cloud like Slack, so students can ask questions and I as instructor can answer? I currently use Slack, but it would be nice to have it all in one place?

There is not. 

## Limits

> What is the individual file limit RStudio.cloud projects?  e.g., GitHub has something like 100MB limit per file]
> {related} Are there file size constraints with RStudio Cloud? 

Each project is allocated 1GB of RAM.

> Do we have to ask for permission to add more than 10 students for each workspace? or can I ask a single time?
{related} It seems like we do not need to request anything if our group is under 25 students, is that correct?

Each account is allocated one private space, with up to **10 members** (including the workspace admin, i.e. the instructor) and **25 projects**. You can submit a request to the RStudio Cloud team for more capacity if you hit one of these space limits, and we will do our best to accommodate you. You do need to put in a request for an increase in members for each workspace. If you are using a Professional shinyapps.io account, you will not encounter these space limits.

> I'm teaching an "Intro to Deep Learning" course online next month and this looks like it could solve a lot of issues I think I might have with controlling 60-70 different installs etc., but they will probably need substantial computation time. Is there anything I should take into account specifically on the computation-side of things in RStudio Cloud?

You will want to try out your assignments with the default memory limit, and if you find that it's not sufficient, you can request a memory increase.


## R Packages

> Are there some packages that we can not use with RStudio Cloud ?

There are some R packages that require system libraries. If you're using a package that uses a system library that is not available in RStudio Cloud, you won't be able to use that package as currently it's not possible for users to install these. We recommend posting this on RStudio Community as a request to install the system library and the RStudio Cloud team should be able to help.

> Is there a trick to installing packages from github? Getting rate limiting error.

There isn't a trick, `devtools::install_github()` works. The answer might depend on the package you're installing though.


## Service issues

> Have you had trouble with RStudio cloud not working during teaching? I was using it in class in late January (first day of class) and none of us could login. It worked before and after class, so I think there was a problem with RStudio cloud itself. I had to improvise and show how to use desktop version. This only happened to me once out of 4 lab sections. But does it happen rarely or often?

This is certainly not a regular occurence, but we also know that some users have found themselves in this situation if their class happens to be running during a system outage. If this happens again I would recommend checking https://status.rstudio.com/. If RStudio Cloud is noted as operational there, the issue might be something on your end (e.g. WiFi failure?). You might also be the first person to encounter the issue, so we would very much appreciate if you can report any such issues on RStudio Community or by emailing support@rstudio.cloud, but we appreciate that you probably won't get to do this in the middle of teaching.


## Miscellaneous 

> When the paid plan is available, will free features be limited and if so, which ones?

We've not yet finalized the pricing plans for RStudio Cloud. However, I can say for sure that we will have a free plan. The free plan may include restrictions on amount of CPU, memory, and storage resources that may be used, and may have limits on the number of members and projects that can exist within a space.

> I had a problem with RStudio Cloud to connect it to the relational databases.
How do you use RMySQL, DBI... packages on RStudio Cloud?

Connecting to databases from RStudio Cloud is supported using a wide variety of packages. However, you may need to contact your network administrator to allow access to your firewall so that the RStudio servers are able to connect to those databases. Information can be found in the guide: https://rstudio.cloud/learn/guide#external-access

> Can we run code chunks in, e.g, python or C? 

Yes. Python, RCpp, and C chunks in RMD documents are supported. Please, keep in mind memory limitations might affect the ability to compile some chunks.

> Any tips to make projects open fast? What causes projects to load slowly?

Project opening performance is something we're actively working on improving. There are a number of issues that can cause things to open slowly that we hope to address in the near future. A couple of things to keep in mind to reduce opening times: 1) Ensure you're on a fast and reliable internet connection. 2) Avoid having loading very large files into your R session at startup.


## Lessons

> Can I get an example of a file on git that could be used to create a new class and/or project?

[Here](https://github.com/Sta112-F18/hw-06-political-contributions) is an example of a repository that is an assignment in an introductory data science course. Note that in my course I would have made copies of this repo for each student (with the repo name appended with student's GitHub name) that only that student and myself can view. You can do this sort of making many copies of repos for students using the [ghclass](https://rundel.github.io/ghclass) package in R or using [GitHub Classroom](https://classroom.github.com/).

Each student would then take the URL of their repo with these started documents and create a New Project from Git in the course workspace (so one repo -> one project). This RStudio Cloud project would be populated with these starter documents and also would have the R packages they need installed (coming from the base project in RStudio Cloud). 

And for completeness, [here](https://www2.stat.duke.edu/courses/Fall18/sta112.01/hw/hw-06/hw-06.html) is the assignment instructions.

> So you have some examples of data wrangling with R?

There are great examples among our [primers](https://rstudio.cloud/learn/primers), especially in the Work with Data and Tidy Your Data primers. 
