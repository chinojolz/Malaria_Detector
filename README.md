# malaria_detector_project
Analysis of submicroscopic *Plasmodium falciparum* infections using microscopy and PCR datasets.


### Project Overview

This project explores the detection of Plasmodium falciparum infections using two diagnostic methods: microscopy and PCR. Adoption of molecular techniques (PCR) has revealed many low-density, transmissible infections that are often missed by microscopy (submicroscopic infections). The analysis aims to compare detection rates, compute prevalence ratios, and visualize how submicroscopic infections vary across global malaria regions.


### Data Source 

The dataset comes from a systematic review of malaria prevalence using microscopy and PCR across different countries and regions. [Download here](https://raw.githubusercontent.com/HackBio-Internship/public_datasets/main/R/lancet_malaria.txt)

### Tasks
- Visualize PCR % vs. Microscopy %
- Add a 1:1 reference line to compare both techniques
- Compute the Prevalence Ratio (Microscopy Positives/PCR Positives)
- Generate boxplots of prevalence ratios across global regions
- Interpret results to determine which region has the highest density of submicroscopic infections

### Visualization of PCR % against microscopy %
```r
plot(malaria_data$PCR_Percent, malaria_data$Microscopy_Percent,
     xlab = "Microscopy %", ylab = "PCR %",
     main = "PCR vs Microscopy Prevalence",
     col = "blue", pch = 19)
abline(0, 1, lty = 2, col = "red")

```
<img width="699" height="435" alt="Screenshot 2025-09-07 022117" src="https://github.com/user-attachments/assets/9c72d1d1-d7f8-4876-9f4f-3e6daa754fae" />


### Prevalence Ration
```r
malaria_data$Prevalence_Ratio <- malaria_data$Microscopy_N_Positive / malaria_data$PCR_N_Positive
head(malaria_data)
```

### PCR% vs Microscopy% by Region
```r
regions <- unique(malaria_data$Region)
num_regions <- length(regions)
par(mfrow = c(ceiling(num_regions/2), 2))  # 2 columns of plots
for (region in regions) {
  region_data <- subset(malaria_data, Region == region)
  plot(region_data$Microscopy_Percent, region_data$PCR_Percent,
       xlab = "Microscopy %", ylab = "PCR %",
       main = paste("PCR% vs Microscopy% -", region),
       col = "darkgreen", pch = 19)
  abline(0, 1, lty = 2, col = "red")
}
```

<img width="700" height="432" alt="microscopy%" src="https://github.com/user-attachments/assets/45d48862-3ae3-492d-89f2-7a2ca369bcc6" />


### Prevalence Ratio by Region
```r
region_colors <- rainbow(length(unique(malaria_data$Region)))  

boxplot(Prevalence_Ratio ~ Region, data = malaria_data,
        main = "Prevalence Ratio by Region",
        xlab = "Global Region", ylab = "Prevalence Ratio",
        col = region_colors, las = 2, notch = TRUE)

abline(h = 1, col = "red", lty = 2)
legend("topright", legend = unique(malaria_data$Region),
       col = region_colors, pch = 19, cex = 0.8, bty = "n", title = "Regions")
```
<img width="700" height="432" alt="region" src="https://github.com/user-attachments/assets/efb4c452-88f7-446d-a60e-739def55a0fb" />



### Interpretation of Results

The boxplot of prevalence ratios by global region reveals important differences in the density of submicroscopic *Plasmodium falciparum* infections. South America shows the lowest median prevalence ratio, indicating that microscopy detects very few infections compared to PCR. This means South America has the highest density of submicroscopic infections.

In contrast, Asia & Oceania and East Africa display intermediate ratios, reflecting a moderate level of submicroscopic infections. **West Africa has the highest prevalence ratio**, suggesting that microscopy performs relatively well in this region, and submicroscopic infections are less frequent compared to other regions.

### Recommendations
These findings highlight the importance of molecular methods such as PCR for accurately capturing the true malaria burden, particularly in regions like South America where submicroscopic infections are most common.

[View project on RPubs](http://rpubs.com/chinonso_okezie/1341958)
