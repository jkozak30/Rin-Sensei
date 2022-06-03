class HealingRoom extends Square{
  boolean isCompleted; 
  Health h;
  int t=0;
  
  public HealingRoom(int r, int c) { 
    super(r, c);
    isCompleted = false; 
  }
  
  void updateH() {
    h.amt = 100 - p.health;
  }
  
  void draw() {
    if (t == 0) {h = new Health(this, width/2, height/2, max(0, 100-p.health), true);}
    //fill(255);
    //text("health +10 (temp)", 200, 200);
    //if (!isCompleted) {increaseHealth();}
    updateH();
    this.h.draw();
    t++;
  }
  
  //void increaseHealth() {
    //p.health +=10;
    //isCompleted = true; 
  //}
}
