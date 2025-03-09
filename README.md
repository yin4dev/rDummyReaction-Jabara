
# rDummyReaction-Jabara
A simulation tool for generating dummy data of catalytic reaction experiments.

Welcome to **rDummyReaction-Jabara**! This open-source project is designed to simulate catalytic reaction experiments by generating dummy data based on various reaction parameters. Contributions, improvements, and customizations are welcome—feel free to fork and submit pull requests.

---

## Table of Contents
1. [Overview](#overview)
2. [Key Features](#key-features)
3. [Dependencies](#dependencies)
4. [Installation and Setup](#installation-and-setup)
   - [Required Tools](#required-tools)
5. [Usage](#usage)
   - [Running the Application](#running-the-application)
   - [Feature Management](#feature-management)
6. [Configuration](#configuration)
7. [License](#license)
8. [Acknowledgments](#acknowledgments)

---

## Overview
**rDummyReaction-Jabara** is an R-based simulation tool that generates synthetic data representing catalytic reaction experiments. It creates a dataset by sampling various factors such as catalyst type, catalyst molarity, solvent type, temperature, and reaction time, and then computes the reaction yield along with associated attributes like crystal type and industry designation. This project is ideal for users who need dummy data for testing or demonstration purposes in the field of chemical reaction engineering.

---

## Key Features
- **Comprehensive Simulation**: Generates data by incorporating multiple reaction parameters including catalyst type, molarity, solvent, temperature, and time.
- **Dynamic Yield Calculation**: Implements a step-by-step process to calculate reaction yield based on optimal reaction times, noise factors, and process adjustments.
- **Customizable Parameters**: Easily modify simulation settings (e.g., number of samples, temperature levels, etc.) to fit different experimental scenarios.
- **CSV Output**: Exports the generated dataset to a CSV file for further analysis or integration with other applications.

---

## Dependencies
- **Programming Language/Framework**: R
- **Libraries/Packages**:  
  Base R (uses functions like `sample()`, `rnorm()`, etc.)
- **System Tools**:  
  - [R](https://www.r-project.org/)
  - [RStudio](https://www.rstudio.com/) (optional, for development)

---

## Installation and Setup

### Required Tools
**Clone or Download the Repository**  
   Clone this repository or download the source files.

---

## Usage

### Running the Application
To run the simulation, simply execute the R script in your preferred R environment. For example, from the R console:
```r
source("path_to_your_script/catalyst_simulator.R")
```
This will generate a CSV file (`dummy_.csv`) containing the simulated data.

### Feature Management
- **Simulation Parameters**: Edit the sampling parameters (e.g., number of samples, temperature values) in the script to tailor the simulation.
- **Yield Calculation**: Modify the reaction yield calculation section if you need to adjust the simulation logic.
- **Output Customization**: Change the CSV output filename or data formatting as needed.

---

## Configuration
Customize various settings directly within the R script to tailor the simulation:
- **Sampling Settings**: Adjust the sample size (`n`) and parameter ranges.
- **Reaction Parameters**: Modify the constants and adjustments for optimal reaction time (`t_opt`) and yield calculation.
- **Noise Level**: Change the standard deviation in `rnorm()` to simulate different levels of experimental noise.

---

## License

This project is licensed under the GNU General Public License v3.0 (GPL-3.0).

Copyright (C) 2025 Hongrong Yin

This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

---

## Acknowledgments

Special thanks to my loving Aimi Yago for her continuous support, inspiration, and contributions to this project's success! 🎉

---
