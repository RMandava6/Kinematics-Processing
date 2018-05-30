
//ArrayList<Tentacle> tentacles;
Tentacle t1;
//Tentacle t1;
//Tentacle t1;
//Tentacle t1;
//Tentacle t1;


PVector pos;
PVector vel;

void setup()
{
  size(800, 600);
  pos = new PVector(0,0);
  vel = new PVector(2, 1.3);
  vel.mult(3);
  //tentacles = new ArrayList<Tentacle>();
  t1 = new Tentacle(width/2, height); 
  
}

void draw()
{
  //frame.setTitle(mouseX + ", " + mouseY);
  background(51);
  t1.update();
  t1.show();
  velocity(200,10, 100, 255, 0, 225, 48, 48);
}
 
void velocity(float s, float sw, int f1, int f2, int f3, int f4, int e1, int e2)
{
  pos.add(vel);
  stroke(6, s);
  strokeWeight(sw);
  fill(f1, f2, f3, f4);
  ellipse(pos.x, pos.y, e1, e2);
  
  if(pos.x>width|| pos.x<0)
  {
    vel.x*= -1;
  }
  
  if(pos.y>height || pos.y<0)
  {
    vel.y*= -1;
  }
}
