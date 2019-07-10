#get figure with label names
if (! require(ggrepel)){install.packages("ggrepel")}
require(ggrepel)
library(ggplot2)
pn<-read.table("FNR.txt",header=T,sep="\t",stringsAsFactors = T)
head(pn)
ggplot(pn,aes(x=Precision,y=Sensitivity,shape=Type,col=sample,label=sample))+
  geom_point(size=I(3))+
  geom_label_repel(aes(label=sample))+
  theme_classic(base_size = 10)
