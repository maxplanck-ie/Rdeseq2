## Day 3

3.1 What does the intercept value reflect ?
    a) The average gene counts for celltype JJ
    b) The average gene counts for celltype BM

3.2 What coefficients will we have when we specify the condition?
    a) Intercept, amiloride condition, DMSO condition, TG condition
    b) Intercept, amiloride vs dmso condition, TG vs dmso condition
    c) Intercept, dmso vs amiloride, tg vs amiloride

3.3 What does the intercept value reflect ?
    a) The average gene counts for celltype BM
    b) The average gene counts for treatment amiloride
    c) The average gene counts for amiloride treated BM cells
    d) The average gene counts for dmso treated JJ cells

3.4 Is there a difference in specifying ~celltype*condition and ~celltype + condition + celltype:condition ?
   a) Yes
   b) No
   c) Maybe

3.5 Given our contrast c('condition', 'TG', 'AMIL'), what would a (significant) positive foldchange correspond to?
   a) Higher expression in TG-treated BM cells
   b) Higher expression AMIL-treated BM cells
   c) Higher expression in TG- and AMIL-treated BM cells relative to DMSO.
