# CalculatorRAMPA_ITI
This is a simple calculator project to learn and practice CMake.

## How to build
- Available features: SUM, SUB, MUL, DIV, and MOD.
### To enable all features
```bash
cmake -S . -B build -DALL=ON
```
### To disable all features
```bash
cmake -S . -B build -DALL=OFF
```
### To enable specific feature
```bash
cmake -S . -B build -DSUM=ON
```
### To disable all features
```bash
cmake -S . -B build -DSUM=OFF
```
### Build the project
```bash
cmake --build build
```
### Run the project
```bash
./build/Calc.exe
```
