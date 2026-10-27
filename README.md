# PA5: INTRODUCTION TO MATLAB

**Course:** ECE 2112 - Advanced Computer Programming and Algorithms  
**Student Name:** HILARIO, Gabriel  
**Section:** 2ECE-A  
**Date Submitted:** 10/27/2026

## Overview
This repository contains the MATLAB script and output for **Programming Assignment 5 (PA5)** covering basic matrix operations, transpositions, and solving systems of linear equations.

## File Structure
* `HILARIO_PA5.m` - The main MATLAB script containing the code for Problems A and B.
* `README.md` - Documentation of the assignment, explanations, and outputs.

## Problems Covered

### **Problem A: Transpose Operations**
* Creation of real matrix `R` (3x4) and complex matrix `Z` (2x3).
* Execution of transpose operations using:
  1. `transpose()` function
  2. Single apostrophe operator (`'`)
  3. Dot-apostrophe operator (`.'`)

#### **Questions & Answers:**
a. **Which operations give identical results for the real matrix R?**
> All three operations – `transpose(R)`, `R'`, and `R.'` – produce identical results for the real matrix `R` because all elements are purely real.

b. **Which two operations give identical results for the complex matrix Z?**
> `transpose(Z)` and `Z.'` give identical results for the complex matrix `Z`. Both compute the non-conjugate transpose (array transpose).

c. **What additional operation is performed by the apostrophe operator (`'`) when the matrix contains complex entries?**
> The single apostrophe operator (`'`) computes the complex-conjugate transpose. In addition to swapping rows and columns, it negates the imaginary component of each complex element.

### **Problem B: Two Methods for a Linear System**
* Solving a 4x4 system of linear equations $Ax = b$ using:
  1. **Inverse Method:** `x_inv = inv(matrixA) * b`
  2. **Cramer's Rule:** `x_cramer = [det(A1)/det_A; det(A2)/det_A; det(A3)/det_A; det(A4)/det_A]`
* Numerical precision check using `norm(x_inv - x_cramer)` and `norm(matrixA * x_inv - b)`.

## MATLAB Code Output

### **PROBLEM A OUTPUT:**

```matlab
R =
     5    -2     0     7
     1     3    -4     2
     6     0     8    -1

Z =
   2.0000 + 3.0000i  -1.0000 + 4.0000i   5.0000 - 2.0000i
  -3.0000 + 1.0000i   6.0000 + 0.0000i   2.0000 + 5.0000i

transpose(R):
     5     1     6
    -2     3     0
     0    -4     8
     7     2    -1

R':
     5     1     6
    -2     3     0
     0    -4     8
     7     2    -1

R.':
     5     1     6
    -2     3     0
     0    -4     8
     7     2    -1

transpose(Z):
   2.0000 + 3.0000i  -3.0000 + 1.0000i
  -1.0000 + 4.0000i   6.0000 + 0.0000i
   5.0000 - 2.0000i   2.0000 + 5.0000i

Z':
   2.0000 - 3.0000i  -3.0000 - 1.0000i
  -1.0000 - 4.0000i   6.0000 + 0.0000i
   5.0000 + 2.0000i   2.0000 - 5.0000i

Z.':
   2.0000 + 3.0000i  -3.0000 + 1.0000i
  -1.0000 + 4.0000i   6.0000 + 0.0000i
   5.0000 - 2.0000i   2.0000 + 5.0000i
```

### **PROBLEM B OUTPUT:**

```matlab
matrixA =
     2    -1     3     2
     1     4    -2     1
     3     2     1    -1
    -2     3     4     2

b =
    16
    -7
     6
     7

x_inv =
    2.0000
   -1.0000
    3.0000
    1.0000

det_A =
   280

A1 =
    16    -1     3     2
    -7     4    -2     1
     6     2     1    -1
     7     3     4     2

det(A1) =
   560

A2 =
     2    16     3     2
     1    -7    -2     1
     3     6     1    -1
    -2     7     4     2

det(A2) =
  -280

A3 =
     2    -1    16     2
     1     4    -7     1
     3     2     6    -1
    -2     3     7     2

det(A3) =
   840

A4 =
     2    -1     3    16
     1     4    -2    -7
     3     2     1     6
    -2     3     4     7

det(A4) =
   280

x_cramer =
    2.0000
   -1.0000
    3.0000
    1.0000

norm(x_inv - x_cramer):
   2.3941e-15

norm(matrixA * x_inv - b):
   8.8818e-16
```
