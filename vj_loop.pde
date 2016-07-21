
PImage [] loadImages(String stub, String extension, int numImages)
{
  PImage [] images=new PImage[152];//[1];
  for(int i =1; i<=numImages; i++)
  {
    PImage img=loadImage(stub+i+extension);
    if(img!=null)
    {
      //images = (PImage [])append(images,img);
      images[i]=img;//loadImage(stub+i+extension);
    }
    else
    {
      break;
    }
  }
  return images;
}
