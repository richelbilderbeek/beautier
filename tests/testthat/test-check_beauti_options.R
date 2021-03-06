context("test-check_beauti_options")

test_that("use", {
  expect_silent(check_beauti_options(create_beauti_options()))

  # required can be both empty and a string
  expect_silent(
    check_beauti_options(
      create_beauti_options(
        required = ""
    )
  )
)
  expect_silent(
    check_beauti_options(
      create_beauti_options(
        required = "valid input"
    )
  )
)

  # Must stop on nonsense
  expect_error(check_beauti_options(beauti_options = "nonsense"))
  expect_error(check_beauti_options(beauti_options = NULL))
  expect_error(check_beauti_options(beauti_options = NA))
})

test_that("in-depth use", {

  good_beauti_options <- create_beauti_options()

  # OK
  expect_silent(
    check_beauti_options(
      good_beauti_options
    )
  )

  # Wrong parameter names
  beauti_options <- good_beauti_options
  beauti_options$capitalize_first_char_id <- NULL
  expect_error(
    check_beauti_options(
      beauti_options
    ),
    "'capitalize_first_char_id' must be an element of an 'beauti_options'"
  )

  beauti_options <- good_beauti_options
  beauti_options$nucleotides_uppercase <- NULL
  expect_error(
    check_beauti_options(
      beauti_options
    ),
    "'nucleotides_uppercase' must be an element of an 'beauti_options'"
  )

  beauti_options <- good_beauti_options
  beauti_options$beast2_version <- NULL
  expect_error(
    check_beauti_options(beauti_options),
    "'beast2_version' must be an element of an 'beauti_options'"
  )

  beauti_options <- good_beauti_options
  beauti_options$required <- NULL
  expect_error(
    check_beauti_options(beauti_options),
    "'required' must be an element of an 'beauti_options'"
  )

  beauti_options <- good_beauti_options
  beauti_options$sequence_indent <- NULL
  expect_error(
    check_beauti_options(beauti_options),
    "'sequence_indent' must be an element of an 'beauti_options'"
  )


  # Wrong parameter values
  # capitalize_first_char_id
  expect_error(
    check_beauti_options(
      create_beauti_options(capitalize_first_char_id = "nonsense")
    ),
    "'capitalize_first_char_id' must be one boolean"
  )
  expect_error(
    check_beauti_options(
      create_beauti_options(capitalize_first_char_id = NA)
    ),
    "'capitalize_first_char_id' must be one boolean"
  )

  # nucleotides_uppercase
  expect_error(
    check_beauti_options(
      create_beauti_options(nucleotides_uppercase = "nonsense")
    ),
    "'nucleotides_uppercase' must be one boolean"
  )
  expect_error(
    check_beauti_options(
      create_beauti_options(nucleotides_uppercase = NA)
    ),
    "'nucleotides_uppercase' must be one boolean"
  )

  # beast2_version
  expect_error(
    check_beauti_options(
      create_beauti_options(beast2_version = c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10))
    ),
    "beauti_options\\$beast2_version is not of class 'character'"
  )
  expect_error(
    check_beauti_options(
      create_beauti_options(beast2_version = NA)
    ),
    "beauti_options\\$beast2_version is not of class 'character'"
  )

  # beast2_version
  expect_error(
    check_beauti_options(
      create_beauti_options(required = c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10))
    ),
    "beauti_options\\$required is not of class 'character'"
  )
  expect_error(
    check_beauti_options(
      create_beauti_options(required = NA)
    ),
    "beauti_options\\$required is not of class 'character'"
  )

  # sequence_indent
  expect_error(
    check_beauti_options(
      create_beauti_options(sequence_indent = "nonsense")
    ),
    "'sequence_indent' must be one number"
  )
  expect_error(
    check_beauti_options(
      create_beauti_options(sequence_indent = NA)
    ),
    "'sequence_indent' must be one number"
  )
})
