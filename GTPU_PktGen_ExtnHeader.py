from scapy.contrib.gtp import (
        GTP_U_Header,
        GTPPDUSessionContainer)
from scapy.all import *

sendp(Ether()/IP(src="192.168.50.100", dst="192.168.50.200")/UDP(sport=2152,dport=2152)/GTP_U_Header(teid=100,next_ex=133)/GTPPDUSessionContainer(type=1, QFI=6)/IP(src="192.168.128.79", dst="8.8.8.8")/TCP(sport=5001,dport=53),iface="veth0", count=5)

