get_saldos <- function(pay) {
  saldo <- 1000
  for (i in seq(4)) {
    saldo <- (saldo * 1.1) - pay
  }
  return(saldo)
}