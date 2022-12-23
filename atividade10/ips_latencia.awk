{
  comando ="ping -c5 "$1" | grep  rtt"
  comando | getline latencia
  split(latencia,vet,"/")
  print $1, vet[length(vet) - 2] "ms"| "sort -n -k2" 
}
