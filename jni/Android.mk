LOCAL_PATH:= $(call my-dir)

# ################################################ 自己的第三方so，无法打包到apk中，试试test
# include $(CLEAR_VARS)
# LOCAL_MODULE := my-prebuilt 
# LOCAL_SRC_FILES := libmy.so
# # 使用该共享库的模块就会在它的 LOCAL_C_INCLUDES 变量加入该头文件搜索路径
# # LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/include
# include $(PREBUILT_SHARED_LIBRARY)

####################################################################
# Module libmmedia

include $(CLEAR_VARS)
LOCAL_MODULE := libmmedia
# LOCAL_MODULE_SUFFIX、LOCAL_SRC_FILES和BUILD_PREBUILT配套
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_SUFFIX := .so
LOCAL_SRC_FILES := libmmedia.so
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/include
include $(BUILD_PREBUILT)


#####################################################################
# Module libpgerf

include $(CLEAR_VARS)
LOCAL_MODULE := libgperf
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_SUFFIX := .so
LOCAL_SRC_FILES := libgperf.so
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/include
include $(BUILD_PREBUILT)

############################################### 编译JNI共享库

include $(CLEAR_VARS)
LOCAL_SRC_FILES:= \
    simp.cpp
# 我艹，这个竟然成了？string的问题
# 这里会根据头文件自动添加对系统库的依赖？
LOCAL_C_INCLUDES := \
	$(JNI_H_INCLUDE) \
	external/stlport/stlport \
	bionic \
	$(LOCAL_PATH)/include \		# 不对啊！！！不用在这里指明模块的头文件路径啊，在模块内部的LOCAL_EXPORT_C_INCLUDES指出不就可以了

LOCAL_STATIC_LIBRARIES := libstlport_static 

LOCAL_MODULE := libsimp
LOCAL_MODULE_TAGS := optional  # tests?

# 当前模块在运行时依赖的动态库名称, 引入自己的共享库模块，这个模块直接去out/mako中去找了
# 在上面设置的BUILD_PREBUILT模块中寻找
LOCAL_SHARED_LIBRARIES := \
	libgperf \
	libmmedia \

include $(BUILD_SHARED_LIBRARY)


