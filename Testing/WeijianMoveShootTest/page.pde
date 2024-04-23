public class Page {
  //page 1
  public void gameStart() {
    image(bground, width / 2, height/ 2, width, height);
    textSize(width*0.1);
    text("game 19", (width / 2), height*0.325);
    //image(button2, WIDTH - 70, 70, 100, 100); // leaderboard
    imageMode(CENTER);
    image(button, (width / 2), height*0.625, width*0.2666, height*0.1375); //start
    textSize(50);
    textAlign(CENTER);
    text("ENTER TO START", (width / 2), height*0.6425);
    
  }
  
  //page 2
  public void gameInstruct() {
 
  imageMode(CENTER);
  image(bground, width / 2, height / 2, width, height);
  
  fill(0, 0, 255); // Blue color for oxygen
  rect(width/10, height*0.4, (player.oxygenLevel * (width * 0.00266)), height/35,height/50);
  fill(0); 
  text("This is your stamina.\n Your can't move if it's empty. \nFreeze to refill.", (width/4.2), height*0.5);
  textSize(height*0.04);
  textAlign(CENTER, CENTER);
  fill(0); // 设置文本颜色为白色
  
  image(zombieImg, width*0.8, height*0.4 -70, width*0.1, width*0.1);
  text("Survive the incoming\n waves of zombies for\n as long as possible. ", (width*0.8), height*0.5);
  

  // 控制指令 "W", "A", "S", "D" 的布局
  // 由于将按钮放置在中间部分，所以需要适当调整文本和按钮的位置
  float baseX = width / 2;
  float baseY = height / 2;
  float offset = width/15; // 控制键之间的水平和垂直偏移量

  // "W"
  image(button, baseX, baseY - offset + 30, height*0.075, height*0.075); // 将按钮向下移动一点，放在"W"的正下方
  text("W", baseX, baseY - offset + 30);

  // "A"
  image(button, baseX - offset + (height*0.0375), baseY, height*0.075, height*0.075); // 将按钮向右移动一点，放在"A"的右侧
  text("A", baseX - offset  + (height*0.0375), baseY);

  // "S"
  image(button, baseX, baseY + offset - (height*0.0375), height*0.075, height*0.075); // 将按钮向上移动一点，放在"S"的正上方
  text("S", baseX, baseY + offset  - (height*0.0375));

  // "D"
  image(button, baseX + offset - (height*0.0375), baseY, height*0.075, height*0.075); // 将按钮向左移动一点，放在"D"的左侧
  text("D", baseX + offset - (height*0.0375), baseY);

  // 显示射击指令，并调整"Click to Start"按钮和文本的位置
  text("Mouse to aim and shoot", baseX, baseY + 1.3 * offset);
  image(button, baseX, baseY + 2 * offset + 50, width*0.1333, height*0.075); // 为"Click to Start"按钮调整大小和位置
  text("Enter to Start", baseX, baseY + 2 * offset + (height*0.044));
  }

  // page 4
  public void gameOver() {
    imageMode(CENTER);
    image(bground, width / 2, height/ 2, width, height);
    image(gameover,(width / 2), height*0.325);

    image(button, width / 2, height / 2 + height*0.125, width*0.2666, height*0.1375); // Restart game button
    textSize(height*0.04);
    fill(0); // White text color
    text("Enter to Restart", width / 2, height / 2 + height*0.13125);
    
    text("Score: "+scorePoint ,width / 2, height / 2 );
  }
  
  // page 3
  public void gameOn(){
    imageMode(CENTER);
    image(bground, width / 2, height/ 2, width, height);
    
  }
  
}
