---
layout: paper
code: masek2015
type: article
title: Single interval shortwave radiation scheme with parameterized optical saturation and spectral overlaps
authors:
  - first: J.
    last: Mašek
    affil: 1, 2
  - first: J.-F.
    last: Geleyn
    affil: 3, 4
  - first: Brožková
    last: R.
    affil: 1, 2
  - first: O.
    last: Giot
    affil: 5, 6
  - first: H. O.
    last: Achom
    affil: 4
  - first: P.
    last: Kuma
    affil: 7
    orcid: 0000-0002-0910-8646
affils:
  - Department of Meteorology and Climatology, Czech Hydrometeorological Institute, Prague, Czech Republic
  - Global Change Research Centre, Academy of Sciences of the Czech Republic, Brno, Czech Republic
  - CNRM-GAME, Météo-France/CNRS UMR 3589, Toulouse, France
  - Department of Physics and Astronomy, Ghent University, Belgium
  - Department of Meteorological and Climatological Research, Royal Meteorological Institute, Brussels, Belgium
  - Department of Biology, Centre of Excellence PLECO, University of Antwerp, Belgium
  - Department of Astronomy, Physics of the Earth and Meteorology, Faculty of Mathematics, Physics and Informatics, Comenius University, Bratislava, Slovakia
abstract: Spectral integration is the most time consuming part of solar radiative transfer codes used in numerical weather prediction. Routinely used approaches usually incline to one of two extremes – expensive and very accurate correlated k-distribution method made affordable by doing radiative transfer calculations with reduced temporal and/or spatial resolution, or cheaper but less accurate broadband approach affordable at every grid-point and time-step. Both approaches have their pros and cons, but hybrid solutions do not seem very promising. The presented work improves accuracy of full spectrum broadband approach by parameterizing secondary saturation of gaseous absorption, optical saturation of Rayleigh scattering and of cloud absorption as well as non-random gas-cloud spectral overlap. In order to isolate the problem of spectral integration from other approximations, one builds a narrowband reference using the same delta-two stream framework as the broadband scheme. Using this reference reveals the surprising fact that saturation effect of cloud absorption for one single layer and for the whole solar spectrum can be parameterized in a rather compact way, with one simple formula for liquid clouds and one for ice clouds. One then introduces the concept of effective cloud optical depth, which extends the applicability of parameterized cloud optical saturation to multi-layer cases, accommodating also effects of gas-cloud spectral overlap in the near-infrared. A scheme with all the above parameterizations indeed pushes accuracy limits of broadband approach to the level where a single shortwave interval can be used. This opens the possibility to reduce costs by using selective intermittency, where slowly evolving gaseous transmissions are updated on the timescale of hours, while quickly varying cloud optical properties are recomputed at every model time-step. In a companion article it will be demonstrated that the above core strategy is applicable also to thermal radiative transfer, with perhaps even better cost effectiveness there.
journal: Quarterly Journal of the Royal Meteorological Society
volume: 142
issue: 694
pages:
  - 304
  - 326
_url: https://rmets.onlinelibrary.wiley.com/doi/full/10.1002/qj.2653
doi: 10.1002/qj.2653
submitted: 2015-01-08
accepted: 2015-08-11
published: 2015-08-17
date: 2015-08-17
---
