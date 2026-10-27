# PA5: Introduction to MATLAB 🧮

**ECE 2112 — Advanced Computer Programming and Algorithms**

| Student | Section | Date submitted |
| :--- | :---: | :---: |
| Gabriel Hilario | 2ECE-A | October 27, 2026 |

## Overview

This repository contains the MATLAB script and documentation for **Programming Assignment 5: Introduction to MATLAB**. The activity explores how MATLAB handles real and complex matrices, compares three transpose operations, and solves a system of four linear equations using the inverse method and Cramer's rule.

Each problem includes its MATLAB implementation, numerical results, and an explanation of the functions used.

## Objectives

The activity develops the ability to:

1. Define real and complex matrices in MATLAB.
2. Distinguish a non-conjugate transpose from a complex-conjugate transpose.
3. Represent a system of linear equations in the matrix form $Ax=b$.
4. Solve the system using the inverse method and Cramer's rule.
5. Interpret numerical checks that compare the solutions and measure the residual.

## Contents

- [Repository files](#repository-files)
- [How to run](#how-to-run)
- [Problem A: Transpose Operations](#problem-a-transpose-operations)
- [Problem B: Two Methods for a Linear System](#problem-b-two-methods-for-a-linear-system)
- [Key takeaways](#key-takeaways)
- [Version history](#version-history)

## Repository files

| File | Description |
| :--- | :--- |
| [HILARIO_PA5.m](HILARIO_PA5.m) | MATLAB script containing both problems, the answers to Problem A, and the numerical checks for Problem B. |
| [README.md](README.md) | Problem explanations, code excerpts, outputs, and instructions. |

## How to run

1. Download [HILARIO_PA5.m](HILARIO_PA5.m) and open it in MATLAB, or upload it to MATLAB Online.
2. Set MATLAB's **Current Folder** to the folder containing the script.
3. Click **Run**, or enter the following in the Command Window:

   ```matlab
   run('HILARIO_PA5.m')
   ```

4. Read the labeled results in the Command Window. The script's `%%` headings separate Problems A and B.

The script uses built-in MATLAB functions and does not require additional toolboxes. It starts with `clc` to clear the Command Window and `clear` to remove existing workspace variables.

> The code excerpts below retain the script's calculations, with matrix rows split across lines for readability. Output values are retained from the recorded assignment results; spacing is standardized. The final digits of floating-point checks may vary between computing environments.

---

## Problem A: Transpose Operations

### Problem description

Define a **3 × 4 real matrix** `R` and a **2 × 3 complex matrix** `Z`. For each matrix, compute and display:

- `transpose(...)`
- The apostrophe operator, `'`
- The dot-apostrophe operator, `.'`

Compare the results to determine when the three operations are equivalent and how complex conjugation changes the output.

### MATLAB code

```matlab
%% PROBLEM A: TRANSPOSE OPERATIONS
disp('PROBLEM A: TRANSPOSE OPERATIONS')

R = [5 -2  0  7;
     1  3 -4  2;
     6  0  8 -1]

Z = [2+3i -1+4i 5-2i;
     -3+i 6     2+5i]

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
```

### Output

```text
PROBLEM A: TRANSPOSE OPERATIONS

R =
     5    -2     0     7
     1     3    -4     2
     6     0     8    -1

Z =
     2.0000 + 3.0000i    -1.0000 + 4.0000i     5.0000 - 2.0000i
    -3.0000 + 1.0000i     6.0000 + 0.0000i     2.0000 + 5.0000i

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
     2.0000 + 3.0000i    -3.0000 + 1.0000i
    -1.0000 + 4.0000i     6.0000 + 0.0000i
     5.0000 - 2.0000i     2.0000 + 5.0000i

Z':
     2.0000 - 3.0000i    -3.0000 - 1.0000i
    -1.0000 - 4.0000i     6.0000 + 0.0000i
     5.0000 + 2.0000i     2.0000 - 5.0000i

Z.':
     2.0000 + 3.0000i    -3.0000 + 1.0000i
    -1.0000 + 4.0000i     6.0000 + 0.0000i
     5.0000 - 2.0000i     2.0000 + 5.0000i
```

The transpose of `R` has size **4 × 3**, while the transpose of `Z` has size **3 × 2**. Every operation exchanges the row and column positions; only `'` also conjugates the entries.

### Answers and discussion

**a. Which operations give identical results for the real matrix `R`?**

All three operations—`transpose(R)`, `R'`, and `R.'`—produce the same matrix. Every entry in `R` is real, so taking its complex conjugate leaves its value unchanged.

**b. Which two operations give identical results for the complex matrix `Z`?**

`transpose(Z)` and `Z.'` produce the same result. They exchange rows and columns while preserving each entry's real and imaginary parts.

**c. What additional operation does `'` perform on complex entries?**

The apostrophe operator also takes the complex conjugate of each entry, reversing the sign of its imaginary part. For example, the entry `2 + 3i` becomes `2 - 3i` in `Z'`, while it remains `2 + 3i` in `Z.'`.

### Functions and syntax used

| Function or syntax | Purpose in the script |
| :--- | :--- |
| `[ ... ; ... ]` | Creates a matrix; semicolons inside the brackets separate rows. |
| `i` | Represents the imaginary unit in the cleared workspace. |
| [`transpose(M)` and `M.'`](https://www.mathworks.com/help/matlab/ref/double.transpose.html) | Exchange rows and columns without conjugating the entries. |
| [`M'`](https://uk.mathworks.com/help/matlab/ref/double.ctranspose.html) | Exchanges rows and columns and takes the complex conjugate of each entry. |
| `disp(...)` | Displays a label or a computed matrix. |

Here, `M` represents either `R` or `Z`. In a label such as `disp('R'':')`, the doubled apostrophe inserts a literal apostrophe into the displayed text.

---

## Problem B: Two Methods for a Linear System

### Problem description

Solve the following system using the **inverse method** and **Cramer's rule**:

$$
\begin{aligned}
2x_1-x_2+3x_3+2x_4 &= 16 \\
x_1+4x_2-2x_3+x_4 &= -7 \\
3x_1+2x_2+x_3-x_4 &= 6 \\
-2x_1+3x_2+4x_3+2x_4 &= 7
\end{aligned}
$$

In the matrix form $Ax=b$, `matrixA` contains the coefficients, `b` contains the constants, and `x` contains the four unknowns. The script also assigns `A = matrixA`, so both names refer to the same coefficient values.

### MATLAB code

```matlab
%% PROBLEM B: TWO METHODS FOR A LINEAR SYSTEM
disp('PROBLEM B: TWO METHODS FOR A LINEAR SYSTEM')

matrixA = [ 2 -1  3  2;
            1  4 -2  1;
            3  2  1 -1;
           -2  3  4  2]
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
```

### Output

```text
PROBLEM B: TWO METHODS FOR A LINEAR SYSTEM

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

x_cramer =
    2.0000
   -1.0000
    3.0000
    1.0000

norm(x_inv - x_cramer):
   2.3941e-15

norm(A * x_inv - b):
   8.8818e-16
```

### How the two methods work

**1. Inverse method**

For an invertible coefficient matrix, multiplying $Ax=b$ by $A^{-1}$ gives $x=A^{-1}b$. The script implements this as `inv(matrixA) * b`.

For this system, the exact determinant is **280**, which is nonzero. Therefore, the matrix is invertible and the system has a unique solution.

**2. Cramer's rule**

Each unknown is calculated from a ratio of determinants:

$$
x_k=\frac{\det(A_k)}{\det(A)},\qquad k=1,2,3,4.
$$

The matrix $A_k$ is formed by replacing column $k$ of $A$ with `b`. For example, `A1(:,1) = b` replaces every row of the first column while preserving the other columns.

| Matrix | Column replaced by `b` | Exact determinant | Corresponding solution |
| :--- | :---: | ---: | :--- |
| `A1` | 1 | 560 | $x_1=560/280=2$ |
| `A2` | 2 | −280 | $x_2=-280/280=-1$ |
| `A3` | 3 | 840 | $x_3=840/280=3$ |
| `A4` | 4 | 280 | $x_4=280/280=1$ |

The following matrices are intermediate values used in the calculation. Their assignments end with semicolons, so the current script stores them without printing them separately.

<details>
<summary>View the four matrices used in Cramer's rule</summary>

```text
A1 =
    16    -1     3     2
    -7     4    -2     1
     6     2     1    -1
     7     3     4     2

A2 =
     2    16     3     2
     1    -7    -2     1
     3     6     1    -1
    -2     7     4     2

A3 =
     2    -1    16     2
     1     4    -7     1
     3     2     6    -1
    -2     3     7     2

A4 =
     2    -1     3    16
     1     4    -2    -7
     3     2     1     6
    -2     3     4     7
```

To display these matrices and their determinants, enter the following in the Command Window after running the script:

```matlab
disp(A1); disp(det(A1));
disp(A2); disp(det(A2));
disp(A3); disp(det(A3));
disp(A4); disp(det(A4));
```

</details>

### Numerical checks and interpretation

| Check | Recorded value | Interpretation |
| :--- | ---: | :--- |
| `norm(x_inv - x_cramer)` | `2.3941e-15` | The two computed solution vectors differ only by a very small amount. |
| `norm(A * x_inv - b)` | `8.8818e-16` | Substituting the inverse-method solution into the equations produces a residual very close to zero. |

Both checks use the [Euclidean norm](https://www.mathworks.com/help/matlab/ref/norm.html) of a vector. The first measures agreement between the two methods; the second measures how closely the computed solution satisfies the original equations. The small nonzero values are consistent with floating-point roundoff.

Both methods give the solution **$x_1=2$, $x_2=-1$, $x_3=3$, and $x_4=1$**. Substituting these exact values gives:

$$
A\begin{bmatrix}2\\-1\\3\\1\end{bmatrix}
=\begin{bmatrix}16\\-7\\6\\7\end{bmatrix}=b.
$$

### Functions and syntax used

| Function or syntax | Purpose in the script |
| :--- | :--- |
| `matrixA = [...]` | Defines the 4 × 4 coefficient matrix. |
| `b = [16; -7; 6; 7]` | Defines the 4 × 1 column vector of constants. |
| [`inv(matrixA)`](https://www.mathworks.com/help/matlab/ref/inv.html) | Computes the inverse used in the first solution method. |
| `*` | Performs matrix multiplication in `inv(matrixA) * b` and `A * x_inv`. |
| `det(...)` | Computes the determinants used in Cramer's rule. |
| `Ak(:,k) = b` | Replaces column `k` of a modified coefficient matrix with `b`; `:` selects all rows. |
| `norm(...)` | Measures the magnitude of a difference or residual vector. |
| A trailing `;` | Suppresses the display of a statement's result. |

> **MATLAB practice:** This assignment demonstrates the inverse method and Cramer's rule. For general numerical work, MathWorks recommends solving a linear system directly with `A\b` instead of explicitly computing `inv(A)*b`. See the [MathWorks guidance on matrix inversion](https://www.mathworks.com/help/matlab/ref/inv.html).

---

## Key takeaways

- A transpose changes an $m\times n$ matrix into an $n\times m$ matrix.
- For real matrices, `transpose(M)`, `M.'`, and `M'` give identical results.
- For complex matrices, `M'` also conjugates the entries; `transpose(M)` and `M.'` preserve their imaginary signs.
- The inverse method and Cramer's rule both produce $[2,-1,3,1]^T$ for the given system.
- Comparing solution vectors and checking the residual provide two different checks on the numerical results.

## Version history

| Date | Update |
| :--- | :--- |
| October 27, 2026 | Uploaded the MATLAB script and initial README. |
| October 27, 2026 | Expanded the documentation with objectives, code walkthroughs, formatted outputs, function guides, and explanations of the numerical checks. |
