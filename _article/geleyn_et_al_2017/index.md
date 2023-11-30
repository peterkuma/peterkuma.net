---
layout: paper
code: geleyn2017
type: article
document: article
title: Single interval longwave radiation scheme based on the net exchanged rate decomposition with bracketing
authors:
  - first: J.-F.
    last: Geleyn
    affil: 1, 2
  - first: J.
    last: Mašek
    affil: 3, 4
    orcid: 0000-0002-9385-2506
  - first: R.
    last: Brožková
    affil: 3, 4
  - first: P.
    last: Kuma
    affil: 5
    orcid: 0000-0002-0910-8646
  - first: D.
    last: Degrauwe
    affil: 6
  - first: G.
    last: Hello
    affil: 1
  - first: N.
    last: Pristov
    affil: 7
affils:
  - CNRM-GAME, Météo-France/CNRS UMR 3589, Toulouse, France
  - Department of Physics and Astronomy, Ghent University, Belgium
  - Department of Meteorology and Climatology, Czech Hydrometeorological Institute, Prague, Czech Republic
  - Global Change Research Institute, Academy of Sciences of the Czech Republic, Brno, Czech Republic
  - Faculty of Mathematics, Physics and Informatics, Department of Astronomy, Physics of the Earth and Meteorology, Comenius University, Bratislava, Slovakia
  - Department of Meteorological and Climatological Research, Royal Meteorological Institute, Brussels, Belgium
  - Meteorology Office of Slovenian Environment Agency, Ljubljana, Slovenia
abstract: The main obstacle to efficient calculation of longwave radiative transfer is the existence of multiple radiative sources, each with its own emission spectrum. The work presented here overcomes this problem by combining the full spectrum broadband approach with the net exchanged rate decomposition. The idea is worked out to suit the needs of numerical weather prediction, where the most costly contribution representing the sum of internal exchanges is interpolated between cheap minimum and maximum estimates, while exchange with the surface and dominant cooling to space contributions are calculated accurately. The broad-band approach must address the additional problems related to spectral integration and many ideas developed previously for the solar spectrum are reused. Specific issues appear, the dependence of broadband gaseous transmissions on the temperature of the emitting body being the most important one. The thermal spectrum also brings some simplifications—aerosols, clouds and the Earth's surface can safely be treated as grey bodies. The optical saturation of gaseous absorption remains the main complication and non-random spectral overlaps between gases become much more significant than in the solar spectrum. The broadband character of the proposed scheme enables the use of an unreduced spatial resolution with an intermittent update of gaseous transmissions and interpolation weights, thus ensuring a full response of longwave radiation to rapidly varying cloudiness and temperature fields. This is in contrast to the mainstream strategy, where very accurate and expensive radiative transfer calculations are performed infrequently, often with reduced spatial resolution. The approach proposed here provides a much better balance between errors coming from the radiation scheme itself and from the intermittency strategy. The key achievement, ensuring a good scalability of the scheme, is a computational cost essentially linear in the number of layers, with straightforward inclusion of scattering as an additional bonus.
journal: Quarterly Journal of the Royal Meteorological Society
volume: 143
number: 704
pages:
  - 1313
  - 1335
_url: https://rmets.onlinelibrary.wiley.com/doi/full/10.1002/qj.3006
doi: 10.1002/qj.3006
submitted: 2016-06-17
accepted: 2017-01-18
published: 2017-04-17
date: 2017-04-17
license: Paid access / proprietary
---
