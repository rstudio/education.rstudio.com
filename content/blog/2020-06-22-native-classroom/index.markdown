---
title: Data analysis for social justice in a Native classroom
author:
  - '[Nic Thompson Gonzalez](http://www.nicolethompsongonzalez.com/)'
date: '2020-06-22'
categories:
  - teach
slug: native-classroom
description: |
  My personal experience teaching data science at an exclusively Native American community college in New Mexico.
photo:
  URL: https://unsplash.com/photos/3KEJMfoHoMY
  author: Graeme Nicholl
---

I'm here to share some insights from a work in progress. I began teaching an introduction to data science last year at the Southwestern Indian Polytechnic Institute [(SIPI)](https://www.sipi.edu/), a community college in Albuquerque, New Mexico with an exclusively Native American student-body. My professional background is in behavioral ecology, however, my passion for teaching lies in data analysis. Why? Because data literacy and analytical expertise are freely available tools to empower people and remedy many societal ills and injustices. My course datasets are therefore usually related to such ills.

The material is currently delivered in an intensive 4-day workshop. Since the first round of its development and implementation, I’ve learned a number of lessons (beyond how to teach mental models that underlie ggplots). I can group these into three general areas.

1.  Creating culturally relevant and inclusive content and structure.

2.  The importance of logistics and technology.

3.  A teaching attitude that's make-or-break for beginners.

## 1. Creating culturally relevant and inclusive content and structure

An inclusive class must address two big issues: is the material personally relevant and is the material accessible and safe to engage with?[^1]

