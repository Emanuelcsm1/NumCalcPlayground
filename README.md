
# NumCalcPlayground: Numerical Methods Implemented in Octave

**NumCalcPlayground** is a collection of numerical methods implemented in Octave, developed as part of academic studies in Numerical Analysis. The repository demonstrates a range of algorithms used for solving mathematical and computational problems, with a focus on clarity, structure, and practical application.

This repository aims to:
- Provide well-documented implementations of key numerical methods.
- Serve as a resource for students, researchers, and professionals working with numerical computations.
- Demonstrate problem-solving approaches relevant to engineering and applied mathematics.

---

## Key Features

### Root-Finding Algorithms
- **Bisection Method**: A reliable iterative technique for finding roots.
- **Newton-Raphson Method**: A faster alternative leveraging derivatives.
- **Secant Method**: A derivative-free iterative root-finding method.

### Linear Systems
- **Gaussian Elimination**: Direct method for solving systems of equations.
- **LU Decomposition**: Efficient for solving multiple systems with the same coefficient matrix.
- **Iterative Methods**: Jacobi and Gauss-Seidel methods for large systems.

### Interpolation and Approximation
- **Lagrange Polynomial**: Polynomial interpolation using Lagrange coefficients.
- **Newton’s Divided Differences**: Efficient interpolation for non-equally spaced data.

### Numerical Integration
- **Trapezoidal Rule**: Approximating definite integrals using trapezoids.
- **Simpson’s Rule**: A higher-order approximation technique.

### Optimization Techniques
- **Gradient Descent**: Iterative optimization for minimizing functions.
- **Simplex Method**: A linear programming approach for constrained optimization.

---

## Getting Started

### Prerequisites
Ensure you have **GNU Octave** installed on your system. Octave is an open-source alternative to MATLAB, designed for numerical computation.

Download Octave: [https://www.gnu.org/software/octave/](https://www.gnu.org/software/octave/)

### Cloning the Repository
Clone this repository to your local machine:
```bash
git clone https://github.com/your-username/NumCalcPlayground.git
cd NumCalcPlayground
```

### Running Scripts
To execute any script, navigate to the desired folder and run it in Octave:
```bash
octave script_name.m
```

---

## Repository Structure

```
|-- README.md                 # Project description and instructions
|-- LICENSE                   # License for the project
|-- docs/                     # Supporting documentation
|   |-- images/               # Visual resources (diagrams, charts)
|-- src/                      # Source code organized by category
|   |-- root_finding/         # Root-finding algorithms
|   |-- linear_systems/       # Linear system solvers
|   |-- interpolation/        # Interpolation techniques
|   |-- integration/          # Integration methods
|   |-- optimization/         # Optimization techniques
|-- examples/                 # Example applications and use cases
|-- tests/                    # Validation and test scripts
```

---

## Documentation

Each algorithm is accompanied by:
- **Method Description**: A brief overview of the algorithm.
- **Mathematical Background**: Key equations and theoretical details.
- **Code Explanation**: A step-by-step guide to understanding the implementation.

Detailed documentation can be found in the `docs/` folder.

---

## Examples

The `examples/` directory includes practical applications of numerical methods, such as:
- Finding the roots of complex equations.
- Solving real-world systems of linear equations.
- Estimating integrals and optimizing objective functions.

These examples demonstrate how the algorithms can be applied in engineering and science contexts.

---

## License

This project is licensed under the [MIT License](LICENSE). You are free to use, modify, and distribute the code with proper attribution.

---

## About

This repository reflects my academic exploration of numerical methods during my undergraduate studies in Electrical Engineering. It serves as both a personal learning resource and a tool for others looking to deepen their understanding of numerical computation.

---

## Contact

Feel free to reach out for collaboration, feedback, or questions:

- **GitHub**: [https://github.com/your-username](https://github.com/your-username)
- **LinkedIn**: [https://linkedin.com/in/your-profile](https://linkedin.com/in/your-profile)

---
