%.lua: %.fnl
	fennel --compile $< > $@

ROOT_DIR:=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))
SRC := $(wildcard *.fnl)
OUT := $(patsubst %.fnl,%.lua,$(SRC))

or: $(OUT)
	@echo "Building"

test:
	@echo "Checking nginx config..."
	/opt/openresty/nginx/sbin/nginx -p $(ROOT_DIR)/ -c nginx.dev.conf -t

run: clean
	@mkdir -p logs
	@echo "Checking nginx config..."
	/opt/openresty/nginx/sbin/nginx -p $(ROOT_DIR)/ -c nginx.dev.conf

stop:
	@echo "Killing nginx pid..."
	-fuser -k 8080/tcp

clean: stop
	@echo "Cleaning.."
	rm -rf fastcgi_temp client_body_temp proxy_temp uwsgi_temp scgi_temp
	rm -rf $(OUT)
