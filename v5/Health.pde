class Health {
  int amt;
  Square pos;
  int x, y;
  
  public Health(int amt){
    this.amt = amt;
  }
  
  void draw() {
    fill(0, 255, 0);
    ellipse(x, y, 5, 5);
  }
}
