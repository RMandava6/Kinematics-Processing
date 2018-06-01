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

  int[] x = new int[]{ 0,width/2,width, width, width,width/2,0,0};
  int[] y = new int[]{ 0,0,0, height/2, height,height,height,height/2};
  for (int i=0; i< 8; i++) {
     
    tentacles.add( buildTentacle(x[i], y[i])); 
    
  }
}

private Tentacle buildTentacle(int x, int y){
  return new Tentacle(x, y, 4); 
=======
  for (int i=1; i< 7; i++) {
    tentacles.add( buildTentacle(i)); 
  }
}

private Tentacle buildTentacle(int index){
  return new Tentacle(width/index, height, index*3); 

}

void draw()
{

  loadSpaceImage();

  background(120);

  for (Tentacle t:tentacles) {
    t.update();
    t.show();
  }
  pos.add(vel);
  noStroke();

  fill(250,0,6,150);

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

  int step=4;
  int sign = vel.x<0? -1: 1;
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
 
void loadSpaceImage()
{
  PImage img;
  img = loadImage("/Users/ramya/Documents/GitHub/Kinematics-Processing/Data/Space.jpg");
  image(img, 0, 0);   
}

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
 

