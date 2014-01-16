UNAME := $(shell uname -s)
INCLUDE_PATH=/usr/lib/jvm/java-6-openjdk/include/

ifeq ($(UNAME),Darwin)
	INCLUDE_PATH=/System/Library/Frameworks/JavaVM.framework/Headers/
endif

install: bin/libNailgunTest.jnilib closure-compiler nailgun

bin/libNailgunTest.jnilib:
	cd bin && javac NailgunTest.java && gcc NailgunTest.c -shared -fPIC -o libNailgunTest.jnilib -I$(INCLUDE_PATH)

closure-compiler:
	rm -fr temp
	mkdir temp
	cd temp && curl -O http://dl.google.com/closure-compiler/compiler-20131014.zip && unzip compiler-20131014.zip
	mkdir closure-compiler
	mv temp/compiler.jar closure-compiler
	chown a+r closure-compiler/compiler.jar
	rm -fr temp

nailgun:
	rm -fr temp
	git clone https://github.com/martylamb/nailgun temp && cd temp && mvn install && make
	mkdir nailgun
	mv temp/nailgun-server/target/nailgun-server-0.9.2-SNAPSHOT.jar nailgun/nailgun.jar
	mv temp/ng nailgun/ng
	rm -fr temp

.PHONY: clean
clean:
	rm -rf temp nailgun closure-compiler

