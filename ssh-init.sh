#!/bin/sh

name="$1"
host_config=$(ssh -G "$name")

value_of() {
  echo "$host_config" | grep -E "^$1 " | cut -d' ' -f2
}

user=$(value_of "user")
hostname=$(value_of "hostname")
identityfile=$(value_of "identityfile" | sed "s#^~#$HOME#")

ssh-keygen -t ed25519 -f "$identity_file" -q -N ""
ssh-copy-id -i "$identityfile.pub" "$user@$hostname"
