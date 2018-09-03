
#Figure 9.2 BEAST2 MCCT Tree - Not time calibrated

#BEAST Tree
library(ape)
library(phytools)
library(dplyr)
library(shape)
library(phyloch)
library(RCurl)

#Reading in MCCT tree from BEAST analysis (not time calibrated)
plains_beast_tree <- read.beast("https://raw.githubusercontent.com/erikgjes/Bayes_Phylogenies/master/plains_houses_Mk_4_strict_Sky50_MCCT.trees")

#png("~/Dropbox/Phylogenies_Book_Chapter/Graphics/beast_tree.png",
#    res=300,units="in",height=9,width=10)  #To create a usable graphic for powerpoint

#tiff("~/Dropbox/Phylogenies_Book_Chapter/Graphics/beast_tree.tiff",
#     res=300,units="in",height=9,width=10)  #To create a usable graphic for publication

plot.phylo(plains_beast_tree,cex=0.7,use.edge.length = T,align.tip.label = F,label.offset = 0.005)
nodelabels(as.numeric(round(plains_beast_tree$posterior,digits=2)),cex=0.5,frame="none",adj=c(1.25,-0.8))
tip.shapes=c(16,15,16,16,16,15,15,15,16,16,16,15,15,15,15,17,15,15,15,16,16,17,15,16,17,16,17,17,15,17,15,15,15,17,16,16,17,17,15,15)
tip.color=c("navyblue","darkseagreen","dodgerblue","dodgerblue","navyblue","darkgreen","darkseagreen","darkseagreen","navyblue","navyblue","blue","darkgreen","darkgreen","darkgreen","darkseagreen","firebrick","green","darkgreen","darkgreen","dodgerblue","dodgerblue","red","darkgreen","blue","firebrick","blue","firebrick","red","darkgreen","firebrick","green","darkgreen","darkgreen","pink","navyblue","navyblue","red","red","darkseagreen","darkseagreen")
tiplabels(frame="none",pch=tip.shapes,col = tip.color,cex=1.5)

par(xpd=NA)
#Legend - Central Plains
polygon(x=c(-0.006,-0.002,0.002),y=c(-1.5,-0.5,-1.5),col="firebrick",border=NA)
polygon(x=c(-0.006,-0.002,0.002),y=c(-3,-2,-3),col="red",border=NA)
polygon(x=c(-0.006,-0.002,0.002),y=c(-4.5,-3.5,-4.5),col="pink",border=NA)
text("Central Plains - Upper Republican",x=0,y=-1.25,pos=4,cex=0.9)
text("Central Plains - Nebraska",x=0,y=-2.75,pos=4,cex=0.9)
text("Central Plains - Loup River",x=0,y=-4.25,pos=4,cex=0.9)

#Legend - Middle Missouri
rect(18/146,-0.5,19/146,-1.5,col="darkgreen",border=NA)
rect(18/146,-2,19/146,-3,col="darkseagreen",border=NA)
rect(18/146,-3.5,19/146,-4.5,col="green",border=NA)
text("Middle Missouri - Initial",x=19/146,y=-1.25,pos=4,cex=0.9)
text("Middle Missouri - Extended",x=19/146,y=-2.75,pos=4,cex=0.9)
text("Middle Missouri - Terminal",x=19/146,y=-4.25,pos=4,cex=0.9)

#Legend - Middle Missouri
filledcircle(r1=0.6/146,mid=c(35/146,-1),col="navyblue")
filledcircle(r1=0.6/146,mid=c(35/146,-2.5),col="blue")
filledcircle(r1=0.6/146,mid=c(35/146,-4),col="dodgerblue")
text("Coalescent - Initial",x=35.5/146,y=-1.25,pos=4,cex=0.9)
text("Coalescent - Extended",x=35.5/146,y=-2.75,pos=4,cex=0.9)
text("Coalescent - Post-Contact",x=35.5/146,y=-4.25,pos=4,cex=0.9)

#dev.off()
