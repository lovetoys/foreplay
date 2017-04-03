#!/bin/bash
TARGET=$1

zip -q -r -0 $TARGET.love assets/*
cd src/ && zip -q -r ../$TARGET.love *
