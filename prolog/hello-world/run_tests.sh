#!/bin/bash
swipl -f hello_world.pl -s hello_world_tests.plt -g run_tests,halt -t 'halt(1)'
