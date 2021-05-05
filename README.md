# PDDL
Planning Domain Definition Language for Lightup Puzzle using FD Stripped. 
## Description

This game is based on a 2D grid consisting of black and white cells. White cells
can be lit up by placing light bulbs on the grid.
Placing a light bulb at some coordinate hx; yi lights up all white cells of the same column (x), and all white cells of the same row
(y), such that no black cell lies in between hx; yi and the cell, i.e., light propagation is
stopped by black cells. 
A light bulb may only be placed in a cell that is not lighted up
by another light bulb, yet. Some black cells are associated with numbers. This number
gives the number of light bulbs that must be placed directly (horizontally or vertically)
adjacent to the black cell. For example, if the number is 0, no light bulb may be placed in
a cell adjacent to the black cell. If 1, exactly one light bulb may (and must) be placed to
a cell adjacent to the black cell. The goal is to light up all white cells while adhering to
the aforementioned constraints.

## How to run
The problem instances can be run against the domain file in http://editor.planning.domains/ to generate the output plan.
Another way is to run with varoius search like blind search using https://github.com/francos3/fd-stripped, follow the read me instructions and execute the files, it has several search algorithms that can be used to compare efficiency. 
