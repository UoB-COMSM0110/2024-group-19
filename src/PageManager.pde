public class PageManager{
  int pageNumber;
  EnemyManager enemyManager;
  Character playerInfo;
  public PageManager(Character player, int pageNumber, EnemyManager enemyManager){
    this.playerInfo = player;
    this.pageNumber = pageNumber;
    this.enemyManager = enemyManager;
    
  }
  
  //page 1
  public void gameStart() {
    image(backgroundImage, width / 2, height/ 2, width, height);
    textSize(width*0.1);
    text("The Chase", (width / 2), height*0.325);
    //image(button2, WIDTH - 70, 70, 100, 100); // leaderboard
    imageMode(CENTER);
    image(buttonImage, (width / 2), height*0.625, width*0.2666, height*0.1375); //start
    textSize(50);
    textAlign(CENTER);
    text("ENTER TO START", (width / 2), height*0.6425);
    
  }
  
  //page 2
  public void homePage(){
    imageMode(CORNER);
    float topLeftX = -(playerInfo.x - (width/2));
    float topLeftY = -(playerInfo.y - (height/2));
    image(backgroundImage, topLeftX, topLeftY);
    imageMode(CENTER);
    textSize(60);
    text("INSTRUCTIONS",width*0.5,height*0.1);
    textSize(30);
    text("Press 'M' for menu and instructions",width*0.5,height*0.15);
             // "W", "A", "S", "D" 
  float baseX = width / 2;
  float baseY = height / 2;
  float offset = width/15; 
    oxygenInstr();
    zombieInstr();
    buttonInstr(baseX,baseY,offset);

  textSize(50);
  image(buttonImage, baseX, baseY + 2 * offset + 50, width*0.2, height*0.13);// "Click to Start"
  text("Enter to Play", baseX, baseY + 2 * offset + (height*0.044));
  imageMode(CORNER);
  
  }
  
 
   public void helpPage(){
    imageMode(CORNER);
    float topLeftX = -(playerInfo.x - (width/2));
    float topLeftY = -(playerInfo.y - (height/2));
    image(backgroundImage, topLeftX, topLeftY);
    imageMode(CENTER);
    textSize(90);
    text("MENU",width*0.5,height*0.1);

  float baseX = width / 2;
  float baseY = height / 2;
  float offset = width/15; 
    oxygenInstr();
    zombieInstr();
    buttonInstr(baseX,baseY,offset);

  textSize(50);
  image(buttonImage, (width/3), height*0.72, width*0.2, height*0.13);// "Enter to Resume"
  textLeading(37);
  text("Enter to\nResume",(width*0.33), height*0.71);
  textSize(50);
  image(buttonImage, (width*0.7), height*0.72, width*0.2, height*0.13);// "Shift to Quit"
  text("Shift to Quit", (width*0.7), height*0.72);
  imageMode(CORNER);
  
  }
 
  
  
  //page 5
  public void gameOverPage(int previousScore){
    imageMode(CENTER);
    image(backgroundImage, width / 2, height/ 2, width, height);
    image(gameOverImage,(width / 2), height*0.325);

    image(buttonImage, width / 2, height / 2 + height*0.125, width*0.2666, height*0.1375); // Restart game button
    textSize(height*0.04);
    fill(0); // White text color
    image(buttonImage, (width / 2), height*0.625, width*0.2666, height*0.1375); //start
    textSize(50);
    textAlign(CENTER);
    text("ENTER TO RESTART", (width / 2), height*0.6425);
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
  
  private void oxygenInstr(){
    textSize(height*0.04);
    fill(0, 0, 255); // Blue color for oxygen
    rect(width/10, height*0.35, (playerInfo.oxygenLevel * (width * 0.00266)), height/35,height/50);
    fill(0); 
    textLeading(33);
    text("This is your stamina.\n Your can't move if it's empty. \nFreeze to refill.", (width/4.4), height*0.45);
    
  }
  
  private void zombieInstr(){
     textSize(height*0.04);
    textAlign(CENTER, CENTER);
    fill(0); 
    textLeading(30);
    image(zombieImage, width*0.8, height*0.4 -70, width*0.1, width*0.1);
    text("Survive the incoming\n waves of zombies for\n as long as possible. ", (width*0.8), height*0.45);
  }
  
  private void buttonInstr(float baseX, float baseY, float offset){
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

  textLeading(30);
  text("Mouse to aim \nand shoot", baseX, baseY + 1.3 * offset);
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
    rect(width/150, height*0.09, (player.oxygenLevel * (width * 0.00266)), height/35,height*0.02);
  }
  
  private void healthDisplay(){
    for (int i = 0; i < player.health; i++) {
      image(heartImage, (width/60 + (heartImage.width + width*(5/1500)) * i), (height/40)); // Adjust positioning as needed
    }
  }
  
  public void StatisticsDisplay(){
    scoreDisplay();
    waveDisplay();
    oxygenDisplay();
    healthDisplay();
  }
}
