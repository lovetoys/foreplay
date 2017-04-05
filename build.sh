#!/bin/bash
ROOTDIR=$(dirname $0)
NAME=$(lua $ROOTDIR/get_title.lua)

mkdir -p $ROOTDIR/pkg

zip -q -r -0 $ROOTDIR/pkg/$NAME.love assets/*
cd src/ && zip -q -r ../$ROOTDIR/pkg/$NAME.love *
