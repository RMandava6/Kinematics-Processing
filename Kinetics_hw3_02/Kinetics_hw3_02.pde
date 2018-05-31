import java.util.List;
import java.util.LinkedList;


private List<Tentacle> tentacles;
private int theColor;
private int backgroundColor;

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
  for (int i=1; i< 8; i++) {
    tentacles.add( buildTentacle(i)); 
  }
}

private Tentacle buildTentacle(int index){
  return new Tentacle(width/index, height, index*3); 
}

void draw()
{
  background(backgroundColor, 95, 95);
  for (Tentacle t:tentacles) {
    t.update();
    t.show(this.theColor);
  }
  pos.add(vel);
  noStroke();
  fill(190,120,0);
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
  int step=4;
  int sign = vel.x<0? -1: 1;
  this.theColor= random.nextInt(255);
  this.backgroundColor= random.nextInt(255);
  if(speedFactor<4) {
    vel.x = Math.min(vel.x+ (sign * step), width);
    vel.y = Math.min(vel.y+ (sign * step), height);
    speedFactor++;
  }
  else {
    vel.x=5;
    vel.y=5;
    speedFactor=1;
  }
}
 
