class Player {
  int health;
  int attack;
  int r, c;
  Square pos;
  Square[][] grid;
  int x, y, dx, dy;
  Weapon weapon;
  int cooldown = 30;
  int t;
  int attackTimer = 0;
  boolean attacked; 
  boolean right;
  boolean isAttacking;
  MeleeAttack hitbox;
  RangedAttack[] projectiles;
  
  //animation stuff
  int currentFrame, delay, offset;
  PImage[] slimeRun;
  PImage[] swordAttack;
  
  
  public Player(Square[][] grid){
    health = 100;
    attack = 100; 
    r = 0;
    c = 0;
    this.grid = grid;
    pos = grid[0][0];
    x = y = width/2;
    dx = dy = 0;
    t = 60;
    right = true;
    hitbox = null;
    
    //animation
    currentFrame = 0;
    delay=0; 
    offset = 0; 
    setWeapon(0); //temp, sword
  }
  
  void setWeapon(int type) {
    slimeRun = new PImage[10];
    for (int i=0; i<10; i++) {
      if (type==0) {slimeRun[i] = loadImage("slime/sword-right/sword-run/sword-run" + nf(i)+ ".PNG");}
    }
    
  }
  
  boolean moveSq(int kp) {
    if (!pos.walls[kp] && pos.isCompleted) {
      if (kp == 0) r -= 1; pos = grid[r][c];
      if (kp == 1) c += 1; pos = grid[r][c];
      if (kp == 2) r += 1; pos = grid[r][c];
      if (kp == 3) c -= 1; pos = grid[r][c];
      return true;
    } return false;
  }
  
  // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  void draw() {
    if (health <=0) {
      background(0); 
      fill(255); 
      text("GAME OVER", 200, 200);
      textAlign(CENTER);
    }
    else {
      //draw the guy
      status(); 
      weapon.draw();
      stroke(255);
      strokeWeight(5);
      if (pos.walls[0]) {line(1, 1, width-1, 1);}
      if (pos.walls[1]) {line(width-1, 1, width-1, height-1);}
      if (pos.walls[2]) {line(width-1, height-1, 1, height-1);}
      if (pos.walls[3]) {line(1, height-1, 1, 1);}
      pos.draw( );
      
      if (isAttacking){
        if (weapon.type == 0){
          if (attackTimer > 13){
            isAttacking = false;
            attackTimer = 0;
            //hitbox = null;
          }
        }
        if (weapon.type == 1){
          if (attackTimer > 15){
            isAttacking = false;
            attackTimer = 0;
            //hitbox = null;
          }
        }
        hitbox.draw();
        attackTimer++;
      }      
      
      else{
      //slime animation--------------
      //noStroke();
      //fill(30, 30, 100);
      /*if (!right){
      }
      */
      if (dx==0 && dy==0) { //not moving 
        image(slimeRun[0+offset], x, y);
      }
      else { //moving
        if (right) {offset = 0; } //facing right
        else {offset = 5;} //facing left
        
        image(slimeRun[currentFrame+offset], x, y);
        //print(currentFrame+offset);
        if (delay==0) {
          currentFrame = (currentFrame+1)%5;
        } 
      } 
      delay = (delay+1)%8; //change speed of animation
      }
      t++;
    }
  }
  
  void update() {
    if (y < 5) {
      if (moveSq(0)) { y = height-5; }
      else { dy = 0; y++; }
    }
    if (x > width-5) {
      if (moveSq(1)) { x = 5; }
      else {dx = 0; x--; }
    }
    if (y > height-5) {
      if (moveSq(2)) { y = 5; }
      else {dy = 0; y--;}
    }
    if (x < 5) {
      if (moveSq(3)) { x = width-5; }
      else {dx = 0; x++;}
    }
    if (t <= 60) { dash(); }
    x += dx;
    y += dy;
  }
  
  void status() {
    textSize(12); 
    fill(255); 
    if (health < 10) { text("HEALTH: " + "000" + health, 272, 18); } 
    else if (health < 100) { text("HEALTH: " + "00" + health, 272, 18); } 
    else if (health < 1000) { text("HEALTH: " + "0" + health, 272, 18); 
    } else { text("HEALTH: " + health, 272, 18); }
    
    fill(255, 0, 0);
    noStroke();
    rect(10, 10, health, 10);
    noFill();
    stroke(255);
    strokeWeight(1);
    rect(10, 10, 100, 10);
    
    
    
    if (attack < 10) { text("ATTACK: " + "000" + attack, 272, 34); } 
    else if (attack < 100) { text("ATTACK: " + "00" + attack, 272, 34); } 
    else if (attack < 1000) { text("ATTACK: " + "0" + attack, 272, 34); } 
    else { text("ATTACK: " + attack, 272, 34); }
  }    
  // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  
  
  
  void dash() {
    if (t == 0) {dx *= 3; dy *= 3;}
    if (t == 5) {dx /= 3; dy /= 3;}
    
  }
  
  void attack() {
    isAttacking = true;
    //if (weapon.type == 0){
      if (right){
        hitbox = new MeleeAttack(x+10, x+70, y-20, y+20);
      }
      else{
        hitbox = new MeleeAttack(x-70, x-10, y-20, y+20);
      }
    //}
    /*if (weapon.type == 1){
      if (right){
        hitbox = new MeleeAttack(x+10, x+80, y-20, y+20);
      }
      else{
        hitbox = new MeleeAttack(x-80, x-10, y-20, y+20);
      }
    }*/
    /*if (weapon.type == 2){
      
    }*/
  }
  
}
