class EndRoom extends Square{
  Boss waffler;
  boolean won;
    
  public EndRoom(int r, int c) { 
    super(r, c);
    waffler = new Boss();
    isCompleted = false;
  }
  
  void draw() {
  //text("END", 200, 200); 
  if (!waffler.dead){
  waffler.draw();
  if (p.x > 280) { p.dx = 0; p.x --;}
  
  fill(255, 0, 0);
  noStroke();
  rect(10, 380, waffler.health / 5, 10);
  noFill();
  stroke(255);
  strokeWeight(1);
  rect(10, 380, 200, 10);
  }
  else{
    won = true;
  }
  if (won){
    background(0); 
    fill(255); 
    text("You Win!", 200, 200);
    textAlign(CENTER);
  }
  }
  //fight boss?
}
