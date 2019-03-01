class Jellyfish {
  
float jxSpeed, jySpeed, jzSpeed, jxRot,jyRot,jzRot;
int numSystems = 40; 
PSystem[] ps = new PSystem[numSystems]; 
float inx, iny, inz; 


float theta, theta2 = 0.0f; 
float amplitude;   
float x, y,z; 
float r; 
boolean vel;

float rotx,roty;
int bounds = 1000;
float jx,jy,jz;


Jellyfish(boolean vel) {
  this.vel=vel;
  inx = 0; 
  iny = 0; 
  
  for(int i=0; i<numSystems; i++){ 
    // dispose PSystems in a circle 
    x = r * cos(theta); 
    y = r * sin(theta); 
    z = 1;
    x += inx; 
    y += iny;       
    ps[i] = new PSystem(new PVector(x, y, z), 60, theta);  
    theta += 0.16; //0.057,inx,iny,inz,r2;
  } 
  r = 20.0f; //40
  amplitude = r; 

  this.jxSpeed = 1;
  this.jySpeed = 1; 
  this.jzSpeed = 1; 
  this.jxRot = random(100, 150);
  this.jyRot = random(100, 150);
  this.jzRot = random(100, 150);
}

void drawJelly() 
{   
  translate (width/2,height/2,zoom);
  rotx += map(mouseX, 0, width,-0.01,0.01) * HALF_PI;
  roty += map(mouseY, 0, height,-0.01,0.01) * HALF_PI; 
  rotateX(rotx);
  rotateY(roty);

  noSmooth(); 
  //background(224, 94, 28, 100); 
  waveR(); // cycle and run all the PSystems 

  pushMatrix();
  //if (!vel){
  //    inx= 542;
  //    iny = 542;
  //    inz = 542;
  //    r = 83;
  //    vel = false;
  //  }
    noiseDetail(1,0.2);
  jyRot += noise (-0,002,0.002);
  jzRot += noise (-0.002,0.002);
  rotateY(radians(jyRot));
  rotateZ(radians(jzRot));
  // inx = inx + 1;
  // iny = iny + 1;
  // inz = inz + 1;
  for(int i = 0; i < numSystems; i++) 
  {  
    ps[i].run(inx, iny, inz,r); 
  }  
 popMatrix();
} 

void waveR() 
{ 
  theta += 0.03;//0.05 
  r = theta; 
  r = sin(r)*amplitude; 
  r += 100; //100
} 

//void mouseDragged () {
//  zoom =-mouseY*4;
//}

}
