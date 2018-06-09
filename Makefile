
alpine3.7:
	docker build -t yoanlin/dlib:alpine3.7 3.7

all:
	docker build -t yoanlin/dlib:latest .
