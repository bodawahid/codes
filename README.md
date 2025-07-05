# Embedded System Control Program (PIC Microcontroller)

This repository contains an embedded C program for controlling hardware via a PIC microcontroller. It uses interrupt-driven logic and port manipulation to handle input/output control, sequencing operations, and LED or device timing through `PORTA`, `PORTB`, `PORTC`, and `PORTD`.

## 🧠 Overview

The program:
- Monitors button presses on `PORTB.B0` and `PORTB.B5`.
- Triggers an interrupt when `PORTB.B0` is pressed.
- Depending on the status of `PORTC` pins (`C0`, `C1`, `C5`, `C6`), it executes one of two sequences.
- Uses two timers (count_units and count_tenth) with delays to simulate countdown or operational sequences.
- Controls outputs on `PORTA` and `PORTC` to trigger LEDs or relays in a specific order.

## 📟 Hardware Requirements

- PIC Microcontroller (e.g., PIC16F877A or similar)
- Input buttons connected to `PORTB.B0` and `PORTB.B5`
- LEDs or output devices connected to `PORTA`, `PORTC`, and `PORTD`
- Interrupt configuration enabled for `PORTB.B0`

## ⚙️ Pin Configuration

| Port   | Pin(s) Used | Description                   |
|--------|-------------|-------------------------------|
| PORTA  | RA0, RA1     | Output Control                |
| PORTB  | RB0, RB5     | Input Buttons (Interrupts)    |
| PORTC  | All          | LED/Relay Pattern Control     |
| PORTD  | All          | Countdown Display             |

## 🧾 Features

- **Interrupt-Driven Logic:** Uses `INTF_BIT` to detect button presses.
- **Conditional Sequences:** Two unique logic paths based on pin states.
- **Countdown Timer:** Displays 3-to-0 or 35-to-0 countdown via `PORTD`.
- **Dynamic LED Patterns:** Changes LED patterns based on active logic.
- **Efficient Timing:** Controlled using `delay_ms(500)` for visible transitions.

## 🚀 How It Works

1. **Interrupt Handler:**
   - Triggered by `PORTB.B0`.
   - Checks if `PORTB.B5` is high.
   - Depending on conditions in `PORTC`, it initiates a sequence, manipulates LEDs, and counts down.

2. **Main Loop:**
   - Executes alternating sequences based on `flag` status.
   - Updates `PORTD` to reflect current countdown.
   - Resets or switches states based on flag and button inputs.

## 🧑‍💻 Code Snippet (Main Loop Structure)

```c
if(flag == 0 || flag == 2) {
    // First sequence logic
} else if(flag == 1 || flag == 3) {
    // Second sequence logic
}

