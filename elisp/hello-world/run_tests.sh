#!/bin/bash
emacs -batch -l ert -l hello-world-test.el -f ert-run-tests-batch-and-exit
