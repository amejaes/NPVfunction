# The below tests demonstrate that the NPV function works accordingly, including
#that the function outputs a numeric and only accepts one element for the second
#input, y.

test_that("Basic testing on NPV", {
  #determines whether the output is numeric
  expect_is(NPV(1:10,1), "numeric")
  #determines whether the function outputs the same number as a manual calculation
  expect_equal(NPV(1:10, 1), 2046)
  expect_equal(NPV(1:2, 0.05), (1+0.05)^1 + (1+0.05)^2)
  #determines whether the y input accepts more than one element or not
  expect_error(NPV(1:10, 1:2), 'I am so sorry, but this function only works when the number of elements in y is 1.')
})
