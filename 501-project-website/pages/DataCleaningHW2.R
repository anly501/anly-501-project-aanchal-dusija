# CLEANING THE ENVIRONMENT
rm(list = ls())

# LIBRARIES
library(psych)
library(ggplot2)
library(plotly)
library(corrplot)
library(ggplot2)


getwd()
#READING MEN'S CLOTHING DATA
setwd("/Users/aanchaldusija/Desktop/Georgetown University/ANLY 501/Homework/anly-501-project-aanchal-dusija/501-project-website/pages")
m_df_1 <- read.csv("Macy_menclothing.csv", sep = ",", header = TRUE)

# DIMENSIONS OF THE DATA
dim(m_df_1)

colnames(m_df_1)

# KEEPING ONLY NECESSARY COLUMNS
m_df_2 <- m_df_1[c("brand","category","colors.0.colorName","colors.0.price","colors.0.salePrice",
                 "colors.0.sizes.0","colors.0.sizes.1","colors.0.sizes.2","colors.0.sizes.3","colors.0.sizes.4",
                 "colors.0.sizes.5","colors.0.sizes.6","colors.0.sizes.7","colors.0.sizes.8","colors.0.sizes.9",
                 "colors.0.sizes.10","colors.0.sizes.11","colors.0.sizes.12","colors.0.sizes.13","colors.0.sizes.14",
                 "colors.0.sizes.15","colors.0.sizes.16","colors.0.sizes.17","colors.0.sizes.18","colors.0.sizes.19",
                 "colors.0.sizes.20","colors.0.sizes.21","colors.0.sizes.22","colors.0.sizes.23","colors.0.sizes.24",
                 "colors.0.sizes.26","colors.0.sizes.27","colors.0.sizes.29","colors.0.sizes.30","colors.0.sizes.32",
                 "colors.1.colorName","colors.1.price","colors.1.salePrice","colors.1.sizes.0","colors.1.sizes.1",
                 "colors.1.sizes.2","colors.1.sizes.3","colors.1.sizes.4","colors.1.sizes.5","colors.1.sizes.6",
                 "colors.1.sizes.7","colors.1.sizes.8","colors.1.sizes.9","colors.1.sizes.10","colors.1.sizes.11",
                 "colors.1.sizes.12","colors.1.sizes.13","colors.1.sizes.14","colors.1.sizes.15","colors.1.sizes.16",
                 "colors.1.sizes.17","colors.1.sizes.18","colors.1.sizes.19","colors.1.sizes.20","colors.1.sizes.21",
                 "colors.1.sizes.22","colors.1.sizes.24","colors.1.sizes.25","colors.1.sizes.26","colors.1.sizes.29",
                 "colors.1.sizes.31","colors.2.colorName","colors.2.price","colors.2.salePrice","colors.2.sizes.0",
                 "colors.2.sizes.1","colors.2.sizes.2","colors.2.sizes.3","colors.2.sizes.4","colors.2.sizes.5",
                 "colors.2.sizes.6","colors.2.sizes.7","colors.2.sizes.8","colors.2.sizes.9","colors.2.sizes.10",
                 "colors.2.sizes.11","colors.2.sizes.12","colors.2.sizes.13","colors.2.sizes.14","colors.2.sizes.15",
                 "colors.2.sizes.16","colors.2.sizes.17","colors.2.sizes.18","colors.2.sizes.19","colors.2.sizes.20",
                 "colors.2.sizes.21","colors.2.sizes.22","colors.2.sizes.23","colors.2.sizes.24","colors.2.sizes.25",
                 "colors.2.sizes.26","colors.2.sizes.27","colors.2.sizes.29","colors.2.sizes.30","colors.2.sizes.32",
                 "colors.3.colorName","colors.3.price","colors.3.salePrice","colors.3.sizes.0","colors.3.sizes.1","colors.3.sizes.2","colors.3.sizes.3","colors.3.sizes.4","colors.3.sizes.5","colors.3.sizes.6","colors.3.sizes.7","colors.3.sizes.8","colors.3.sizes.9","colors.3.sizes.10","colors.3.sizes.11","colors.3.sizes.12","colors.3.sizes.13","colors.3.sizes.14","colors.3.sizes.15","colors.3.sizes.16","colors.3.sizes.17","colors.3.sizes.18","colors.3.sizes.19","colors.3.sizes.20","colors.3.sizes.24","colors.3.sizes.25","colors.3.sizes.26","colors.3.sizes.29","colors.3.sizes.30","colors.3.sizes.32","colors.4.colorName",
                 "colors.4.price","colors.4.salePrice","colors.4.sizes.0","colors.4.sizes.1","colors.4.sizes.2","colors.4.sizes.3","colors.4.sizes.4","colors.4.sizes.5","colors.4.sizes.6","colors.4.sizes.7","colors.4.sizes.8","colors.4.sizes.9","colors.4.sizes.10","colors.4.sizes.11","colors.4.sizes.12","colors.4.sizes.13","colors.4.sizes.14","colors.4.sizes.15","colors.4.sizes.16","colors.4.sizes.17","colors.4.sizes.18","colors.4.sizes.19","colors.4.sizes.20","colors.4.sizes.21","colors.4.sizes.22","colors.5.colorName",
                 "colors.5.price","colors.5.salePrice","colors.5.sizes.0","colors.5.sizes.1","colors.5.sizes.2","colors.5.sizes.3","colors.5.sizes.4","colors.5.sizes.5","colors.5.sizes.6","colors.5.sizes.7","colors.5.sizes.8","colors.5.sizes.9","colors.5.sizes.10","colors.5.sizes.11","colors.5.sizes.12","colors.5.sizes.13","colors.5.sizes.14","colors.5.sizes.15","colors.5.sizes.16","colors.5.sizes.17","colors.5.sizes.18","colors.5.sizes.19","colors.5.sizes.20","colors.5.sizes.22","colors.5.sizes.23","colors.5.sizes.24","colors.5.sizes.27","colors.5.sizes.28","colors.5.sizes.30","colors.5.sizes.31","colors.6.colorName",
                 "colors.6.price","colors.6.salePrice","colors.6.sizes.0","colors.6.sizes.1","colors.6.sizes.2","colors.6.sizes.3","colors.6.sizes.4","colors.6.sizes.5","colors.6.sizes.6","colors.6.sizes.7","colors.6.sizes.8","colors.6.sizes.9","colors.6.sizes.10","colors.6.sizes.11","colors.6.sizes.12","colors.6.sizes.13","colors.6.sizes.14","colors.6.sizes.16","colors.6.sizes.18","colors.6.sizes.19","colors.6.sizes.21","colors.6.sizes.22","colors.6.sizes.24","colors.6.sizes.25","colors.6.sizes.28","colors.6.sizes.29","colors.6.sizes.30","colors.6.sizes.31","colors.6.sizes.32","colors.7.colorName",
                 "colors.7.price","colors.7.salePrice","colors.7.sizes.0","colors.7.sizes.1","colors.7.sizes.2","colors.7.sizes.3","colors.7.sizes.4","colors.7.sizes.5","colors.7.sizes.6","colors.7.sizes.7","colors.7.sizes.8","colors.7.sizes.9","colors.7.sizes.10","colors.7.sizes.11","colors.7.sizes.12","colors.7.sizes.13","colors.7.sizes.14","colors.7.sizes.18","colors.7.sizes.19","colors.8.price","colors.8.salePrice","colors.8.sizes.0","colors.8.sizes.2","colors.8.sizes.3","colors.8.sizes.4","colors.8.sizes.6","colors.8.sizes.7","colors.8.sizes.11","colors.8.sizes.12","colors.8.sizes.14","colors.8.sizes.16",
                 "colors.9.salePrice","colors.9.sizes.0","colors.9.sizes.3","colors.9.sizes.4","colors.9.sizes.5","colors.9.sizes.7","colors.9.sizes.12","colors.9.sizes.14","colors.9.sizes.15","colors.9.sizes.19","colors.9.sizes.20","colors.9.sizes.21","colors.9.sizes.23","colors.9.sizes.24","colors.9.sizes.29","colors.9.sizes.30","colors.9.sizes.31","colors.9.sizes.32","colors.10.colorName",
                 "colors.10.sizes.2","colors.10.sizes.4","colors.10.sizes.6","colors.10.sizes.9","colors.10.sizes.10","colors.10.sizes.11","colors.10.sizes.12","colors.10.sizes.14","colors.10.sizes.15","colors.10.sizes.18","colors.10.sizes.20","colors.10.sizes.23","colors.10.sizes.24","colors.10.sizes.26","colors.10.sizes.30","colors.10.sizes.31","colors.10.sizes.32","colors.11.colorName",
                 "colors.11.sizes.0","colors.11.sizes.1","colors.11.sizes.4","colors.11.sizes.7","colors.11.sizes.8","colors.11.sizes.9","colors.11.sizes.10","colors.11.sizes.11","colors.11.sizes.13","colors.11.sizes.15","colors.11.sizes.16","colors.11.sizes.17","colors.11.sizes.18","colors.11.sizes.21","colors.11.sizes.25","colors.11.sizes.26","colors.11.sizes.27","colors.11.sizes.28","colors.11.sizes.29","colors.11.sizes.30","description","details.0","details.1","details.2","details.3","details.4","details.5","details.6","details.7","details.8","details.9","details.10","details.11","details.12","id",
                 "rating","url")]


