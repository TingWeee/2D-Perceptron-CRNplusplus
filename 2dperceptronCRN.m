
Perceptron[a1_,a2_,aAns_,b1_,b2_,bAns_,c1_,c2_,cAns_,d1_,d2_,dAns_,e1_,e2_,eAns_]:=
(
  crn = {
    conc[zero,0],conc[neg, -1],
    conc[wx,0],conc[wy,0],
    
    (*initialising variables*)
    conc[ax,a1],conc[ay,a2],
    conc[bx,b1],conc[by,b2],
    conc[cx,c1],conc[cy,c2],
    conc[dx,d1],conc[dy,d2],
    conc[ex,e1],conc[ey,e2],
    
    (*
    each step is in an INFINITE loop
    we expect wx and wy to converge eventually
    y = ax*wx + ay*wy this the weighted sum
    new wx = ax*y + wx
    new wy = ay*y + wy
    *)
    
    step[{
      mul[ax,wx,sx],mul[ay,wy,sy],
    }],
    (* start of repeat*)
    step[{
      add[sx,sy,y]
    }],
    step[{
      mul[y,aAns,ytmp]
    }],
    step[{
      cmp[ytmp, zero] (*see if Pos -> correct, neg -> wrong*)
      mul[ax,y,addWeightx],
      mul[ay,y,addWeighty],
    }],
    step[{
      add[wx,addWeightx,newWeightx],
      add[wy,addWeighty,newWeighty]
    }],
   
    step[{
      ifLT[{
        ld[newWeightx,wx],
        ld[newWeighty,wy]
      }]
    }], 
    (* end of repeat*)
    
    step[{
      mul[bx,wx,sx],mul[by*wy,sy],
    }],
    step[{
      add[sx,sy,y]
    }],
    step[{
      mul[y,bAns,ytmp]
    }],
    step[{
      cmp[ytmp, zero] (*see if Pos -> correct, neg -> wrong*)
      mul[ax,y,addWeightx],
      mul[ay,y,addWeighty],
    }],
    step[{
      add[wx,addWeightx,newWeightx],
      add[wy,addWeighty,newWeighty]
    }],
   
    step[{
      ifLT[{
        ld[newWeightx,wx],
        ld[newWeighty,wy]
      }]
    }],
   
    step[{
      mul[cx,wx,sx],mul[cy*wy,sy],
    }],
    (*repeat*)
   step[{
      add[sx,sy,y]
    }],
    step[{
      mul[y,cAns,ytmp]
    }],
    step[{
      cmp[ytmp, zero] (*see if Pos -> correct, neg -> wrong*)
      mul[ax,y,addWeightx],
      mul[ay,y,addWeighty],
    }],
    step[{
      add[wx,addWeightx,newWeightx],
      add[wy,addWeighty,newWeighty]
    }],
   
    step[{
      ifLT[{
        ld[newWeightx,wx],
        ld[newWeighty,wy]
      }]
    }],
   
    step[{
      mul[dx,wx,sx],mul[dy*wy,sy],
    }], 
    (*repeat*)
    step[{
      add[sx,sy,y]
    }],
    step[{
      mul[y,dAns,ytmp]
    }],
    step[{
      cmp[ytmp, zero] (*see if Pos -> correct, neg -> wrong*)
      mul[ax,y,addWeightx],
      mul[ay,y,addWeighty],
    }],
    step[{
      add[wx,addWeightx,newWeightx],
      add[wy,addWeighty,newWeighty]
    }],
   
    step[{
      ifLT[{
        ld[newWeightx,wx],
        ld[newWeighty,wy]
      }
    }],
    
    step[{
      mul[ex,wx,sx],mul[ey*wy,sy],
    }], 
    (*repeat*)
    
    step[{
      add[sx,sy,y]
    }],
    step[{
      mul[y,eAns,ytmp]
    }],
    step[{
      cmp[ytmp, zero] (*see if Pos -> correct, neg -> wrong*)
      mul[ax,y,addWeightx],
      mul[ay,y,addWeighty],
    }],
    step[{
      add[wx,addWeightx,newWeightx],
      add[wy,addWeighty,newWeighty]
    }],
   
    step[{
      ifLT[{
        ld[newWeightx,wx],
        ld[newWeighty,wy]
      }]
    }],
  };
  Return[crn];
 )

  
    
 
      
      
      
      
    
      
    
   
    
