# HelloJNI5
    Compile APK in Android 5
Android.mk、打包so到APK、JNI in AOSP、第三方so库引用

## Android.mk
```
this is the code
```
```cpp
#inclue <string>
using namespace std;
```
```Java
pucli static void main(){

}
```

## 系统的问题
虽然JNI库libsimp.so同时依赖了libgperf.so和libmedia5.so，而且这两个so都打包进APK中，安装在 /lib/armeabi-v7a/下。但是通过native libs monitor这个app的查看，libsimp.so却依赖了libgperf.so和系统的`libmedia.so`。
其实，及时不将libmedia5.so打包进APK中，安装后app还是可以正常运行的。

