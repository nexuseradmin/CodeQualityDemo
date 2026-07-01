#!/bin/bash
mkdir -p reports
cppcheck --enable=all --inconclusive --xml --output-file=reports/cppcheck.xml src
