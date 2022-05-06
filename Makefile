ENV_FILE ?= environment.env

setup_requirements:
	pip install -r requirements.txt

build:
	docker build --build-arg USER_ID=${shell id -u} --build-arg USER_NAME=user -t base_project .

clean_up:
	docker rmi -f base_project

run:
    mkdir -p folder
	docker run --env-file ${ENV_FILE} --mount type=bind,source=${shell pwd}/folder,target=/home/user/folder -ti base_project
