#!/bin/bash
if [[ $(defaults read -g AppleInterfaceStyle 2>/dev/null) == "Dark" ]]; then
    echo 1
else
    echo 0
fi
