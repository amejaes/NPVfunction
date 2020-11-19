test_that("Basic testing", {
  expect_equal(NPV(1:10, 1), 2046)
  expect_equal(NPV(1:2, 0.05), (1+0.05)^1 + (1+0.05)^2)
  expect_error(NPV(1:10, 1:2), 'I am so sorry, but this function only works when the number of elements in y is 1.')
})
