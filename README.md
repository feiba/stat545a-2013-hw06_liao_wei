Toy example for [STAT 545A Homework 6](http://www.stat.ubc.ca/~jenny/STAT545A/hw06_puttingAllTogether.html).

Initial state of directory, containing data and R scripts
  *4 R scripts file and no data file(data import via internet download)
How to replicate my analysis

  * (Clone the repo! Ha! OK I'm pretending the analyst doesn't use github.)
  * Download into an empty directory:
    - Input data: [`lotr_raw.tsv`](https://github.com/jennybc/STAT545A/blob/master/hw06_scaffolds/01_justR/lotr_raw.tsv)
    - Scripts: [`01_filterReorder.R`](https://raw.github.com/jennybc/STAT545A/master/hw06_scaffolds/01_justR/01_filterReorder.R) and [`02_aggregatePlot.R`](https://raw.github.com/jennybc/STAT545A/master/hw06_scaffolds/01_justR/02_aggregatePlot.R)
    - Makefile-like script: [`Makefile.R`](https://raw.github.com/jennybc/STAT545A/master/hw06_scaffolds/01_justR/Makefile.R)
  * Start a fresh RStudio session, make sure the above directory is the working directory, open `Makefile.R`, and click on "Source".
  * Alternatively, in a shell: `Rscript Makefile.R`.
  * When you run the pipeline the first time, you will get warnings about `file.remove()` trying to remove files that don't exist. That's OK. They will exist and will be removed and remade on subsequent runs.
  * New files you should see after running the pipeline:
    - [`barchart_totalWords.png`](https://raw.github.com/jennybc/STAT545A/master/hw06_scaffolds/01_justR/barchart_totalWords.png)
    - [`barchart_totalWordsFilmDodge.png`](https://raw.github.com/jennybc/STAT545A/master/hw06_scaffolds/01_justR/barchart_totalWordsFilmDodge.png)
    - [`lotr_clean.tsv`](https://github.com/jennybc/STAT545A/blob/master/hw06_scaffolds/01_justR/lotr_clean.tsv)
    - `stripplot_wordsByRace_FILM.png`, where FILM is one of the 3 movies. Example: [`stripplot_wordsByRace_The_Fellowship_Of_The_Ring.png`](https://raw.github.com/jennybc/STAT545A/master/hw06_scaffolds/01_justR/stripplot_wordsByRace_The_Fellowship_Of_The_Ring.png)
    - [`totalWordsByFilmRace.tsv`](https://github.com/jennybc/STAT545A/blob/master/hw06_scaffolds/01_justR/totalWordsByFilmRace.tsv)
