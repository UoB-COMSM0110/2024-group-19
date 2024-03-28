public class PageManager{
  int pageNumber;
  EnemyManager enemyManager;
  Character playerInfo;
  public PageManager(Character player, int pageNumber, EnemyManager enemyManager){
    this.playerInfo = player;
    this.pageNumber = pageNumber;
    this.enemyManager = enemyManager;
    
  }
  
  public void gameStart() {
    image(backgroundImage, width / 2, height/ 2, width, height);
    textSize(width*0.1);
    text("game 19", (width / 2), height*0.325);
    //image(button2, WIDTH - 70, 70, 100, 100); // leaderboard
    imageMode(CENTER);
    image(buttonImage, (width / 2), height*0.625, width*0.2666, height*0.1375); //start
    textSize(50);
    textAlign(CENTER);
    text("ENTER TO START", (width / 2), height*0.6425);
    
  }
  
  public void homePage(){
    imageMode(CORNER);
    float topLeftX = -(playerInfo.x - (width/2));
    float topLeftY = -(playerInfo.y - (height/2));
    image(backgroundImage, topLeftX, topLeftY);
    imageMode(CENTER);
    
    fill(0, 0, 255); // Blue color for oxygen
    rect(width/10, height*0.4, (playerInfo.oxygenLevel * (width * 0.00266)), height/35,height/50);
    fill(0); 
    text("This is your stamina.\n Your can't move if it's empty. \nFreeze to refill.", (width/4.2), height*0.5);
    textSize(height*0.04);
    textAlign(CENTER, CENTER);
    fill(0); 
    
    image(zombieImage, width*0.8, height*0.4 -70, width*0.1, width*0.1);
    text("Survive the incoming\n waves of zombies for\n as long as possible. ", (width*0.8), height*0.5);
    
    // "W", "A", "S", "D" 
  float baseX = width / 2;
  float baseY = height / 2;
  float offset = width/15; 

  // "W"
  image(buttonImage, baseX, baseY - offset + 30, height*0.075, height*0.075); // "W"
  text("W", baseX, baseY - offset + 30);

  // "A"
  image(buttonImage, baseX - offset + (height*0.0375), baseY, height*0.075, height*0.075); // "A"
  text("A", baseX - offset  + (height*0.0375), baseY);

  // "S"
  image(buttonImage, baseX, baseY + offset - (height*0.0375), height*0.075, height*0.075); // "S"
  text("S", baseX, baseY + offset  - (height*0.0375));

  // "D"
  image(buttonImage, baseX + offset - (height*0.0375), baseY, height*0.075, height*0.075); // "D"
  text("D", baseX + offset - (height*0.0375), baseY);

  // "Click to Start"
  text("Mouse to aim and shoot", baseX, baseY + 1.3 * offset);
  image(buttonImage, baseX, baseY + 2 * offset + 50, width*0.1333, height*0.075); // "Click to Start"
  text("Enter to Start", baseX, baseY + 2 * offset + (height*0.044));
  imageMode(CORNER);
  
  }
  
  public void gameOverPage(int previousScore){
    imageMode(CENTER);
    image(backgroundImage, width / 2, height/ 2, width, height);
    image(gameOverImage,(width / 2), height*0.325);

    image(buttonImage, width / 2, height / 2 + height*0.125, width*0.2666, height*0.1375); // Restart game button
    textSize(height*0.04);
    fill(0); // White text color
    text("Enter to Restart", width / 2, height / 2 + height*0.13125);
    
    text("Score: "+ previousScore ,width / 2, height / 2 );
  }
  
  public void keyPressed(){
    if (keyCode == ENTER) {
      pageNumber++;
    }
    
    if(pageNumber == 5){
      pageNumber = 1;
    }
  }
  
  private void scoreDisplay(){
    fill(0);
   textSize(width*0.02);
   text("Score: " + playerInfo.score , (width*(0.8666)),(height*0.0625));
  }
  
  private void waveDisplay(){
   fill(0);
   textSize(width*0.02);
   text("Waves spawned: " + enemyManager.waveNumber , (width*(0.8666)),height*0.1);
  }
  
  private void oxygenDisplay(){
    fill(0, 0, 255); // Blue color for oxygen
    rect(width/150, height*0.05, (player.oxygenLevel * (width * 0.00266)), height/35,height*0.02);
  }
  
  public void StatisticsDisplay(){
    scoreDisplay();
    waveDisplay();
    oxygenDisplay();
  }
}
