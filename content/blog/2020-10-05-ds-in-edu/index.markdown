---
title: "Writing Data Science in Education Using R in the Open"
author: 
  - Ryan Estrellado
  - Joshua Rosenberg
date: '2020-10-05'
categories:
  - teach
  - learn
tags:
  - bookdown
description: |
  We're Learning Too
slug: ds-in-edu
photo:
  url: https://unsplash.com/photos/SYTO3xs06fU
  author: Marvin Meyer
editor_options: 
  markdown: 
    wrap: 72
---











## Introduction

When we wrote [*Data Science in Education Using R (DSIEUR)*](https://datascienceineducation.com/), we knew it
would be easy to assume that new learners would have more prior
knowledge about R than they actually did--a phenomenon called "[the
curse of knowledge](https://en.wikipedia.org/wiki/Curse_of_knowledge)".
We knew this intuitively as more experienced R users because we only
vaguely associated feelings of triumph and frustration with the memory
of running that first chunk of R code. The details of where we got stuck
in our learning were harder to remember.

Over time, we traded in fresh memories of these learning pain points for
experience and ease of use. That led to a design problem we had to solve
while writing DSIEUR: How do we write with empathy for new learners when
our own memories of learning R have gotten foggier?

To better identify with the learning experiences of others, we needed to
identify where our blind spots were. To identify our blind spots, we
needed strategies to empower others to give us feedback by sharing.
Bringing our strengths to this collaboration but checking that we
understand one another's work, writing in the open, and using a project
workflow to support creativity were our strategies to do just this.

## Collaborate with people from different perspectives to help you identify your blind spots

As we neared the end of writing the DSIEUR manuscript, we set out to
review each chapter and edit it for readability. To create an
opportunity for fresh eyes to read our work, we each reviewed a chapter
we hadn't written. Ryan picked chapter 13, which is on using multilevel
models to analyze student survey responses about their online classes.
Having a new perspective on experiencing the chapter---particularly when
the chapter includes lots of technical explanations---turned out to be a
great way to discover blind spots in our work.

Here were Ryan's thoughts after reviewing chapter 13: 

> "I don't use
multilevel models regularly in my work, so I could tell right away I was
going to learn something new. I read through the sections to make small
edits, but also took breaks every so often to check my comprehension of
the concepts."

About halfway through the chapter review, we started a great,
back-and-forth conversation and brainstorm about conveying how
standardizing coefficients works in multilevel models. Thinking back, we
see that our different experiences with multilevel models were critical
for accomplishing two things: identifying areas where the writing could
be clearer and more accessible and also staying true to the technical
parts of the topic.

We read through the chapter and picked out sections that didn't seem
clear. Then, we had conversations to clarify how standardizing
coefficients work in multilevel models. We wrote out some initial
thoughts to convey where we-together-ended up in our conversation. Then,
we read the section again. And round and round we went, until finally we
arrived at an execution we were happy with.

<img src="Screen Shot 2020-07-14 at 7.32.58 AM.png" width="1496"/>

In this way, we supercharged the iterative writing process with two
elements of collaboration. First, differing backgrounds gave us an
opportunity to find blind spots. Josh has used, taught, and written
about multilevel models regularly for years. Ryan had a basic
understanding of the concepts, but less experience using them. And
second, a collective goal---in this case, writing a book
together---motivated us to communicate openly and experiment with
different ways to create a great experience for our readers.

## Write and revise in the open to get feedback from readers

There are all kinds of ways to build empathy for new learners, like
"listening" on social media, interviewing members of the R community,
and regularly trying to learn new things ourselves. Creating in the open
is another approach---one that the R community and others have embraced.
[Open source educational resources, software, and science make code
available to readers to encourage collaboration and
accountability](https://rviews.rstudio.com/2020/07/01/open-source-authorship-of-data-science-in-education-using-r/).
But can open source writing also help us check our biases about what
learners need by including the learners themselves in the development of
the content?

When data scientists share their writing and code through sites like
GitHub and Kaggle, that sharing comes with an unspoken invitation to
communicate with the creators. Most of the time, that communication is
about improving code. When the open source project is designed to teach
something new, the communication can also be about improving the
learning experience.

Consider a scenario where a classroom teacher asks their students to
complete worksheets---an example of (tacitly) closed source education
materials. Not only do worksheets hide the underlying thinking behind
their creation: they also invite compliance more than they invite
conversation about what the learner needs.

On the other hand, providing the code for our book at every stage of
writing empowered us to share *how* we thought through an analysis. It
also set the tone for conversation on social media platforms and GitHub
about how we can improve the book. For example, in Chapter 8 we created
a visualization to explore scores from student classwork assignments.
For this post, we added `reorder()` to change the order of values in the
x-axis:


```r
# Scatterplot of continuous variable
classwork_df %>%
  ggplot(aes(x = reorder(classwork_number, -score, median),
             y = score,
             fill = classwork_number)) +
  geom_boxplot() +
  labs(title = "Distribution of Classwork Scores",
       x = "Classwork",
       y = "Scores") +
  scale_fill_dataedu() +
  theme_dataedu() +
  theme(
    # removes legend
    legend.position = "none",
    # angles the x axis labels
    axis.text.x = element_text(angle = 45, hjust = 1)
    )
```

<img src="/blog/2020-10-05-ds-in-edu/index_files/figure-html/plot-1.png" width="672" style="display: block; margin: auto;" />

By making the code for this plot
[available](https://github.com/data-edu/rstudio_edu_post), we invited
readers (implicitly by being openly available but also explicitly by
requesting feedback on Twitter) to tell us where we could do more to
scaffold the lesson. For example, a reader might tell us they need more
explanation of how `reorder()` is used to arrange the boxplots by median
scores.

In other cases, readers let us know when the writing itself didn't make
sense. For example, one community member read the [online version of
DSIEUR](https://datascienceineducation.com) and emailed to tell us a
plot that showed the importance of different variables for predicting a
student's final grade didn't match the interpretation we wrote. It turns
out we made revisions to the analysis that changed the plot, but we
hadn't updated the plot's interpretation. We tracked this feedback and
others in a [GitHub
issue](https://github.com/data-edu/data-science-in-education/issues/525)
and corrected it.

Indeed, while writing DSIEUR, sharing the book and its code led to
[conversations](https://twitter.com/rrherr/status/1254208054008205314)
and opportunities for improvement we might not have had if we didn't
write in the open.

## Use the structure provided by a writing project to encounter blind spots

When we structure our creative endeavors like a formal
project---including setting a deadline and working toward a product---we
create many opportunities to encounter our oversights and blind spots.

One way to do this is to write for an audience (of any size). If you've
written a blog or social media post before, you might recognize the
experience of doing so: As soon as you publish the post, you find gaps
(or typos!) in your writing you feel motivated to fix. Moreover, if you
write a blog post in [R Markdown](https://rmarkdown.rstudio.com), the
process of publishing the post will expose issues, warnings, or messages
related to the code---issues you may wish to address before (or after)
publishing the post. Knowing someone will read your work gives that
extra bit of productive pressure to offer value to your readers. Indeed,
the audience has a role to pay in the creative process because they
aren't just reading, they're participating. Conversations can start in
the comment section or on social media. These conversations help you
learn how well you've connected with the audience and help you uncover
what's important to your readers.

Another part of structuring creative endeavors is creating opportunities
to have your work reviewed, either by you or by someone else. In the
context of book writing, working through the copy-edits with our
publisher helped (or forced!) us to encounter other parts of our writing
we hadn't considered: We realized late in the process that we used both
the singular and plural form of 'data' throughout the manuscript
(without expressed reasons for doing so!). Even an early [GitHub
issue](https://github.com/data-edu/data-science-in-education/issues/20)
about this very topic hadn't prompted the same level of urgency as the
copy-edits did. While more particular than the broader blind spots
discovered through collaboration and writing in the open, these blind
spots are critical for creating a clear, professional, and readable book
for the audience. Whether reviewing your own work or having others
review for you, an intentional revision process can uncover missed
opportunities for improvements.

Finally, deadlines can help. The due date for the manuscript motivated
us to improve how we communicated with each other. In *Change By
Design*, Tim Brown writes:

> "Curse deadlines all you want, but remember
that time can be our most creative constraint." 

Indeed, the frequency of
team calls and the commitment to revising and finalizing our manuscript
together grew as our deadline approached. Thus, our publisher's deadline
provided a structure that encouraged organization, efficient
decision-making, problem-solving, and collaboration. With the deadline
looming, we got to the essential question as quickly as possible: Does
what we wrote connect meaningfully with the audience and if not, how can
we speak to them better?

## Conclusion

In the end, the solution for writing the best book we could for new R
users in the education field was to empower the community with tools to
look at our work and share their reactions with us. Writing *Data
Science in Education Using R* in the open was a way for us to express
what we've learned, but also a way for us to keep learning.

You can reach us and our co-authors on Twitter: Emily
[\@ebovee09](https://twitter.com/ebovee09), Jesse
[\@kierisi](https://twitter.com/kierisi), Joshua
[\@jrosenberg6432](https://twitter.com/jrosenberg6432), Isabella
[\@ivelasq3](https://twitter.com/ivelasq3), Ryan
[\@RyanEs](https://twitter.com/RyanEs).
