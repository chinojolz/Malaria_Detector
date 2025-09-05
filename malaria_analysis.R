library(tidyverse)

# Create prevalence ratio
malaria$Prevalence.Ratio <- malaria$Microscopy.N.Positive / malaria$PCR.N.Positive

