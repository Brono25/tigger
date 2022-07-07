#!/bin/bash



find ~ -name '._*'|xargs -I@ rm -f @
find ~ -name '.DS*'|xargs -I@ rm -f @