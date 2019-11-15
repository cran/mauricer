## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ------------------------------------------------------------------------
library(mauricer)
library(testthat)

## ------------------------------------------------------------------------
if (beastier::is_beast2_installed()) {
  beast2_packages <- get_beast2_pkg_names() 
  knitr::kable(head(beast2_packages))
}

## ------------------------------------------------------------------------
if (beastier::is_beast2_installed()) {
  first_absent_package_name <- beast2_packages[ 
    beast2_packages$installed_version == "NA", 
  ]$name[1]
  print(first_absent_package_name)
}

## ------------------------------------------------------------------------
if (beastier::is_beast2_installed()) {
  expect_false(is_beast2_pkg_installed(first_absent_package_name))
}

## ------------------------------------------------------------------------
if (beastier::is_beast2_installed()) {
  install_beast2_pkg(first_absent_package_name)
}

## ------------------------------------------------------------------------
if (beastier::is_beast2_installed()) {
  beast2_packages <- get_beast2_pkg_names() 
  new_first_absent_package_name <- beast2_packages[ 
   beast2_packages$installed_version == "NA", 
  ]$name[1]
  expect_true(new_first_absent_package_name != first_absent_package_name)
}

## ------------------------------------------------------------------------
if (beastier::is_beast2_installed()) {
  uninstall_beast2_pkg(first_absent_package_name)
}

## ------------------------------------------------------------------------
if (beastier::is_beast2_installed()) {
  beast2_packages <- get_beast2_pkg_names() 
  last_first_absent_package_name <- beast2_packages[ 
   beast2_packages$installed_version == "NA", 
  ]$name[1]
  expect_equal(last_first_absent_package_name, first_absent_package_name)
}

