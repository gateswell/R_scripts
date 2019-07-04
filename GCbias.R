#GCbias figure---method#1
library(ggplot2)
gcbias1<-read.table("A3.markdup.realign.recal_gc_bias_metrics.txt",sep='\t',header = T)
gcbias2<-read.table("A4.markdup.realign.recal_gc_bias_metrics.txt",sep='\t',header = T)
gcbias3<-read.table("B3.markdup.realign.recal_gc_bias_metrics.txt",sep='\t',header = T)
gcbias4<-read.table("B4.markdup.realign.recal_gc_bias_metrics.txt",sep='\t',header = T)
window_ratio1=0.5/max(gcbias1$WINDOWS)
window_ratio2=0.5/max(gcbias2$WINDOWS)
window_ratio3=0.5/max(gcbias3$WINDOWS)
window_ratio4=0.5/max(gcbias4$WINDOWS)
scaled_windows1 = gcbias1$WINDOWS * window_ratio1
scaled_windows2 = gcbias2$WINDOWS * window_ratio2
scaled_windows3 = gcbias3$WINDOWS * window_ratio3
scaled_windows4 = gcbias4$WINDOWS * window_ratio4
gcbias1$scaled_windows=scaled_windows1
gcbias2$scaled_windows=scaled_windows2
gcbias3$scaled_windows=scaled_windows3
gcbias4$scaled_windows=scaled_windows4
gcbias1$Marker<-c("A3")
gcbias2$Marker<-c("A4")
gcbias3$Marker<-c("B3")
gcbias4$Marker<-c("B4")
gcbias12<-merge(gcbias1,gcbias2,all=T)
gcbias34<-merge(gcbias3,gcbias4,all=T)
gcbias<-merge(gcbias12,gcbias34,all=T)
png("GCbias.png",width = 8,height = 4,units = "in",res = 1200)

ggplot(gcbias)+geom_density(aes(GC,scaled_windows,col=Marker),fill="red",stat = "identity")+
  geom_line(aes(GC,NORMALIZED_COVERAGE,col=Marker),stat = "identity")
  coord_cartesian(ylim = c(0,2))+
  geom_hline(aes(yintercept=c(1)),col="lightgrey")+
  geom_vline(aes(xintercept = c(50)),col="lightgrey")+theme_bw()+
  ggtitle("All Reads: GC Bias Plot")
  #geom_errorbarh(aes(xmin=GC-ERROR_BAR_WIDTH,xmax=GC+ERROR_BAR_WIDTH,y=NORMALIZED_COVERAGE,height = .03))
dev.off()


#GCbias figure---method#2
png("GCbias_noggplot.png",width = 8,height = 8,units = "in",res = 500)
plot(type="p", x=gcbias$GC, pch=c(20),y=gcbias$NORMALIZED_COVERAGE,xlab=paste(c("GC% of", "100", "base windows"), sep=" ", collapse=" "),
	ylab="Fraction of normalized coverage", xlim=c(0,100), ylim=c(0, 2),col=rainbow(factor(gcbias$Marker)),main=paste("All Level","GC Bias Plot"))
legend("topleft",pch=c(20),legend = sort(unique(gcbias$Marker)),col=rainbow(factor(gcbias$Marker)))
lines(gcbias1$GC, scaled_windows, type="h", col="#FFAAAA", lwd=3);
abline(h=1, v=50, col="lightgrey");
dev.off()