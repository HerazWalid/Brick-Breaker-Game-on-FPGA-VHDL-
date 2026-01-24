# 🎮FPGA Game Console

Project for **LU3EE100 – L3 EEA Sorbonne University**, consisting of the design and implementation of a **game console on FPGA** using **VHDL** and **AMD/Xilinx Vivado**.

The project is deployed on **Digilent Basys** or **Nexys** FPGA boards and features real-time VGA graphics, user input handling, and multiple games.

---

## 📌 Project Overview

The goal of this project is to complete and enhance a partially functional FPGA-based game console by:
- Implementing missing hardware modules in **VHDL**
- Designing and simulating **finite state machines (FSMs)**
- Interfacing real hardware peripherals (VGA, rotary encoder, buttons)
- Improving graphics and gameplay features

---

## 🧠 Implemented Features

### 🎥 VGA Display
- VGA controller (640×480 @ 60 Hz)
- RGB output upgraded from **1-bit** to **4-bit per color** (12-bit total)
- Dynamic color generation using a custom **Moving Colors** module

### 🕹️ Games
- **Brick Breaker**
- **Pong**
- Game selection managed by a central game controller

### 🎛️ User Inputs
- Rotary encoder (left / right movement)
- Push button (pause / resume)
- Switches for game mode and options

### ⏸️ Game Management
- Pause mode with debounce handling
- Win / loss detection
- Visual feedback (screen color change)

---

## 🧩 Architecture

Main modules:
- `ClkDiv` – Clock divider (100 MHz → 25 MHz / 25 Hz)
- `VGA / VGA_4bits` – VGA controllers
- `Moving_Colors` – Dynamic RGB color generator
- `IP_Rotary` + `Move` – Rotary encoder handling
- `Game` – Global game controller
- `Mode` – Pause, win, and loss FSM
- `Decor` – Game environment and obstacles

---

## 🛠️ Tools & Technologies

- **Language**: VHDL
- **FPGA Tools**: AMD/Xilinx Vivado
- **Simulation**: Vivado Behavioral Simulator
- **Boards**:
  - Digilent Basys
  - Digilent Nexys A7 / Nexys4 DDR
- **Display**: VGA
- **Peripherals**: Rotary encoder, buttons, switches

---

## ▶️ How to Run

1. Open **Vivado**
2. Create a new VHDL project
3. Add all source files (`.vhd`)
4. Select the correct **Top module**:
   - `Top_Basys.vhd` or `Top_Nexys.vhd`
5. Enable the correct `.xdc` constraint file
6. Run:
   - Synthesis
   - Implementation
   - Generate Bitstream
7. Program the FPGA via **Hardware Manager**
8. Connect VGA screen and peripherals
9. Power on the board and play 🎉


