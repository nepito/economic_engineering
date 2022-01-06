get_saldos <- function(pay) {
  saldo <- 1000
  for (i in seq(4)) {
    saldo <- (saldo * 1.1) - pay
  }
  return(saldo)
}

update_interval <- function(intervalue, residuo) {
  ifelse(residuo > 0, intervalue <- c(0, 50), intervalue <- c(50, 100))
  return(intervalue)
}
