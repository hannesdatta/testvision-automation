library(xlsx)
library(data.table)

fn <- list.files(full.names=T, pattern = 'txt$')

filename = 'exam2020-main.xlsx'

append = F
cnt=1
for (f in fn) {
  x<-fread(f)
  
  sname = paste0(cnt,'_', gsub('[.]txt', '', paste0(rev(strsplit(f, '/', fixed=T)[[1]])[1], collapse='')))
  x[, answer:=gsub('[ ][|][ ]', '\n', answer)]
  write.xlsx(x, filename, sheetName = sname, append = append, showNA = FALSE)
  append=T
  cnt=cnt+1
}