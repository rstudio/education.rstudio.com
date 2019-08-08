Our starting point is a three-stage model of cognitive development:

-   A *novice* doesn't yet have a mental model of the domain.
    They don't know what they don't know,
    don't speak the jargon,
    and do things by analogy or by rote.
-   A *competent practitioner* has a usable mental model of the domain.
    They can do routine tasks and solve routine problems,
    know where to look to find more information,
    and can recognize solutions to their problems when they find them.
-   An *expert* has a large, densely-connected model of the domain.
    They can solve common problems at a glance and figure out the one-in-a-thousand cases.

The diagram below shows how different kinds of material help different people.
The X axis is the user's general knowledge of R, RStudio, the tidyverse, and data science.
The Y axis is their *domain expertise*,
i.e., how well they understand the particular problem they're trying to solve.
The difference is illustrated by these two cases:

-   Someone can have expert knowledge of R in general,
    but be a novice when it comes to the features of the latest release of the IDE.
    (The jargon term for such a person is *false beginner*:
    they look like a novice if you test their knowledge,
    but move much faster than someone without their background knowledge.)
-   Less commonly,
    someone can be competent in one specific area
    but know little or nothing about the larger domain.
    Someone who has learned how to install and configure RStudio Connect but has never used it may fall into this category.
    We sometimes say that their understanding is *brittle*:
    even small changes can shatter their ability to accomplish tasks because they don't have enough of a mental model to generalize or adapt.

<img src="doctypes.svg" alt="Documentation Types" />

This diagram refers to the following kinds of material:

1.  A **how-to** is a step-by-step recipe for solving a particular problem.
    Novices can use it without understanding the "why" behind each step;
    it increases knowledge of a very specific topic (how to accomplish one particular task)
    but doesn't do much for general domain knowledge.

2.  An **overview** is a high-level introduction that makes people aware something exists;
    they increase general understanding,
    but aren't much help with specific problems.
    Overviews are often delivered as webinars,
    as the first lecture of a larger workshop or course,
    or as elevator pitches and other marketing material;
    concept maps and other visual aids are particularly useful.

3.  A **tutorial** is a planned lesson that helps people build a mental model of a domain
    and acquire a few basic skills so that they can start to tackle problems of interest.
    We have shown tutorials as moving people from novice to competent;
    any single tutorial will probably only move people part of the way along this vector.

4.  A **translation** shows a reader who knows how to do something with tool X how to do it with tool Y,
    i.e., it leverages understanding of one topic to increase understanding of another.
    (Note that translations include "Linux for Windows sys admins"
    as well as "the Frisian version of a Spanish-language cheatsheet").

5.  **Release notes** and similar "updaters" assume general understanding,
    and fill in pre-identified gaps in knowledge of detail.

6.  **References** (and Q&A sites) assume you know what you're looking for
    but have forgotten or never knew the details.
    They keep being useful no matter how far you progress,
    so the arrow should extend into expertise,
    but that would clutter the diagram.

7.  A **worked example** is like a how-to,
    but assumes the user knows enough to generalize from a specific series of steps to solve a particular problem.
    (Checklists, on the other hand, continue to be useful even for experts.)

This list doesn't encompass everything,
but most of what's not here can fit into it or be explained in terms of it.
The key is to distinguish content from presentation,
i.e., what's being delivered from how it's being delivered:

-   A **workshop** is usually a way to deliver a tutorial.

-   A **book** often includes tutorials, reference material, worked examples, and case studies in one place.

-   A **vignette** can be an overview or a worked example.

-   A **cheatsheet** is a one-page reference guide that opens with an overview
    and includes a bit of cookbook material as well;
    it's mostly a reminder of things the reader has probably already seen with a few other useful bits thrown in.

-   Similarly, a **computational notebook**
    (sometimes also called a **knuth** in honor of the inventor of literate programming)
    can be a tutorial,
    a case study,
    a reference manual,
    or many other things depending on its primary purpose.
