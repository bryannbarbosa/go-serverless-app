.PHONY: build clean deploy gomodgen

build: gomodgen
	GO111MODULE=on GOARCH=amd64 CGO_ENABLED=0 GOOS=linux go build -ldflags="-s -w" -o bin/hello hello/main.go
	GO111MODULE=on GOARCH=amd64 CGO_ENABLED=0 GOOS=linux go build -ldflags="-s -w" -o bin/world world/main.go

clean:
	rm -rf ./bin ./vendor go.sum

deploy:
	sls deploy --verbose

install:
	go mod tidy

gomodgen:
	chmod u+x gomod.sh
	./gomod.sh
