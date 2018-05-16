
#Figure 9.2 Methods to examine rate variation in trees
library(dplyr)
library(phyloch)
library(phytools)

#Figure 9.2a - Gamma Distribution
#Example of a gamma distribution used to identify the gamma rate categoreis

#png("~/Dropbox/Phylogenies_Book_Chapter/Graphics/Gamma_Distribution.png",
#    res=300,units="in",height=5,width=5)  #To create a usable graphic for powerpoint

#tiff("~/Dropbox/Phylogenies_Book_Chapter/Graphics/Gamma_Distribution.tiff",
#     res=300,units="in",height=5,width=5)  #To create a usable graphic for powerpoint
 
shape=0.95 #as estimated from BEAST2 for plains house data
rate=0.95 #as estimated from BEAST2 for plains house data
fx<-seq(0,4,length=100000) #four rate categories following Yang et al. 
x<-dgamma(fx,shape=shape,rate=rate) #gamma distribution

data<-data.frame(fx=fx,x=x)
data<-data[-1,]
par(mar=c(5.1,4.1,4.1,2.1))
plot(data$x, data$fx, type="l", lty=1, xlab="", xlim=c(0,max(data$x)),
     ylab="",bty="n", main="Gamma Distribution",yaxt="n",xaxt="n")  #plotting general shape of gamma distribution 
axis(2,at=c(-.12,1.12,2.12,3.12,4.12),labels=c(0,1,2,3,4),line=-0.7)
axis(1,at=c(.02,0.52,1.02,1.52),labels=c(0,0.5,1,1.5))
mtext("x",side=1,line=2)
mtext("f(x)",side=2,line=2)
xpd=NA

#See Yang et al. 1994 for description
#Category 4 of gamma rate distribution (the upper 75-100 pecntiles)
b4<-data[which(x>=qgamma(0.75,shape=shape,rate=rate)),]
b4.x<-c(b4$x[nrow(b4):1],b4$x[1:nrow(b4)])
b4.y<-c(b4$fx[nrow(b4):1],rep(-.12,nrow(b4)))
polygon(b4.x,b4.y,col="grey20",lwd=2)

#Category 3 of gamma rate distribution (the 50-75 pecentiles)
b3<-data[which(x<=qgamma(0.7511,shape=shape,rate=rate)),]
b3<-b3[which(x>qgamma(0.5,shape=shape,rate=rate)),]
b3.x<-c(b3$x[nrow(b3):1],b3$x[1:nrow(b3)])
b3.y<-c(b3$fx[nrow(b3):1],rep(-.12,nrow(b3)))
polygon(b3.x,b3.y,col="grey40",lwd=2)

#Category 2 of gamma rate distribution (the 25-50 pecentiles)
b2<-data[which(x<qgamma(0.5,shape=shape,rate=rate)),]
b2<-b2[which(x>=qgamma(0.25,shape=shape,rate=rate)),]
b2.x<-c(b2$x[nrow(b2):1],b2$x[1:nrow(b2)])
b2.y<-c(b2$fx[nrow(b2):1],rep(-.12,nrow(b2)))
polygon(b2.x,b2.y,col="grey60",lwd=2)

#Category 1 of gamma rate distribution (the 1-25 pecentiles)
b1<-data[which(x<qgamma(0.25,shape=shape,rate=rate)),]
#b1<-b1[which(x>qgamma(0,shape=shape,rate=rate)),]
b1.x<-c(b1$x[nrow(b1):1],b1$x[1:nrow(b1)])
b1.y<-c(b1$fx[nrow(b1):1],rep(-.12,nrow(b1)))
polygon(b1.x,b1.y,col="grey80",lwd=2)

#dev.off()


###Figure 4b - Branch Length Distribution

#Trees (50,000) from best fitting model (may take a few minutes to load)
plains_beast <- read.nexus("https://raw.githubusercontent.com/erikgjes/Bayes_Phylogenies/master/plains_houses_Mk_4_strict_Sky50.trees")

#This function aggregates all of the branch lengths from the 50,000 trees together so they can plotted in a historgram
bl_agg<-function(x){  
  bl=matrix(nrow=length(x),ncol=length(x[[1]][[2]]))
  for (i in 1:length(x)){
    z<-x[[i]][[2]]
    bl[i,]<-as.numeric(z)
  }
  branch_lengths<<-bl
}

bl_agg(plains_beast) #may also take a few minutes to finish
all_bl<-apply(branch_lengths,2,c) #combines the branch lengths together

#png("~/Dropbox/Phylogenies_Book_Chapter/Graphics/Branch_Lengths.png",
#    res=300,units="in",height=4,width=5) 

#tiff("~/Dropbox/Phylogenies_Book_Chapter/Graphics/Branch_Lengths_2.tiff",
#     res=300,units="in",height=4,width=5)  #To create a usable graphic for powerpoint

#This is slightly different from the figure in the chapter, as I am using the 50,000 tree sample (as opposed to the 10,000)
#in order to remain consistent throughout this figure, the shape of histogram does not change
hist(all_bl,xlim=c(0,0.25),breaks = 10000,ylim=c(0,70000),cex=0.5,
     main="Distribution of Branch Lengths",xlab="Branch Lengths",ylab="Frequency")

#dev.off()

###Figure 4c - Color coded tree

plains_beast_MCCT <- read.nexus("https://raw.githubusercontent.com/erikgjes/Bayes_Phylogenies/master/plains_houses_Mk_4_strict_Sky50_MCCT.trees")

#png("~/Dropbox/Phylogenies_Book_Chapter/Graphics/Beast_Tree_Color_Grey.png",
#    res=300,units="in",height=9,width=10)  #To create a usable graphic for powerpoint

tiff("~/Dropbox/Phylogenies_Book_Chapter/Graphics/Beast_Tree_Color_Grey.tiff",
     res=300,units="in",height=9,width=10)  #To create a usable graphic for powerpoint
plotBranchbyTrait(plains_beast_MCCT,plains_beast_MCCT$edge.length,mode="edges",label.offset=0.01,
                  use.edge.length=T,palette=colorRampPalette(c("grey90","black")))

tip.shapes=c(16,15,16,16,16,15,15,15,16,16,16,15,15,15,15,17,15,15,15,16,16,17,15,16,17,16,17,17,15,17,15,15,15,17,16,16,17,17,15,15)
tip.color=c("navyblue","darkseagreen","dodgerblue","dodgerblue","navyblue","darkgreen","darkseagreen","darkseagreen","navyblue","navyblue","blue","darkgreen","darkgreen","darkgreen","darkseagreen","firebrick","green","darkgreen","darkgreen","dodgerblue","dodgerblue","red","darkgreen","blue","firebrick","blue","firebrick","red","darkgreen","firebrick","green","darkgreen","darkgreen","pink","navyblue","navyblue","red","red","darkseagreen","darkseagreen")
tiplabels(frame="none",pch=tip.shapes,col = tip.color,cex=1.5)

#dev.off()
