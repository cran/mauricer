## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## -----------------------------------------------------------------------------
library(mauricer)
library(testthat)

## -----------------------------------------------------------------------------
if (!curl::has_internet()) {
  print("No internet connection")
}
if (!beastier::is_beast2_installed()) {
  print("No BEAST2 installed")
}

## -----------------------------------------------------------------------------
if (curl::has_internet() && beastier::is_beast2_installed()) {
  beast2_packages <- get_beast2_pkg_names()
  knitr::kable(head(beast2_packages))
}

## -----------------------------------------------------------------------------
if (curl::has_internet() && beastier::is_beast2_installed()) {
  package_name <- beast2_packages[
    beast2_packages$installed_version == "NA",
  ]$name[1]
  print(package_name)
}

