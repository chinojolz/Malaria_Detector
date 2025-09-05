# malaria_detector_project
Analysis of submicroscopic Plasmodium falciparum infections using microscopy and PCR datasets.


### Project Overview

This project explores the detection of Plasmodium falciparum infections using two diagnostic methods: microscopy and PCR. Adoption of molecular techniques (PCR) has revealed many low-density, transmissible infections that are often missed by microscopy (submicroscopic infections). The analysis aims to compare detection rates, compute prevalence ratios, and visualize how submicroscopic infections vary across global malaria regions.


### Data Source 

The dataset comes from a systematic review of malaria prevalence using microscopy and PCR across different countries and regions. [Download here](https://raw.githubusercontent.com/HackBio-Internship/public_datasets/main/R/lancet_malaria.txt)

### Tasks
- Visualize PCR % vs. Microscopy %
- Add a 1:1 reference line to compare both techniques
- Compute the Prevalence Ratio (Microscopy Positives ÷ PCR Positives)
- Generate boxplots of prevalence ratios across global regions
- Interpret results to determine which region has the highest density of submicroscopic infections
