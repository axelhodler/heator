#

## Setup macos

```
brew install r
brew install libgit2 # necessary for R package devtools
```

run via

```
Rscript file.R
```

### dependencies

fire up `R` and run
```
install.packages("ggplot2")
install.packages("devtools") # make sure `libgit2` is present
devtools::install_github("dkahle/ggmap")
install.packages("RColorBrewer")
```

```
Fehler in i.p(...) :
  (konvertiert von Warnung) installation of package ‘BH’ had non-zero exit status
```

```
install.packages( "BH", type = "source" )
install.packages( "bindr", type = "source" )
install.packages( "bitops", type = "source" )
install.packages( "pkgconfig", type = "source" )
install.packages( "plogr", type = "source" )
install.packages( "bindrcpp", type = "source" )
install.packages( "purrr", type = "source" )
install.packages( "dplyr", type = "source" )
install.packages( "tidyselect", type = "source" )
```
