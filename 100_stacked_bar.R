library(ggplot2)

argv <- commandArgs(TRUE)
in_file1 <- argv[1]
out_file <- argv[2]

pdf(out_file,width = 8,height = 10)

dat <- read.table(in_file1,head=T)

ggplot(data = dat, mapping = aes(x = Sample, y = Count, fill = Type)) + geom_bar(stat = 'identity',position="fill") + theme(axis.title.x = element_text(size = 20),axis.title.y = element_text(size = 20),axis.text.x = element_text(size = 15),axis.text.y = element_text(size = 15),legend.title = element_text(size=15),legend.text = element_text(size=15),plot.title = element_text(hjust = 0.5,size = 25)) + scale_fill_manual(values=c("#8B1A1A", "#104E4B", "#B4EEB4","#6B6B6B","#FFD700","#8B6914")) + labs(title='Mutation Spectrum')
dev.off()
