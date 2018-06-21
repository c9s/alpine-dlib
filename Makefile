alpine/3.7:
	docker build -t yoanlin/dlib:$@ $@

latest:
	docker build -t yoanlin/dlib:latest .

all: latest alpine3.7

.PHONY: alpine3.7
