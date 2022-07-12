#!/bin/bash
[[ $(defaults read -g AppleInterfaceStyle 2>/dev/null) == "Dark" ]] && echo 1 || echo 0
