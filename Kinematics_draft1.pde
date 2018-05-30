
//ArrayList<Tentacle> tentacles;
Tentacle t;

PVector pos;
PVector vel;

void setup()
{
  size(800, 600);
  pos = new PVector(0,0);
  vel = new PVector(2, 1.3);
  vel.mult(3);
  //tentacles = new ArrayList<Tentacle>();
  t = new Tentacle(width/2, height); 
}

void draw()
{
  background(51);
  t.update();
  t.show();
  
  pos.add(vel);
  noStroke();
  fill(100,255,0);
  ellipse(pos.x, pos.y, 32, 32);
  
  if(pos.x>width|| pos.x<0)
  {
    vel.x*= -1;
  }
  
  if(pos.y>height || pos.y<0)
  {
    vel.y*= -1;
  }
}
 
