[![Netlify Status](https://api.netlify.com/api/v1/badges/32c49824-eb3b-407a-9f76-1aeab95922e6/deploy-status)](https://app.netlify.com/sites/rstudio-education/deploys)

# education.rstudio.com

This repo is the source of <https://education.rstudio.com>, and this readme tells 
you how it all works. 

* If you spot any small problems with the website, please feel empowered to fix 
  them directly with a PR. 
  
* If you see any larger problems, an issue is probably better: that way we can 
  discuss the problem before you commit any time to it.

* If you'd like to contribute a blog post, please chat with one of us first.
  Then read the [contributing guide](CONTRIBUTING.md).

This repo (and resulting website) is licensed as [CC BY-SA](license.md).

## Structure

The source of the website is a collection of `.md`, `.Rmd`, and `.Rmarkdown` files stored in 
[`content/`](content/), which are rendered for the site with 
[blogdown](https://bookdown.org/yihui/blogdown). 

* `content/learn`: these files generate the [learn](https://education.rstudio.com/learn/) section of the site. The file `_index.md` governs the landing page for that section. The subfolders populate the subpages: [beginner](https://education.rstudio.com/learn/beginner), [intermediate](https://education.rstudio.com/learn/intermediate), and [expert](https://education.rstudio.com/learn/expert/). The main text for each of those subpages is located in the file named `index.Rmd`. If you update any text in these `.Rmd` files, it is important to run `blogdown::serve_site()` before committing your changes so that the corresponding `index.html` file gets updated.

* `content/teach`: these files generate the [teach](https://education.rstudio.com/teach/) section of the site. The file `_index.md` governs the landing page for that section. The subfolders populate the subpages: [how-to-teach](https://education.rstudio.com/teach/how-to-teach), [materials](https://education.rstudio.com/teach/materials), and [tools](https://education.rstudio.com/teach/tools). The main text for each of those subpages is located in the file named `index.md`. You can preview your changes to these files with `blogdown::serve_site()`, but this should not create any additional files; no `*.html` file should be committed here.
  
* `content/blog/`: these files are for blog posts. Posts should be written as either `.Rmarkdown`, or `.md` files (in the event that you do not have any code in your post). This will be done automatically for you when you use the __"New Post" blogdown add in__; pick the "blog" archetype from the drop-down menu. All blog posts are created as Hugo page bundles, which means that a new folder gets created in `blog/`, and you work on a file in that folder named `index.*`. 

    + You may add any images for your post to the folder for your post bundle. Two very special images are required- one for the banner that goes across the top of your post that must be named `*-wd.jpg`. The other is for the thumbnail for your post on the blog listing page and it have the word `thumbnail` in the file name (so `thumbnail-mtsalsa.jpg` for example). Hugo will find these images and put them where they need to be, if named correctly and placed inside your post bundle.

    + For `*.md` posts, no `*.html` file should be committed. If you generate one locally during development, delete it once it's no longer useful to you. Keep it out of this repo.
    
    + For `*.Rmarkdown` posts, you should render the `.md` yourself before submitting the post using `blogdown::serve_site()`; no `*.html` file should be committed here either. This also provides a way for you to check that the post is rendering on the site the way you intended (see recommended workflow below).      
    
    + If your post includes emoji, use the `.Rmarkdown` format, and incorporate emoji using the [emo](https://github.com/hadley/emo) package.  

* `content/events`: these files are for events. These end up in the table of [upcoming](https://education.rstudio.com/events/) or [past events](https://education.rstudio.com/events/archive/). The two events that are closest in time to the last site update will appear in sticky notes in the sidebar of various pages on the site. Don't worry about removing old events- these are nice to have for us so please leave as is. If you want to add an event, use the __"New Post" blogdown add in__; change the subdirectory to "events" and pick the "events" archetype from the drop-down menu. You must set a  `publishDate` in the YAML, and I recommend to use the current date you are adding the event, as Hugo by default filters out any content with a `date` YAML key in the future.

* `content/author`: these files are for individual team member bios. Each team member has their own folder- the name of the file is very important so please don't change without talking to the team first. If you want to edit your bio, edit the `_index.md` file in your folder. Again, the name of the file is very important here (do not change it to `index.md` for example!). No `*.html` file should be committed here.

## Previewing changes

### Use `blogdown::serve_site()`

To build the site locally, you'll need to install blogdown, and then install 
hugo, the music behind the magic of blogdown:

```R
install.packages("blogdown")
blogdown::install_hugo()
```

Then run

```R
blogdown::serve_site()
```

This will open a preview of the site in your web browser, and it will 
automatically update whenever you modify one of the input files. For `.Rmd`, 
this will generate an `.html` file, which you should commit and push to GitHub. For `.Rmarkdown`, this will generate an `.md` file, which you should also commit and push to GitHub.

#### Other methods of local preview

You should really preview the site using `blogdown::serve_site()`. But if, accidentally or intentionally, you knit or preview the content using another method (e.g. click the **Preview** button in RStudio for `.[R]md`), make sure you don't commit an `.html` file from an **`.md`** file. Delete any of these files before serving site again.

### In PRs

The education site is automatically published with 
[netlify](http://netlify.com/). One big advantage of netlify is that every PR 
automatically gets a live preview. Once the PR is merged, that preview becomes 
the live site.
