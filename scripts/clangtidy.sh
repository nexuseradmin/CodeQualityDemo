#!/bin/bash
mkdir -p reports
clang-tidy src/*.c -p build > reports/clangtidy.txt
