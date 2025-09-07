library(tidyverse)
library(readr)

# Create prevalence ratio
malaria$Prevalence.Ratio <- malaria$Microscopy.N.Positive / malaria$PCR.N.Positive

link_to_dataset <- read.table(file = "https://raw.githubusercontent.com/HackBio-Internship/public_datasets/main/R/lancet_malaria.txt", header = TRUE, sep = "\t")
malaria_data <- link_to_dataset
head(malaria_data)

colnames(malaria_data) <- c("Review Found", "Author", "Title", "Year", "Region","Country","Location", "PCR_N_Tested", "PCR_N_Positive", "PCR_Percent",
"Microscopy_N_Tested", "Microscopy_N_Positive", "Microscopy_Percent", "Historical_Transmission", "Current_Transmission", "Setting_20", "Setting_15", "Setting_10", "Setting_5", "PCR_Method", "Microscopy_Fields", "Sampling_Season", "Notes")
head(malaria_data)

plot(malaria_data$PCR_Percent, malaria_data$Microscopy_Percent,
     xlab = "Microscopy %", ylab = "PCR %",
     main = "PCR vs Microscopy Prevalence",
     col = "blue", pch = 19)
abline(0, 1, lty = 2, col = "red")

malaria_data$Prevalence_Ratio <- malaria_data$Microscopy_N_Positive / malaria_data$PCR_N_Positive
head(malaria_data)

ggplot(malaria_data, aes(x = Microscopy_Percent, y = PCR_Percent, color = Region)) +
geom_point() +
geom_abline(intercept = 0, slope = 1, linetype = "dotted") +
facet_wrap(~Region) +
labs(title = "PCR% vs Microscopy% by Region",
x = "Microscopy %", y = "PCR %")

boxplot(Prevalence_Ratio ~ Region, data = malaria_data,
        main = "Prevalence Ratio by Region",
        xlab = "Global Region", ylab = "Prevalence Ratio",
        col = c("lightblue","lightgreen","lightpink","lightyellow"),
        las = 2, notch = TRUE)

ggplot(malaria_data, aes(x = Region, y = Prevalence_Ratio, fill = Region)) +
geom_boxplot(alpha = 0.7) +
labs(title = "Prevalence Ratio by Region",
x = "Region", y = "Prevalence Ratio") 

