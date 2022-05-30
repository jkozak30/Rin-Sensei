class HealingRoom extends Square{
  boolean earned; 
  
  public HealingRoom(int r, int c) { 
    super(r, c);
    earned = false; 
  }
  
  void draw() {
  fill(255);
  text("health +10 (temp)", 200, 200);
  if (!earned) {increaseHealth();}
  }
  
  void increaseHealth() {
    p.health +=10;
    earned = true; 
  }
}
