# 2024-group-19

### Team
<img src='/ReportMaterial/MicrosoftTeams-image.png'/>

Weijian Li ,  me23202@bristol.ac.uk , LassonLi

Xinyue Feng , qg23773@bristol.ac.uk , XinyueFeng99 

Charmaine Suah , zx23187@bristol.ac.uk , Csuah09

Jamie Bell-Thomas , ws19177@bristol.ac.uk , jamiebellthomas

Hsuan Lin , ev23671@bristol.ac.uk , HsuanLin322

### Introduction

In our single player roguelite survival game, the player takes on the role of a one-man army aiming to survive waves of mutated rats and the collection of gems. The gems are generated from killing the rats, allowing for a more powerful weapon or statistical upgrades. Our main character is moved through the manipulation of the ‘W’’S’’A’’D’ characters, with the bullets shooting out of the character oriented through the directions of the mouse. Players can strategise to either kill their way through or survive through the incoming waves of rats. As the player progresses onto the next level, the difficulty of the game increases with more rats that are harder to kill. The game is lightly based off a mobile game “[Suvivor.io](http://suvivor.io/)”. We included an endurance bar that decreases as the character moves as a twist to our game. Leading the character to stay still to build up their endurance and run further after. Our twists allows for an increased difficulty level as the player will need to bare their endurance in mind, simultaneously causing the player to confront the waves of rats.

---

### Game Paper Prototype
<img src='/game video.gif'/>

Click [here](https://www.bilibili.com/video/BV1Q4421F7zK/) or on the image above to watch our Game Paper Prototype!

---

### Requirements

### Use-case Diagram
<img src='/Use-case diagram.png'/>

**Early stages design. Ideation process**

In inital stages of development, our group brainstormed about several types of games. Every team member introduced a game that he/she had researched prior to the meeting. Three members introduced their ideas that were similar to MATCH-3-GAMES. Another member introduced a 1v1 soccer game. The last member introduced a [survivor](https://www.bilibili.com/video/BV1Q4421F7zK/) game, which is a 2D-kill-zombie game. Through an anonymous vote, majority decided on the survivor game due to its creativity as well as difficulty level. In week 3, we started to discuss about the basic function of this game before creating initial paper prototype mock-ups. In the following weeks, we employed use-case diagram, user stories and use-case-specifications to set up initial requirements that wanted in our game. Using our requirements, we redid the paper prototype and recorded a video to depict ideally how our game would flow. During which, we named our game "The Chase". Through the use of careful planning and communication, we then had a plan for how we wanted to implement the game moving forward.


**User Stories**

>“As a << Developer >> I want to << have a twist in the gamel>> so that << the game is more fun and unique >>”

>“As a << User >> I want to << understand the game instructions >> so that << I can play the game intuitively >>”

>“As a << Teacher >> I want to << be specific >> so that << I can mark the game accurately to the marking scheme >>”

>"As a << Negative Stakeholder>> I want to << find some bugs and difficulties in this game>> so that << I can provide some feedbacks for developers and earn money from them>>"

>"As a << Original Developer >> I want to << protect my intellectual property >> so that << I can protect my property >>"

<br>

**Use-Case Specifications**

*Login use case*

>System shows: Login page display

>User input: login parameters

>System checks: checks the parameters with the existing users

> If login parameter exist, match the game login with their account. Else, show user another page for new log in / register account.

*Entered main page of game*

>Show the details of user’s game (levels/ existing highscore/ start game button )

>User inputs: 'enter' as start game button

>System shows: instructions of game, highlighting the instruction on the oxygen endurance bar, how to move and shoot and the aim of the game.

>User starts playing using WASD, and the automatic gun shoots through aiming with a mouse

>System creates: more zombies zoning into the user in waves

>Character continuously shooting bullet, moving around around according to the user’s mouse input

>Once moving and killed zombie, system display health decrease if user attacked by zombie. With continuous movement, the endurance bar will depleat and user will need to stand still to refill their endurance bar to move again. 

>System displays hp to be full (indicator of entering next level system needs to know that we need to go to next level). With more zombie kills, power ups relating to the weapons or health bar will randomly appear to help with user.

*Entered page of level 2*

>System display next level page

>System needs to reset the different bars

>Repeat till end of game, with enemies that are harder to kill, either by needing more hit damage to kill or enemy's health bar increases. 

*Entered page of win after level2*

>Show congratulation page

>System displays high score onto the scoresheet
> If they are exisiting players, higher scores placed above previous scores. 
> First time players places their score in the middle, ighlight the current game score using border
>System shows: most recent 3 scores to show improvement or deprovement from previous games 

>System display back to original page showing the login

### Design 

750 words 
System Architecture 
  - Class Diagrams
  - Behaviour Diagrams

---

### Implementation 
750 words 
Describe implementation + 3 challenges chosen 

---


### Evaluations 
Stage 1 : mid-production evaluations


Think Aloud Participant #1:

Positives: fun game 

Negatives: There isn’t much fun or interesting movements to the character. Its not necessary for the character to move to play the game (but will die faster). Without prior experience of playing games on a keyboard, it might be hard to control the characters. Felt that the colour scheme of most elements in the game was too similar, causing it to be hard to see. Would enjoy a leaderboard to feature or saving of past scores for sense of improvement. Misunderstood that it is not necessary to click on the mouse to shoot. 

---

Think Aloud Participant #2:

Positives: Like that the character can move diagonally and the stamina bar is quite interesting.

Negatives: the enemy’s colour scheme is too similar to the background. Having a border or background of a different colour for instructional texts might be useful. The bullets could be more accurate with the speed of the mouse and it should not be able to hurt more than one zombie with one bullet. The health bar and the stamina bar could be moved down. Would prefer a larger more interactive map. 

---

Think Aloud Participant #3:

Positives: good amount of challenging. 

Negatives: Unsure what stamina means. Felt that the background was too colourful and distracting from the enemy. When the enemy is too close to the character, the visuals of the bullet deteriorate. The font used for texts are too small and white makes it hard to see. Did not catch or fully grasps what the instructions were before starting the game. 

---
**Heuristic Evaluation** 

<img src='/HeuristicEvalS1.png'/>

---
**System Usability Scale**
<img src='/SUS stage 1.png'/>
---
**NASA TLX**
<img src='/TLXstage1.png'/>

Through analysing the data recorded from the qualitative and quantitative evaluations of the first stages of development, after we had our first viable product. 
We identified some key themes that guided our development onto the next stage for further improvement based on feedback. 
Key Themes:

- Poor colour scheme for text, characters and background.
- Need more clearer instructions on the game and have instructions be more accessible.
- Background and characters need more interactive features.

As such, the team underwent brain storming to further improve the game whilst using these themes as the basis for improvement. Together, we decided that we were going to change the background and include obstacles for the player to navigate. The screen will be further improved to make it dynamic, where the screen will follow the player, allowing for a larger map. Secondly, we will be making some design changes to the enemy and choosing a more distinct but complementary colour for the texts. Finally, include a help button where the player can access whilst playing the game to re-familiarise themselves with the rules.

---
Stage 2: Final evaluation 

> quantitative evaluation
> wilcoxin significant testing for quantitative
>  How code was tested in evaluation
> was there a significant difference??


### Process ###


**Teamwork:**

Our team communicates via Teams to confirm the time and place for our meeting. When we do come together, we first look through our KanBan board to understand which tasks take priorityand writes a to-do list for that day. These tasks are usually delagated to different individuals accordingly to what they are better and more confortable with. With each task being ticked off, we gather the group to show the difference and impact it has on the game and remind each other to git-pull the new version of the repository. Our team usually stays in the meeting till everyone is mostly done with their tasks, before we decide on the next time we will meet and what tasks we are planning for the next meeting. These decisions are updated on the KanBan board and reiterated on the Team's chat. 


**Tools used:**

**Microsoft Teams** as a way for communication:
> Used to update each other on the progress and the work each of us did\
> Used to organise time and place for out next meet up

**GitHub** for version control:
> Made sure we only committed and push working code\
> Made sure our commit messages were helpful and discriptive

---

**Team Roles**:

Whilst every member played a role in contributing to the working code, prototyping ,ideation process and report writing, some members who had stronger coding skills had roles of being the team leaders in the code development and they delegated code work to the rest of the members. Some members took on roles of recording and keeping track of what tasks were completed during the meetings and updated the report to be as accurate as possible. While the rests of the members worked on the video presentation and sourcing of assets. 


**Reflection on how you worked together** 
// guys pls write you reflections on our work and how much you think you contributed to the role 

Charmaine: 1.0

I feet that with all group work comes with friction and misunderstandings, but as this group has proven, with the joined mindset of providing the best product forward, we can all commit and work together to do our best. I am glad to have this group mates who are willing to put forward their best foot and help out the other teammates and I am grateful that the whole team was very involved in every stage of the process. 

XinYue: 1.0

I really enjoy the whole process of us figuring out the idea for the game. A lot of the initial design has to be modified during the process, and that is the chance we got to understand and practice agile development and teamwork. In the team, every member contributes their understanding of what makes the game work well and what makes it appealing to people. Therefore, we have a broader view of how to deliver a quality product. 

Jamie: 1.0

WeiJian: 1.0

During the whole process of game design, I find the agile development more important than the waterfall development since we just change our game continuously. For my job, I am responsible for coding the fundamental structure of our game. Although I finish the basic code at a early stage, our team wish to optimize the game to a top level. Therefore, all of us needs to reconstruct our code as well as adjust it to the new demand. It is not a easy process, but it is worth since the game becomes a better one.

LinXuan: 1.0 


### Conclusion ###
In conclusion, ... 
reflect on project as a whole, lessons learnt and reflect on future work)


<br>

TODO : 

System Architecture 
  - Class Diagrams
  - Behaviour Diagrams

Describe implementation + 3 challenges chosen 

Process for teamwork (what tools, team rolls, reflection on working together)
Conclusion (reflect on project as a whole, lessons learnt and reflect on future work)
