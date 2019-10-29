#!/bin/bash
emacs -batch -l ert -l leap-test.el -f ert-run-tests-batch-and-exit
