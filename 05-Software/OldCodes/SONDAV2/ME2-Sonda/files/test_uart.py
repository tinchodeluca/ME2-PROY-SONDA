'''
Created on 26 jul. 2024

@author: mdelu
'''
import serial
import time
import threading
import sys
import serial.tools.list_ports

def list_uart_ports():
    """
    List all available UART (serial) ports on the system.
    
    Returns:
    A list of tuples, each containing (port, description, hardware_id)
    """
    ports = list(serial.tools.list_ports.comports())
    
    if not ports:
        print("No UART ports found.")
        return []

    print("Available UART ports:")
    for port, desc, hwid in sorted(ports):
        print(f"- {port}: {desc} [{hwid}]")

    return ports


def read_uart(ser, uart_name):
    while True:
        if ser.in_waiting:
            data = ser.read(ser.in_waiting)
            print(f"{uart_name} received: {data}")

def main():
    
    available_ports = list_uart_ports()
    
    if available_ports:
        print(f"\nTotal UART ports found: {len(available_ports)}")
    else:
        print("No UART ports available on this system.")
    
    # Replace these with your actual COM port numbers and baud rate
    uart1 = serial.Serial('COM13', 115200, timeout=1)
    uart2 = serial.Serial('COM14', 115200, timeout=1)

    # Start reading threads
    threading.Thread(target=read_uart, args=(uart1, "UART1"), daemon=True).start()
    threading.Thread(target=read_uart, args=(uart2, "UART2"), daemon=True).start()

    while True:
        command = input("Enter command (1: send to UART1, 2: send to UART2, 3: send to both, q: quit): ")
        if command == 'q':
            break
        elif command in ['1', '2', '3']:
            data = input("Enter data to send: ").encode()
            if command in ['1', '3']:
                uart1.write(data)
            if command in ['2', '3']:
                uart2.write(data)
        else:
            print("Invalid command")

    uart1.close()
    uart2.close()

if __name__ == "__main__":
    main()