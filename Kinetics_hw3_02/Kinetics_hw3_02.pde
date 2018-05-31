import java.util.List;
import java.util.LinkedList;


private List<Tentacle> tentacles;
private int theColor;
//private int backgroundColor;

private PVector pos;
private PVector vel;
private volatile int speedFactor=0;

void setup()
{
  size(800, 600);
  //loadSpaceImage();
  pos = new PVector(0,0);
  vel = new PVector(2, 1.3);
  vel.mult(3);
  tentacles = new LinkedList<Tentacle>();
  //int x = width;
  int[] x = new int[]{ 0,width/2,width, width, width,width/2,0,0};
  //int y = height;
  int[] y = new int[]{ 0,0,0, height/2, height,height,height,height/2};
  for (int i=0; i< 8; i++) {
     
    tentacles.add( buildTentacle(x[i], y[i])); 
    
  }
}

private Tentacle buildTentacle(int x, int y){
  return new Tentacle(x, y, 4); 
}

void draw()
{
  //background(backgroundColor, 95, 95);
  loadSpaceImage();
  for (Tentacle t:tentacles) {
    t.update();
    //fill(210, 56, 51, 200);
    t.show(this.theColor);
  }
  pos.add(vel);
  noStroke();
  fill(190,120,0,200);
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
 
void loadSpaceImage()
{
  PImage img;
  img = loadImage("/Users/ramya/Documents/GitHub/Kinematics-Processing/Data/Imgspace.jpg");
  image(img, 0, 0);   
}
