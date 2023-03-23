cmake_minimum_required (VERSION 3.16)

project(OpenMP)

include(cmake/CPM.cmake)

# include(CTest)

# CPMAddPackage(
#   NAME GTest
#   GITHUB_REPOSITORY google/googletest
#   GIT_TAG release-1.11.0
#   EXCLUDE_FROM_ALL ON
# )
# include(GoogleTest)

CPMAddPackage(
  NAME xtl
  GITHUB_REPOSITORY xtensor-stack/xtl
  GIT_TAG 0.7.5
  VERSION 0.7.5
)

CPMAddPackage(
  NAME xtensor
  GITHUB_REPOSITORY xtensor-stack/xtensor
  GIT_TAG 0.24.5
  VERSION 0.24.5
)

add_executable(test_integration test_integration.cxx)
