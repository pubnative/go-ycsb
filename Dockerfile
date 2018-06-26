FROM golang:1.10-alpine

RUN apk add --no-cache bash git \
&& go get -u github.com/golang/dep/cmd/dep

ADD . /go/src/github.com/pingcap/go-ycsb

WORKDIR /go/src/github.com/pingcap/go-ycsb
RUN dep ensure \
 && go build -o /go-ycsb ./cmd/* \
 && cp -rf /go/src/github.com/pingcap/go-ycsb/workloads /workloads
