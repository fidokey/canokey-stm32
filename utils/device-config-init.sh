#!/bin/bash
if [ -z "$1" ]; then
    exit 1
fi
echo "Reader name: $1"
TS=$(printf %08x $(date +%s))
(cat <<-EOF
00A4040005F000000000
0020000006313233343536
00FF01010903B005720300B39900
00FF010103039100
00FF01010603A044000420
0030000004$TS
0001000020D95C1215D10ABB5791B64752DF9D253CA41731375D41CD9CD93CDA005136E64E
000200000001C7308201c33082016aa00302010202081bde067b4cd949e8300a06082a8648ce3d040302304f310b300906035504061302636e310d300b060355040a13047a34797831223020060355040b131941757468656e74696361746f72204174746573746174696f6e310d300b060355040313047a347978301e170d3139303932303133313230305a170d3230303932303133313230305a304f310b300906035504061302636e310d300b060355040a13047a34797831223020060355040b131941757468656e74696361746f72204174746573746174696f6e310d300b060355040313047a3479783059301306072a8648ce3d020106082a8648ce3d030107034200048e6e622aad848700e2ba764a0fbe68bedbcc612daa1100460716c13c5d9632c3ae49f4e9a2db6fd5ee2b6453fa7b3d2f1bdaa7e5516f4d5332409710f30e8efca330302e30090603551d13040230003021060b2b0601040182e51c01010404120000244eb29ee0904e4981fe1f20f8d3b8f4300a06082a8648ce3d040302034700304402201287b23172f02a9717a0b627da3936264f4521e458455215784599a5be7dfa7d02202079693a7831d3ec3a9b171b304704a8353b5b58d557f57759eb7a07ba0e1c67
EOF
) | scriptor -r "$1"
