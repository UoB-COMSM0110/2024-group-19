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
    // Because Enemy & Enemy collisions need previous positions to revert to if a collision is detected, this needs to be done in EnemyManager
    
    
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

    
    for(Enemy enemy : enemyManager.enemyListOnScreen){
      for(Bullet bullet : bulletManager.bulletList){

        if(dist(bullet.centreX, bullet.centreY, enemy.centreX, enemy.centreY) < (enemy.img.width/2 + bullet.img.width/2)){
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
  
  public void update(){
    CharacterEnemyCollisions();
    BulletEnemyCollisions();
  }
}
