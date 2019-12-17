Ball[] balls;

void setup(){
  size(600,400);
  balls = new Ball[5];
  
  for (int i = 0; i < balls.length; i++){
    balls[i] = new Ball();
  }
  
  stroke(255);
  noFill();
}

void draw() {
  
  background(0);
  
  for (Ball b : balls){
  
    PVector grav = new PVector(0,0.3);
    grav.mult(b.mass);
    b.applyForce(grav);
      
    //PVector wind = new PVector(0.2,0);
    //b.applyForce(wind);
    
    if (mousePressed){
      PVector friction = b.velocity.get();
      friction.normalize();
      float c = -0.01;
      friction.mult(c);
      b.applyForce(friction);
    }
    
    b.update();
    b.bounce();
    b.display();
  }
}
