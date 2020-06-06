---
layout: paper
title: Ground-based lidar processing and simulator framework for comparing models and observations
authors:
  - first: Peter
    last: Kuma
    affil: 1
    orcid: 0000-0002-0910-8646
  - first: Adrian J.
    last: McDonald
    affil: 1
    orcid: 0000-0002-1456-6254
  - first: Olaf
    last: Morgenstern
    affil: 2
    orcid: 0000-0002-9967-9740
  - first: Richard
    last: Querel
    affil: 3
    orcid: 0000-0001-8792-2486
  - first: Israel
    last: Silber
    affil: 4
    orcid: 0000-0001-6588-2145
  - first: Connor J.
    last: Flynn
    affil: 5
    orcid: 0000-0002-9182-6531
affils:
  - University of Canterbury, Christchurch, New Zealand
  - National Institute of Water & Atmospheric Research (NIWA), Wellington, New Zealand
  - National Institute of Water & Atmospheric Research (NIWA), Lauder, New Zealand
  - Department of Meteorology and Atmospheric Science, Pennsylvania State University, PA, USA
  - School of Meteorology, University of Oklahoma, Norman, OK, USA
abstract: Automatic lidars and ceilometers provide valuable information on cloud and aerosols, but have not been used systematically in the evaluation of GCMs and NWP models. Obstacles associated with the diversity of instruments, a lack of standardisation of data products and open processing tools mean that the value of the large ALC networks worldwide is not being realised. We discuss a tool, called the Automatic Lidar and Ceilometer Framework (ALCF), that overcomes these problems and also includes a ground-based lidar simulator, which calculates the radiative transfer of laser radiation, and allows one-to-one comparison with models. Our ground-based lidar simulator is based on the Cloud Feedback Model Intercomparison Project (CFMIP) Observation Simulator Package (COSP) which has been used extensively for spaceborne lidar intercomparisons. The ALCF implements all steps needed to transform and calibrate raw ALC data and create simulated backscatter profiles for one-to-one comparison and complete statistical analysis of cloud. The framework supports multiple common commercial ALCs (Vaisala CL31, CL51, Lufft CHM 15k and Sigma Space MiniMPL), reanalyses (JRA-55, ERA5 and MERRA-2) and models (AMPS and the Unified Model). To demonstrate its capabilities, we present case studies evaluating cloud in the supported reanalyses and models using CL31, CL51, CHM 15k and MiniMPL observations at three sites in New Zealand. We show that the reanalyses and models generally underestimate cloud fraction and overestimate cloud albedo, the common "too few too bright" problem. If sufficiently high temporal resolution model output is available (better than 6 hourly), a direct comparison of individual clouds is also possible. We demonstrate that the ALCF can be used as a generic evaluation tool to examine cloud occurrence and cloud properties in reanalyses, NWP models and GCMs, potentially utilising the large amounts of ALC data already available. This tool is likely to be particularly useful for the analysis and improvement of low-level cloud simulations which are not well monitored from space. This has previously been identified as a critical deficiency in contemporary models, limiting the accuracy of weather forecasts and future climate projections.
journal: Geoscientific Model Development Discussions
volume: 2020
pages:
  - 1
  - 45
_url: https://www.geosci-model-dev-discuss.net/gmd-2020-25/
doi: 10.5194/gmd-2020-25
note: in review
submitted: 2020-01-26
date: 2020-01-26
archive: Zenodo
archive_url: https://zenodo.org/record/3785715
file: "Kuma et al. (2020), Ground-based lidar processing and simulator framework for comparing models and observations (ALCF 1.0).pdf"
code: kuma2020b
---
