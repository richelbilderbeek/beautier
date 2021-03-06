context("are_init_clock_models")

test_that("use", {
  expect_false(are_init_clock_models("nonsense"))
})


test_that("detect initialized RLN clock models", {

  init_rln_models <- list(
    create_rln_clock_model(
      mean_rate_prior_distr = create_uniform_distr(id = 1),
      ucldstdev_distr = create_uniform_distr(id = 2),
      mparam_id = 1,
      dimension = 10
    )
  )
  expect_true(
    are_init_clock_models(init_rln_models)
  )
})


test_that("detect uninitialized RLN clock models", {

  uninit_rln_models <- list(
    create_rln_clock_model(
      ucldstdev_distr = create_uniform_distr(id = NA)
    )
  )

  expect_false(
    are_init_clock_models(uninit_rln_models)
  )

})
