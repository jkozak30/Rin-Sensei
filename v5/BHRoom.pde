class BHRoom extends Square{
  
  float currentFrame;
  int t;
  fireball[] projectiles;
  
  public BHRoom(int r, int c) {
    super(r, c); 
    currentFrame = 0;
    t=0; 
    projectiles = new fireball[60];
  }
  
  void draw(){
    //background(0);
    int x = 30;
    if (t < 1800){
      if (t%x == 0) {
        projectiles[t/x] = new fireball();
      }
      for (int i = 0; i < t/x; i++){
        projectiles[i].draw();
        projectiles[i].update();
      }
      t++;
    }
  }
  
}
