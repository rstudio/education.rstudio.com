---
title: "Data Analysis for Social Justice in a Native Classroom"
date: '2020-03-12'
slug: native-classroom
categories:
  - teach
author:
  - "[Nic Thompson Gonzalez](http://www.nicolethompsongonzalez.com/)"
photo:
  URL: https://unsplash.com/photos/3KEJMfoHoMY
  author: Graeme Nicholl
---

In this post, I'll share some insights from a work in progress. Last year, I began teaching an introduction to data science at the Southwestern Indian Polytechnic Institute [(SIPI)](https://www.sipi.edu/), a community college in Albuquerque, New Mexico with an exclusively Native American student-body. Although my professional background is research in behavioral ecology, my teaching passion is for data analysis. Why? Because I think data literacy and analytical expertise is one freely available tool to remedy many societal ills and injustices. My course datasets are therefore usually related to these ills. The material is currently delivered in an intensive 4-day workshop. One day, I hope it can be offered as a full course.

From the first round of developing and teaching the workshop, I’ve learned a number of lessons (beyond how to teach mental models that underlie ggplots). I can group these into 3 general areas.

1. Creating culturally relevant and inclusive content and structure
  
2. The importance of logistics and technology
  
3. A teaching attitude that’s make-or-break for beginners


# **1.	Creating culturally relevant and inclusive content and structure**

