#!/bin/bash
emacs -batch -l ert -l anagram-test.el -f ert-run-tests-batch-and-exit
