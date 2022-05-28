class HealingRoom {
  boolean earned; 
  
  public HealingRoom() { 
    earned = false; 
  }
  
  void draw() {
  fill(255);
  text("health +10 (temp)", 200, 200);
  }
  
  void increaseHealth() {
    p.health +=10;
    earned = true; 
  }
}
