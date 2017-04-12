#!/bin/bash
rm -f vcslog.txt
vcs -timescale=1ns/1ps -lca -sverilog -f files.f +v2k -full64 -debug_all | tee vcslog.txt && ./simv

