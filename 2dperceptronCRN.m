Get[NotebookDirectory[]<>"init.m"];
Perceptron[a1_,a2_,ans_,b1_,b2_,ansb_,c1_,c2_,ansc_,d1_,d2_,ansd_,e1_,e2_,anse_] :=
(
	crn = {
		conc[bias,0],
		conc[ax,a1],conc[ay,a2],conc[aans,ans],
		conc[bx,b1],conc[by,b2],conc[bans,ansb],
		conc[cx,c1],conc[cy,c2],conc[cans,ansc],
		conc[dx,d1],conc[dy,d2],conc[dans,ansd],
		conc[ex,e1],conc[ey,e2],conc[eans,anse],
		conc[wx,0],conc[wy,0],conc[one,1], conc[zero,0],
		
		step[{
			mul[ax,wx,sx],
			mul[ay,wy,sy],
			add[sx,sy,y],
			add[y,bias,yb],
			mul[yb,aans,ytmp],
			cmp[ytmp,zero],
			mul[ax,aans,addWeightx],
			mul[ay,aans,addWeighty],
			add[wx,addWeightx,newWeightx],
			add[wy,addWeighty,newWeighty]
		}],
		step[{
			ifLE[{
				ld[newWeightx,wx],
				ld[newWeighty,wy]
			}]
		}],
		step[{
			mul[bx,wx,sx],
			mul[by,wy,sy],
			add[sx,sy,y],
			add[y,bias,yb],
			mul[yb,bans,ytmp],
			cmp[ytmp,zero],
			mul[bx,bans,addWeightx],
			mul[by,bans,addWeighty],
			add[wx,addWeightx,newWeightx],
			add[wy,addWeighty,newWeighty]
		}],
		step[{
			ifLE[{
				ld[newWeightx,wx],
				ld[newWeighty,wy]
			}]
		
		}],
		
		step[{
			mul[cx,wx,sx],
			mul[cy,wy,sy],
			add[sx,sy,y],
			add[y,bias,yb],
			mul[yb,cans,ytmp],
			cmp[ytmp,zero],
			mul[cx,cans,addWeightx],
			mul[cy,cans,addWeighty],
			add[wx,addWeightx,newWeightx],
			add[wy,addWeighty,newWeighty]
		}],
		step[{
			ifLE[{
				ld[newWeightx,wx],
				ld[newWeighty,wy]
			}]
		
		}],
	
		step[{
			mul[dx,wx,sx],
			mul[dy,wy,sy],
			add[sx,sy,y],
			add[y,bias,yb],
			mul[yb,dans,ytmp],
			cmp[ytmp,zero],
			mul[dx,dans,addWeightx],
			mul[dy,dans,addWeighty],
			add[wx,addWeightx,newWeightx],
			add[wy,addWeighty,newWeighty]
		}],
		step[{
			ifLE[{
				ld[newWeightx,wx],
				ld[newWeighty,wy]
			}]
		
		}],
		step[{
			mul[ex,wx,sx],
			mul[ey,wy,sy],
			add[sx,sy,y],
			add[y,bias,yb],
			mul[yb,eans,ytmp],
			cmp[ytmp,zero],
			mul[ex,eans,addWeightx],
			mul[ey,eans,addWeighty],
			add[wx,addWeightx,newWeightx],
			add[wy,addWeighty,newWeighty]
		}],
		step[{
			ifLE[{
				ld[newWeightx,wx],
				ld[newWeighty,wy]
			}]
		}]
	};
	Return[crn];
);



tmax=2200;
rsys = Perceptron[0,1,1, 1,2,1, 2,3,1, 0,-1,-1,1,0,-1];
sol=SimulateRxnsys[ExpandDiscreteRsys[rsys],tmax];
PlotForPaper[Evaluate[{wx[t]}/.sol,tmax,200]]
PlotForPaper[Evaluate[{wy[t]}/.sol,tmax,200]]
errorMap=EvaluateError[rsys, tmax]
cErrorList=errorMap[wx]/.{resultMap_}:>{resultMap["time"],resultMap["error"]};
ListPlot[cErrorList,Ticks->{Range[0,tmax,100],Automatic}]
Print["maximum error for c: "<>ToString[Max[cErrorList/.{time_,error_}->error]]];

