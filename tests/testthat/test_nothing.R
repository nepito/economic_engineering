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
    expected_saldo <- 14000
    obtained_saldo <- get_saldos()
    pagaste_de_mas <- obtained_saldo < 0
    expect_true(pagaste_de_mas)
  })
})