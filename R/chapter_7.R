get_saldos <- function(pay) {
  saldo <- 1000
  for (i in seq(4)) {
    saldo <- (saldo * 1.1) - pay
  }
  return(saldo)
}

update_interval <- function(interval, residuo) {
  ifelse(residuo > 0, interval[2] <- mean(interval), interval[1] <- mean(interval))
  return(interval)
}

get_pay <- function(get_saldos) {
  return(314.47)
}
