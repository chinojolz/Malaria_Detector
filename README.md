<img width="1024" height="768" alt="Bible designs2025" src="https://github.com/user-attachments/assets/3de15d86-498e-4757-ae9e-a384dee41e56" /># malaria_detector_project
Analysis of submicroscopic Plasmodium falciparum infections using microscopy and PCR datasets.


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
<img width="699" height="435" alt="Screenshot 2025-09-07 022117" src="https://github.com/user-attachments/assets/9c72d1d1-d7f8-4876-9f4f-3e6daa754fae" />


### Prevalence Ration
```r
malaria_data$Prevalence_Ratio <- malaria_data$Microscopy_N_Positive / malaria_data$PCR_N_Positive
head(malaria_data)
```

### PCR% vs Microscopy% by Region
```r
ggplot(malaria_data, aes(x = Microscopy_Percent, y = PCR_Percent, color = Region)) +
geom_point() +
geom_abline(intercept = 0, slope = 1, linetype = "dotted") +
facet_wrap(~Region) +
labs(title = "PCR% vs Microscopy% by Region",
x = "Microscopy %", y = "PCR %")
```

<img width="708" height="418" alt="Screenshot 2025-10-16 192657" src="https://github.com/user-attachments/assets/90259764-083b-4c15-afd2-1f000b1c06b8" />

### Prevalence Ratio by Region
```r
ggplot(malaria_data, aes(x = Region, y = Prevalence_Ratio, fill = Region)) +
geom_boxplot(alpha = 0.7) +
labs(title = "Prevalence Ratio by Region",
x = "Region", y = "Prevalence Ratio") 
```
<img width="700" height="439" alt="Screenshot 2025-09-07 022407" src="https://github.com/user-attachments/assets/d6a552e4-accc-4be8-a61b-87ac836c92fe" />



### Interpretation of Results

The boxplot of prevalence ratios by global region reveals important differences in the density of submicroscopic Plasmodium falciparum infections. South America shows the lowest median prevalence ratio, indicating that microscopy detects very few infections compared to PCR. This means South America has the highest density of submicroscopic infections.

In contrast, Asia & Oceania and East Africa display intermediate ratios, reflecting a moderate level of submicroscopic infections. **West Africa has the highest prevalence ratio**, suggesting that microscopy performs relatively well in this region, and submicroscopic infections are less frequent compared to other regions.

### Recommendations
These findings highlight the importance of molecular methods such as PCR for accurately capturing the true malaria burden, particularly in regions like South America where submicroscopic infections are most common.

[View project on RPubs](http://rpubs.com/chinonso_okezie/1341958)
