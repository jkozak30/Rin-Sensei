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
  }
  
  void draw(){
    image(wof, 200, 200);
    if (t == 120){ //laser
    float rotation = atan(-307.0/280) - atan(-1 * (312.0-p.y)/(280-p.x));
    }
    
    t++;
    t%=240;
    
  }
  
  void laser(){
    rotate(atan(-307.0/280) - atan(-1 * (312.0-p.y)/(280-p.x)) );
    
  }
  
  void drop(){
    
  }
}
