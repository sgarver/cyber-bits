# Nmap

```bash
nmap -sV $TARGET                        # service version scan
nmap -sS $TARGET                        # stealth scan (syn)
nmap -sn $TARGET                        # disable port scan
nmap -Sc $TARGET                        # scan using default script
nmap -p1-9999 $TARGET                   # scan port range
nmap -p- --min-rate 1000 -sV $TARGET    # all ports, faster and service version
```

