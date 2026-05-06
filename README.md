# Stack Memory (LIFO) Design using Verilog

## 📌 Project Description
This project implements a Stack Memory based on the Last-In-First-Out (LIFO) principle using Verilog Hardware Description Language (HDL).

The design supports push and pop operations and is verified through simulation using a testbench and GtkWave.

---

## 🧠 Features

- Push operation (insert data into stack)
- Pop operation (remove last inserted data)
- Full and Empty detection
- Stack Pointer (SP) management
- Peek (top) feature → observe top element without removing it
- Overflow and Underflow prevention using control conditions

---

## 🏗️ Design Details

- Stack Depth: 8 elements
- Data Width: 8 bits
- Synchronous design (clock-based)
- Stack Pointer (SP) tracks the number of elements

---

## ⚙️ Inputs and Outputs

### Inputs:
- `clk` → Clock signal  
- `reset` → Reset stack  
- `push` → Insert data  
- `pop` → Remove data  
- `data_in` → Input data  

### Outputs:
- `data_out` → Output data  
- `full` → Stack is full  
- `empty` → Stack is empty  
- `top` → Peek (top element without removal)  

---

## 🧪 Testbench

The testbench verifies the stack behavior with the following operations:
Push 10
Push 20
Push 30
Pop → 30
Pop → 20
Push 40
Pop → 40
Pop → 10

---

## 📊 Simulation

Simulation is performed using Icarus Verilog and GtkWave.

### Steps:
```bash
iverilog -o stack_sim stack_memory.v stack_memory_tb.v
vvp stack_sim
gtkwave stack_memory.vcd
