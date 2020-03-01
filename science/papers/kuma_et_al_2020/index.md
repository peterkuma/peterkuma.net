---
layout: default
title: Ground-based lidar processing and simulator framework for comparing models and observations
---

# Ground-based lidar processing and simulator framework for comparing models and observations

Peter Kuma<sup>1</sup>, Adrian J. McDonald <sup>1</sup>, Olaf Morgenstern <sup>2</sup>, Richard Querel <sup>3</sup>, Israel Silber <sup>4</sup>, and Connor
J. Flynn <sup>5</sup>

<small>
<sup>1</sup> University of Canterbury, Christchurch, New Zealand<br />
<sup>2</sup> National Institute of Water & Atmospheric Research (NIWA), Wellington, New Zealand<br />
<sup>3</sup> National Institute of Water & Atmospheric Research (NIWA), Lauder, New Zealand<br />
<sup>4</sup> Department of Meteorology and Atmospheric Science, Pennsylvania State University, PA, USA<br />
<sup>5</sup> School of Meteorology, University of Oklahoma, Norman, OK, USA
</small>

## Abstract

Automatic lidars and ceilometers provide valuable information on cloud and aerosols, but have not been used systematically in the evaluation of GCMs and NWP models. Obstacles associated with the diversity of instruments, a lack of standardisation of data products and open processing tools mean that the value of the large ALC networks worldwide is not being realised. We discuss a tool, called the Automatic Lidar and Ceilometer Framework (ALCF), that overcomes these problems and also includes a ground-based lidar simulator, which calculates the radiative transfer of laser radiation, and allows one-to-one comparison with models. Our ground-based lidar simulator is based on the Cloud Feedback Model Intercomparison Project (CFMIP) Observation Simulator Package (COSP) which has been used extensively for spaceborne lidar intercomparisons. The ALCF implements all steps needed to transform and calibrate raw ALC data and create simulated backscatter profiles for one-to-one comparison and complete statistical analysis of cloud. The framework supports multiple common commercial ALCs (Vaisala CL31, CL51, Lufft CHM 15k and Sigma Space MiniMPL), reanalyses (JRA-55, ERA5 and MERRA-2) and models (AMPS and the Unified Model). To demonstrate its capabilities, we present case studies evaluating cloud in the supported reanalyses and models using CL31, CL51, CHM 15k and MiniMPL observations at three sites in New Zealand. We show that the reanalyses and models generally underestimate cloud fraction and overestimate cloud albedo, the common "too few too bright" problem. If sufficiently high temporal resolution model output is available (better than 6 hourly), a direct comparison of individual clouds is also possible. We demonstrate that the ALCF can be used as a generic evaluation tool to examine cloud occurrence and cloud properties in reanalyses, NWP models and GCMs, potentially utilising the large amounts of ALC data already available. This tool is likely to be particularly useful for the analysis and improvement of low-level cloud simulations which are not well monitored from space. This has previously been identified as a critical deficiency in contemporary models, limiting the accuracy of weather forecasts and future climate projections.

## Journal

Submitted to Geoscientific Model Development (GMD)

## Download

[Revision 2019-01-28 (PDF)](https://github.com/peterkuma/research/raw/master/papers/Kuma%20et%20al.%20(2020),%20Ground-based%20lidar%20processing%20and%20simulator%20framework%20for%20comparing%20models%20and%20observations%20[2020-01-28].pdf)
