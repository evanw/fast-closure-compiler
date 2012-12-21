#include <unistd.h>
#include <jni.h>

JNIEXPORT void JNICALL Java_NailgunTest_chdir(JNIEnv *env, jobject obj, jstring dir) {
  const char *str = (*env)->GetStringUTFChars(env, dir, NULL);
  chdir(str);
  (*env)->ReleaseStringUTFChars(env, dir, str);
}
