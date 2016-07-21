void plasma(float x, float y,float w, float h, float c1, float c2, float c3, float c4)
{
   float rand=randomGaussian();
   float c, m, e1, e2, e3, e4;
   
   if ((w<1.0)&&(h<1.0))
   {
     c=(c1+c2+c3+c4)/4.0;
     set((int)x,(int)y,color(c*150,240,240));
   }
   else
   {     
     m=(c1+c2+c3+c4)/4.0+(rand-floor(rand))*((w/width)*(h/height))*f;    
     e1=(c1+c2)/2.0;
     e2=(c2+c3)/2.0;
     e3=(c3+c4)/2.0;
     e4=(c4+c1)/2.0;
 
     if (m<=0)
     {
       m=0.0;
     }
     else if (m>1.0)
     {
       m=1.0;
     }
     
     w=w/2;
     h=h/2;
             
     plasma(x,y,w,h,c1,e1,m,e4);
     plasma(x+w,y,w,h,e1,c2,e2,m);
     plasma(x+w,y+h,w,h,m,e2,c3,e3);
     plasma(x,y+h,w,h,e4,m,e3,c4);
   }
}
