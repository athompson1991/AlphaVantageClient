context("Utilities")

test_that("Argument validation works", {
  good_list <- list(dog = "lucy", cat = "felix", bird = "charlie parker")
  expect_true(all(validateArguments(good_list, list(dog = "lucy", cat = "felix"))))
  expect_error(validateArguments(good_list, list(hello = "world")),
               "Arguments are missing from valid list: hello$")
  expect_error(validateArguments(good_list, list("world")), "Invalid arguments. Lists must be named")
  expect_error(validateArguments(good_list, c(hello = "world")), 
               regexp = "Invalid arguments. Both the args to be checked and the valid args to check against must be of class list")
})

