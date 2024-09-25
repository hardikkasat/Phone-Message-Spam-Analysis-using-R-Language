text_mining=function(df){
  
  text_corpus= Corpus(VectorSource(df$v2))
  clean=tm_map(text_corpus,tolower)
  clean=tm_map(clean,removeNumbers)
  
  clean=tm_map(clean,removePunctuation)
  clean=tm_map(clean,stripWhitespace)
  clean=tm_map(clean,stemDocument)
  dtm=DocumentTermMatrix(clean)
  spdtm = removeSparseTerms(dtm, 0.95)
  textd = as.data.frame(as.matrix(spdtm))
  colnames(textd) = make.names(colnames(textd))
  textd$spam = df$v1
  textd$spam = as.factor(textd$spam)
  return(textd)
}