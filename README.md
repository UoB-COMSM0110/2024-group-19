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

### Use-case diagram
<img src='/Use-case diagram.png'/>

**Early stages design. Ideation process**

In week 2, our group had a brainstorm about several types of games. Every team members introduced a game that he/she had researched before. Three members introduced their game similar to MATCH-3-GAMES. One member introduced a 1v1 soccer game. One member introduced a [survivor](https://www.bilibili.com/video/BV1Q4421F7zK/) game, which was like a 2D-kill-zombie game. Then we voted. The survivor one became our final choice due to its creativity as well as difficulty level. In week 3, we started to discuss about the basic function of this game then mock-up the initial paper prototype. In week 4, we first created a use-case diagram user stories as well as use-case-specifications to set up initial requirements. Secondly, we redo paper prototype and took a video to show how our game would work. Thirdly, we named our game "the chase". In week 5, to be continue.

**User Stories**

>“As a << Developer>> I want to << have a twist in the gamel>> so that << the game is more fun and unique >>”

>“As a << User>> I want to << understand the game instructions >> so that << I can play the game intuitively >>”

>“As a << teacher>> I want to << be specific>> so that << I can mark the game accurately to the marking scheme >>”

>"As a << negative stakeholder>> I want to << find some bugs and difficulties in this game>> so that << I can provide some feedbacks for developers and earn money from them>>"

>"As a << original developer >> I want to << protect my intellectual property >> so that << I can protect my property >>"

<br>

**Use-Case Specifications**

*login use case*

>System shows: Login page display

>User enter:inlog in parameters

>System checks: checks the paramterswith the existing users

>if it existing,match the game login with their account. Else show page for new log in / register account

*entered main page of game*

>Show the details of user’s game (levels/ existing highscore/ start game button )User clicks onto the start game button(entered start game loading page)

>System showing instructions of game, there is a level button (bottom left/ healthbar+ hp bar on top left)

>User starts playing using WASD

>System creates more zombies zoning into the user

>Character continuously shooting bullet, moving around around according to the user’s button input

>Once moving and killed zombie, user walks to the gems to collect and system displays increase hp . System display health decrease if user attacked by zombie

>System displays hp to be full (indicator of entering next level system needs to know that we need to go to next level). Will display weapon upgrade page User to choose upgrade

*entered page of level 2*

>System to implement upgrades

>System display next level page

>System needs to reset the different bars

>Repeat till end of game (same )

*entered page of win after level2*

>Show congratulation page

>Show timer of how long it took to complete level 2

>System displays timing onto the scoresheet(if higher,puton top, else place below , if first time playing, place timinginmiddle, highlight the current game score using border ) [ show timing next to name , do not overwrite , show existing scorestohighlightimprovement]

>System display back to original page showing the login

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

Through analysing the data recorded from the qualitative and quantitative evaluations of the first stages of development, we identified some key themes that guided our development onto the next stage. 

Key Themes:

- Poor colour scheme for text, characters and background.
- Need more clearer instructions on the game and have instructions be more accessible.
- Background and characters need more interactive features.

As such, the team underwent brain storming to further improve the game whilst using these themes as the basis for improvement. Together, we decided that we were going to change the background and include obstacles for the player to navigate. The screen will be further improved to make it dynamic, where the screen will follow the player, allowing for a larger map. Secondly, we will be making some design changes to the enemy and choosing a more distinct but complementary colour for the texts. Finally, include a help button where the player can access whilst playing the game to re-familiarise themselves with the rules.

<br>
