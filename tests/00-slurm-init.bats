#!/bin/npx bats

load "node_modules/bats-support/load.bash"
load "node_modules/bats-assert/load.bash"


myjuju () {
  command juju "$@"
  command juju-wait -t 540 -m $JUJU_MODEL
}


@test "test sinfo succeeds" {
  command juju run "/snap/bin/sinfo" -m $JUJU_MODEL --unit slurm-configurator/0
}

# @test "add a unit of slurmd" {
#   myjuju add-unit slurmd -m $JUJU_MODEL
# }