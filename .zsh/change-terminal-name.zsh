change-terminal-name() {
  echo -ne "\e]1;$1\a"
}
