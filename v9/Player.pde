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
  int projectileCtr;
  
  //animation stuff
  int currentFrame, delay, offset;
  PImage[] slimeRunRight;
  PImage[] slimeRunLeft;
  PImage[] slimeAttackRight;
  PImage[] slimeAttackLeft;
  PImage[] slimeDashRight;
  PImage[] slimeDashLeft;
  PImage projectileRight;
  PImage projectileLeft;
  
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
    projectiles = new RangedAttack[10];
    projectileCtr = 0;
    
    //animation
    currentFrame = 0;
    delay=0;  
    slimeRunRight = new PImage[5];
    slimeRunLeft = new PImage[5];
    slimeDashRight = new PImage[5];
    slimeDashLeft = new PImage[5];
    projectileRight = loadImage("slime/staff-right/projectile.png");
    projectileLeft = loadImage("slime/staff-left/projectile.png");
    setWeapon(0); //temp, sword
  }
  
  void setWeapon(int type) {

      if (type==0) {
        slimeAttackRight = new PImage[13];
        slimeAttackLeft = new PImage[13];
        for (int i = 0; i < 5; i++){
          slimeRunRight[i] = loadImage("slime/sword-right/sword-run-right" + (i+1) + ".png");
          slimeRunLeft[i] = loadImage("slime/sword-left/sword-run-left" + (i+1) + ".png");
        }
        for (int i = 0; i < 5; i++){
          slimeDashRight[i] = loadImage("slime/sword-right/sword-dash-right" + (i+1) + ".png");
          slimeDashLeft[i] = loadImage("slime/sword-left/sword-dash-left" + (i+1) + ".png");
        }
        for (int i = 0; i < 13; i++){
          slimeAttackRight[i] = loadImage("slime/sword-right/sword-attack-right" + (i+1) + ".png");
          slimeAttackLeft[i] = loadImage("slime/sword-left/sword-attack-left" + (i+1) + ".png");
        }
      }
      else if (type==1) {
        slimeAttackRight = new PImage[15];
        slimeAttackLeft = new PImage[15];
        for (int i = 0; i < 5; i++){
          slimeRunRight[i] = loadImage("slime/axe-right/axe-run-right" + (i+1) + ".png");
          slimeRunLeft[i] = loadImage("slime/axe-left/axe-run-left" + (i+1) + ".png");
        }
        for (int i = 0; i < 5; i++){
          slimeDashRight[i] = loadImage("slime/axe-right/axe-dash-right" + (i+1) + ".png");
          slimeDashLeft[i] = loadImage("slime/axe-left/axe-dash-left" + (i+1) + ".png");
        }
        for (int i = 0; i < 15; i++){
          slimeAttackRight[i] = loadImage("slime/axe-right/axe-attack-right" + (i+1) + ".png");
          slimeAttackLeft[i] = loadImage("slime/axe-left/axe-attack-left" + (i+1) + ".png");
        }
      }
      else if (type==2) {
        slimeAttackRight = new PImage[9];
        slimeAttackLeft = new PImage[9];
        for (int i = 0; i < 5; i++){
          slimeRunRight[i] = loadImage("slime/staff-right/staff-run-right" + (i+1) + ".png");
          slimeRunLeft[i] = loadImage("slime/staff-left/staff-run-left" + (i+1) + ".png");
        }
        for (int i = 0; i < 5; i++){
          slimeDashRight[i] = loadImage("slime/staff-right/staff-dash-right" + (i+1) + ".png");
          slimeDashLeft[i] = loadImage("slime/staff-left/staff-dash-left" + (i+1) + ".png");
        }
        for (int i = 0; i < 9; i++){
          slimeAttackRight[i] = loadImage("slime/staff-right/staff-attack-right" + (i+1) + ".png");
          slimeAttackLeft[i] = loadImage("slime/staff-left/staff-attack-left" + (i+1) + ".png");
        }
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
    for (int i = 0; i < 10; i++){
      if(projectiles[i] != null) {projectiles[i].draw(); projectiles[i].update();}
    }
    if (health <=0) {
      background(0); 
      fill(255); 
      text("GAME OVER", 200, 200);
      textAlign(CENTER);
    }
    else {
      //draw the guy
      
      weapon.draw();
      stroke(255);
      strokeWeight(5);
      if (pos.walls[0]) {line(1, 1, width-1, 1);}
      
      if (pos.walls[1]) {line(width-1, 1, width-1, height-1);}
      if (pos.walls[2]) {line(width-1, height-1, 1, height-1);}
      if (pos.walls[3]) {line(1, height-1, 1, 1);}
      pos.draw();
      
      if (isAttacking){
        if (weapon.type == 0){
          if (attackTimer > 12){
            isAttacking = false;
            attackTimer = 0;
            
          }          
          imageMode(CENTER);
          if (right){image(slimeAttackRight[attackTimer], x+23, y-11);}
          else {image(slimeAttackLeft[attackTimer], x-23, y-11);}
        }
        if (weapon.type == 1){
          if (attackTimer > 29){
            isAttacking = false;
            attackTimer = 0;
          }
          imageMode(CENTER);
          if (right){image(slimeAttackRight[attackTimer/2], x+23, y-11);}
          else {image(slimeAttackLeft[attackTimer/2], x-23, y-11);}
        }
        if (weapon.type == 2){
          if (attackTimer > 8){
            isAttacking = false;
            attackTimer = 0;
          }
          imageMode(CENTER);
          if (right){image(slimeAttackRight[attackTimer], x+23, y-11);}
          else {image(slimeAttackLeft[attackTimer], x-23, y-11);}
          if (attackTimer == 4){
            projectiles[projectileCtr] = new RangedAttack(x,y, right);
            projectileCtr = (projectileCtr + 1) % 10;
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
      if (t < 8){
        imageMode(CENTER);
        if (right){image(slimeDashRight[0], x+23, y-11);}
        else{image(slimeDashLeft[0], x-23, y-11);}
      }
      else if (t < 24){
        imageMode(CENTER);
        if (right){image(slimeDashRight[(t-8)/4 + 1], x+23, y-11);}
        else{image(slimeDashLeft[(t-8)/4 + 1], x-23, y-11);}
      }
      else{
      if (dx==0 && dy==0) { //not moving
      imageMode(CENTER);
      if (right){image(slimeRunRight[0], x+23, y-11);}
      else{image(slimeRunLeft[0], x-23, y-11);}
        //ellipse(x, y, 5, 5);
      }
      
      else { //moving
        imageMode(CENTER);
        if (right) {image(slimeRunRight[currentFrame], x+23, y-11);} //facing right
        else {image(slimeRunLeft[currentFrame], x-23, y-11);} //facing left
        if (delay==0) {
          currentFrame = (currentFrame+1)%5;
        } 
      } 
      delay = (delay+1)%8; //change speed of animation
      }
      }
      t++;
    }
    status(); 
  }
  
  void update() {
    if (y < 15) {
      if (moveSq(0)) { y = height-15; }
      else { dy = 0; y++; }
    }
    if (x > width-15) {
      if (moveSq(1)) { x = 15; if (r == 5 && c == 5){
      p.x = 100;
      p.y = 200;
    }}
      else {dx = 0; x--; }
    }
    if (y > height-15) {
      if (moveSq(2)) { y = 15; if (r == 5 && c == 5){
      p.x = 100;
      p.y = 200;
    }}
      else {dy = 0; y--;}
    }
    if (x < 15) {
      if (moveSq(3)) { x = width-15; }
      else {dx = 0; x++;}
    }
    
    if (t <= 60) { dash(); }
    x += dx;
    y += dy;
  }
  
  void status() {
    if (health > 0) {
      textSize(12); 
      fill(255); 
      if (health < 10) { text("HEALTH: " + "00" + health, 157, 20); } 
      else if (health < 100) { text("HEALTH: " + "0" + health, 157, 20); } 
      else if (health < 1000) { text("HEALTH: " + health, 157, 20); 
      } else { text("HEALTH: " + health, 157, 20); }
      
      //bar
      
      fill(255, 0, 0);
      noStroke();
      rect(10, 10, health, 10);
      noFill();
      stroke(255);
      strokeWeight(1);
      rect(10, 10, 100, 10);
    }
    
    //attack
    //if (attack < 10) { text("ATTACK: " + "000" + attack, 272, 34); } 
    //else if (attack < 100) { text("ATTACK: " + "00" + attack, 272, 34); } 
    //else if (attack < 1000) { text("ATTACK: " + "0" + attack, 272, 34); } 
    //else { text("ATTACK: " + attack, 272, 34); }
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
