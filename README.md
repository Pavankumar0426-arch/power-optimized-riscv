# ⚡ Power-Optimized 3-Stage Pipelined RISC-V Processor

This project is a complete design and implementation of a **3-stage pipelined RISC-V processor** in Verilog HDL, optimized for energy-efficient computing.
The design integrates **enable control, latch-based clock gating, and data gating** to minimize dynamic power consumption while preserving throughput—making it highly suitable for **low-power IoT and embedded applications**.

---

## 🚀 Key Features

* **3-Stage Pipeline:** Instruction Fetch, Decode, Execute.
* **Power Optimization Techniques:**

  * Enable Control
  * Latch-Based Clock Gating
  * Data Gating
* **Energy Efficiency:** Reduced dynamic power from **0.71 W → 0.03 W**.
* **Implementation:** Designed in Verilog HDL, verified via simulation, and tested on FPGA.

---

## 🏗️ Architecture Overview

* **Top-Level (pipeline.v):** Integrates all processor stages.
* **Instruction Memory & Fetch Unit:** Supplies instructions to the pipeline.
* **Instruction Decoder:** Decodes RISC-V instructions for execution.
* **Execute Unit:** Performs ALU operations and branching.
* **Clock Gating Module:** Applies enable-control and latch-based gating.
* **Pipeline Registers:** Preserve state across stages with power-aware design.

---

## ⚡ Power Optimization Results

| Design Version                         | Dynamic Power |
| -------------------------------------- | ------------- |
| 3-Stage RISC-V (Baseline)              | 0.71 W        |
| 3-Stage RISC-V Pipelined               | 0.63 W        |
| Pipeline with Enable Control           | 0.13 W        |
| Pipeline with Latch-Based Clock Gating | 0.10 W        |
| Pipeline with Data Gating              | 0.03 W        |

---

## 📁 Project Structure

```
power-optimized-riscv/
├── src/
│   ├── clock_gating.v
│   ├── instruction_memory.v
│   ├── instruction_fetch.v
│   ├── instruction_decoder.v
│   ├── execute.v
│   └── pipeline.v
├── test/
│   └── testbench.v
└── README.md
```

---

## 🛠 Tools Used

* **EDA Playground** – Simulation & Verification
* **Xilinx Vivado** – FPGA Synthesis & Power Analysis
* **Verilog HDL** – Hardware Description Language

---

## 🧪 Verification

The provided testbench validates:

* Correct pipeline execution
* Functional correctness of enable-control & clock gating
* Power reduction efficiency
* 
---

## 👨‍💻 Authors

* M. Pavan Kumar
* P. V. Satya Bala
* M. Sai Likhith
* M. Divya Teja

📜 License: MIT License – Free to use and modify for educational or research purposes.
