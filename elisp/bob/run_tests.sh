#!/bin/bash
emacs -batch -l ert -l bob-test.el -f ert-run-tests-batch-and-exit
