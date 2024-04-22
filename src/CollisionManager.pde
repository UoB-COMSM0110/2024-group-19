public class CollisionManager{
  
  private Character playerInfo;
  private EnemyManager enemyManager;
  private BulletManager bulletManager;
  private ObstacleManager obstacleManager;
  
  public CollisionManager(Character player, EnemyManager enemyManager, BulletManager bulletManager,ObstacleManager obstacleManager){
    
    this.playerInfo = player;
    this.enemyManager = enemyManager;
    this.bulletManager = bulletManager;
    this.obstacleManager = obstacleManager;
    /*
    There are 3 collisions we need to detect:
    1) Enemy & Bullet
    2) Enemy and Character
    3) Enemy & Enemy
    // Because Enemy & Enemy collisions need previous positions to revert to if a collision is detected, this needs to be done in EnemyManager
    
    
    We are going to make use of the enemyListOnScreen ArrayList we made in EnemyManager
    too limit the number of calculations that need to be done per iteration.
    */
    
    
  }
   public boolean CharacterObstacleCollisions() {
        for (Obstacle obstacle : obstacleManager.obstacles) {
            // Calculate the player's bounding box (assuming the player's position is centered)
            float playerCentreX = playerInfo.x + playerInfo.img.width/2;
            float playerCentreY = playerInfo.y + playerInfo.img.height/2;

            // Check for collision
            if (dist(playerCentreX, playerCentreY, (obstacle.x+(obstacle.image.width/2)), (obstacle.y+(obstacle.image.height/2))) < (obstacle.image.width/2+player.img.width/2)) {
                   //playerBottom > obstacleTop &&
                // Handle collision
                // For example, stop the player's movement or push them back
                handlePlayerObstacleCollision();
                return true;
            }
        }
        return false;
    }
    
    private void EnemyObstacleCollisions(){
      
      for (Obstacle obstacle : obstacleManager.obstacles) {
        for(Enemy enemy: enemyManager.enemyListOnScreen){
          if (dist(enemy.centreX, enemy.centreY, (obstacle.x+(obstacle.image.width/2)), (obstacle.y+(obstacle.image.height/2))) < (obstacle.image.width/2+enemy.img.width/2)) {
            enemy.x = enemy.prevX;
            enemy.y = enemy.prevY;

          }  
        }
      }
    }


    // Handle the response to a collision (e.g., stop movement, bounce back, etc.)
    public void handlePlayerObstacleCollision() {
        // This is a simple example that stops the player's movement.
        // You could add more complex responses like sliding along the obstacle.
        playerInfo.x = playerInfo.prevX;
        playerInfo.y = playerInfo.prevY;
    }
    
    private void bulletObstacleCollision(){
      
      ArrayList<Bullet> bulletsToRemove = new ArrayList();
      
      for(Bullet bullet: bulletManager.bulletList){
        for(Obstacle obstacle : obstacleManager.obstacles){
          if(dist(bullet.centreX, bullet.centreY, (obstacle.x+(obstacle.image.width/2)), (obstacle.y+(obstacle.image.height/2))) < (obstacle.image.width/2+bullet.img.width/2)){
            bulletsToRemove.add(bullet);
          }
        }
      }
      
      for (Bullet bullet : bulletsToRemove) {
          bulletManager.bulletList.remove(bullet);
      }
    }
    
  private void CharacterEnemyCollisions(){
    
    if(player.invulnerable && ((millis() - player.lastHitReceived) >= player.invulnerablePeroid)){
      
      player.invulnerable = false;
    }
    
    else{
      if(!player.invulnerable){
        
        for(Enemy enemy : enemyManager.enemyListOnScreen){
          //println(dist(player.x, player.y, enemy.x, enemy.y) + " needs " + enemy.hitDistance);
          if(dist(player.x, player.y, enemy.x, enemy.y) < enemy.hitDistance){
            player.health--;
            player.invulnerable = true;
            player.lastHitReceived = millis();
            println("hit. Remaning: " + player.health);
            break;
            
          }
        }
      }
    }
  }
  
  private void BulletEnemyCollisions(){
    ArrayList<Bullet> bulletsToRemove = new ArrayList();
    ArrayList<Enemy> enemiesToRemove = new ArrayList();

    
    for(Enemy enemy : enemyManager.enemyListOnScreen){
      for(Bullet bullet : bulletManager.bulletList){

        if(dist(bullet.centreX, bullet.centreY, enemy.centreX, enemy.centreY) < (enemy.img.width/2 + bullet.img.width/2)){
          bulletsToRemove.add(bullet);
          enemy.health--;
          player.score += 10;
          if(enemy.health < 0){
          enemiesToRemove.add(enemy);
          powerUpManager.powerUpCreate(enemy.x,enemy.y);
          player.score += 20;
          }
          
        }
        
      }
    }
    
    bulletManager.bulletList.removeIf(bulletsToRemove::contains);
    enemyManager.enemyList.removeIf(enemiesToRemove::contains);
    
  }
  
  public void update(){
    CharacterEnemyCollisions();
    BulletEnemyCollisions();
    CharacterObstacleCollisions();
    EnemyObstacleCollisions();
    bulletObstacleCollision();
  }
}
