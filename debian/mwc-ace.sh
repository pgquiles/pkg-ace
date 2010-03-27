#!/bin/sh

export ACE_ROOT=/usr/share/ace
export TAO_ROOT=$ACE_ROOT/TAO
export MPC_ROOT==$ACE_ROOT/MPC
exec MPC_ROOT/mwc.pl "$@"
