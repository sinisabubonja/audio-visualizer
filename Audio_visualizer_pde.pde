PImage [] images=new PImage[151];
Maxim maxim;
AudioPlayer player;
float[] spec;

int br=0;
int sp=1;
float speed=1.0;
float max_speed=3;
float c1=random(0,1);
float c2=random(0,1);
float c3=random(0,1);
float c4=random(0,1);
float f=0.3;
float c=(c1+c2+c3+c4)/4.0;
float power=0;
float old;
float vol=1.0;
float x, y;
float a=1000;
float koef=random(10,900);
float op=random(0,10);
int i=1;
int j=1;
int k=1;

void setup()
{
 size(400,640);
 maxim = new Maxim(this);
 player = maxim.loadFile("mysong.wav");
 player.setLooping(true);
 player.volume(1.00);
 player.setAnalysing(true);
 imageMode(CENTER);
 colorMode(HSB,255,255,255); 
 //320x240
 images=loadImages("Circ_hole/circ.hole+(loop)-Mobile_", ".png", 151);
 background(0);
}

void draw()
{
  c1=random(0,1);
  c2=random(0,1);
  c3=random(0,1);
  c4=random(0,1);
  c=(c1+c2+c3+c4)/4.0;
    
  if (br>151)
  {
   br=1; 
  }
  else
  {  
   if (br==int(br+i*speed)) 
     i++;
     else
       i=1;
   br=int(br+i*speed);
   if (br>151) 
     br=br%151;
  }
  if (br==1)
  {
    if (j==1)
      plasma(0,250,width, height-250,c1,c2,c3,c4);
    koef=random(10,900);
    op=random(0,10);
    if(j==1)
    {
    j=0;
    fill(0,0,0);
    rect(0,0,width,250);
    }
  }
  image(images[br], width/2, 125, images[br].width/1.61, images[br].height/1.61);
  player.play();
  
  if(k!=int(k+sp*speed))
  {
  old=power;
  power=player.getAveragePower();
  k=int(k+sp*speed);
  stroke(c*150,240,240);
  line(k*0.4+(1-speed)*3,250-(old*700)*vol,(k+1)*0.4+(1-speed)*3,250-(power*700)*vol);
  spec = player.getPowerSpectrum();
  for(int l=0;l<spec.length;l++)
  {
    x=constrain(a*spec[l]*sin(a*spec[l]),-200,200);
    y=constrain(a*spec[l]*cos(a*spec[l]),-190,190);
    fill((int(c*155)+128)%255,240,240,op);
    shininess(power*koef*vol);
    rect(200+x,440+y,koef*spec[l]*vol,koef*power*vol);   
  }
  sp=1;
  }
  else
{
  k=int(k+sp*speed);
  sp++;
  }
  if(k>=1000)
  {
  k=1;
  plasma(0,250,width, height-250,c1,c2,c3,c4);
  fill(0,0,0);
  noStroke();
  rect(0,0,width,250);
  }
}

void mousePressed()
{  
  c1=random(0,1);
  c2=random(0,1);
  c3=random(0,1);
  c4=random(0,1);
  c=(c1+c2+c3+c4)/4.0;
  if (mouseY>250)
    {
      vol=(mouseX*1.0)/width;
      player.volume(vol);    
      plasma(mouseX,250,width*power*vol, height-250,c1,c2,c3,c4);  
      fill(0,0,0);
      noStroke();
      rect(300,0,100,20);
      fill(c*150,240,240);
      textSize(12);
      text("Volume: "+floor(vol*100)+"%", 312, 17);    
    }
  if(mouseY<250)
  {
    speed=((mouseX*1.0)/width)*max_speed;
    player.speed(speed);
    fill(0,0,0);
    noStroke();
    rect(300,0,100,20);
    fill(c*150,240,240);
    textSize(12);
    text("Speed: "+floor(speed*100)+"%", 312, 17);  
  }
}

void mouseDragged()
{
  c1=random(0,1);
  c2=random(0,1);
  c3=random(0,1);
  c4=random(0,1);
  c=(c1+c2+c3+c4)/4.0;
  if (mouseY>250)
    {
    vol=(mouseX*1.0)/width;
    player.volume(vol);
    stroke(c*150,240,240);
    line(mouseX,250,mouseX,height);
    fill(0,0,0);
    noStroke();
    rect(300,0,100,20);
    fill(c*150,240,240);
    textSize(12);
    text("Volume: "+floor(vol*100)+"%", 312, 17);
    }
  if(mouseY<250)
  {
    speed=((mouseX*1.0)/width)*max_speed;
    player.speed(speed);
    fill(0,0,0);
    noStroke();
    rect(300,0,100,20);
    fill(c*150,240,240);
    textSize(12);
    text("Speed: "+floor(speed*100)+"%", 312, 17);  
  }
}

void mouseReleased()
{
  fill(0,0,0);
  noStroke();
  rect(300,0,100,20);
}
