### Overview

This Processing project manages the various elements of a video game, including characters, enemies, bullets, and power-ups. The game uses images for backgrounds, characters, and other interactive elements, and it manages game state through multiple managers and properties.

### Global Variables

PImage objects for various game elements like background, character, bullets, zombies, etc.

ArrayList<PImage> collections for different animations of the character and enemies (walking forward, backward, left, right, stationary).

Character player: The main character of the game.

boolean hardMode: Flag to determine if the game is in hard mode.

Background background: Manages the game background.

BulletManager bulletManager: Manages the bullets fired by the player.

EnemyManager enemyManager: Manages the enemies in the game.

CollisionManager collisionManager: Manages collisions between various game elements.

PageManager pageManager: Manages different pages or states of the game.

TreeManager treeManager: Manages tree obstacles.

ObstacleManager obstacleManager: Manages other types of obstacles.

PowerUpManager powerUpManager: Manages power-ups in the game.

PlayerScore playerScore: Manages the scoring of the player.

float mapX, mapY: Variables for the map's position.

int playerSpeed, playerHealth, previousScore: Variables for player's speed, health, and previous score.

PFont font: Font used for text in the game.

String playerName: Name of the player.

### Game Managers Description

BulletManager: Responsible for creating, updating, and rendering bullets.

EnemyManager: Handles creation, movement, and behavior of enemies.

CollisionManager: Detects and handles collisions between game entities like characters, enemies, and bullets.

PageManager: Controls which page or view is active in the game, managing transitions between menus and game views.

TreeManager and ObstacleManager: Manage various obstacles within the game environment, adding complexity and challenge.

PowerUpManager: Distributes power-ups that can modify gameplay, like increasing speed or firepower.

### Gameplay Mechanics

Game progresses through different states managed by PageManager.

Player interacts with the game using keyboard or mouse, controlling the character to avoid obstacles, defeat enemies, and collect power-ups.

The health and scoring system are tracked, influencing the game progression and player's success.

### Initialization and Setup

The game initializes by loading all images and setting up initial game properties.

Game elements are positioned, and initial states are set based on the starting conditions.

### Main Game Loop

Includes updates to all managers and rendering of all visual elements.

Handles user input and updates game state accordingly.
