library(ape)
library(phytools)

#Figure 9.1 - Hypothetical tree topologies based on expectations provided in the text

tree.string<-"((Sweetwater2,
(((TheodoreDavisB, TheodoreDavisC),(Patterson4,LittlePawneeCreek1)), 
((Owens3, Holdredge2),(MowryBluff1, RedWillow1)))),
((Huff,Shermer),
((FireHeartCreek33,Bendish3),((Cannonball1,Cannonball3),(ThomasRiggs1,ThomasRiggs3))),
((((Mitchell4,JiggsThompson4),(Langdeau4,PrettyHead7)),(Breeden2,(Swanson3,Swanson4))),(Dodd17,(Dodd29,Dodd76)))),
((((BigVillage1,BigVillage2),(LikeAFishhook18,LikeAFishhook5)),(Demery2,(OversLaRoche3B,Molstad7))),
((BlackPartizan11,Arzberger3),((CrowCreek1,CrowCreek3),(TalkingCrow1,TalkingCrow3)))));"


tree.string2<-"(((Huff,Shermer),
((FireHeartCreek33,Bendish3),((Cannonball1,Cannonball3),(ThomasRiggs1,ThomasRiggs3))),
((((Mitchell4,JiggsThompson4),(Langdeau4,PrettyHead7)),(Breeden2,(Swanson3,Swanson4))),(Dodd17,(Dodd29,Dodd76)))),
((((((BigVillage1,BigVillage2),(LikeAFishhook18,LikeAFishhook5)),((Demery2,(OversLaRoche3B,Molstad7)),(Sweetwater4,((Patterson4,LittlePawneeCreek1),(TheodoreDavisB,TheodoreDavisC))))))),
(((BlackPartizan11,Arzberger3),(((MowryBluff1,RedWillow1),(Owens3,Holdredge2)),(((CrowCreek1,CrowCreek3),(TalkingCrow1,TalkingCrow3))))))));"


##Hypothetical tree for first expectation - no shared ancestry

#png("~/Dropbox/Phylogenies_Book_Chapter/Graphics/hypo_tree_1.png",
#    res=300,units="in",height=9,width=10)  #To create a usable graphic for powerpoint

#tiff("~/Dropbox/Phylogenies_Book_Chapter/Graphics/hypo_tree_1.tiff",
#     res=300,units="in",height=9,width=10)  #To create a usable graphic for publication


plains_hypo1_tree<-read.tree(text=tree.string)
par(mar=c(5.1,4.1,4.1,2.1))
plot.phylo(plains_hypo1_tree,cex=0.7,use.edge.length = T,align.tip.label = F,label.offset = 0.8)
tip.shapes=c(rep(17,9),rep(15,18),rep(16,13))
tip.color=c("pink","red","red","red","red","firebrick","firebrick","firebrick","firebrick",
            "green","green","darkseagreen","darkseagreen","darkseagreen","darkseagreen","darkseagreen","darkseagreen","darkgreen","darkgreen","darkgreen","darkgreen","darkgreen","darkgreen","darkgreen","darkgreen","darkgreen","darkgreen",
            "dodgerblue","dodgerblue","dodgerblue","dodgerblue","blue","blue","blue","navyblue","navyblue","navyblue","navyblue","navyblue","navyblue")
tiplabels(frame="none",pch=tip.shapes,col = tip.color,cex=1.5)

#dev.off()


#Hypothetical tree for second expectation - partial ancestry between Central Plains and Coalescent traditions

png("~/Dropbox/Phylogenies_Book_Chapter/Graphics/hypo_tree_2.png",
    res=300,units="in",height=9,width=10)  #To create a usable graphic for powerpoint

tiff("~/Dropbox/Phylogenies_Book_Chapter/Graphics/hypo_tree_2.tiff",
     res=300,units="in",height=9,width=10)  #To create a usable graphic for publication


plains_hypo2_tree<-read.tree(text=tree.string2)

plot.phylo(plains_hypo2_tree,cex=0.7,use.edge.length = T,align.tip.label = F,label.offset = 0.8)
tip.shapes.2=c(rep(15,18),rep(16,7),rep(17,5),rep(16,2),rep(17,4),rep(16,4))
tip.color.2=c("green","green","darkseagreen","darkseagreen","darkseagreen","darkseagreen","darkseagreen","darkseagreen","darkgreen","darkgreen","darkgreen","darkgreen","darkgreen","darkgreen","darkgreen","darkgreen","darkgreen","darkgreen",
              "dodgerblue","dodgerblue","dodgerblue","dodgerblue","blue","blue","blue",
              "pink","red","red","red","red",
              "navyblue","navyblue",
              "firebrick","firebrick","firebrick","firebrick",
              "navyblue","navyblue","navyblue","navyblue")
tiplabels(frame="none",pch=tip.shapes.2,col = tip.color.2,cex=1.5)

#dev.off()


##As a note, the composite figure provided in the text is a product of 
##assembling the figures together with the tree legend in GIMP

