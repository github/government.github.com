---
layout: story
author: Bruce Ravel, National institute of Standards and Technology
title: NIST opens up atoms with open source
description: Scientists from the Synchrotron Methods Group at the National Institute of Standards and Technology develop state-of-the-art synchrotron X-ray measurement technology, including instrumentation, methods, and analytical tools, for X-ray measurement facilities at The National Synchrotron Light Source.
image: /images/xas.png
category: open source
---

Scientists from the
[Synchrotron Methods Group](http://www.nist.gov/mml/mmsd/synchrotron_methods/index.cfm)
at the
[National Institute of Standards and Technology](http://www.nist.gov)
develop state-of-the-art synchrotron X-ray measurement technology,
including instrumentation, methods, and analytical tools, for X-ray
measurement facilities at
[The National Synchrotron Light Source](http://www.bnl.gov/ps).  A
[synchrotron](http://en.wikipedia.org/wiki/Synchrotron) is a
large-scale particle accelerator dedicated to producing intense beams
of X-rays for research applications.  The NSLS is one of
[four such facilities in the United States](http://science.energy.gov/user-facilities/basic-energy-sciences/)
operated by the Department of Energy and one of
[about fifty worldwide](http://www.lightsources.org/light-source-facility-information).
The instrumentation and methodology develop at a rapid pace, requiring
novel software tools to make effective use of the data measured.

[X-ray Absorption Spectroscopy (XAS)](http://en.wikipedia.org/wiki/EXAFS)
(XAS) is a way of probing the electronic and atomic structure of
matter using X-rays.  With XAS, a researcher can understand the
properties and behavior of materials by investigating how the atoms in
the material stack together.  XAS plays a central role in a wide
variety of scientific disciplines, including:

 * _energy science_: batteries, fuel cells, catalytic materials,
   photovoltaic materials
 * _materials science_: components for computers and electronics
 * _environmental science_: fate and transport of contaminant
   metals in natural systems
 * _life science_: the role of metals in proteins and tissues
 * _art and archaeology_: studies of pigments and metals used to make
   objects of cultural or historical significance

In short, scientific discoveries made using XAS have a great impact on
many of the scientific areas most important to society.

[Demeter](https://github.com/bruceravel/demeter) is scientific
software for the processing and analysis of XAS data.
[Demeter](https://github.com/bruceravel/demeter) is built using
various open source tools, including [Perl](http://www.perl.org),
[wxWidgets](http://www.wxwidgets.org/),
[Gnuplot](http://www.gnuplot.info), and others.  It also depends upon
the scientific software efforts of various academic collaborators,
including [Feff](http://www.feffproject.org/),
[Ifeffit](https://github.com/newville/ifeffit), and
[Larch](https://github.com/xraypy/xraylarch).

As a system for linking the advanced capabilities of the backend
scientific tools to useful and expressive user interfaces,
[Demeter](https://github.com/bruceravel/demeter) allows scientists to
use data measured at synchrotron facilities from around the world to
the fullest extent.

The programs built using Demeter &ndash; Athena (for XAS data processing),
Artemis (for quantitative XAS data analysis), and Hephaestus (a
souped-up periodic table for the XAS practitioner) &ndash; enable thousands
of scientists from around the country and the world to make scientific
progress using XAS.