# REMOVING WOMEN CATEGORY
m_df_3 <- m_df_2[!m_df_2$category == "Women",]

#COLUMN NAMES
colnames(m_df_3)

#SUMMARY OF COLUMNS
lapply(m_df_3,summary) 

# PRICE DATA FRAME
m_price <- m_df_3[grepl("Price", colnames(m_df_3))]
avg_price <- rowMeans(m_price[,1:10],na.rm = TRUE)

# STOCK DATA FRAME
m_stock<-m_df_3[grepl("sizes", colnames(m_df_3))]
total_stock <- rowSums(m_stock, na.rm = TRUE)

# COLOUR 0 DATA FRAME
m_color0 <- m_df_3[grepl("colors.0", colnames(m_df_3))]
color0_stock <- rowSums(m_color0[,4:33] ,na.rm = TRUE)

# COLOUR 1 DATA FRAME
m_color1 <- m_df_3[grepl("colors.1.", colnames(m_df_3))]
m_color1 <- m_color1[,1:31]
color1_stock <- rowSums(m_color1[,4:31] ,na.rm = TRUE)

# COLOUR 2 DATA FRAME
m_color2 <- m_df_3[grepl("colors.2", colnames(m_df_3))]
color2_stock <- rowSums(m_color2[,4:34] ,na.rm = TRUE)

