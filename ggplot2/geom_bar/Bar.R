library(ggplot2)
summ<-read.table("./result.txt",header = F,stringsAsFactors = T)
summ$V3<-as.factor(summ$V3)
ggplot(summ)+geom_bar(aes(x=V3,y=V2,fill=V1),stat='identity',position='dodge')+coord_cartesian(ylim=c(0.975, 1))+xlab("Mismatch Value")+ylab("Split Ratio(%)")+
ggtitle("Split ratio at different error rate")+
theme(plot.title = element_text(size = 15, vjust = 0.5, hjust = 0.5),axis.title = element_text(size = 10))+
scale_fill_discrete(name="Lane")