public class Page {
  //page 1
  public void gameStart() {
    image(bground, width / 2, height/ 2, width, height);
    textSize(180);
    text("game 19", (width / 2), 260);
    //image(button2, WIDTH - 70, 70, 100, 100); // leaderboard
    imageMode(CENTER);
    image(button, (width / 2), 500, 400, 110); //start
    textSize(60);
    textAlign(CENTER);
    text("ENTER TO START", (width / 2), 525);
    
  }
  
  //page 2
  public void gameInstruct() {
  imageMode(CENTER);
  image(bground, width / 2, height / 2, width, height);
  textSize(32);
  textAlign(CENTER, CENTER);
  fill(255); // 设置文本颜色为白色

  // 控制指令 "W", "A", "S", "D" 的布局
  // 由于将按钮放置在中间部分，所以需要适当调整文本和按钮的位置
  float baseX = width / 2;
  float baseY = height / 2;
  float offset = 100; // 控制键之间的水平和垂直偏移量

  // "W"
  image(button, baseX, baseY - offset + 30, 60, 60); // 将按钮向下移动一点，放在"W"的正下方
  text("W", baseX, baseY - offset + 30);

  // "A"
  image(button, baseX - offset + 30, baseY, 60, 60); // 将按钮向右移动一点，放在"A"的右侧
  text("A", baseX - offset  + 30, baseY);

  // "S"
  image(button, baseX, baseY + offset - 30, 60, 60); // 将按钮向上移动一点，放在"S"的正上方
  text("S", baseX, baseY + offset  - 30);

  // "D"
  image(button, baseX + offset - 30, baseY, 60, 60); // 将按钮向左移动一点，放在"D"的左侧
  text("D", baseX + offset - 30, baseY);

  // 显示射击指令，并调整"Click to Start"按钮和文本的位置
  text("Mouse to aim and shoot", baseX, baseY + 2 * offset);
  image(button, baseX, baseY + 2 * offset + 50, 200, 60); // 为"Click to Start"按钮调整大小和位置
  text("Click to Start", baseX, baseY + 2 * offset + 50);
  }

  public void gameOver() {
    imageMode(CENTER);
    image(bground, width / 2, height/ 2, width, height);
    image(gameover,(width / 2), 260);

    image(button, width / 2, height / 2 + 100, 400, 110); // Restart game button
    textSize(32);
    fill(255); // White text color
    text("Click to Restart", width / 2, height / 2 + 105);
  }
  
  public void gameOn(){
    imageMode(CENTER);
    image(bground, width / 2, height/ 2, width, height);
    
  }
  
}