# COLOUR 3 DATA FRAME
m_color3 <- m_df_3[grepl("colors.3", colnames(m_df_3))]
color3_stock <- rowSums(m_color3[,4:30] ,na.rm = TRUE)

# COLOUR 4 DATA FRAME
m_color4 <- m_df_3[grepl("colors.4", colnames(m_df_3))]
color4_stock <- rowSums(m_color4[,4:26] ,na.rm = TRUE)

# COLOUR 5 DATA FRAME
m_color5 <- m_df_3[grepl("colors.5", colnames(m_df_3))]
color5_stock <- rowSums(m_color5[,4:31] ,na.rm = TRUE)


# NEW DATAFRAME
m_df_4 <- m_df_3[c("brand","category","colors.0.colorName",
               "colors.1.colorName","colors.2.colorName",
               "colors.3.colorName","colors.4.colorName",
               "colors.5.colorName",
               "rating","url")]

m_df_5 <- cbind(m_df_4,avg_price,color0_stock,color1_stock,color2_stock,color3_stock,color4_stock,color5_stock, total_stock)

# ADD GENDER COLUMN
m_df_5$gender = "Men"


#READING WOMEN'S CLOTHING DATA
w_df_1<- read.csv("Macy_womenclothing.csv", sep = ",", header = TRUE)

