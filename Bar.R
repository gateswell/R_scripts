args<-commandArgs(TRUE)
input<-args[1]
output<-args[2]
library(ggplot2)
data = read.table(input,header=TRUE,sep="\t")
pdf(output,height = 10, width = 14)
par(font.lab = 2, font.axis = 1, cex.lab = 1.2, cex.axis = 1.2)
p<-ggplot(data,aes(x=sample_name,y=Dup_rate))+geom_bar(stat="identity", position = "dodge",width=0.5)+xlab('Samples')+ylab('Value')
p
dev.off()
