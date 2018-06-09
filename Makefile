alpine3.7:
	docker build -t yoanlin/dlib:$@ $@

all:
	docker build -t yoanlin/dlib:latest .

.PHONY: alpine3.7
