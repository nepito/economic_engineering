describe("Get version of the module", {
  it("The version is 0.1.0", {
    expected_version <- c("0.1.0")
    obtained_version <- packageVersion("EconEngy")
    version_are_equal <- expected_version == obtained_version
    expect_true(version_are_equal)
  })
})

describe("return_one is loaded", {
  it("return 1", {
    expected <- 1
    obtained <- return_one()
    expect_equal(expected, obtained)
  })
})

describe("Ejemplo 7.1", {
  it("Sobre la cantidad inicial pagando $350 anual", {
    obtained_saldo <- get_saldos(350)
    pagaste_de_mas <- obtained_saldo < 0
    expect_true(pagaste_de_mas)
  })
  it("Sobre la cantidad sin pagar intereses pagando $250 anual", {
    obtained_saldo <- get_saldos(250)
    pagaste_de_menos <- obtained_saldo > 0
    expect_true(pagaste_de_menos)
  })
  it("Sobre la cantidad sin pagar intereses pagando $315.47 anual", {
    obtained_saldo <- get_saldos(315.47)
    expect_equal(obtained_saldo, 0, tolerance = 1e-2)
  })
})

describe("Bisection", {
  it("With positive output", {
    expected_intervalue <- c(0, 50)
    obtained_intervalue <- update_interval()
    expect_equal(expected_intervalue, obtained_intervalue)
  })
})
