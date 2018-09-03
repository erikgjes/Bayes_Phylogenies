
source("https://raw.githubusercontent.com/erikgjes/PyRate_Cultural_Evolution/master/PyRate_CE_Functions.R")
library(dplyr)
library(RCurl)

###PyRate Analysis

#To reproduce PyRate analysis see tutorial on PyRate_Cultural_Evolution for running the PyRate program using the plains_houses_lifespans.txt
#In short:
#1 In a terminal window run python2.7 PyRate.py -d plains_houses_lifespans.txt -A 2 -mBDI 0
#2 After analysis, initial plots can be viewed by running python2.7 PyRate.py -plot ....marginal_rates.log

#To reproduce graphics from PyRate Analysis you can simply load the results
#source("~/Dropbox/Phylogenies_Book_Chapter/PyRate/pyrate_mcmc_logs/plains_houses_0_BD_marginal_rates_RTT.r")

source("https://raw.githubusercontent.com/erikgjes/Bayes_Phylogenies/master/plains_houses_0_BD_marginal_rates_RTT.r")

age_rev<-1886+age #adjust for the most recent date in each of the datasets

#png("~/Dropbox/Phylogenies_Book_Chapter/Graphics/Figure_9.4_PyRate_Rates.png",
#    res=300,units="in",height=10,width=7)  #To create a usable graphic for powerpoint
#tiff("~/Dropbox/Phylogenies_Book_Chapter/Graphics/Figure_9.4_PyRate_Rates.tiff",
#     res=300,units="in",height=10,width=7)  #To create a usable graphic for powerpoint
#par(mfrow=c(2,1))
plot(age_rev[115:1073],M_hpd_M95[115:1073], type = 'n', ylim = c(0,max(M_hpd_M95[115:1073],na.rm=T)),xlim = c(min(age_rev[115:1073]),max(age_rev[115:1073])),
     xlab="Years (AD)", ylab="Rate of Event Per Lineage Per Time Unit")
plot_RTT(age_rev[115:1073],M_hpd_M95[115:1073],M_hpd_m95[115:1073],M_mean[115:1073],"firebrick") #Grey60
plot_RTT(age_rev[115:1073],L_hpd_M95[115:1073],L_hpd_m95[115:1073],L_mean[115:1073],"navyblue") #Grey20
segments(800,0.014,900,0.014,"navyblue",lwd=2)
segments(800,0.013,900,0.013,"firebrick",lwd=2)
text(labels="Origination Rate",x=900,y=0.014,pos=4)
text(labels="Extinction Rate",x=900,y=0.013,pos=4)
mtext("A",side=3,line=1,at=800)

plot(age_rev[115:1073],R_hpd_M95[115:1073], type = 'n', ylim = c(min(R_hpd_m95[115:1073]),max(R_hpd_M95[115:1073],na.rm=T)),xlim = c(min(age_rev[115:1073]),max(age_rev[115:1073])),
     xlab="Years (AD)", ylab="Rate of Event Per Lineage Per Time Unit")
plot_RTT(age_rev[115:1073],R_hpd_M95[115:1073],R_hpd_m95[115:1073],R_mean[115:1073],"darkgreen")
abline(h=0,lty=2)
segments(1300,0.005,1400,0.005,"darkgreen")
text(1400,0.005,pos=4,"Net Diverisfication Rate")
mtext("B",side=3,line=1,at=800)
#dev.off()



#Shift Point Analysis (not presented in the chapter but may be of interest)
#Identify the most likely shifts using python2.7 PyRate.py -mProb <<_mcmc.log>>
##Run -A 1 with the estimated rate shift

BD_12<-read.delim("https://raw.githubusercontent.com/erikgjes/Bayes_Phylogenies/master/plains_houses_0_BD12BD1-2_TI_mcmc.log",row.names=1) #This one was chosen as it was the best fitting model

BD_12<-BD_12[1:1000,] #removal of the rest of the TI as we are not interested in it

ex.1<-shift.points.func(BD_12$shift_ex_1, 1886.5)
x<-BD_12$shift_ex_1
y<-1886.5
shift.data<-hist(x,breaks=(max(round(x))-min(round(x))),plot=FALSE)
shift.data<-data.frame(breaks=shift.data$mids,counts=shift.data$counts)
summary<-data.frame(max_age=(y-shift.data$breaks),
                    min_age=(y-shift.data$breaks),
                    counts=shift.data$counts,
                    proportion=(shift.data$counts/sum(shift.data$counts)))
summary<-arrange(summary,desc(counts))
summary_top_3<-head(summary,3)
print(summary_top_3)

