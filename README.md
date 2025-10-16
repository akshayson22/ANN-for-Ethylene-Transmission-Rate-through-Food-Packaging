# Neural Network Model for Ethylene Transmission Rate Prediction

This repository contains a MATLAB implementation of an Artificial Neural Network (ANN) model for predicting ethylene permeance and transmission rate through perforated packaging films.

## Reference

This code implements the model from:

**Sonawane et al. (2022).** Ethylene permeance through perforated packaging film: Modelling and effect of air velocity, temperature, film thickness and perforation diameter. *Food Packaging and Shelf Life, 34*, 100961.
[https://doi.org/10.1016/j.fpsl.2022.100961](https://doi.org/10.1016/j.fpsl.2022.100961)

Please cite this paper if you use this model in your work.

---

## Model Overview

The model predicts:

* **ETR**: Ethylene Transmission Rate (cm³/h)
* **K**: Ethylene permeance or convective mass transfer coefficient (cm/s)

Based on four input parameters:

1. Film thickness (cm)
2. Perforation diameter (cm)
3. Air velocity (cm/s)
4. Temperature (K)

---

## Files Description

### Main Files

* **`pred.m`** - Main prediction function
* **`extract_weights.m`** - Script to extract weights from neural network object (reference only)
* **`example_usage.m`** - Examples demonstrating how to use the prediction function

### Supplementary Files

* **`network_architecture.png`** - Diagram of neural network architecture
* **`regression_results.png`** - Regression results (R values) from the original publication

---

## Usage

### Basic Usage

```matlab
% Predict K and ETR
[K, ETR] = pred(film_thickness_cm, perf_diameter_cm, air_velocity_cm_s, temperature_K);
```

### Input Ranges

The model works best within these ranges:

* Film thickness: 20-30 μm (0.002-0.003 cm)
* Perforation diameter: 556.8-936 μm (0.05568-0.0936 cm)
* Air velocity: 0.0112-0.1855 m/s (1.12-18.55 cm/s)
* Temperature: 4.76-23.33°C (277.91-296.48 K)

---

### Model Architecture

The neural network has:

* Input Layer: 4 neurons (normalized inputs)
* Hidden Layer: 5 neurons (tan-sigmoid activation)
* Output Layer: 1 neuron (linear activation)

---

## Requirements

* MATLAB R2018b or later
* Deep Learning Toolbox (for tansig and purelin functions)

---

## Validation

The model achieved excellent performance in the original study:

* Training R-value: 0.999
* Validation R-value: 0.998
* Test R-value: 0.997
* All data R-value: 0.999

---

## License

This implementation is provided for academic and research purposes. Please ensure proper citation of the original publication when using this code.
