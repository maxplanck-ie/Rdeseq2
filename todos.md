# Todos

## final checklist
 - [x] index / description  
 - [x] outline  
 - [x] day1  
 - [x] day2  
 - [ ] day3  
 - [ ] day4  
 - [ ] summary / template  

## day 1

 - [ ] RColorBrewer example
 - [ ] recommendation windows -> workbench
 - [ ] no git -> download repo zip as alternative.


## day 2

 - [ ] phrasing of question, 
 - [ ] write_tsv instead of write_table
 - [ ] DESeq workflow -> a,b,d,e
 - [ ] before writing table, include resultsNames to get the coefficients printed out
 - [ ] possibly skip relevel() --> extensive contrast discussion

## day 3
 - [x] celltype + condition + celltype:condition --> fix manual explanation of beta (JJ<->BM)
 - [ ] use "real" sample names from data, rather than sample1,2,...
 - [ ] after break (heatmap of significant genes): 
        - subset(padj < 0.05) is optional
        - simplify filter (%in%)
        - simplify heatmap (keep only scale = "row", everything else is optional)
 - [ ] skip results() in favour of lfcShrink() 
 - [ ] mod_mat trick: 
        - move up?
        - have a task/poll to create complex contrast: BM_DMSO vs JJ_TG
 - [ ] GENEID --> SYMBOL task too challenging. 
    - needs more time or hints
    - columns selection: dplyr::select(8,9,10,14,15,16) --> select by pattern ?
- [ ] reduce to only one prior gene set apoptosis or spliceosome


## general todo
 - [ ] continuous variable in design ?
 - [ ] give example with own sizefactors (e.g. from spike-ins)?
 - [ ] enforce consistency in sample naming (DMSO or CTRL)
