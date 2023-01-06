/ip firewall nat
add action=dst-nat chain=dstnat disabled=no dst-address=[X.X.X.X] dst-port=\
    [XXXX] protocol=tcp to-addresses=X.X.X.X to-ports=[XXXX]