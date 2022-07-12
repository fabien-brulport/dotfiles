#!/bin/bash
[ -z "$(pmset -g batt | grep discharging)" ] && echo 1 || echo 0
