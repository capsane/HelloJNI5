#include <jni.h>
// #include <iostream>
#include <string>
// #include "myaudio.h"
#include "gperf.h"
#include "mediaplayer.h"

using namespace std;
using namespace android;

// extern "C"
// int play()
// {
//     int iRet = 0;
//     MediaPlayer *p= new MediaPlayer();
    
//     // iRet = p->setDataSource("/data/j2me/phoneme-cache/061075.midi", NULL);
//     // if (0 != iRet)
//     // {
//     //     printf("[setDataSource] iRet = %d\n", iRet);
//     // }

//     // 最基本的编译不过
//     // error: invalid conversion from 'int' to 'audio_stream_type_t' [-fpermissive]
//     // iRet = p->setAudioStreamType(3);
//     // if (0 != iRet)
//     // {
//     //     printf("[setAudioStreamType] iRet = %d\n", iRet);
//     // }   
    
//     iRet = p->prepare();
//     if (0 != iRet)
//     {
//         printf("[prepare] iRet = %d\n", iRet);
//     }

//     iRet = p->start();
//     if (0 != iRet)
//     {
//         printf("[start] iRet = %d\n", iRet);
//     }

//     p->stop();
//     return 0;
// }

extern "C"
jstring Java_com_capsane_hellojni_MainActivity_stringFromJNI(
        JNIEnv *env,
        jobject /* this */) {
    string hello = "Hello from C++";

    uint64_t ticks = GetTicks();
    // for (auto exp = 0; exp < 32; ++exp) {
    //     volatile unsigned val = gpower(exp);
    //     (void) val;  // to silence compiler warning
    // }
    // ticks = GetTicks() - ticks;
    // int a = play();
    return env->NewStringUTF(hello.c_str());
}