[^1]: [Guide for Inclusive Teaching at Columbia](https://cpb-us-w2.wpmucdn.com/edblogs.columbia.edu/dist/8/1109/files/2020/02/Guide-for-Inclusive-Teaching-at-Columbia_Accessibility-Revisions_15-January-2020_FINAL.pdf)

Skills in coding and statistics grow through application, which happens best when students are motivated to answer a question. If one of our goals as instructors is to increase diversity in STEM and data science, then we need to become literate on a diversity of questions that people are motivated to answer.

For this workshop, I've chosen the route of letting students choose among datasets on public health and social justice issues. These topics are too widely pertinent to Native peoples, e.g. diabetes[^diabetes], cancer[^cancer], suicide[^suicide], and gun crime[^guns]. Now, no group is homogeneous and it is inaccurate to think that every member of a marginalized group is interested in social justice; however, these topics do draw the interest of my students. They are also issues that the power of data literacy can help students solve in their lifetimes. In the future, I plan to incorporate datasets on other contemporary issues, such as social media usage (similar to [Girls Inc of NYC](https://www.elsevier.com/connect/teaching-data-science-through-the-lens-of-social-justice-issues)), as the current hard-hitting topics may turn-off some students. The provided datasets serve as the basis for group projects, in which students hone and analyze their research questions.

[^diabetes]: [Call to action: A new path for improving diabetes care for Indigenous peoples, a global review](https://www.sciencedirect.com/science/article/pii/S0168822716302467)

[^cancer]: [Cancer in Indigenous Populations](https://www.thelancet.com/series/cancer-in-indigenous-populations)

[^suicide]: [The Native American Identity Crisis and the Rise of Suicide](:https://blog.nativehope.org/february-spotlight-native-american-identity)

[^guns]: [Gun Violence Has a Major Impact on Native Communities in the United States](https://www.teenvogue.com/story/gun-violence-has-a-major-impact-on-native-communities-in-the-united-states) 

To create a safe and engaging classroom structure, I take a few different abstract and concrete steps...

In the abstract, I first understand that for many Native Americans, and other historically marginalized populations, community and storytelling are a central part of life, playing massive roles in individual identity. The culture of many classrooms does not always value communities and their stories in the same way... Western higher education was established in a highly individualistic culture, whose Protestant Christian roots[^ethic] emphasize dutiful and successful work (not necessarily community) as a core component of individual identity. This culture has been introduced to the world too often via painful and dehumanizing experiences[^history]. So, the elevation of the individual through hustle and perfection, which is a common ambition of higher education, does not always feel familiar to students and, if familiar, it does not always feel safe. For many students, instead, a focus on community and connections to community makes classroom material much more accessible.

[^ethic]: [The Protestant Ethic and Higher Education in America](https://www.jstor.org/stable/pdf/1050005.pdf?refreqid=excelsior%3A2bea6bf49df970ca4232f691609d8547)

[^history]: [Higher Education in the United States](https://education.stateuniversity.com/pages/2044/Higher-Education-in-United-States.html)

Second, I try to adjust my perspective as a teacher, understanding that

-   *I am operating on stolen land.*
-   *My students likely have an inseparable connection to their communities and their land.*
-   *My students are strong and resilient in the face of intergenerational trauma.*[^2]
-   *My own notions of health, medicine, and justice are highly individualistic and institutional.*

[^2]: [The National Native American Boarding School Healing Coalition - Impact of Historical Trauma](https://boardingschoolhealing.org/education/impact-of-historical-trauma/)

Then concretely, I put the following principles into action.

-   *The destination is clear*: Roadmapping is central to effective teaching in any classroom. One of the biggest barriers for students are the tacit expectations teachers place on them, including why they are taking the class and their performance and behavior in it. Students should have a clear outline about what we're doing throughout and at each stage of the course: what they will learn from it, how and when their performance will be evaluated, and how it will be useful to them outside the classroom. Yup, a good written syllabus + explicit and regular expression of expectations and learning objectives are foundational for inclusive classrooms. Doing this well takes time, practice, and planning.[^design] 

-   *Everyone is up to speed*: At the end of any 15-20 minute lecture chunk I use low-stakes, formative assessments (e.g. ungraded quizzes[^assess]) to focus everyone's attention on the big picture of what we've just talked about and track/realign any misconceptions.

-   *Representation matters*: For slideshows, I aim to highlight Native people that are working to solve the problems showcased in each dataset. Whenever possible, I also choose pictures of Native people applying the skills that the students are learning. Each of these gives students role models, so they can envision themselves doing data analysis for public health and social justice.

-   *Make the connection*: Upon choosing their data set and at mileposts during their analysis, I ask students to express how the data relates to them and their communities, and how they can share insights from the data with others. Letting students tell their stories builds trust. In the future, I plan to use a talking stick as each speaker shares.

-   *You have agency*: I let students decide on their project datasets.

-   *We're a team*: Working in groups begins early. In teams of 3-4, students alternate roles as "lead investigator", "coder", and "reporter". The teams take time to communicate as a class via their reporters.

-   *Tell me more*: I always end with a survey (I use SurveyMonkey). This gives students a clear chance to let me know what datasets spoke to them, what tripped them up, and what types of data they'd be interested to work with in the future (as well as the various technical skills they've gained).

[^design]: [Learning Objectives and Backward Design](https://tep.uoregon.edu/learning-objectives-and-backward-design)

[^assess]: [Formative vs. Summative Assessments: What's the Difference?](https://www.aeseducation.com/blog/formative-vs.-summative-assessments-what-do-they-mean)

## 2. The importance of logistics and technology

Attitudes are vital. Unfortunately, they can't do much if technical difficulties completely hamper students' engagement with material. The students we seek to recruit and empower in STEM will often be in resource-limited institutions and this will require additional tricks and strategies from instructors.

One of the easiest ways to ensure a smooth-running workshop or class is to **limit class size**. I know, this doesn't sound very inclusive, but I choose to cap workshops at 15 and only work with students that actively choose to participate. I find this ensures a baseline of motivation and allows me to be most effectively hands-on.

Otherwise, *the big idea is to come prepared.*

For class startup, I try to have different Wi-Fi dependent and independent options. To be clear: Wi-Fi can be a **big** problem.

-   I have a version of all materials on RStudio Cloud **(Wi-Fi dependent)**. The cloud's workspaces and projects for courses and workshops are fantastic. If you're not already familiar with it, I recommend [this tutorial](https://resources.rstudio.com/webinars/rstudio-cloud-in-the-classroom) from Mine Çetinkaya-Rundel. Unfortunately, RStudio Cloud is sometimes slow, extremely slow with weak Wi-Fi, and of course simply non-existent when Wi-Fi is down.
-   I'm lucky to teach in a computer lab -- I can coordinate with IT ahead of time to have R and RStudio installed on every computer (yes, time and labor intensive for someone). I have my most recent exercises and assignments posted online for them to download at the start and then run Wi-Fi free **(minimal Wi-Fi dependence)**. I also put my scripts on thumb drives **(Wi-Fi independent)**, for the worst case scenario -- zero Wi-Fi.
-   For the future, when students might bring in their own computers, I'm working on (and asking others to help) write bash scripts for different machines, which install R, Rstudio, and several base packages. I can distribute these bash scripts, and R scripts for the day's exercises on thumb drives **(total Wi-Fi independence)** and have students go through dreaded installations with minimal pain. In any case, I do some intros and demos (fun) before installations begin (not fun).

For **presentations**, I have a powerful mini projector with blue tooth connection (an Anker Capsule, many thanks to NIH research funding). So regardless of the awkward shape or layout of the room available to me, or however weak the projector is, I know I have my own flexible little powerhouse whose ins-and-outs I'm intimately familiar with.

There are two other workarounds (both Wi-Fi dependent) for students to watch **live coding** when visibility is poor. First is an institutional Zoom account that allows me to share my screen with several students. Another is the new [livecode](https://github.com/rundel/livecode) package from Colin Rundel that I'm excited to try. Check out the demo from Rstudioconf::2020 [here](https://resources.rstudio.com/rstudio-conf-2020/lightning-talk-colin-rundel). Essentially, your RStudio IDE is constantly creating a web page of your work, which your students can watch with the appropriate link.

## 3. Finally, a make or break attitude for teaching beginners

We generally know, but regularly need to remember... When we first saw R or the RStudio IDE it was daunting and foreign.
Hours (or years) of debugging and Google searches may have made us
forget this, but we must resist the temptation to trivialize or
oversimplify in front of students. In my experience, flashy demos can
often dishearten even talented people, making knowledge and skills feel
unattainable to all but a few type-A students.

One thing I love about the #rstats community is that this reminder is rarely necessary. People I encounter whose knowledge far exceeds mine most often act with humility and respect for everyone's stage of the journey. I'm deeply grateful to the #rstats community and education department for their support and training. From my start as a conference diversity scholar, to completing the RStudio instructor certification, to this guest blog post -- RStudio has played an enormous part of my teaching journey.

## Recommended reads

+ ["Good Teachers Embrace Their Students' Cultural Backgrounds"](https://www.theatlantic.com/education/archive/2013/11/good-teachers-embrace-their-students-cultural-backgrounds/281337/)  

+ ["Why Diversity Training Isn't Enough"](https://newrepublic.com/article/156032/diversity-training-isnt-enough-pamela-newkirk-robin-diangelo-books-reviews)  

+ ["How Teachers Can Reduce Stereotype Threat In The Classroom"](https://cesp.rutgers.edu/blog/how-teachers-can-reduce-stereotype-threat-classroom)

## Acknowledgments

I thank Dr. Alfonso Heras Llanos, a math professor at SIPI, who helped me implement this workshop. I also thank my friends and colleagues Tammi Duncan and Carla Sakiestewa of the Navajo, Hopi, and Lakota Nations, who provided helpful comments and feedback while developing this workshop and this post.

Twitter: [\@NicoleAlineSci](https://twitter.com/nicolealinesci)
