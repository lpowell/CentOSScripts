# Generated by iptables-save v1.4.21 on Tue Jan 31 15:19:11 2023
*nat
:PREROUTING ACCEPT [806488:183121300]
:INPUT ACCEPT [2672:143876]
:OUTPUT ACCEPT [826475:49932670]
:POSTROUTING ACCEPT [826475:49932670]
:OUTPUT_direct - [0:0]
:POSTROUTING_ZONES - [0:0]
:POSTROUTING_ZONES_SOURCE - [0:0]
:POSTROUTING_direct - [0:0]
:POST_public - [0:0]
:POST_public_allow - [0:0]
:POST_public_deny - [0:0]
:POST_public_log - [0:0]
:PREROUTING_ZONES - [0:0]
:PREROUTING_ZONES_SOURCE - [0:0]
:PREROUTING_direct - [0:0]
:PRE_public - [0:0]
:PRE_public_allow - [0:0]
:PRE_public_deny - [0:0]
:PRE_public_log - [0:0]
-A PREROUTING -j PREROUTING_direct
-A PREROUTING -j PREROUTING_ZONES_SOURCE
-A PREROUTING -j PREROUTING_ZONES
-A OUTPUT -j OUTPUT_direct
-A POSTROUTING -j POSTROUTING_direct
-A POSTROUTING -j POSTROUTING_ZONES_SOURCE
-A POSTROUTING -j POSTROUTING_ZONES
-A POSTROUTING_ZONES -o ens192 -g POST_public
-A POSTROUTING_ZONES -g POST_public
-A POST_public -j POST_public_log
-A POST_public -j POST_public_deny
-A POST_public -j POST_public_allow
-A PREROUTING_ZONES -i ens192 -g PRE_public
-A PREROUTING_ZONES -g PRE_public
-A PRE_public -j PRE_public_log
-A PRE_public -j PRE_public_deny
-A PRE_public -j PRE_public_allow
COMMIT
# Completed on Tue Jan 31 15:19:11 2023
# Generated by iptables-save v1.4.21 on Tue Jan 31 15:19:11 2023
*mangle
:PREROUTING ACCEPT [36526485:19863644210]
:INPUT ACCEPT [36526475:19863637304]
:FORWARD ACCEPT [0:0]
:OUTPUT ACCEPT [35451701:15254143129]
:POSTROUTING ACCEPT [35451733:15254146282]
:FORWARD_direct - [0:0]
:INPUT_direct - [0:0]
:OUTPUT_direct - [0:0]
:POSTROUTING_direct - [0:0]
:PREROUTING_ZONES - [0:0]
:PREROUTING_ZONES_SOURCE - [0:0]
:PREROUTING_direct - [0:0]
:PRE_public - [0:0]
:PRE_public_allow - [0:0]
:PRE_public_deny - [0:0]
:PRE_public_log - [0:0]
-A PREROUTING -j PREROUTING_direct
-A PREROUTING -j PREROUTING_ZONES_SOURCE
-A PREROUTING -j PREROUTING_ZONES
-A INPUT -j INPUT_direct
-A FORWARD -j FORWARD_direct
-A OUTPUT -j OUTPUT_direct
-A POSTROUTING -j POSTROUTING_direct
-A PREROUTING_ZONES -i ens192 -g PRE_public
-A PREROUTING_ZONES -g PRE_public
-A PRE_public -j PRE_public_log
-A PRE_public -j PRE_public_deny
-A PRE_public -j PRE_public_allow
COMMIT
# Completed on Tue Jan 31 15:19:11 2023
# Generated by iptables-save v1.4.21 on Tue Jan 31 15:19:11 2023
*security
:INPUT ACCEPT [153485600:74222648743]
:FORWARD ACCEPT [0:0]
:OUTPUT ACCEPT [152776901:67597670145]
:FORWARD_direct - [0:0]
:INPUT_direct - [0:0]
:OUTPUT_direct - [0:0]
-A INPUT -j INPUT_direct
-A FORWARD -j FORWARD_direct
-A OUTPUT -j OUTPUT_direct
COMMIT
# Completed on Tue Jan 31 15:19:11 2023
# Generated by iptables-save v1.4.21 on Tue Jan 31 15:19:11 2023
*raw
:PREROUTING ACCEPT [36526485:19863644210]
:OUTPUT ACCEPT [35451701:15254143129]
:OUTPUT_direct - [0:0]
:PREROUTING_ZONES - [0:0]
:PREROUTING_ZONES_SOURCE - [0:0]
:PREROUTING_direct - [0:0]
:PRE_public - [0:0]
:PRE_public_allow - [0:0]
:PRE_public_deny - [0:0]
:PRE_public_log - [0:0]
-A PREROUTING -j PREROUTING_direct
-A PREROUTING -j PREROUTING_ZONES_SOURCE
-A PREROUTING -j PREROUTING_ZONES
-A OUTPUT -j OUTPUT_direct
-A PREROUTING_ZONES -i ens192 -g PRE_public
-A PREROUTING_ZONES -g PRE_public
-A PRE_public -j PRE_public_log
-A PRE_public -j PRE_public_deny
-A PRE_public -j PRE_public_allow
COMMIT
# Completed on Tue Jan 31 15:19:11 2023
# Generated by iptables-save v1.4.21 on Tue Jan 31 15:19:11 2023
*filter
:INPUT ACCEPT [0:0]
:FORWARD ACCEPT [0:0]
:OUTPUT ACCEPT [2243887:130570553]
:FORWARD_IN_ZONES - [0:0]
:FORWARD_IN_ZONES_SOURCE - [0:0]
:FORWARD_OUT_ZONES - [0:0]
:FORWARD_OUT_ZONES_SOURCE - [0:0]
:FORWARD_direct - [0:0]
:FWDI_public - [0:0]
:FWDI_public_allow - [0:0]
:FWDI_public_deny - [0:0]
:FWDI_public_log - [0:0]
:FWDO_public - [0:0]
:FWDO_public_allow - [0:0]
:FWDO_public_deny - [0:0]
:FWDO_public_log - [0:0]
:INPUT_ZONES - [0:0]
:INPUT_ZONES_SOURCE - [0:0]
:INPUT_direct - [0:0]
:IN_public - [0:0]
:IN_public_allow - [0:0]
:IN_public_deny - [0:0]
:IN_public_log - [0:0]
:OUTPUT_direct - [0:0]
-A INPUT -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
-A INPUT -i lo -j ACCEPT
-A INPUT -j INPUT_direct
-A INPUT -j INPUT_ZONES_SOURCE
-A INPUT -j INPUT_ZONES
-A INPUT -m conntrack --ctstate INVALID -j DROP
-A INPUT -j REJECT --reject-with icmp-host-prohibited
-A FORWARD -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
-A FORWARD -i lo -j ACCEPT
-A FORWARD -j FORWARD_direct
-A FORWARD -j FORWARD_IN_ZONES_SOURCE
-A FORWARD -j FORWARD_IN_ZONES
-A FORWARD -j FORWARD_OUT_ZONES_SOURCE
-A FORWARD -j FORWARD_OUT_ZONES
-A FORWARD -m conntrack --ctstate INVALID -j DROP
-A FORWARD -j REJECT --reject-with icmp-host-prohibited
-A OUTPUT -o lo -j ACCEPT
-A OUTPUT -j OUTPUT_direct
-A FORWARD_IN_ZONES -i ens192 -g FWDI_public
-A FORWARD_IN_ZONES -g FWDI_public
-A FORWARD_OUT_ZONES -o ens192 -g FWDO_public
-A FORWARD_OUT_ZONES -g FWDO_public
-A FWDI_public -j FWDI_public_log
-A FWDI_public -j FWDI_public_deny
-A FWDI_public -j FWDI_public_allow
-A FWDI_public -j DROP
-A FWDO_public -j FWDO_public_log
-A FWDO_public -j FWDO_public_deny
-A FWDO_public -j FWDO_public_allow
-A FWDO_public -j DROP
-A INPUT_ZONES -i ens192 -g IN_public
-A INPUT_ZONES -g IN_public
-A IN_public -j IN_public_log
-A IN_public -j IN_public_deny
-A IN_public -j IN_public_allow
-A IN_public -j DROP
-A IN_public_allow -p tcp -m tcp --dport 80 -m conntrack --ctstate NEW,UNTRACKED -j ACCEPT
-A IN_public_allow -p tcp -m tcp --dport 443 -m conntrack --ctstate NEW,UNTRACKED -j ACCEPT
-A IN_public_allow -p tcp -m tcp --dport 8000 -m conntrack --ctstate NEW,UNTRACKED -j ACCEPT
-A IN_public_allow -p tcp -m tcp --dport 8080 -m conntrack --ctstate NEW,UNTRACKED -j ACCEPT
-A IN_public_allow -p tcp -m tcp --dport 4023 -m conntrack --ctstate NEW,UNTRACKED -j ACCEPT
-A IN_public_allow -p tcp -m tcp --dport 9404 -m conntrack --ctstate NEW,UNTRACKED -j ACCEPT
-A IN_public_allow -p tcp -m tcp --dport 8089 -m conntrack --ctstate NEW,UNTRACKED -j ACCEPT
-A IN_public_allow -p tcp -m tcp --dport 8191 -m conntrack --ctstate NEW,UNTRACKED -j ACCEPT
-A IN_public_allow -p tcp -m tcp --dport 601 -m conntrack --ctstate NEW,UNTRACKED -j ACCEPT
-A IN_public_allow -p tcp -m tcp --dport 9997 -m conntrack --ctstate NEW,UNTRACKED -j ACCEPT
-A IN_public_allow -p udp -m udp --dport 8089 -m conntrack --ctstate NEW,UNTRACKED -j ACCEPT
-A IN_public_allow -p tcp -m tcp --dport 9998 -m conntrack --ctstate NEW,UNTRACKED -j ACCEPT
COMMIT
# Completed on Tue Jan 31 15:19:11 2023