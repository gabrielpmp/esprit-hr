# ESPRIT HR
Heart rate detection using the ESPRIT algorithm.

## Repository

The repository contains:

- a folder containing the proposed ESPRIT-based algorithm for heart rate detection;
- a folder containing other heart rate detection algorithms (zero crossing, correlation, peak detection, FFT) used for comparison;
- other scripts used for signal preprocessing in the samples used.

All scripts were developed in MATLAB  version 2018a and tested on Windows 10. Samples used are available on request by contacting the author.

## Usage

Each algorithm consists of an estimator script named ```estimator_*.m``` and additional helper signal processing functions. To run the heart rate detection process, the estimator is called by passing the following arguments to the script:

- ```raw_data```: heartbeat signal recorded by a PPG sensor;
- ```fs```: sampling frequency of the recorded heartbeat signal, in Hz;
- ```timeWindow```: time window of the signal to be considered for heart rate estimation, in seconds.

The raw signal is organized as a column with the counts of infrared light captured by the PPG signal and another column containing their respective time stamp.

