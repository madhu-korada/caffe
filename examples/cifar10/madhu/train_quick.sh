#!/usr/bin/env sh
set -e

TOOLS=./build/tools

$TOOLS/caffe train \
    --solver=examples/cifar10/madhu/cifar10_solver_quick.prototxt $@

# reduce learning rate by factor of 10
$TOOLS/caffe train \
    --solver=examples/cifar10/madhu/cifar10_solver_lr1_quick.prototxt \
    --snapshot=examples/cifar10/madhu/cifar10_full_iter_60000.solverstate $@


