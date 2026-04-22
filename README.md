# RTL-to-GDS-Implementation-of-Low-Power-Configurable-Multi-Clock-Digital-System
# UART-Based ALU & Register File Control System  
## Digital IC Design Project  

## 📌 Project Overview  
This repository contains the complete RTL-to-GDSII flow for a **UART-controlled system** that performs ALU and Register File operations. The design features dual-clock domains, clock gating, asynchronous FIFO, and full DFT insertion with scan chains.  

The system receives commands via UART, executes arithmetic/logic operations or register read/writes, and transmits results back – verified through synthesis, timing analysis, and formality.  

---

## 🛠️ Project Phases  

### Phase 0 – System Architecture  
- Defined dual-clock architecture:  
  - `REF_CLK` (50 MHz) for system logic, ALU, and register file  
  - `UART_CLK` (3.6864 MHz) for UART TX/RX and clock divider  
- Designed 10 sub-blocks: RegFile, ALU, Clock Gating, SYS_CTRL, Clock Dividers, UART_TX, UART_RX, Pulse Generator, Reset Synchronizer, Data Synchronizer, Async FIFO.  
- Created register map (0x0–0x3 for config, 0x4–0x15 for user space).  

<img width="971" height="583" alt="image" src="https://github.com/user-attachments/assets/1e55dfd3-dad4-4b2d-8406-8cc6e6dea6c3" />


---

### Phase 1 – RTL Design  
- Implemented all modules in **Verilog** with parameterized widths.  
- ALU supports 14 operations: ADD, SUB, MUL, DIV, AND, OR, NAND, NOR, XOR, XNOR, equality, greater-than, shift left/right.  
- UART configurable parity (enable/type) and prescale via REG2.  
- Clock divider always enabled (REG3 sets division ratio).  
- Added reset synchronizers and data synchronizer for CDC.  


---

### Phase 2 – RTL Verification  
- Built a **directed testbench** to simulate all commands:  
  - Register File write/read (addresses 0x0–0x15)  
  - ALU operations using REG0 and REG1  
  - UART frame reception/transmission  
- Verified asynchronous FIFO and pulse generator functionality.  
- Compared internal signals against expected behavior.  


---

### Phase 3 – Synthesis & Timing Constraints  
- **Synthesized** using Synopsys Design Compiler with `cons.tcl` constraints:  
  - Master clocks: 50 MHz (REF_CLK), 3.6864 MHz (UART_CLK)  
  - Generated clocks: ALU_CLK, RX_CLK, TX_CLK (div_ratio=32)  
  - Clock uncertainty: 0.2 ns setup, 0.1 ns hold  
  - Input/output delays: 20% of clock period  
  - Output load 0.1 pF, buffer cells on inputs  
- No errors, latches, or loops; setup/hold timing met.  


---

### Phase 4 – DFT Insertion  
- Added scan ports: `SI[2:0]`, `SE`, `SO[2:0]` (3 scan chains).  
- Inserted muxes on clock and reset ports.  
- Updated constraints with `SCAN_CLK`, scan groups, and `set_case_analysis 1 [get_port test_mode]`.  
- Pre-DFT and post-DFT design rule checking passed.  
- **DFT coverage > 98%**.  

<img width="800" alt="DFT Coverage" src="images/dft_coverage.png">  

---

### Phase 5 – Formality & Equivalence Checking  
- Ran formality **post-synthesis** – no failing points.  
- Ran formality **post-DFT** – scan-inserted netlist matched.  

---
