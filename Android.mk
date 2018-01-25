LOCAL_PATH:= $(call my-dir)
#####################################################3
# 假设so库是已经存在的，不需要重新编译的话。只需要用LOCAL_PREBUILT_JNI_LIBS指定（注意包含so的路径）
# include $(CLEAR_VARS)
# LOCAL_MODULE := libmmedia
# # LOCAL_MODULE_SUFFIX、LOCAL_SRC_FILES和BUILD_PREBUILT配套
# LOCAL_MODULE_CLASS := SHARED_LIBRARIES
# LOCAL_MODULE_SUFFIX := .so
# LOCAL_SRC_FILES := libmmedia.so	# $(LOCAL_PATH)/../lib/armeabi-v7a/
# LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/jni/include
# include $(BUILD_PREBUILT)

#####################################################3
include $(CLEAR_VARS)

# 我曹，这个就可以把so库打包进apk了？！！
LOCAL_MODULE_TAGS := tests 

LOCAL_SRC_FILES := $(call all-java-files-under,src)
LOCAL_PACKAGE_NAME := HelloJNI

LOCAL_RESOURCE_DIR := \
        $(LOCAL_PATH)/res

# 指定需要打包到apk的so库
LOCAL_JNI_SHARED_LIBRARIES := libsimp \
        libgperf \
        libmmedia \

LOCAL_MODULE_INCLUDE_LIBRARY := true

# LOCAL_PREBUILT_JNI_LIBS := libmmedia \

LOCAL_PROGUARD_ENABLED := disabled
# Tell it to build an APK
include $(BUILD_PACKAGE)
include $(call all-makefiles-under,$(LOCAL_PATH))
