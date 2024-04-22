public class EnemyManager{
  
  // This handles the Enemy instanses and how the mob behaves.
  
  Character playerInfo;
  PImage enemyImage;
  int waveNumber = 0, safeDistance = width/10;
  float lastRoundTime = 0, lastEnemySpawned = 0;
  float mapX, mapY;
  ArrayList<Enemy> enemyList = new ArrayList();
  // We'll track which enemies are on screen to reduce the collision detection calculations
  public ArrayList<Enemy> enemyListOnScreen;
  Round currentRound;
  
  public EnemyManager(float mapX, float mapY, Character player, PImage enemyImage){
    
    this.playerInfo = player;
    this.enemyImage = enemyImage;
    this.mapX = mapX;
    this.mapY = mapY;
   
  
  }
  
  private void roundHandler(){
    // This activates the next round if one of the round-ending conditions are triggered.
    if (waveNumber == 0 || millis() - lastRoundTime > currentRound.roundTime || (enemyList.size() == 0 && player.oxygenLevel==100)) { 
      currentRound = new Round(++waveNumber);
      lastRoundTime = millis();
    }
  }
  
  private void enemySpawner(){
    // This method spawns all the zombies within a round.
    if(millis()-lastEnemySpawned > 200 && currentRound.leftToSpawn > 0){
      spawnEnemy();
      lastEnemySpawned = millis();
      currentRound.spawn();
    }
  }
  
  private void spawnEnemy(){
    // This handles the spawning of an individual enemy. It ensures it isn't too close to the player or inside an obstacle at spawn.
    boolean obstacleCollision = true;
    float enemyX, enemyY;
    do {
      obstacleCollision = true;
      enemyX = random(width/2, (mapX-width/2));
      enemyY = random(height/2, (mapY-height/2));
      
      for(Obstacle obstacle:obstacleManager.obstacles){
        if(dist((obstacle.x+(obstacle.image.width/2)), (obstacle.y+(obstacle.image.height/2)), enemyX+(enemyImage.width/2), enemyY+(enemyImage.height/2)) < (obstacle.image.width/2 + characterWalkingForward.get(0).width/2)){
          obstacleCollision = false;
          break;
        }
      }
      
    } while ((dist(enemyX, enemyY, player.x, player.y) < safeDistance) && obstacleCollision); // Ensure enemy spawns away from player
  
      enemyList.add(new Enemy(enemyX, enemyY, currentRound.enemySpeed, enemyImage, currentRound.averageHealth, player));
  }
  



  
  private void updatePosition(){
    float prevX, prevY;
    
    for(Enemy enemy : enemyList){
      prevX = enemy.x;
      prevY = enemy.y;
      enemy.update();
      
    }
    EnemyEnemySeparation();
    // To prevent enemies from coalescing we are going to try and implement the seperation part of the boid algorithm. 
  }
  
  private void EnemyEnemySeparation(){
    
    if(enemyListOnScreen == null){return;}
    
    float yClose, xClose, protectedDistance = enemyImage.width, direction;
    int collisions;
    // These track the net distance between a given enemy (enemyOne) and all other enemies in its protected radius
    // Rather than stopping them from moving when they get to close to one another (which causes large groups of enemies to effectively become 'stuck'
    // we'll insted encourage them to go in a different direction.
    
    for(Enemy enemyOne : enemyListOnScreen){
      yClose = 0;
      xClose = 0;
      collisions = 0;
      for(Enemy enemyTwo : enemyListOnScreen){
        if(enemyOne.equals(enemyTwo)){
          continue;
        }
        else{
          // Accumulate the net vectors of all enemies within the protected radius
          if(dist(enemyOne.centreX,enemyOne.centreY,enemyTwo.centreX,enemyTwo.centreY) < protectedDistance){
              yClose += enemyOne.centreY - enemyTwo.centreY;
              xClose += enemyOne.centreX - enemyTwo.centreX;
              collisions++;
          }
        }
      }
      // Move the current enemy away from that. 
      if(collisions!=0){
        direction = atan2(yClose, xClose);
        enemyOne.specificMovement(direction);
      }
    }
  }
  
  
  private void enemyOnScreen(){
    
    // This generates a sub-set of zombies who are on screen. By only considering this handful of zombies at any one point we save computational power.
    // This generated list is for rendering, boundary and seperation calculations.
    
    
    enemyListOnScreen = new ArrayList();
    
    for(Enemy enemy : enemyList){
      if(abs(player.x - enemy.x) < width/2 ||
         abs(player.y - enemy.y) < height/2){
         enemyListOnScreen.add(enemy);
       }
    }
  }
  
  private void enemyRender(){
    float screenPositionX, screenPositionY;
    for(Enemy enemy : enemyListOnScreen){
      screenPositionX = enemy.x - playerInfo.x + width/2;
      screenPositionY = enemy.y - playerInfo.y + height/2;
      image(enemy.img,screenPositionX,screenPositionY);
      
    }
  }
  
  public void update(){
    roundHandler();
    enemySpawner();
    updatePosition();
    enemyOnScreen();
    //println(enemyListOnScreen.size() + " out of " + enemyList.size());
    //println("FPS: " + frameRate);
    enemyRender();
  }

}
