#!/bin/bash/env bash


V1=""
V2=""

if [[ "$V1" = "$V2" ]]; then
  echo "Same value"
fi

# alternative syntax
if [[ "$V1" = "$V2" ]]
then
  echo "Same value"
fi

# alternative syntax 
if test "$V1" = "$V2"
then
  echo "Same value"
fi

# alternative syntax
if [ "$V1" = "$V2" ]
then
  echo "Same value"
fi

[ "$V1" = "$V2" ] && echo "Same value"
