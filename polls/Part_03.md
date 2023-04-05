## Day 3
3.1 What is the relation between the size factors and the values of the columns?
    a) Larger size factors correspond to the samples with higher sequencing depth.
    b) Larger size factors correspond to the samples with lower sequencing depth.
    c) Size factors are independent of the sequencing depth.

3.2 Is there a difference in specifying ~celltype*condition and ~celltype + condition + celltype:condition ?
   a) Yes
   b) No
   c) Maybe

3.3 Given our design (~celltype*condition), what comparison do we look at by specifying results(dds, contrast = c("condition", "TG", "DMSO")) ?
   a) A comparison between TG-treated cells and DMSO-treated cells.
   b) A comparison between TG-treated BM cells and DMSO-treated BM cells.
   c) A comparison between TG-treated JJ cells and DMSO-treated JJ cells.
   d) A comparison between TG-treated JJ cells and DMSO-treated BM cells.

3.4 Given our contrast c('condition', 'TG', 'AMIL'), what would a (significant) positive foldchange correspond to?
   a) Higher expression in TG-treated BM cells
   b) Higher expression AMIL-treated BM cells
   c) Higher expression in TG- and AMIL-treated BM cells relative to DMSO.
