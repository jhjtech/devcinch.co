clua/%.lua: %.fnl
	fennel --compile $< > $@

html/articles/%.html: articles/%.org
	pandoc -o $@ $<

html/pages/%.html: pages/%.org
	pandoc -o $@ $<

html/pages/clients/%.html: pages/clients/%.org
	pandoc -o $@ $<

ROOT_DIR:=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))
SRC := $(wildcard *.fnl)
OUT := $(patsubst %.fnl,clua/%.lua,$(SRC))

ARTICLES := $(sort $(wildcard articles/*.org))
AHTML := $(patsubst %.org,html/%.html,$(ARTICLES))

PAGES := $(sort $(wildcard pages/*.org))
PHTML := $(patsubst %.org,html/%.html,$(PAGES))

CLIENTS := $(sort $(wildcard pages/clients/*.org))
CHTML := $(patsubst %.org,html/%.html,$(CLIENTS))

build: $(OUT) $(AHTML) $(PHTML) $(CHTML)

html: $(AHTML) $(PHTML) $(CHTML)

clean-html:
	rm -rf html
	mkdir -p html/articles
	mkdir -p html/pages/clients

clean-lua:
	rm -rf $(OUT)

test:
	@echo "Checking nginx config..."
	/opt/openresty/nginx/sbin/nginx -p $(ROOT_DIR)/ -c nginx.dev.conf -t

dev: stop clean-html html
	@mkdir -p logs
	@echo "Checking nginx config..."
	/opt/openresty/nginx/sbin/nginx -p $(ROOT_DIR)/ -c nginx.dev.conf

stop:
	@echo "Killing nginx pid..."
	-fuser -k 8080/tcp

clean: stop clean-html clean-lua
	@echo "Cleaning.."
	rm -rf fastcgi_temp client_body_temp proxy_temp uwsgi_temp scgi_temp
	rm -rf $(OUT)

deploy: clean build
	-git remote add heroku https://git.heroku.com/devcinch.git
	@git describe --match=NeVeRmAtCh --always --dirty > version.txt
	@git add .
	@git commit -m "Deploy"
	@git push heroku main
