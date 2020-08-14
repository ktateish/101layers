#!/bin/sh

cat << EOM > main.go
package main
import "fmt"
func main() {
	var s string
	fmt.Scan(&s)
	fmt.Println(s)
}
EOM


cat << EOM > Dockerfile
FROM golang:latest AS builder
WORKDIR /src
COPY main.go .
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o docker-entry .
RUN touch empty

FROM scratch
COPY --from=builder /src/docker-entry /

EOM

for i in `seq 1 120`
do
	echo "COPY --from=builder /src/empty /$i" >> Dockerfile
done


echo 'CMD ["/docker-entry"]' >> Dockerfile
