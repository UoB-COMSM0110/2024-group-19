# Team
<img src='MicrosoftTeams-image.png'/>

Weijian Li ,  me23202@bristol.ac.uk , LassonLi

Xinyue Feng , qg23773@bristol.ac.uk , XinyueFeng99 

Charmaine Suah , zx23187@bristol.ac.uk , Csuah09

Jamie Bell-Thomas , ws19177@bristol.ac.uk , jamiebellthomas

Hsuan Lin , ev23671@bristol.ac.uk , HsuanLin322

<br>

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

<br>