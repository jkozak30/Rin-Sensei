class Boss{
  PImage wof;
  int health;
  int attack;
  int x;
  Square pos;
  boolean wasAttacked;
  int t, t1;
  boolean dead;
  PImage[] laser;
  PImage[] drop;
  int laserTimer;
  int dropTimer;
  float rotation;
  int posX;
  int posY;
  
  
  public Boss() {
    this.x = 280; 
    this.attack = 1000;
    this.health = 1000;
    t = 0;
    wof = loadImage("boss/wof.png");
    laser = new PImage[8];
    drop  = new PImage[14];
    for (int i = 0; i < 8; i++){
      laser[i] = loadImage("boss/laser" + (i+1) + ".png");
    }
    for (int i = 0; i < 14; i++){
      drop[i] = loadImage("boss/drop" + (i+1) + ".png");
    }
    laserTimer = -1;
    dropTimer = -1;
    rotation = 0;
    posX = 100;
    posY = 200;
  }
  
  void draw(){
    image(wof, 200, 200);
    if (t == 180){ //laser
    rotation = atan(-307.0/280) - atan(-1 * (312.0-p.y)/(280-p.x));
    laserTimer = 0;
    }
    if (t == 0){ //drop
    posX = p.x;
    posY = p.y;
    dropTimer = 0;
    }
    if (laserTimer >= 0){
      pushMatrix();
      imageMode(CORNER);
      translate(280,312);
      rotate(rotation+PI);
      if (laserTimer <= 20) {     
        image(laser[0], 0, 0);
      }
      else if (laserTimer/3 == 7) {
        image(laser[2], 0, 0);
      }
      else if (laserTimer < 39) {
        image(laser[3], 0, 0);
      }
      else{
        image( laser[(laserTimer - 30)/2] , 0, 0);
      }
      
      
      
      popMatrix();
      laserTimer++;
      
      if (laserTimer > 45) {
        laserTimer = -1;
      }
      
      
    }
    if (dropTimer >= 0){
      imageMode(CENTER);
      image(drop[dropTimer/4], posX+16, posY-153);
      dropTimer++;
      if (dropTimer > 55) {
        dropTimer = -1;
      }
    }
    
    t= (t+1) % 360;
    
  }
  
  void laser(){
    rotate(atan(-307.0/280) - atan(-1 * (312.0-p.y)/(280-p.x)) );
    
  }
  
  void drop(){
    
  }
}
