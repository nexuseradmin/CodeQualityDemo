#!/bin/bash
mkdir -p reports
valgrind --leak-check=full --xml=yes --xml-file=reports/valgrind.xml ./build/CodeQualityDemo || true
