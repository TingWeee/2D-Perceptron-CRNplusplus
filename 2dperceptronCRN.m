Get[NotebookDirectory[]<>"init.m"];
Perceptron[a1_,a2_,ans_,b1_,b2_,ansb_,c1_,c2_,ansc_,d1_,d2_,ansd_,e1_,e2_,anse_] :=
(
	crn = {
		conc[ax,a1],conc[ay,a2],
		conc[bx,b1],conc[by,b2],
		conc[cx,c1],conc[cy,c2],
		conc[dx,d1],conc[dy,d2],
		conc[wx,0],conc[wy,0],conc[one,1], conc[zero,0],
		step[{
			mul[ax,wx,sx],
			mul[ay,wy,sy],
			add[sx,sy,y],
			mul[y,ans,ytmp],
			cmp[ytmp,zero],
			mul[ax,ans,addWeightx],
			mul[ay,ans,addWeighty],
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
			mul[y,ansb,ytmp],
			cmp[ytmp,zero],
			mul[bx,ansb,addWeightx],
			mul[by,ansb,addWeighty],
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
			mul[y,ansc,ytmp],
			cmp[ytmp,zero],
			mul[cx,ansc,addWeightx],
			mul[cy,ansc,addWeighty],
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
			mul[y,ansd,ytmp],
			cmp[ytmp,zero],
			mul[dx,ansd,addWeightx],
			mul[dy,ansd,addWeighty],
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
			mul[y,anse,ytmp],
			cmp[ytmp,zero],
			mul[ex,anse,addWeightx],
			mul[ey,anse,addWeighty],
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

Get[NotebookDirectory[]<>"/counter.m"]
tmax=112200;
rsys = Perceptron[0,1,1, 1,2,1, 2,3,1, 0,-1,-1,1,0,-1];
sol=SimulateRxnsys[ExpandDiscreteRsys[rsys],tmax];
PlotForPaper[Evaluate[{wx[t]}/.sol,tmax,2000]]
PlotForPaper[Evaluate[{wy[t]}/.sol,tmax,2000]]
