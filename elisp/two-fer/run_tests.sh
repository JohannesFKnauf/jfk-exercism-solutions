#!/bin/bash
emacs -batch -l ert -l two-fer-test.el -f ert-run-tests-batch-and-exit
