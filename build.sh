#!/bin/bash
ROOTDIR=$(dirname $0)
NAME=$(lua $ROOTDIR/get_title.lua)
LOVEFILE=$ROOTDIR/pkg/$NAME.love

mkdir -p $ROOTDIR/pkg

zip -q -r $LOVEFILE assets/*
zip -q -r $LOVEFILE src/*
zip -q $LOVEFILE main.lua
zip -q $LOVEFILE conf.lua
