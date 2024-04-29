# 2024-group-19

[![Header](ReportMaterial/welcomPage.png)](https://youtu.be/xEocnZ7FiOo)
Click the image to see our game's video :)

### Team
<figure> 
  <img src='/ReportMaterial/MicrosoftTeams-image.png'alt="group photo" style="width:100%"/>
</figure>


L -> R: Jamie Bell Thomas, WeiJian Li, Xinyue Feng, Charmaine Suah, Hsuan Lin



| Name (github username)  | Email |
| ------------- | ------------- |
| WeiJian Li (@LassonLi)  | me23202@bristol.ac.uk  |
| Xinyue Feng (@XinyueFeng99) | qg23773@bristol.ac.uk  |
|Charmaine Suah (@Csuah09) | zx23187@bristol.ac.uk |
| Hsuan Lin (@HsuanLin322) | ev23671@bristol.ac.uk  |
| Jamie Bell Thomas (@jamiebellthomas) | ws19177@bristol.ac.uk |

[**Game Video**](https://youtu.be/xEocnZ7FiOo)




# Table of Content 
* [Introduction](https://github.com/UoB-COMSM0110/2024-group-19?tab=readme-ov-file#introduction)

* [Requirements](https://github.com/UoB-COMSM0110/2024-group-19?tab=readme-ov-file#requirements)
    * [Use Case specifications](https://github.com/UoB-COMSM0110/2024-group-19?tab=readme-ov-file#use-case-specifications)
    * [Early Designs & Ideation](https://github.com/UoB-COMSM0110/2024-group-19?tab=readme-ov-file#early-stages-design--ideation-process)

* [Design](https://github.com/UoB-COMSM0110/2024-group-19?tab=readme-ov-file#design)

  * [Class Diagram](https://github.com/UoB-COMSM0110/2024-group-19?tab=readme-ov-file#class-diagrams)
  * [Behavioural Diagram](https://github.com/UoB-COMSM0110/2024-group-19?tab=readme-ov-file#sequence-diagram)

* [Implementation](https://github.com/UoB-COMSM0110/2024-group-19?tab=readme-ov-file#implementation)
  * [3 Challenges ](https://github.com/UoB-COMSM0110/2024-group-19?tab=readme-ov-file#challenges) 

* [Evaluations](https://github.com/UoB-COMSM0110/2024-group-19?tab=readme-ov-file#evaluations)
  * [Qualitative Evaluations](https://github.com/UoB-COMSM0110/2024-group-19?tab=readme-ov-file#stage-1--mid-production-evaluations)
  * [Quantitative Evaluations](https://github.com/UoB-COMSM0110/2024-group-19?tab=readme-ov-file#system-usability-scale-1)
  * [Evaluation Descriptions](https://github.com/UoB-COMSM0110/2024-group-19?tab=readme-ov-file#wilcoxon-significant-testing)


* [Process](https://github.com/UoB-COMSM0110/2024-group-19?tab=readme-ov-file#process)
    * [Tools](https://github.com/UoB-COMSM0110/2024-group-19?tab=readme-ov-file#tools-used)
    * [Reflections](https://github.com/UoB-COMSM0110/2024-group-19?tab=readme-ov-file#reflection)

• [Conclusions](https://github.com/UoB-COMSM0110/2024-group-19?tab=readme-ov-file#conclusion)


# Introduction

In our single player roguelike survival game, the player takes on the role of a one-man army in a post-apocalyptic scenario, aiming to survive against waves of zombies using evasive techniques and power-ups that have a chance of spawning when you defeat an enemy. Our main character is moved through the manipulation of the ‘W’’A’’S’’D’ characters, with a continual stream of bullets shooting out of the character, whose trajectories are controlled by the position of the mouse. Players must be careful with the way they strategise to ensure they don't get trapped by the oncoming hoard. The game has 2 built in difficulty levels, and while there is no difference in the core mechanics of either levels, the harder setting creates a much more aggressive round structure, resulting in enemies spawning more frequently, moving faster, and being harder to defeat. The game is based off a mobile game “Suvivor.io" ([AppStore](https://apps.apple.com/sg/app/survivor-io/id1528941310) & [Google Play](https://play.google.com/store/apps/details?id=com.dxx.firenow&hl=en&gl=US&pli=1)). In this game, the user must fend off a continual onslaught of zombies to save their city. To make this game differ from it's inspiration we implemented 2 unique features. 

The first is an endurance bar that depletes when the player is moving and replenishes when they are stationary, creating an additional layer of strategy by forcing them to manage their endurance while safely navigating their way through the incoming waves of enemies. Our team found that this endurance bar idea managed to be both interesting and novel without hindering the quality of the game.

<figure>
  <img src="ReportMaterial/StaminaDemo.gif" alt="stamina demonstration" style="width:50%">
  <figcaption>Demonstration of stamina mechanics</figcaption>
</figure>


The second was in-game power-ups that have a chance of spawning when an enemy is defeated. We found that these power-ups not only made the latter stages of the game more accessible, but also increased user satisfaction by making the game more stimulating. 

<figure>
  <img src="ReportMaterial/powerUpDemo.gif" alt="power-up demonstration" style="width:75%">
  <figcaption>Demonstration of power-up collection and effects</figcaption>
</figure>



---

# Requirements

## Early stages design & Ideation process

In inital stages of development, our group brainstormed several types of games. Every team member introduced a game that he/she had researched prior to the meeting. Three members introduced their ideas that were similar to MATCH-3-GAMES. Another member introduced a 1v1 soccer game. The last member introduced a  a 2D-Wave-Survival game. The majority opted for the survivor game through an anonymous voting system. It was selected because it offered a comparatively low minimal viable product requirement, while retaining ample room for overhead expansion into a more intricate game. Furthermore, the structure of the game leant itself to the concept of varying difficulty levels quite nicely. We started to discuss the basic functionality of the game. 

In the following weeks, we employed use-case diagram, user stories and use-case-specifications to set up initial requirements for our game. To better understand the purpose users may have in our game, we created different User Stories as the basis of our requirement engineering. After which, we used use-case specifications to experiment with the basic flow of pages that the player would interact with. To further visualise these requirements, we created a paper prototype. The paper prototype allowed us to discuss as a team and identify potential issues with the game flow. Furthermore, being able to visual the game allowed the team to refine and adjust the game mechanics and layout of the different pages. Most importantly, a benefit of visualising the game allowed some members to be inspired and implement key features, such as the endurance bar and the mechanics behind the scoring of the game. However, one key challenged we faced during early stage designs was balancing all the different ideas we had without overwhelming the game. As such, we had to find a right balance of potential ideas and implementation. The teamed looked back at the User stories to choose those ideas that best fit the purpose of the users. Overall, the early stages of design was a fundamental step in the teams ability to have a shared understanding of how we wanted the game to look design wise, and identify key mechanics that were needed for the game to flow the way it was imagined. 


## User Stories

* “As a **Developer**, I want to have **a twist in the game** so that the game is **more fun and unique** ”

* “As a **User**, I want to **understand the game instructions** so that **I can play the game intuitively** ”

* “As a **Teacher**, I want to **be specific** so that **I can mark the game accurately to the marking scheme** ”

* "As a **Negative Stakeholder**, I want to **find some bugs and difficulties in this game** so that **I can provide some feedbacks for developers and earn money from them**"
* As an **Original Developer** I want to **protect my intellectual property** so that I can **protect my rights** 




<!--[survivor](https://www.bilibili.com/video/BV1Q4421F7zK/) -->

<br>

## Use-Case Specifications


*Login use case*

>System shows: Login page display

>User input: login parameters for score-board

*Difficulty level choosing use case*
>use mouse to choose level of difficulty for game

*Lore use case*

>use arrow buttons or 'Enter' to move between lore and instructions 
>System shows: instructions of game, highlighting the instruction on the oxygen endurance bar, how to move and shoot and the aim of the game.


*Entered main page of game*

>User inputs: 'enter' as start game button

>User starts playing using WASD, and the automatic gun shoots through aiming with a mouse

>System creates: more zombies zoning into the user in waves

>Character continuously shooting bullet, moving around around according to the user’s mouse input

>Once moving and defeating zombie, system display health decrease if user attacked by zombie. With continuous movement, the endurance bar will depleat and user will need to stand still to replenish their endurance bar to move again. 

>System displays warning signs when endurance bar is low or getting hit by zombies

*Menu page use case*
> User inputs: 'm' during game to switch to menu page
> System displays: instructions about the game, current score, and leaderboard
> Users inputs: 'Enter' to resume game, or 'Shift' to quit the game

*Entered page of wave 2*

>System display next wave

>System needs to reset the different bars

>Repeat until end of game, with enemies that are harder to kill, either by needing more damage to kill or increased enemy points. 

*Entered page of death after wave 2*

> Show game over page:
> User input: right arrow for leaderboard that shows top 10 scores
> If they are existing players, higher scores placed above previous scores. 
> User input: 'Enter' to restart the game

>System display back to original page showing the login

## Use-case Diagram
<figure>
  <img src='/ReportMaterial/Use-case diagram.png' alt="use case diagram" style="width:100%"/>
</figure>

## Paper Prototype
<figure>
  <img src='/ReportMateiral/game_video.gif' alt="paper prototype" style="width:30%">

</figure>

Click [here](https://www.bilibili.com/video/BV1Q4421F7zK/) to watch our Game Paper Prototype!

# Design 



## Class Diagrams
Generally speaking, the game's architecture will have 3 layers of granularity. 

### Entity Level
The first and most fundamental level is the entity level. Each instance at this level represents the physical state of a given entity whether it's an obstacle, an enemy or even the character itself. Attributes stores at this level usually include the (x,y) position, the speed, and image used to represent the entity. Methods stored at this level usually look at updating and rendering the position of entities where applicable. 
### Manager Level
The second level is the manager level. Each manager class is responsible for governing the collective behaviour of it's respective entities. Some examples of this are the EnemyManager class which will handle the incrementing difficulty of enemies that are spawned and the BulletManager class which will monitor all active bullets, removing those that have either had a collision, left the game world, or gone off screen.
### Control Level
The highest level is the control level. This is the Main class in the script it's role is to continually call the update methods of each of the Manager classes. This pivotal role not only ensures the synchronisation of the various game elements but also facilitates the smooth progression of gameplay dynamics. This layered systems-based approach not only enhances the efficiency of game management but also contributes to the overall player experience, ensuring a seamless and immersive gameplay journey. Moreover, this structured approach facilitated highly effective test-driven development by providing clear progressions from unit testing to integration testing and finally to system testing.

The proposed structure is shown in the System Class Diagram below.
<figure>
  <img src='/ReportMaterial/classDiagram.png' alt="class diagram" style="width:100%">
</figure>
<strong><u>Progression Through the Game</u></strong>

The user's progression through our game will be managed collectively by two key components: a switch-case statement in the main class and the public pageNumber attribute in the PageManager class. Within the PageManager class, methods will be implemented to handle the formatting for each page as well as providing instructions for incrementing the pageNumber attribute. Subsequently, the switch-case statement in the main class will call the appropriate PageManager method based on the current pageNumber value. This implementation will not only create a seemless user progression through the game but will also work very well inside the draw function which is conotinually running. 

<strong><u>Other Classes</u></strong>

There are a few additional classes that haven't been covered thus far.

The first is the Animation class. For now this will only be applied to dynamic entities (Character & Enemy). Its primary attribute will be an array of image arrays. This array will have 4 image arrays, with each sub-array representing an animation sequence of sprites travelling in one of the 4 fundamental directions. The sub-array that is chosen for render will depend on an array of boolean expressions, which in-turn represent the statuses of the W,A,S & D keys (true = pressed and false = not). Some simple conditional logic should be enough to implement this effectively. Once the correct sub-array has been selected it will simply be a case of looping through the images in this array. 

The second is the Round class. This will called as part of the EnemyManager class and will calculate Enemy health, speed and number as a function of the current round number & return it to the EnemyManager class so it can deploy an appropriate wave of enemies. 

The final class worth mentioning is the Backgroud class. This class will be responsible for rendering the background appropriately relative to the players current position to create the perception that the player is moving across a large landscape. 

## Sequence Diagram
The above structure should ensure a smooth process from the perspective of development, however it offers little with regards to illustrating interactions between different objects within the system. The proposed sequence diagram for this system can be seen below. 
<figure>
  <img src='/ReportMaterial/sequenceDiagram.png' alt="class diagram" style="width:100%">
</figure>

The diagram outlines the proposed sequence of events for each loop of gameplay, divided into four sections.

1. Position Update and Collision Detection: 
This loop begins by updating the positions of the Character and all enemies using the EnemyManager class. It then checks for collisions, deducts health points, and ends the game if necessary.
2. Bullet Handling and Collision Resolution: 
In this section, the system checks if a new bullet needs to be spawned. The CollisionManager then utilises a nested loop to detect collisions between bullets and other entities, taking appropriate actions when collisions occur.
3. Rendering: 
The third step involves rendering the new positions of the background, obstacles, and border trees, ensuring that the visual representation of the game world is updated accordingly.
4. Power-up Proximity Check: 
Finally, the system quickly checks if the player is in proximity to any spawned power-ups, enabling the player to interact with these beneficial items as needed.

This organised sequence aims to elevate gameplay quality by ensuring smooth mechanics and seamless interactions between game elements. With clear steps for position updates, collision detection, rendering, and power-up checks, players will be able to enjoy a refined and engaging gaming experience.

---

# Challenges of Implementation 

The 3 most significant challenges that were encountered during the development of this game were: 
1) Implementing a Dynamic Background
2) Enemy Separation
3) Enemy Obstacle Nagigation
## Challenge 1. Dynamic Maps
   
Originally, the game was was made up of entities moving around a static map, where all enemies converged on the characters potition. This created the immediate issue that entities could wonder off-screen and not be able to find their way back. However this was quickly fixed by establishing a simple coordinate boundary that limited all entity positions to within the area on-screen.
  
However, a persistant piece of feedback that emerged through qualitative evaluations was that the game could become more engaging with a larger map extending beyond the confines of the screen. Such an expansion would serve two primary purposes: fostering a sense of exploration and enabling the spawning of a greater number of enemies without overcrowding the map. Implementing this proved to be conceptually challenging. To do so, all entities, including the map and any onscreen obstacles had a set attributes representing their x,y coordinates. Entities that move such as the Character and enemies had these attributes updated on each iteration. From there, the Character was rendered in the middle of the screen and new set of x,y measurements were generated for each entity. These measurements represented their position relative to the Character, and therefore where they should be rendered, even if it was off-screen. This presented an issue, when the player approached the edge of the map, the render of background would no longer fill the screen. To solve this, the original boundary condition was ammended to create a vertical and horizontal margain equal to the half the width and half the height of the screen respectively. This created an 'invisible barrier', so trees were rendered in this margain space to display to the user that it was out of bounds. These ideas are shown in the diagrams below.

1. This figure visualises the relatively simple calculations behind rendering the characters, background, and enemies on a __static__ background:

<figure> 
  <img src='ReportMaterial/staticBackgroundCalcs.jpg'alt="static map rendering calculations" style="width:90%"/> 
</figure>
2. This figure visualises the relatively complex calculations behind rendering the background and enemies relative to a centralised character in-order to create the perception of movement 
<figure> 
  <img src='ReportMaterial/dynamicBackgroundCalcs.jpg'alt="dynamic map rendering calculations" style="width:90%"/> 
</figure>
3. Finally, this figure shows the previously mentioned margains, and how they are defined.
<figure> 
  <img src='ReportMaterial/margainDemo.jpg'alt="background margain demo" style="width:90%"/> 
</figure>

## Challenge 2. Enemy Separation

In early iterations of the game, enemies were allowed to overlap freely. This created an issue. With all enemies are trying to proceed to the same point on the map (the coordinates of the player), it became a common occurrence that they coalesced into a single entity, significantly detracting from the quality of the game. To combat this, we utilised a component of the bio-inspired algorithm called Swarm Intelligence.
Swarm Intelligence is a mathematical representation of a sub-set of systems that exhibit emergent complexity, and one of its underlying behaviours is Separation, which ensures that the action space is delegated amongst the swarm’s agents.
To enforce this each enemy has a protected radius, and when other enemies enter that radius, it ‘steers away’ from them by calculating a deflection vector. This deflection vector represents the optimal direction of travel to avoid collisions with nearby objects, creating a separation between them.
This idea is displayed in the figure below:
<figure>
   <img src='ReportMaterial/separationDemo.jpg'lt="swarm intelligence separation" style="width:60%"/> 
</figure>
This figure shows the effect of the Enemy Separation algorithm:
<figure>
  <img src="ReportMaterial/SepvsNoSep.gif" alt="stamina demonstration" style="width:70%">
</figure>


## Challenge 3. Enemy Obstacle Navigation

When obstacles were implemented, an immediate and pressing issue revealed itself; enemies were getting 'stuck' against these obstacles far too easily. Up until this point, collision resolutions was handled simply by resetting enemies to their previous position whenever they entered an illegal area. However this solution proved to be completely ineffective in this instance as no ability to circumnavigate obstacles were offered should the need arise. A new form of collision avoidance was required. 

For the purposes of collision avoidance calculations, the obstacles are modelled as circles and if an entity were to breach the circumference of that circle, their position would be reset to what it was in the last iteration. What was required was for the enemy to navigate along the circumference of the obstacle border when encountering an obstacle. In that statement lies the key for the chosen solution. At the point of contact, both possible tangents are calculated. From there the tangent that is closest to the bearing from the enemy to the player was chosen as the new vector for that iteration. Repeating this process over the course of multiple successive iterations created the perception of seemless movement around obstacles. 
1. Figure showing the concept of tangent generation and selection.
<figure>
   <img src='ReportMaterial/tangentialMotion.jpg'lt="tangential modion demo" style="width:80%"/> 
</figure>

2. This figure shows the effect of the Obstacle Avoidance Algorithm.
<figure>
  <img src="ReportMaterial/ObsvsNoObs.gif" alt="Obstacle avoidance demo" style="width:70%">
</figure>


These challenges and their implementations are also explained in our [game video](https://youtu.be/xEocnZ7FiOo).


   ---

# Evaluations
## Stage 1 : Mid-production Evaluations


Think Aloud Participant #1:

Positives: fun game 

Negatives: There aren’t many fun or interesting movements available to the character. Its also not necessary for the character to move to play the game. Without prior experience of playing games on a keyboard, it as difficult to understand how to play the game. Felt that the colour scheme of most elements in the game was too similar, making it hard to see. The game would benefit from a leaderboard feature to save past scores to create a sense of improvement. Misunderstood that it is not necessary to click on the mouse to shoot. 

---

Think Aloud Participant #2:

Positives: good amount of challenging. 

Negatives: Unsure what stamina means or how it effects the game. Felt that the background was too colourful and distracting from the enemy. When the enemy is too close to the character, the visuals of the bullet deteriorate. The font used for texts are too small and white text makes it hard to see. Wasn't able to fully understand the pre-game instructions. 

---
### Heuristic Evaluation 
<figure>
  <img src='/ReportMaterial/HeuristicEvalS1.png'lt=" heuristic evaluation stage 1 " style="width:100%"/>
</figure>

Based on the Heuristic Evaluation of the different game pages, we found that the issues surrounding the aesthetic design of the game was severely impacting the player's experience.


---
### System Usability Scale
<figure>
<img src='/ReportMaterial/SUS.1.png' lt=" SUS stage 1 " style="width:100%"/>
</figure>

The final score was derieved and processed accordingly based off the question number. Odd numbered questions had 1 subtracted from their scale score whilst even numbered questions were subtracted from 5. The cumulative scores were then multiplied by 2.5 to transition it from a 0-40 scale to a 0-100 scale. The processing of the SUS scores was completed in Microsoft Exel. 

---
### NASA TLX
<figure>
  <img src='/ReportMaterial/TLXstage1.png' lt=" TLX stage 1 " style="width:100%"/>
</figure>

The NASA TLX questions were subjected to pair-wise comparisons by users who underwent TLX scoring. These comparisons yielded weightings for each category, calculated using the average scores. These weightings were then utilized to determine the final aggregate workload. Each individual score was multiplied by the corresponding question weightage and divided by 15.

The TLX scores revealed that the predominant effort required to engage with the game stemmed from the performance of each player, their exertion, and the frustrations encountered during gameplay.

---
### Insights

Through analysing the data recorded from the qualitative and quantitative evaluations of the first stages of development, after we had our first viable product. 
We identified some key themes that guided our development onto the next stage for further improvement based on feedback. 
Key Themes:

- Poor colour scheme for text, characters and background.
- Need more clearer instructions on the game and have instructions be more accessible.
- Background and characters need more interactive features.

As such, the team underwent brain storming to further improve the game whilst using these themes as the basis for improvement. Together, we decided to change the background and include obstacles for the player to navigate. Secondly, we wanted a dynamic screen to follow the player, allowing for a larger map. Thirdly, we will be making some design changes to the enemy and choosing a more distinct but complementary colour for the texts. Finally, we'll include a help button that the player can use whilst playing the game to re-familiarise themselves with the rules.

---
## Stage 2: Final evaluation 

The team held another SUS evaluation after redesigning the game. Changes to the design included a fixed font and colour throughout the game, change in ingame background and a menu button to remind users of the instructions and ability to exit the game safely. These changes aimed to help distinguish the text and the backgrounds to be more distinct and clearer, whilst maintaining an aesthetic 8-bit look to the game. 

### System Usability Scale
<figure>
  <img src='/ReportMaterial/SUS.2.png'lt=" SUS stage 2 " style="width:100%"/>
<img src='/ReportMaterial/SUS.3.png'lt=" SUS final " style="width:100%"/>
</figure>



### Wilcoxon Significant Testing 

To evaluate if there was a significant difference in usability, the team used Wilcoxon Ranked test from on online W-test calculator. https://www.statology.org/wilcoxon-signed-rank-test-calculator/. We used the final System Usability Scale results of both Stage 1 (pre-design changes) and Stage 2(post-design changes) for the W-ranked test. 
<figure>
  <img src='/ReportMaterial/TtestScore.png'lt=" SUS stage T test " style="width:100%"/>
<img src='/ReportMaterial/alphaLevel.png' lt=" alpha levels " style="width:100%"/>
</figure>


We found that there was a significant improvement in usability. With a T test score of *t(10)= 6,  p=0.05* on 10 non-paired pairs, our results indicated with a 95% certainty that the significant difference in our design was due to our design changes and not because of random noise. Furthermore, with the average score of 72.1, our SUS testing (post design changes) scored above the average score of 68, indicating good usability practices in our game. 



# Process 

## Teamwork:


Our team relies on Microsoft Teams for our primary communication channel, allowing us to facilitate regular meetings. During these sessions, we thoroughly review our Kanban board, adding and delegating tasks as needed. Using the Planning Poker method we delegate Kanban tickets to compile a to-do list for the each group member for the upcoming sprint. Task assignments are also tailored to individual strengths. Upon sprint completion, we convene to present the changes and assess their impact on the game, while also reminding each other to perform a git-pull to sync with the latest repository version. Before concluding the sprint, we finalise the date and agenda for our next meeting, updating these decisions on the Kanban board and reiterating them in the Team's chat for clarity and alignment.


## Tools used:

**Microsoft Teams** as a way for communication:
> Used to keep group members updated\
> Used to request support from other group members\
> Used to organise time and place for out next meeting

**GitHub** for version control:
> Made sure we only committed and push working code\
> Made sure our commit messages were helpful and discriptive\
> Utilise branches for feature development, only merging to main once it has been succesfully developed and tested

**GitHub** for KanBan Board:
> Tracked the overall progess of tasks that needed to be completed.\
> Tracks which members completed which tasks should a completed task need to be revisited\
> Individual sprint board for to further help prioritise the task needed for that session.
<figure>
  <img src='/ReportMaterial/KanBan.png' lt=" Kanban" style="width:100%"/>
</figure>


The utilisation of these tools significantly enhanced our clarity regarding the tasks at hand as well as our individual roles within the team. With regular updates to the board, we effectively monitored our progress and adjusted our plans to navigate the challenges encountered. By keeping communication open, we listened to each other and understood different viewpoints, making our team stronger. This helped us grasp tasks better and work together more effectively to overcome challenges.

---

## Team Roles:

While every member contributed to the delivery of the game, individual roles were assigned based on background skills. For instance, members with strong coding skills took on leadership roles in code development, delegating tasks to others. Organised members assumed the role of project manager, overseeing project progress, while creative members focused on video presentation and asset design.


# Reflection & Contributions

| Name (github username)  | Contribution |
| ------------- | ------------- |
| WeiJian Li (@LassonLi)  | 1.0  |
| Xinyue Feng (@XinyueFeng99) | 1.0  |
|Charmaine Suah (@Csuah09) | 1.0 |
| Hsuan Lin (@HsuanLin322) | 1.0  |
| Jamie Bell Thomas (@jamiebellthomas) | 1.0 |


Charmaine: 

I feet that with all group work comes with friction and misunderstandings, but as this group has proven, with the joined mindset of providing the best product forward, we can all commit and work together to do our best. I am glad to have this group mates who are willing to put forward their best foot and help out the other teammates and I am grateful that the whole team was very involved in every stage of the process. 

XinYue: 

I really enjoy the whole process of us figuring out the idea for the game. A lot of the initial design had to be modified during the process, and that is the chance we got to understand and practice agile development and teamwork. In the team, every member contributes their understanding of what makes the game work well and what makes it appealing to people. Therefore, we have a broader view of how to deliver a quality product. 

Jamie: 

My main responsibility was the development of the source code. I played a key role in the development and testing of base mechanics of our game. Once a minimal viable product had been developed, I took a step back and restructured our code base, focusing on the principals of agile object orientated design. This increased the readability, performance and robustness of the code significantly - making it simpler to understand and further develop our game. More recently I have been working on higher level features such as the dynamic background as-well as the ‘power-up’ mechanics and entity animations. Overall, I have thoroughly enjoyed working as a part of this team. I feel we have placed great emphasis on regular communication, creating a clear sense of direction for this team and allowing a wide variety of ideas to be considered. 

WeiJian: 

During the whole process of game design, I find the agile development more important than the waterfall development since we just change our game continuously. For my job, I am responsible for coding the fundamental structure of our game. Although I finish the basic code at a early stage, our team wish to optimize the game to a top level. Therefore, all of us needs to reconstruct our code as well as adjust it to the new demand. It is not a easy process, but it is worth since the game becomes a better one.

LinHsuan:  

Upon discovering the task of designing a game in groups before the semester's end, I initially felt overwhelmed. However, through regular face-to-face group discussions and consistent effort, we gradually overcame obstacles and made progress.
In my role, I undertook game display design tasks such as creating game characters and designing instruction pages. Designing a good game is not easy. With each meeting, our collective vision becomes clearer, and our tasks more manageable. Our teamwork and dedication are paving the way for us to steadily close the gap towards achieving our objective.

# Documentation of code

Please see [Documentation ](ReportMaterial/Documentaion.md)


# Conclusion 

In conclusion, our game brought forth multiple challenges we had to face, but introduced opportunities for independent learning to counter these challenges. This project encapsulated the creation of the game by incorporating portions of requirement engineering, game design, system architectures to provide a fun and interesting gaming experience. The challenges we found ourselves facing not only made us realise how important communication and independent learning was, but we realised that working together as an agile unit helped us develop ideas and implement them succesfully. Reflecting on our journey, we recognise that while the core concept of the game remains intact, we've learned that game development is an ever-evolving process. It's essential to maintain flexibility and embrace new ideas as they arise to ensure the project's continued growth and success.

During the development stage of the project, our team struggled with balancing the ideas each of us had without overwhelming the game with too many features. To address this issue, we learned to take reference to our requirement engineering as an anchor. This allowed us to prioritise the different features that served the purpose to address the wants of the key users, and view the larger picture of how the game would play out.

In retrosepct, it might be easy to say that the entire process was smooth sailing, however another key challenges the team faced was messy code and the unorganised classes. Aiming to allow the game to be robust and modular, we decided to refactor the game over the Easter break. The majority of the production was held over those 3 weeks. Furthermore, whilst there were technical challenges that we faced during the game production. One of the challenges that blind sighted us was the design aspect. The team did not realise how big of an impact design has on a game, changes to the design made it look like an amateur production to one of better quality. This process brought valuable lessons in incorporating user feedback and keeping them in mind as we modified the game. Additionally, our Wilcoxin Signed-Rank test results indicated that our design changes were signficant, and the above average scores of the System Usability scores indicated good usability. Key changes consistented of using similar backgrounds, fonts, colour schemes in the game made it clearer and adhered to heuristic evaluation principles. In future endeavours, we hope to explore different ways to implement new enemies, each having their unique attacking move, and find creative ways for the User to power up.  

We would also like to use this space to thanks the different artists who gave them their permissions to use their different art works as assets. Other assets from artists who we were unable to contact were open sourced and available to use for school productions. 

| Artist | Asset purpose |
| ------------- | ------------- |
|  [Purple Zaffre](https://www.deviantart.com/purplezaffre) | Assets for character  |
| [TheStoryTeller01](https://www.deviantart.com/thestoryteller01) | Assets for zombies  |
|[Tyler Dunn](https://www.fontzillion.com/fonts/tyler-dunn/8-bit-madness) | 8-bit Madness Font |
| [Forheksed](https://www.deviantart.com/forheksed/art/Evening-in-the-coniferous-forest-603798203) | Game background  |
| [Rezonate](https://www.youtube.com/watch?v=6R9FfC0Sen8) | SWE video song|




<br>