In an inclusive classroom, we’re addressing two big issues. First – is the material personally relevant? Second – is the material accessible and safe to engage with? ^[[Guide for Inclusive Teaching at Columbia](https://cpb-us-w2.wpmucdn.com/edblogs.columbia.edu/dist/8/1109/files/2020/02/Guide-for-Inclusive-Teaching-at-Columbia_Accessibility-Revisions_15-January-2020_FINAL.pdf)] 

Skills in coding and statistics grow through application, which happens best when students are motivated to answer a question. If one of our goals as instructors is to increase diversity in STEM and data science, then we need to become literate on a diversity of questions that people are motivated to answer.

For this workshop, I've chosen the route of letting students choose among datasets on public health and social justice issues. These topics are too widely pertinent to Native peoples, e.g. diabetes ^[[Call to action: A new path for improving diabetes care for Indigenous peoples, a global review](https://www.sciencedirect.com/science/article/pii/S0168822716302467)], cancer ^[[Cancer in Indigenous Populations](https://www.thelancet.com/series/cancer-in-indigenous-populations)], suicide ^[[The Native American Identity Crisis and the Rise of Suicide](https://blog.nativehope.org/february-spotlight-native-american-identity)], and gun crime ^[[Gun Violence Has a Major Impact on Native Communities in the United States](https://www.teenvogue.com/story/gun-violence-has-a-major-impact-on-native-communities-in-the-united-states)]. Now, no group is homogenous and it is inaccurate to think that every member of a marginalized group is interested in social justice; however, these topics do draw the interest of my students. They are also issues that the power of data literacy can help students solve in their lifetimes. In the future, I plan to incorporate datasets on other contemporary issues, such as social media usage (similar to [Girls Inc of NYC](https://www.elsevier.com/connect/teaching-data-science-through-the-lens-of-social-justice-issues)), as the current hard-hitting topics may turn-off some students. The provided datasets serve as the basis for group projects, in which students hone and analyze their research questions.

To create a safe and engaging classroom structure, I take a few different abstract and concrete steps...

In the abstract, I first understand that for many Native Americans, and other historically marginalized populations, community and storytelling are a central part of life, playing massive roles in individual identity. The culture of many classrooms does not always value communities and their stories in the same way... Western higher education was established in a highly individualistic culture, whose Protestant Christian roots emphasize dutiful and successful work (not necessarily community) as a core component of individual identity ^[[The Protestant Ethic and Higher Education in America](https://www.jstor.org/stable/pdf/1050005.pdf?refreqid=excelsior%3A2bea6bf49df970ca4232f691609d8547)]. This culture has been introduced to the world too often via painful and dehumanizing experiences, like colonization, conquest, genocide, and slavery ^[[Higher Education in the United States](https://education.stateuniversity.com/pages/2044/Higher-Education-in-United-States.html)]. So, the elevation of the individual through hustle and perfection, which is a common ambition of higher education, does not always feel familiar to students, and if familiar, it does not always feel safe. For many students, instead, a focus on community and connections to community makes classroom material much more accessible. 

Second, I try to adjust my perspective as a teacher, understanding that

- *I am operating on stolen land.*
- *My students likely have an inseparable connection to their communities and their land.* 
- *My students are strong and resilient in the face of intergenerational trauma.*^[[The National Native American Boarding School Healing Coalition - Impact of Historical Trauma](https://boardingschoolhealing.org/education/impact-of-historical-trauma/)]
- *My own notions of health, medicine, and justice are highly individualistic and institutional.*

Then concretely, I put the following principles into action.

- *The destination is clear*: Roadmapping is central to effective teaching in any classroom. One of the biggest barriers for students are the tacit expectations teachers place on them, including why they are taking the class and their performance and behavior in it. Students should have a clear outline about what we're doing throughout and at each stage of the course: what they will learn from it, how and when their performance will be evaluated, and how it will be useful to them outside the classroom. Yup, a good written syllabus + explicit and regular expression of expectations and learning objectives are foundational for inclusive classroms. Doing this well takes time, practice, and planning. ^[[Learning Objectives and Backward Design](https://tep.uoregon.edu/learning-objectives-and-backward-design)]

- *Everyone is up to speed*: At the end of any 15-20 minute lecture chunk I use low-stakes, formative assessments (e.g. ungraded quizes^[[Formative vs. Summative Assessments: What's the Difference?](https://www.aeseducation.com/blog/formative-vs.-summative-assessments-what-do-they-mean)]) to focus everyone's attention on the big picture of what we've just talked about and track/realign any misconceptions.

- *Representation matters*: For slideshows, I aim to highlight Native people that are working to solve the problems showcased in each dataset. Whenever possible, I also choose pictures of native people applying the skills that the students are learning. Each of these gives students role models, so they can envision themselves doing data analysis for public health and social justice.

- *Make the connection*: Upon choosing their data set and at mileposts during their analysis, I ask students to express how the data relates to them and their communities, and how they can share insights from the data with others. Letting students tell their stories builds trust. In the future, I plan to use a talking stick as each speaker shares.

- *You have agency*: I let students decide on their project datasets.

- *We’re a team*: Working in groups begins early. In teams of 3-4, students alternate roles as “lead investigator”, “coder”, and “reporter”. The teams take time to communicate as a class via their reporters.

- *Tell me more*: I always end with a survey (I use SurveyMonkey). This gives students a clear chance to let me know what datasets spoke to them, what tripped them up, and what types of data they’d be interested to work with in the future (as well as the various technical skills they’ve gained).


# **2. The importance of logistics and technology**

Attitudes are vital. Unfortunately, they can't do much if technical difficulties completely hamper students' engagement with material. The students we seek to recruit and empower in STEM will often be in resource-limited institutions and this will require additional tricks and strategies from instructors.

One of the easiest ways to run damage-control in a workshop or classroom is to **limit class size**. I know, this doesn’t sound very inclusive, but I choose to cap workshops at 15 and only work with students that actively choose to participate. I find this ensures a baseline of motivation and allows me to be most effectively hands-on. I know of really fantastic and successful courses with > 100 students – these have gone through many several iterations to test and develop effective infrastructure. Maybe I can grow up to be like them.

Otherwise, *the big idea is to come prepared.* 

For class **startup**, I try to have different Wi-Fi dependent and independent options. To be clear: Wi-Fi can be a BIG problem.

- I have a version of all materials on RStudio Cloud **(Wi-Fi dependent)**. The cloud’s workspaces and projects for courses and workshops are fantastic. If you’re not already familiar with it, I recommend [this tutorial](https://resources.rstudio.com/webinars/rstudio-cloud-in-the-classroom) from Mine Çetinkaya-Rundel. Unfortunately, RStudio Cloud is sometimes slow, extremely slow with weak Wi-Fi, and of course simply non-existent when Wi-Fi is down. 
- I’m lucky to teach in a computer lab -- I can coordinate with IT ahead of time to have R and RStudio installed on every computer (yes, time and labor intensive for someone). I have my most recent exercises and assignments posted online for them to download at the start and then run Wi-Fi free **(minimal Wi-Fi dependence)**. I also put my scripts on thumb drives **(Wi-Fi independent)**, for the worst case scenario – zero Wi-Fi. 
- For the future, when students might bring in their own computers, I’m working on (and asking others to help) write bash scripts for different machines, which install R, Rstudio, and several base packages. I can distribute these bash scripts, and R scripts for the day’s exercises on thumb drives **(total Wi-Fi independence)** and have students go through dreaded installations with minimal pain. In any case, I do some intros and demos (fun) before installations begin (not fun).

For **presentations**, I have a powerful mini projector with blue tooth connection (an Anker Capsule, many thanks to NIH research funding). So regardless of the awkward shape or layout of the room available to me, or however weak the projector is, I know I have my own flexible little powerhouse whose ins-and-outs I’m intimately familiar with.  

There are two other workarounds (both Wi-Fi dependent) for students to watch **live coding** when visibility is poor. First is an institutional Zoom account that allows me to share my screen with several students. Another is the new `livecode` package from Colin Rundel that I’m excited to try. Check out the demo from Rstudioconf::2020 [here](https://resources.rstudio.com/rstudio-conf-2020/lightning-talk-colin-rundel). Essentially, your RStudio IDE is constantly creating a web page of your work, which your students can watch with the appropriate link.

# **3. Finally, a make or break attitude for teaching beginners**

We generally know, but regularly need to remember... When we first saw R or an RStudio IDE it was daunting and foreign. We may have since grown complacent and/or proud, having conquered many tasks through hours (or years) of debugging and google searches. Despite this, we can't give in to the temptation to trivialize, oversimplify, or show off skills in front of students. Our goal is to educate - not to impress and not to be lofty beacons of knowledge. In my experience, flashy shows and rapid demos often succeed at disheartening talented people. Knowledge and skills will feel unattainable to all but a very small percentage of type-A students. 

So, I’ll end here. One thing I love about the RStudio community is that this reminder is rarely necessary. People I encounter whose knowledge far exceeds mine most often act with humility and respect for everyone’s stage of the journey. I’m deeply grateful to the RStudio community and education department for their support and training. From my start as a conference diversity scholar, to receiving instructor certification, to this guest blog post -- RStudio has played an enormous part of my teaching journey. Thank you, RStudio! 

**Additional, recommended reads:**

["Good Teachers Embrace Their Students' Cultural Backgrounds"](https://www.theatlantic.com/education/archive/2013/11/good-teachers-embrace-their-students-cultural-backgrounds/281337/)  
["Why Diversity Training Isn't Enough"](https://newrepublic.com/article/156032/diversity-training-isnt-enough-pamela-newkirk-robin-diangelo-books-reviews)  
["How Teachers Can Reduce Stereotype Threat In The Classroom"](https://cesp.rutgers.edu/blog/how-teachers-can-reduce-stereotype-threat-classroom)  

**Acknowledgments:** I thank Dr. Alfonso Heras Llanos, a math professor at SIPI, who helped me implement this workshop. I also thank my friends and colleagues Tammi Duncan and Carla Sakiestewa of the Navajo, Hopi and Lakota Nations, who provided helpful comments and feedback while developing this workshop and this post.

Twitter: @NicoleAlineSci  
