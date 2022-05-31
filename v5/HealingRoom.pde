class HealingRoom extends Square{
  boolean isCompleted; 
  
  public HealingRoom(int r, int c) { 
    super(r, c);
    isCompleted = false; 
  }
  
  void draw() {
  fill(255);
  text("health +10 (temp)", 200, 200);
  if (!isCompleted) {increaseHealth();}
  }
  
  void increaseHealth() {
    p.health +=10;
    isCompleted = true; 
  }
}
