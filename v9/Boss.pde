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
  int savepx, savepy;
  
  
  public Boss() {
    this.x = 280; 
    this.attack = 1000;
    this.health = 1000;
    t = 0;
    t1 = 0;
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
    //ellipse(280, 307, 10, 10);
    if (t == 180){ //laser
    savepx = p.x;
    savepy = p.y;
    rotation = atan(-307.0/280) - atan(-1 * (312.0-p.y)/(280-p.x));
    laserTimer = 0;
    }
    if (t == 0){ //drop
    posX = p.x;
    posY = p.y;
    dropTimer = 0;
    }
    //line(p.x, p.y, 280, 307);
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
        if (abs((savepx-280.0)*p.y + (307.0 - savepy)*p.x + 280.0*savepy - 307.0*savepx)/sqrt(pow(savepx-280.0, 2)+ pow(307.0-savepy, 2)) <= 10 && t1 >= 30) {
          //print(abs((savepx-280.0)*p.y + (307.0 - savepy)*p.x + 280.0*savepy - 307.0*savepx)/sqrt(pow(savepx-280.0, 2)+ pow(307.0-savepy, 2)));
          t1 = 0;
          p.health-=10;
        }
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
      if (dropTimer == 54 && abs(p.x - posX) <= 20 && abs(p.y - posY) <= 20 && t1 >= 30) {
        t1 = 0;
        p.health -= 10;
      }
    }
    
    t= (t+1) % 360;
    t1++;
  }
  
  void laser(){
    rotate(atan(-307.0/280) - atan(-1 * (312.0-p.y)/(280-p.x)) );
    
  }
  
  void drop(){
    
  }
}
