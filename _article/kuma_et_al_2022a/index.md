---
layout: paper
code: kuma2022a
type: article
document: article
title: Machine learning of cloud types in satellite observations and climate models
authors:
  - first: Peter
    last: Kuma
    affil: 1
    orcid: 0000-0002-0910-8646
  - first: Frida A.-M.
    last: Bender
    affil: 1
    orcid: 0000-0003-4867-4007
  - first: Alex
    last: Schuddeboom
    affil: 2
    orcid: 0000-0002-0487-7470
  - first: Adrian J.
    last: McDonald
    affil: 2
    orcid: 0000-0002-1456-6254
  - first: Øyvind
    last: Seland
    affil: 3
affils:
  - Department of Meteorology (MISU), Stockholm University, Stockholm, Sweden
  - University of Canterbury, Christchurch, Aotearoa New Zealand
  - Norwegian Meteorological Institute, Oslo, Norway
abstract: "Uncertainty in cloud feedbacks in climate models is a major limitation in projections of future climate. Therefore, evaluation and improvement of cloud simulation is essential to ensure the accuracy of climate models. We analyse cloud biases and cloud change with respect to global mean near-surface temperature (GMST) in climate models relative to satellite observations, and relate them to equilibrium climate sensitivity, transient climate response and cloud feedback. For this purpose, we develop a supervised deep convolutional artificial neural network for determination of cloud types from low-resolution (2.5°×2.5°) daily mean top of atmosphere shortwave and longwave radiation fields, corresponding to the World Meteorological Organization (WMO) cloud genera recorded by human observers in the Global Telecommunication System (GTS). We train this network on top of atmosphere radiation retrieved by the Clouds and the Earth’s Radiant Energy System (CERES) and GTS, and apply it on the Climate Model Intercomparison Project phase 5 and 6 (CMIP5 and CMIP6) model output and the ECMWF Reanalysis version 5 (ERA5) and the Modern-Era Retrospective Analysis for Research and Applications version 2 (MERRA-2) reanalyses. We compare the cloud types between models and satellite observations. We link biases to climate sensitivity and identify a negative linear relationship between the root mean square error of cloud type occurrence derived from the neural network and model equilibrium climate sensitivity (ECS), transient climate response (TCR) and cloud feedback. This statistical relationship in the model ensemble favours models with higher ECS, TCR and cloud feedback. However, this relationship could be due to the relatively small size of the ensemble used or decoupling between present-day biases and future projected cloud change. Using the abrupt-4xCO2 CMIP5 and CMIP6 experiment, we show that models simulating decreasing stratiform and increasing cumuliform clouds tend to have higher ECS than models simulating increasing stratiform and decreasing cumuliform clouds, and this could also partially explain the association between the model cloud type occurrence error and model ECS."
doi: 10.5194/acp-2022-184
submitted: 2022-03-07
date: 2022-12-05
note: forthcoming
journal: Atmospheric Chemistry and Physics
archive: Zenodo
archive_url: https://doi.org/10.5281/zenodo.6184907
file: "Kuma et al. (2022), Machine learning of cloud types in satellite observations and climate models (submitted revision 5 December 2022, 2nd).pdf"
file_size: 11604478
license: CC BY 4.0
supplement: "supplement_rev2.zip"
supplementary_code: "https://github.com/peterkuma/ml-clouds-2021/"
---
