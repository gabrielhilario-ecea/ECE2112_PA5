% ECE 2112 - Advanced Computer Programming and Algorithms
% Experiment 5: Introduction to MATLAB Programming
% File Name: HILARIO_PA5.m
% Name: HILARIO, Gabriel
% Section: 2ECE-A
% Date Submitted: 10/27/2026

clc;
clear;

%% PROBLEM A: TRANSPOSE OPERATIONS
disp('PROBLEM A: TRANSPOSE OPERATIONS')

R = [5 -2 0 7; 1 3 -4 2; 6 0 8 -1]
Z = [2+3i -1+4i 5-2i; -3+i 6 2+5i]

% Transpose operations for real matrix R
disp('transpose(R):')
disp(transpose(R))

disp('R'':')
disp(R')

disp('R.'':')
disp(R.')

% Transpose operations for complex matrix Z
disp('transpose(Z):')
disp(transpose(Z))

disp('Z'':')
disp(Z')

disp('Z.'':')
disp(Z.')

% Answers to Problem A Questions:
% a. Which operations give identical results for the real matrix R?
%    All three operations — transpose(R), R', and R.' — give identical
%    results for the real matrix R because its entries have no imaginary part.
%
% b. Which two operations give identical results for the complex matrix Z?
%    transpose(Z) and Z.' give identical results for the complex matrix Z,
%    as both perform a non-conjugate transpose (swapping rows and columns only).
%
% c. What additional operation is performed by the apostrophe operator '
%    when the matrix contains complex entries?
%    In addition to transposing rows and columns, the apostrophe operator '
%    takes the complex conjugate of each entry (negating the imaginary parts).

%% PROBLEM B: TWO METHODS FOR A LINEAR SYSTEM
disp('PROBLEM B: TWO METHODS FOR A LINEAR SYSTEM')

matrixA = [2 -1 3 2; 1 4 -2 1; 3 2 1 -1; -2 3 4 2]
A = matrixA; % Alias as A to match handout variable name
b = [16; -7; 6; 7]

% 1. Inverse Method
x_inv = inv(matrixA) * b

% 2. Cramer's Rule
det_A = det(matrixA)

A1 = matrixA;
A1(:,1) = b;

A2 = matrixA;
A2(:,2) = b;

A3 = matrixA;
A3(:,3) = b;

A4 = matrixA;
A4(:,4) = b;

x_cramer = [det(A1)/det_A; det(A2)/det_A; det(A3)/det_A; det(A4)/det_A]

% Required Numerical Checks
disp('norm(x_inv - x_cramer):')
disp(norm(x_inv - x_cramer))

disp('norm(A * x_inv - b):')
disp(norm(A * x_inv - b))
