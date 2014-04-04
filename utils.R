matchPos.x <- function(x){
  X <- tryCatch({
    x <- as.numeric(x)
    x <- ifelse(is.na(x), "", x)
    return(x)
  },warning = function(w){
    match.arg(x,c("center", "left", "right"))
  })
  return(X)
}

matchPos.y <- function(y){
  Y <- tryCatch({
    y <- as.numeric(y)
    y <- ifelse(is.na(y), "", y)
    return(y)
  },warning = function(w){
    match.arg(y,c("bottom", "center", "top"))
  })
  return(Y)
}