This files describes the files associated with the paper:

Mars RB, Sotiropoulos SN, Passingham RE, Sallet J, Verhagen L, Khrapitchev AA, Sibson N, & Saad Jbabdi (2018) 'Whole brain comparative anatomy using connectivity blueprints'

#### Tractography protocols

This directory `protocols` contains the recipes used to generate the white matter tracts using probabilistic tractography in standard space (MNI152_1mm for the human, F99 for the macaque). Each species' directory contains one folder per tract. The tract folders contain at least a seed, target (i.e., waypoint), and exclusion (i.e., avoid) mask. Sometimes there is also a stop mask or an 'invert' file that indicates the protocol should also be run with the seed and target switched and the results averaged.

#### Code

The `code` directory contains some Matlab scripts to perform some of the analyses described in the paper:

- xspecies_map2map.m : to take a cortical map from one species and use the connectivity blueprints to predict what the map would look like in the other species

- calc_KL.m : to calculate the KL divergence

- calc_entropy.m : to calculate the entropy

#### Results

Some of the illustrative results presented in the paper's figures are included in the `blueprints` and `maps` directories.

The blueprints are the vertex by tract blueprints for each hemisphere for the human (hum_L_blueprint.mat and hum_R_blueprint.mat Matlab files) and macaque (mac_L_blueprint.mat and mac_R_blueprint.mat Matlab files) are located in the `blueprints` directory.

A Connectome Workbench betweenspecies.spec file is located in the main directory. This loads surfaces for both the human and macaque and some of the results files:

- doubleclick_KL dconn : the double click files allow you to click anywhere on the human or macaque cortex and see a map of the KL divergence of that vertex's connectivity fingerprintf with that of each other vertex in the two species brains, allowing you to determine which areas are most similar in their connectivity

- minKL dtseries : shows the map of minimum KL divergence (macaque->human on the human brain, human->macaque on the macaque brain) from Figure 4

- myelin map : shows the human myelin map and the predicted macaque myelin map from Figure 3

- entropy dtseries : shows the entropy map from Figure 4a
