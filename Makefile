install: bin/libNailgunTest.jnilib closure-compiler nailgun

bin/libNailgunTest.jnilib:
	cd bin && javac NailgunTest.java && gcc NailgunTest.c -shared -o libNailgunTest.jnilib -I/System/Library/Frameworks/JavaVM.framework/Headers/

closure-compiler:
	rm -fr temp
	mkdir temp
	cd temp && curl -O http://dl.google.com/closure-compiler/compiler-20131014.zip && unzip compiler-20131014.zip
	mkdir closure-compiler
	mv temp/compiler.jar closure-compiler
	rm -fr temp

nailgun:
	rm -fr temp
	svn co http://nailgun.svn.sourceforge.net/svnroot/nailgun/trunk@21 temp && cd temp/nailgun && ant
	mkdir nailgun
	mv temp/nailgun/dist/nailgun-0.7.1.jar nailgun/nailgun.jar
	mv temp/nailgun/ng nailgun/ng
	rm -fr temp
