class Enemy extends Entity {
  public float stopDistance = 75, hitDistance = 75;
  float health, angle;
  Character player;
  float centreX, centreY, currentFramePeriod = 0, animationFramePeriod = 200;
  private ArrayList<ArrayList<PImage>> imageArrays = new ArrayList();
  Animation walkingAnimation;
  // We'll add keys and set them based of the enemy's vector.
  // This will alloy us to use the methods built into the Animation class.
  public boolean[] keys = new boolean[4];

  Enemy(float x, float y, float speed, PImage img, float health, Character player) {
    super(x, y, speed, img);
    this.health = health;
    this.player = player;
    
    imageArrays.add(enemyStationary);
    imageArrays.add(enemyWalkingForward);
    imageArrays.add(enemyWalkingRight);
    imageArrays.add(enemyWalkingBackward);
    imageArrays.add(enemyWalkingLeft);

    for(ArrayList<PImage> list:imageArrays){
      for(PImage image: list){
        image.resize(64,96);
      }
    }
    
    walkingAnimation = new Animation(imageArrays, false);
    
  }


  // Overrides the Entity update method to include movement logic
  @Override
  public void update() {
    angle = atan2(player.y - y, player.x - x);
    animationImageSelector();
    
    // Calculate distance to the player
    float distance = dist(x, y, player.x, player.y);
    
    // Move towards the player if farther than stopDistance
    if (distance > stopDistance) {
      x += cos(angle) * speed;
      y += sin(angle) * speed;
      centreX = x + (img.width/2);
      centreY = y + (img.height/2);
    }
  }
  
  public void specificMovement(float angle){
    
     x += cos(angle) * speed;
     y += sin(angle) * speed;
     centreX = x + (img.width/2);
     centreY = y + (img.height/2);
    
  }
  
  private void keysGenerator(){
    // First we need to reset keys:
    float absAngle = abs(angle);
    
    for (int i = 0; i < keys.length; i++) {
      keys[i] = false;
    }
    
    if(absAngle < (PI/3)){
      //Right quadrent of the circle
      keys[3] = true;
      return;
    }
    
    else if(absAngle > (2*PI/3)){
      // Left quadrent of circle
      keys[1] = true;
      return;
    }
    
    else if(angle < 0){
      keys[0] = true;
      return;
    }
    
    else{
      keys[2] = true;
      return;
    }
    
  }
  
  private void animationImageSelector(){
    float curentTime = millis();
    keysGenerator();
    if((curentTime - currentFramePeriod) > animationFramePeriod){
      currentFramePeriod = millis();
      walkingAnimation.selectImageArrayCharacter(keys);
      walkingAnimation.nextImage();
      img = walkingAnimation.activeImage;
    }
  }
  
  
  
  
  
  

}