# DIMENSIONS OF THE DATA
dim(w_df_1)

colnames(w_df_1)

# KEEPING ONLY NECESSARY COLUMNS
w_df_2 <- w_df_1[c("brand","category","colors.0.colorName",
                        "colors.0.price","colors.0.salePrice","colors.0.sizes.0","colors.0.sizes.2","colors.0.sizes.3","colors.0.sizes.4","colors.0.sizes.5","colors.0.sizes.6","colors.0.sizes.7","colors.0.sizes.8","colors.0.sizes.9","colors.0.sizes.10","colors.0.sizes.11","colors.0.sizes.12","colors.0.sizes.13","colors.0.sizes.14","colors.0.sizes.15","colors.0.sizes.16","colors.0.sizes.17","colors.0.sizes.18","colors.0.sizes.19","colors.0.sizes.20","colors.0.sizes.21","colors.0.sizes.22","colors.0.sizes.23","colors.0.sizes.24","colors.0.sizes.25","colors.0.sizes.26","colors.0.sizes.27","colors.0.sizes.28","colors.0.sizes.29","colors.0.sizes.30","colors.0.sizes.31","colors.0.sizes.32","colors.0.sizes.33","colors.0.sizes.34","colors.1.colorName",
                        "colors.1.price","colors.1.salePrice","colors.1.sizes.0","colors.1.sizes.1","colors.1.sizes.2","colors.1.sizes.3","colors.1.sizes.4","colors.1.sizes.5","colors.1.sizes.6","colors.1.sizes.7","colors.1.sizes.8","colors.1.sizes.9","colors.1.sizes.10","colors.1.sizes.11","colors.1.sizes.12","colors.1.sizes.13","colors.1.sizes.14","colors.1.sizes.15","colors.1.sizes.16","colors.1.sizes.17","colors.1.sizes.18","colors.1.sizes.19","colors.1.sizes.20","colors.1.sizes.21","colors.1.sizes.22","colors.1.sizes.23","colors.1.sizes.24","colors.1.sizes.25","colors.1.sizes.26","colors.1.sizes.27","colors.1.sizes.28","colors.1.sizes.29","colors.1.sizes.30","colors.1.sizes.31","colors.1.sizes.32","colors.1.sizes.33","colors.1.sizes.34","colors.1.sizes.35","colors.1.sizes.36","colors.1.sizes.37","colors.2.colorName",
                        "colors.2.price","colors.2.salePrice","colors.2.sizes.0","colors.2.sizes.1","colors.2.sizes.2","colors.2.sizes.3","colors.2.sizes.4","colors.2.sizes.5","colors.2.sizes.6","colors.2.sizes.7","colors.2.sizes.8","colors.2.sizes.9","colors.2.sizes.10","colors.2.sizes.11","colors.2.sizes.17","colors.3.colorName",
                        "colors.3.price","colors.3.salePrice","colors.3.sizes.0","colors.3.sizes.1","colors.3.sizes.2","colors.3.sizes.3","colors.3.sizes.4","colors.3.sizes.5","colors.3.sizes.6","colors.3.sizes.7","colors.3.sizes.8","colors.3.sizes.9","colors.3.sizes.10","colors.3.sizes.11","colors.4.colorName",
                        "colors.4.price","colors.4.salePrice","colors.4.sizes.0","colors.4.sizes.1","colors.4.sizes.2","colors.4.sizes.3","colors.4.sizes.4","colors.4.sizes.5","colors.4.sizes.6","colors.4.sizes.7","colors.4.sizes.8","colors.4.sizes.9","colors.4.sizes.10","colors.4.sizes.11","colors.5.colorName",
                        "colors.5.price","colors.5.salePrice","colors.5.sizes.0","colors.5.sizes.1","colors.5.sizes.2","colors.5.sizes.3","colors.5.sizes.4","colors.5.sizes.5","colors.6.colorName",
                        "colors.6.price","colors.6.salePrice","colors.6.sizes.0","colors.7.colorName","colors.7.price","colors.7.salePrice","colors.7.sizes.0","colors.7.sizes.1","colors.7.sizes.2","colors.7.sizes.3","colors.7.sizes.4","colors.7.sizes.5","colors.7.sizes.6","colors.7.sizes.7","colors.7.sizes.8","colors.7.sizes.10","colors.7.sizes.11","colors.8.colorName",
                        "colors.8.price","colors.8.salePrice","colors.8.sizes.0","colors.8.sizes.1","colors.8.sizes.2","colors.8.sizes.3","colors.8.sizes.4","colors.8.sizes.5","colors.8.sizes.6","colors.8.sizes.7","colors.8.sizes.8","colors.8.sizes.9","colors.8.sizes.10","colors.8.sizes.11","description","details.0","details.1","details.2","details.3","details.4","details.5","details.6","details.7","details.8","details.9","details.10","details.11",
                        "rating","url")]

