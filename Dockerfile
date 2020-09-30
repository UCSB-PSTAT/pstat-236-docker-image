FROM dddlab/base-rstudio:v20200720-d6cbe5a-94fdd01b492f

LABEL maintainer="Patrick Windmiller <windmiller@pstat.ucsb.edu>"

USER $NB_USER

RUN conda install -y r-base && \
    conda install -c conda-forge udunits2 && \
    conda install -c conda-forge imagemagick && \
    conda install -c conda-forge r-rstan && \
    conda install -c conda-forge r-car && \
    conda install -c conda-forge r-Hmisc && \
    conda install -c conda-forge r-foreign && \
    conda install -c conda-forge r-RcmdrMisc && \
    conda install -c conda-forge r-sf && \
    conda install -c conda-forge r r-rgeos && \
    conda install -c conda-forge r-maptools && \
    conda install -c conda-forge r-V8 && \
    conda install -c conda-forge r-geojson && \
    conda install -c conda-forge r-jqr && \
    conda install -c conda-forge r-jsonvalidate && \
    conda install -c conda-forge r-lwgeom && \
    conda install -c conda-forge r-leafem && \
    conda install -c conda-forge r-leafpop && \
    conda install -c conda-forge r-R2jags
#    conda install -c conda-forge r-CARBayesdata

RUN R -e "install.packages(c('tidyverse','lme4','rstan','brms','animation',\
'ape','broom','CCA','devtools','dplyr','EFDR','expm','fields','FRK','ggplot2','ggmap',\
'ggquiver','gridExtra','gstat','IDE','INLA','lattice','leaps','lmtest',\
'maps','maptools','Matrix','nlme','mgcv','mgcViz','MASS','plyr','purrr','RColorBrewer','scoringRules',\
'sp','spacetime','SpatialVx','SpatioTemporal','SpecsVerification','stargazer',\
'tidyr','verification','xtable','knitr','LatticeKrig','fda','Data2LD','spatial',\
'boot','dlm','SpBayes','MBA','spNNGP','KernSmooth','HRW','glmmEP','gammSlice','stars',\
'spatstat','spatgraphs','splancs','ash','latticeDensity','smacpod'), repos = 'http://cran.us.r-project.org')"

RUN R -e "install.packages(c('lubridate','rmarkdown','viridis','geoR','geoRglm','SpBayes',\
'R2BayesX','CARBayes','foreign','rasterVis','rgeos','mapdata','tmap',\
'quickmapr','cartography','mapmisc','BMA','bisque','EpiBayes',\
'utils','igraph','shp2graph','PBSmapping','shapefiles','RgoogleMaps',\
'plotKML','ggmap','ggsn','mapedit','micromap','recmap','statebins',\
'cartogram','geogrid','stplanr','plm','inlmisc','bibtex','tables','xtable',\
'RefManagerR','libprog','rgdal','methods','DataVisualizations','inlabru',\
'testthat','rgl','sphereplot','raster','shiny','spatstat.data','graphics',\
'geometa','ncdf4','vec2dtransf','RNetCDF','rworldmap','rnaturalearth',\
'rworldxtra','tidycensus','tigris','rgbif','Guerry','gdistance',\
'geosphere','cshapes','spsurvey','trip','areal','magclass','landsat',\
'gganimate','LearnBayes','TeachBayes','learnstats','visualize',\
'TeachingDemos','CAR','leaps','lasso2','lars','MARS','glmnet',\
'faraway','MASS','optimx','roptim','quantreg','optimParallel','ucminf',\
'Rcgmin','Rtnmin','mize','Rsolnp','ManifoldOptim','gsl','neldermead',\
'optimsimplex','trust','trustOptim','quantprog','coneproj','Dykstra',\
'limSolve','nlsr','onls','GenSA','GA','LowRankQP','SparseM','svd',\
'Rlinsolve','matrixcalc','matlib','Deriv','numDeriv','pracma','SpareGrid',\
'calculus','akima','gss','partitions','permutations',\
'Rcpp','RcppNumerical','RcppArmadillo','parallelDist',\
'rpart','tree','ggRandomForests','actuar','VGAM','VGAMdata','gamlss.dist','MATRIX',\
'Hmisc','latex2exp','RandomFields','RandomFieldsUtils',\
'tweedie','sparseMVN','mixtools','matrixsampling','EnvStats',\
'circular','CircStats','foreach','biglm','biglars','convoSPAT',\
'BayesNSGP','astsa','KFAS','reshape2','MARSS','ellipse','lattice',\
'scatterplot3d','misc3d','geometry','vegan','scam','laGP','mvtnorm',\
'tgp','akima','monomvn','reglogit','plgp','dynaTree','coda','MCMCpack',\
'gamair','assist','EnviroStat','BSagri','PottsUtils','multivator','mlegP',\
'RobustGaSP','PrevMap','lgcp','demu','stcos','ideq','sim2Dpredictr','IDE',\
'spTimer','CARBayesST','plm','splm','sphet','pastecs','spate','Stem',\
'surveillance','gapfill','crawl','stplanr','SimilarityMeasures','mvtsplot',\
'openair','spcopula','xts','chron','TimeProjection','forecast','data.table',\
'tseries','stsm','stsm.class','bsts','statespacer','GAS','NGSSEML','bssm',\
'glarma','mclcar','TSTutorial','timsac','acp','gsarima','Rbeast','fable',\
'fabletools','prophet','scoringRules','multDM','scoringutils',\
'reticulate','PythonInR','R.matlab'), repos = 'http://cran.us.r-project.org')"

RUN R -e "install.packages(c('devtools'), repos = 'http://cran.us.r-project.org')"

RUN installGithub.r \
    andrewzm/STRbook

RUN R -e "install.packages('INLA',repos=c(getOption('repos'),INLA='https://inla.r-inla-download.org/R/stable'),dep=TRUE)"

#RUN R -e "if (!requireNamespace('BiocManager', quietly = TRUE))\
#install.packages('BiocManager')\
#BiocManager::install(version = '3.11')\
#BiocManager::install(c('graph','Rgraphviz'),dep=TRUE)"
