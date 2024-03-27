public class CollisionManager{
  
  private Character playerInfo;
  private EnemyManager enemyManager;
  private BulletManager bulletManager;
  
  
  public CollisionManager(Character player, EnemyManager enemyManager, BulletManager bulletManager){
    
    this.playerInfo = player;
    this.enemyManager = enemyManager;
    this.bulletManager = bulletManager;
    /*
    There are 3 collisions we need to detect:
    1) Enemy & Bullet
    2) Enemy and Character
    3) Enemy & Enemy
    
    We are going to make use of the enemyListOnScreen ArrayList we made in EnemyManager
    too limit the number of calculations that need to be done per iteration.
    */
    
    
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
            //println("hit. Remaning: " + player.health);
            break;
            
          }
        }
      }
    }
  }
  
  private void BulletEnemyCollisions(){
    ArrayList<Bullet> bulletsToRemove = new ArrayList();
    ArrayList<Enemy> enemiesToRemove = new ArrayList();
    float bulletCentreX, bulletCentreY, enemyCentreX, enemyCentreY;
    
    // This may cause a fair bit of lag down the line. If so maybe look into taking the centre calcs out of the nested for loop
    
    for(Enemy enemy : enemyManager.enemyListOnScreen){
      for(Bullet bullet : bulletManager.bulletList){
        bulletCentreX = bullet.x + (bullet.img.width/2);
        bulletCentreY = bullet.y + (bullet.img.height/2);
        enemyCentreX = enemy.x + (enemy.img.width/2);
        enemyCentreY = enemy.y + (enemy.img.height/2);
        if(dist(bulletCentreX, bulletCentreY, enemyCentreX, enemyCentreY) < (enemy.img.width/2 + bullet.img.width/2)){
          bulletsToRemove.add(bullet);
          enemy.health--;
          if(enemy.health < 0){
          enemiesToRemove.add(enemy);
          }
          
        }
        
      }
    }
    
    bulletManager.bulletList.removeIf(bulletsToRemove::contains);
    enemyManager.enemyList.removeIf(enemiesToRemove::contains);
    
  }
  
  private void EnemyEnemyCollisions(){
  }
  
  public void update(){
    CharacterEnemyCollisions();
    BulletEnemyCollisions();
  }
}
