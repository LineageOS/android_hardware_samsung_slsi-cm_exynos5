LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE_TAGS := optional

LOCAL_SRC_FILES := \
	swconvertor.c

ifneq ($(TARGET_ARCH),arm64)
LOCAL_SRC_FILES += \
	csc_tiled_to_linear_y_neon.s \
	csc_tiled_to_linear_uv_neon.s \
	csc_tiled_to_linear_uv_deinterleave_neon.s \
	csc_interleave_memcpy_neon.s \
	csc_ARGB8888_to_YUV420SP_NEON.s \
	csc_ARGB8888_to_ABGR8888.s
endif

LOCAL_C_INCLUDES := \
	$(TOP)/hardware/samsung_slsi-cm/openmax/include/khronos \
	$(LOCAL_PATH)/../include

LOCAL_MODULE := libswconverter

LOCAL_MULTILIB := 32

LOCAL_CFLAGS :=

LOCAL_ARM_MODE := arm

LOCAL_STATIC_LIBRARIES :=
LOCAL_SHARED_LIBRARIES := liblog

include $(BUILD_STATIC_LIBRARY)
