# app_name = "rDummyReaction-Jabara v0.1"
# 20250309
# Hongrong Yin


# Fix the seed for reproducibility
set.seed(123)

n <- 2000

# Sampling for each factor
Catalyst_Type <- sample(c("NR50", "Amberlyst-15", "ZSM-5"), n, replace = TRUE)
Catalyst_Molar <- sample(c(1, 3, 5), n, replace = TRUE)
Solvent_Type <- sample(c("Acetonitrile", "Tolune", "DMF"), n, replace = TRUE)
Temp <- sample(c(25, 50, 75), n, replace = TRUE)
# Sample time between 30 and 300 minutes in 10-minute intervals
time <- sample(seq(30, 300, by = 10), n, replace = TRUE)

# Vectors to store results
yield <- numeric(n)
Crystal_Type <- character(n)
Industry <- numeric(n)

for(i in 1:n){
  catype <- Catalyst_Type[i]
  molar <- Catalyst_Molar[i]
  solvent <- Solvent_Type[i]
  temp_val <- Temp[i]
  t_val <- time[i]
  
  # Step 1: Basic settings based on catalyst type
  if(catype == "Amberlyst-15"){
    max_yield_base <- 65
    base_t_opt <- 155 
  } else if(catype == "NR50" || catype == "ZSM-5"){
    # For Catalyst_Type "NR50" and "ZSM-5", the optimal reaction time is based on temperature 50
    if(catype == "NR50"){
      base_t_opt <- 150
    } else if(catype == "ZSM-5"){
      base_t_opt <- 165
    }
    
    # Adjust maximum yield based on temperature
    if(temp_val == 25){
      max_yield_base <- 93
    } else if(temp_val == 50){
      max_yield_base <- 95
    } else if(temp_val == 75){
      max_yield_base <- 96
    }
  }
  
  # Step 2: Adjusting the optimal reaction time (t_opt)
  if(catype == "Amberlyst-15"){
    t_opt <- base_t_opt
  } else if(catype == "NR50" || catype == "ZSM-5"){
    if(temp_val == 50){
      t_opt <- base_t_opt
    } else if(temp_val == 25){
      # For temperature 25, approximately 1.5 times that of temperature 50
      t_opt <- base_t_opt * 1.5
    } else if(temp_val == 75){
      # For temperature 75, approximately 0.9 times that of temperature 50
      t_opt <- base_t_opt * 0.9
    }
  }
  
  # Step 3: If Catalyst_Type is "NR50" and the solvent is Tolune, further reduce t_opt by 10%
  if(catype == "NR50" && solvent == "Tolune"){
    t_opt <- t_opt * 0.9
  }
  
  # Step 4: The greater the catalyst molarity, the shorter the optimal time 
  # (reducing by 10 minutes for molar values 1 → 3 → 5)
  t_opt <- t_opt - 10 * (molar - 1)
  
  # Note: Although Catalyst_Type "Amberlyst-15" originally had solvent-based adjustments for reaction speed,
  # here the new rules for "NR50" and "ZSM-5" take priority.
  if(catype == "Amberlyst-15"){
    if(solvent == "Tolune"){
      solvent_adjust <- -10
    } else if(solvent == "DMF"){
      solvent_adjust <- 20
    } else {
      solvent_adjust <- 0
    }
    t_opt <- t_opt + solvent_adjust
  }
  
  # Step 5: Calculate yield based on reaction time
  if(t_val <= t_opt){
    # Before reaching the optimal time, yield increases linearly (with a minimum of 40)
    yield_calc <- 40 + (max_yield_base - 40) * ((t_val - 30) / (t_opt - 30))
  } else {
    # When reaction time exceeds the optimal time, the decrease rate varies by temperature and catalyst type
    if(catype == "Amberlyst-15"){
      drop_fraction <- 0.2   # 100% → 80%
    } else if(catype == "NR50" || catype == "ZSM-5"){
      if(temp_val == 25){
        drop_fraction <- 0.05  # 100% → 95%
      } else if(temp_val == 50){
        drop_fraction <- 0.2   # 100% → 80%
      } else if(temp_val == 75){
        drop_fraction <- 0.3   # 100% → 70%
      }
    }
    yield_calc <- max_yield_base - drop_fraction * max_yield_base * ((t_val - t_opt) / (300 - t_opt))
  }
  
  # Step 6: Add noise (variability)
  noise <- rnorm(1, mean = 0, sd = 3)
  yield_val <- yield_calc + noise
  
  # Limit yield to be at least 40 and no greater than the maximum yield
  yield_val <- max(40, min(yield_val, max_yield_base))
  
  yield[i] <- yield_val
  
  # Step 7: Determine Crystal_Type
  if(temp_val == 50 && yield_val >= 70 && (solvent == "Acetonitrile" || solvent == "DMF")){
    Crystal_Type[i] <- "alpha"
  } else if(yield_val < 60){
    Crystal_Type[i] <- "theta"
  } else {
    Crystal_Type[i] <- "beta"
  }
  
  # Step 8: Determine Industry
  if(yield_val >= 80 && Crystal_Type[i] == "alpha" && t_val >=60 && t_val <=250){
    Industry[i] <- 1
  } else {
    Industry[i] <- 0
  }
}

# Create data frame
dummy_data <- data.frame(
  Catalyst_Type,
  Catalyst_Molar,
  Solvent_Type,
  Temp,
  time,
  yield = round(yield, 1),  # Round to one decimal place
  Crystal_Type,
  Industry
)

# Write to CSV file
write.csv(dummy_data, "dummy_.csv", row.names = FALSE)

# Display a portion of the results
head(dummy_data)
