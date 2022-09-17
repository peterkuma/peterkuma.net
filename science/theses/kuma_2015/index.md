---
layout: paper
code: kuma2015
type: mastersthesis
document: thesis
title: "Broadband approach as a framework for implementation of radiative transfer scheme with selective intermittency: Cost versus accuracy study  simulations"
authors:
  - first: Peter
    last: Kuma
    affil: 1
    orcid: 0000-0002-0910-8646
affils:
  - Comenius University, Bratislava, Slovakia
  - Czech Hydrometeorological Institute, Prague, Czech Republic
published: 2015-06-09
date: 2015-06-09
archive: Zenodo
school: Comenius University
address: Bratislava, Slovakia
_url: https://zenodo.org/record/3764236
abstract: "The computational complexity of radiation schemes in NWP models precludes full radiative transfer calculations in every time step and every grid point of the model. Traditionally, models resort to calling a radiation scheme on a reduced temporal or spatial resolution, optionally scaling the resulting fluxes for the change in temperature profile and the solar zenith angle. As a result, the variability of cloud cover is neglected, leading to a considerable error. In the shortwave spectrum, relatively slowly changing gaseous optical properties are one of the most expensive parts to calculate. We propose a modification to the shortwave part of the ACRANEB2 broadband radiation scheme to interpolate gaseous optical thickness of layers with respect to the solar zenith angle within a chosen intermittency period, while still accounting for evolving cloudiness by recalculating its optical properties and the resulting fluxes via the adding method in every model time step. In this work we use a single column model to study the dependence of shortwave gaseous optical thickness on the solar zenith angle, we show that this dependence can be approximated with good accuracy, implement this approximation in the ACRANEB2 radiation scheme and assess the impact on accuracy of heating rates and model run time in 24-h simulations of the limited-area NWP model ALADIN. We show that the modification results in time saving of up to 4 % of total model run time and incurs error on shortwave heating rates up to ±0.4 K/day at noon (90 % confidence interval) and 0.06 K/day (MAE) over the whole domain and time period, and that both performance and accuracy scale with the length of the intermittency period. This relationship is summarised in a cost vs. accuracy comparison, giving potential users a guide on choosing the optimal intermittency period in their circumstances. The proposed modification became part of the ACRANEB2 radiation scheme implemented in package ALARO-1 version A, and since January 2015 it is operational in the model ALADIN/CHMI."
doi: 10.5281/zenodo.3764236
supervisors:
  - first: Ján
    last: Mašek
    affil: 2
    orcid: 0000-0002-9385-2506
archive_url: https://zenodo.org/record/3764236
file: "Kuma (2015), Broadband approach as a framework for implementation of radiative transfer scheme with selective intermittency: Cost versus accuracy study simulations.pdf"
---
