#!/bin/bash
: ${currdir=$(realpath $(dirname ${BASH_SOURCE[0]}))}
business=business
encfile=$currdir/${business}.enc
echo password?
read -s pwd
genbusiness(){
  echo "generate business..."
  cat $encfile | openssl enc -aes-256-cbc -a -d -pass pass:$pwd > $business
  echo "done!!"
}
genencbusiness(){
  echo "generate encrypted business..."
  cat $business | openssl enc -aes-256-cbc -a -pass pass:$pwd > $encfile
  echo "done!!"
}
[ ! -f "$business" ] && genbusiness
genencbusiness
