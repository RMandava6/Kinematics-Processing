import java.util.List;
import java.util.LinkedList;


private List<Tentacle> tentacles;


private PVector pos;
private PVector vel;
private volatile int speedFactor=0;

void setup()
{
  size(800, 600);
  pos = new PVector(0,0);
  vel = new PVector(2, 1.3);
  vel.mult(3);
  tentacles = new LinkedList<Tentacle>();
  for (int i=1; i< 7; i++) {
    tentacles.add( buildTentacle(i)); 
  }
}

private Tentacle buildTentacle(int index){
  return new Tentacle(width/index, height, index*3); 
}

void draw()
{
  background(120);
  for (Tentacle t:tentacles) {
    t.update();
    t.show();
  }
  pos.add(vel);
  noStroke();
  fill(100,255,120);
  ellipse(pos.x, pos.y, 52, 52);
  
  if(pos.x>width|| pos.x<0)
  {
    vel.x*= -1;
  }
  
  if(pos.y>height || pos.y<0)
  {
    vel.y*= -1;
  }
}

void mouseClicked() {
  int step=2;
  if(speedFactor<6) {
    vel.x+=step;
    vel.y+=step;
    speedFactor++;
  }
  else {
        vel.x-=(speedFactor*step);
        vel.y-=(speedFactor*step);
        speedFactor=1;
  }
   
}
 
