#!/bin/bash
#Bash file to automate NMAP Scan
#1. Top port Scan
#2. UDP Port Scan
#3. All TCP Port Scan, extract ports and show it on screen
#4. Everything scan [Version, script, vuln scan] on all tcp ports

# Check if at least one IP address is provided
if [ "$#" -lt 1 ]; then
    echo "Usage: $0 <IP_ADDRESS_1> <IP_ADDRESS_2> ... <IP_ADDRESS_n>"
    exit 1
fi

# Loop through all provided IP addresses
for ip in "$@"; do
    echo "Starting scans for IP: $ip"

    # Output file named after the IP address
    output_file="${ip}_nmap_scan_results.txt"

    # 1. Scan top TCP ports
    echo "\n[1/4] Scanning top TCP ports for $ip..."
    nmap --top-ports 1000 -T4 --min-rate 1000 -sV -sC "$ip" | tee -a "$output_file"

    # 2. Scan common UDP ports
    echo "\n[2/4] Scanning UDP ports for $ip..."
    nmap -sU -T4 --min-rate 1000 -sV -sC "$ip" | tee -a "$output_file"

    # 3. Scan all TCP ports and extract open ports
    echo "\n[3/4] Scanning all TCP ports for $ip and extracting open ports..."
    all_tcp_results=$(nmap -T4 --min-rate 1000 -p- "$ip")
    echo "$all_tcp_results" | tee -a "$output_file"

    # Extract open TCP ports
    open_ports=$(echo "$all_tcp_results" | grep -oP '\d+/tcp\s+open' | cut -d '/' -f 1 | tr '\n' ',')
    echo "Open TCP ports for $ip: $open_ports" | tee -a "$output_file"

    # 4. Everything scan on all TCP ports
    echo "\n[4/4] Performing a detailed scan on all open TCP ports for $ip..."
    if [ -n "$open_ports" ]; then
        nmap -T4 --min-rate 1000 -sV -sC -A -p "$open_ports" "$ip" | tee -a "$output_file"
    else
        echo "No open TCP ports found to perform a detailed scan." | tee -a "$output_file"
    fi

    echo "\nScan completed for $ip. Results saved to $output_file."
    echo "------------------------------------------"
done

exit 0

