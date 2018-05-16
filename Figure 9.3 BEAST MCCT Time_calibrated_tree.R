
###Figure 9.3 Time Calibrated Tree
library(ape)
library(phytools)
library(dplyr)
library(shape)
library(phyloch)

beast_tree_dates<-read.beast("https://raw.githubusercontent.com/erikgjes/Bayes_Phylogenies/master/plains_houses_Mk_4_strict_Sky_subs_Calib_BP_TipDates_Cor_MCCT.tre")

#png("~/Dropbox/Phylogenies_Book_Chapter/Graphics/Beast_Time.png",
#    res=300,units="in",height=9,width=10)  #To create a usable graphic for powerpoint
#tiff("~/Dropbox/Phylogenies_Book_Chapter/Graphics/Beast_Time.tiff",
#     res=300,units="in",height=9,width=10)  #To create a usable graphic for powerpoint

plot.phylo(beast_tree_dates,cex=0.7,use.edge.length = T,align.tip.label = F,label.offset = 10)
#nodelabels(as.numeric(round(plains_beast_tree$posterior,digits=2)),cex=0.5,frame="none",adj=c(1.25,-0.8))
tip.shapes=c(16,15,16,16,16,15,15,15,16,16,16,15,15,15,15,17,15,15,15,16,16,17,15,16,17,16,17,17,15,17,15,15,15,17,16,16,17,17,15,15)
tip.color=c("navyblue","darkseagreen","dodgerblue","dodgerblue","navyblue","darkgreen","darkseagreen","darkseagreen","navyblue","navyblue","blue","darkgreen","darkgreen","darkgreen","darkseagreen","firebrick","green","darkgreen","darkgreen","dodgerblue","dodgerblue","red","darkgreen","blue","firebrick","blue","firebrick","red","darkgreen","firebrick","green","darkgreen","darkgreen","pink","navyblue","navyblue","red","red","darkseagreen","darkseagreen")
tiplabels(frame="none",pch=tip.shapes,col = tip.color,cex=1.5)

#axisPhylo(root.time = 800,backward=F) Does not seem to have the dates correct
#axisPhylo(root.time=1000,backward=F)

#Placing dates on the x-axis manually as branch lengths are in substitution rates
par(xpd=T)
mtext("Year (AD)", side=1,line=4,at=(1950-550)-870)
segments(-70,-1,1030,-1)
segments((1950-50)-870,-1,(1950-50)-870,-2) #1900
text((1950-50)-870,-4,"1900")
segments((1950-150)-870,-1,(1950-150)-870,-2) #1800
text((1950-150)-870,-4,"1800")
segments((1950-250)-870,-1,(1950-250)-870,-2) #1700
text((1950-250)-870,-4,"1700")
segments((1950-350)-870,-1,(1950-350)-870,-2) #1600
text((1950-350)-870,-4,"1600")
segments((1950-450)-870,-1,(1950-450)-870,-2) #1500
text((1950-450)-870,-4,"1500")
segments((1950-550)-870,-1,(1950-550)-870,-2) #1400
text((1950-550)-870,-4,"1400")
segments((1950-650)-870,-1,(1950-650)-870,-2) #1300
text((1950-650)-870,-4,"1300")
segments((1950-750)-870,-1,(1950-750)-870,-2) #1300
text((1950-750)-870,-4,"1200")
segments((1950-850)-870,-1,(1950-850)-870,-2) #1300
text((1950-850)-870,-4,"1100")
segments((1950-950)-870,-1,(1950-950)-870,-2) #1300
text((1950-950)-870,-4,"1000")
segments((1950-1050)-870,-1,(1950-1050)-870,-2) #1300
text((1950-1050)-870,-4,"900")
segments((1950-1150)-870,-1,(1950-1150)-870,-2) #1300
text((1950-1150)-870,-4,"800")

#abline(v=1950-1450)
#dev.off()


