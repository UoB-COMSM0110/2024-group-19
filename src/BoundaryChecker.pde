public class BoundaryChecker{
  
  Entity entity;
  float mapX, mapY;
  
  public BoundaryChecker(Entity entity, float mapX, float mapY){
    this.entity = entity;
    this.mapX = mapX;
    this.mapY = mapY;
  }
  
  public void playerCheck(){
    
    entity.x = min(entity.x, (mapX - (width/2) - entity.img.width));
    entity.x = max(entity.x, width/2);
    entity.y = min(entity.y, (mapY - (height/2) - entity.img.height));
    entity.y = max(entity.y, height/2);
  }
  
  public boolean bulletCheck(){
    //println("Entity.x" + entity.x + "Entity.y" + entity.y + "Left Boarder" + width/2 + "Right Boarder" + (mapX - (width/2)) + "Top Boarder" + height/2 + "Bottom boarder" + (mapY - (height/2)));
    return (entity.x<(width/2 ) ||
       entity.x>(mapX - (width/2)) ||
       entity.y<(height/2) ||
       entity.y>(mapY - (height/2)));       
  }
  
public boolean treeCheck(Tree tree) {
    // Define the margins as half of the screen dimensions
    float marginWidth = width / 2;
    float marginHeight = height / 2;

    float safeAreaX1 = marginWidth;
    float safeAreaY1 = marginHeight;
    float safeAreaX2 = mapX - marginWidth;
    float safeAreaY2 = mapY - marginHeight;

    // Check if the tree is outside the area
    boolean isTreeOutside = tree.x + tree.width < safeAreaX1 || tree.x > safeAreaX2 ||
                                  tree.y + tree.width < safeAreaY1 || tree.y > safeAreaY2;

    return isTreeOutside;
}

}
