#!/bin/bash
: ${currdir=$(realpath $(dirname ${BASH_SOURCE[0]}))}
accounts=accounts
encfile=$currdir/${accounts}.enc
echo password?
read -s pwd
genaccounts(){
  echo "generate accounts..."
  cat $encfile | openssl enc -aes-256-cbc -a -d -pass pass:$pwd > $accounts
  echo "done!!"
}
genencaccounts(){
  echo "generate encrypted accounts..."
  cat $accounts | openssl enc -aes-256-cbc -a -pass pass:$pwd > $encfile
  echo "done!!"
}
[ ! -f "$accounts" ] && genaccounts
genencaccounts
