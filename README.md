
<!-- README.md is generated from README.Rmd. Please edit that file -->

# NPV

<!-- badges: start -->
<!-- badges: end -->

NPV represents an economic concept known as net present value. The goal
of the function is to allow the user to calculate the total NPV from
consecutive yearly profits, as well as a discount rate based on the
user’s adopted methodology (i.e. conventional, intergenerational). To
learn more about net present values, you can access the website
[here](https://www.investopedia.com/terms/n/npv.asp#:~:text=Net%20present%20value%20(NPV)%20is,a%20projected%20investment%20or%20project.).

## Installation

You can install the released version of NPV from github with:

``` r
devtools::install_github("amejaes/NPV")
```

## Creating the Function

To create the function, I first started with the simple NPV calculation,
which is:

(y+1)^x

In this equation, y is the discount rate and x represents the yearly
profit.

Next, I knew that I needed to include a loop, so that we could calculate
the NPV over multiple years. To do so, I decided to employ the purrr
function, map2\_dbl. Finally, I used sum() to determine the total NPV,
regardless of the number of years of data that are calculated.

``` r
NPV <- function(x, y) {
  if(length(y) > 1) {
    stop('I am so sorry, but this function only works when the number of elements in y is 1.')
  }
  sum(purrr::map2_dbl(x, y, ~(.y+1)^.x))
}
```

In addition, the if statement was included to prevent the user from
trying to input more than one element as the discount rate.

## Inputs

Below are the inputs that the NPV function requires:

-   `x`: A numeric vector that may consist of one or more elements. This
    input represents the yearly profits in a consecutive fashion.
-   `y`: A numeric vector that only consists of one elements. This input
    represents the discount rate and generally is a value between 0
    and 1.

## Example

Here is a basic example which shows you how to calculate the NPV if you
have yearly profits of 1500, 2200, and 1800, respectively, and you would
like to use a conventional discount rate of 5.8%:

``` r
library(NPV)
NPV(c(1500, 2200, 1800), 0.058)
#> [1] 7.387014e+53
```

Please see the vignette for additional examples.

## Creating the Package

1.  To create the package, I loaded devtools() before using
    create\_package(“\~/Desktop/NPV”) to create a package for my
    function locally.

2.  use\_git() was run and the files were committed to activate the Git
    pane.

3.  While DESCRIPTION and NAMESPACE are both created with
    create\_package(), the function’s R document was created using
    use\_r(“NPV”), and the README and vignette files were created and
    built using use\_readme\_rmd(), build\_readme(),
    use\_vignette(“Calculating\_NPVs”), and build\_vignettes(). Both the
    README file and the vignette were manually configured and written.

4.  The DESCRIPTION was filled in manually as well as using devtools,
    such as use\_mit\_license(“Annie Mejaes”) and
    use\_packages(“purrr”).

5.  To run tests, I used use\_testthat() followed by use\_test(“NPV”) to
    create a test file for my function.Then, I manually created the
    tests.