#SUMMARY OF COLUMNS
lapply(w_df_2,summary) 


# PRICE DATA FRAME
w_price <- w_df_2[grepl("Price", colnames(w_df_2))]
avg_price = rowMeans(w_price[,1:9],na.rm = TRUE)

# STOCK DATA FRAME
w_stock <- w_df_2[grepl("size",colnames(w_df_2))]
total_stock <- rowSums(w_stock, na.rm = TRUE)

# COLOUR 0 DATA FRAME
w_color0 <- w_df_2[grepl("colors.0", colnames(w_df_2))]
color0_stock <- rowSums(w_color0[,4:37] ,na.rm = TRUE)

# COLOUR 1 DATA FRAME
w_color1 <- w_df_2[grepl("colors.1.", colnames(w_df_2))]
color1_stock <- rowSums(w_color1[,4:41] ,na.rm = TRUE)

# COLOUR 2 DATA FRAME
w_color2 <- w_df_2[grepl("colors.2", colnames(w_df_2))]
color2_stock <- rowSums(w_color2[,4:16] ,na.rm = TRUE)

# COLOUR 3 DATA FRAME
w_color3 <- w_df_2[grepl("colors.3", colnames(w_df_2))]
color3_stock <- rowSums(w_color3[,4:15] ,na.rm = TRUE)

# COLOUR 4 DATA FRAME
w_color4 <- w_df_2[grepl("colors.4", colnames(w_df_2))]
color4_stock <- rowSums(w_color4[,4:15] ,na.rm = TRUE)

# COLOUR 5 DATA FRAME
w_color5 <- w_df_2[grepl("colors.5", colnames(w_df_2))]
color5_stock <- rowSums(w_color5[,4:9] ,na.rm = TRUE)

# NEW DATAFRAME
w_df_3 <- w_df_2[c("brand","category","colors.0.colorName",
                   "colors.1.colorName","colors.2.colorName",
                   "colors.3.colorName","colors.4.colorName",
                   "colors.5.colorName",
                   "rating","url")]

w_df_4 <- cbind(w_df_3,avg_price,color0_stock,color1_stock,color2_stock,color3_stock,color4_stock,color5_stock, total_stock)



# ADD GENDER COLUMN
w_df_4$gender <- "Women"

# MERGING MEN AND WOMEN DATAFRAMES
df_mw <- rbind(m_df_5,w_df_4)

# RENAMING COLUMNS
colnames(df_mw) <- c("Brand","Category","Color0",
                     "Color1","Color2",
                     "Color3","Color4",
                     "Color5",
                     "Rating","URL","Average_Price","C0_stock","C1_stock","C2_stock","C3_stock","C4_stock","C5_stock","Total_stock","Gender")

# PLOTTING BRAND AND REVIEWS FOR MEN
# PLOT1
g <- ggplot(df_mw, aes(Category))
g + geom_bar(aes(fill=Gender), width = 0.5) + 
  theme(axis.text.x = element_text(angle=90, vjust=0.1)) + 
  labs(title="Histogram on Categories", 
       subtitle="in Apparel at Macy's for Men and Women") 

# WRITING THE DATA
write.csv(df_mw, "macy_mw.csv", row.names = FALSE)

