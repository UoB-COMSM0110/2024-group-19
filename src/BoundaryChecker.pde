public class BoundaryChecker{
  
  Entity entity;
  float mapX, mapY;
  
  public BoundaryChecker(Entity entity, float mapX, float mapY){
    this.entity = entity;
    this.mapX = mapX;
    this.mapY = mapY;
  }
  
  public void playerCheck(){
    
    entity.x = min(entity.x, (mapX - (width/2)));
    entity.x = max(entity.x, width/2);
    entity.y = min(entity.y, (mapY - (height/2)));
    entity.y = max(entity.y, height/2);
  }
  
  public boolean bulletCheck(){
    return (entity.x<width/2 ||
       entity.x>(mapX - (width/2)) ||
       entity.y<height/2 ||
       entity.y>(mapY - (height/2)));
  }
}
