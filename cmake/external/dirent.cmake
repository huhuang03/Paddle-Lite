# Copyright (c) 2021 PaddlePaddle Authors. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

if(NOT WIN32 OR NOT MSVC)
    return()
endif()

# 1️⃣ 手动导入的 dirent include 目录
# 注意这里使用绝对路径或 PROJECT_ROOT 变量
set(DIRENT_INC_DIR ${CMAKE_SOURCE_DIR}/third-party/paddlelite-dirent/include)

message(STATUS "Using manual dirent include dir: ${DIRENT_INC_DIR}")
message("111111 DIRENT_INC_DIR: ${DIRENT_INC_DIR}")

# 2️⃣ 添加 include 目录给全局使用（可选）
include_directories(${DIRENT_INC_DIR})

# 3️⃣ 创建一个 INTERFACE library，方便其他 target link
add_library(dirent INTERFACE)
target_include_directories(dirent INTERFACE ${DIRENT_INC_DIR})

#include(ExternalProject)
#
#set(DIRENT_PROJECT "extern_dirent")
#set(DIRENT_PREFIX_DIR    ${THIRD_PARTY_PATH}/dirent)
#set(DIRENT_INSTALL_ROOT  ${THIRD_PARTY_PATH}/install/dirent)
#set(DIRENT_INC_DIR       ${DIRENT_INSTALL_ROOT}/include)
#set(DIRENT_DOWNLOAD_DIR    ${DIRENT_PREFIX_DIR}/src/${DIRENT_PROJECT})
#
#message("1111 DIRENT_INC_DIR: ${DIRENT_INC_DIR}, DIRENT_DOWNLOAD_DIR: ${DIRENT_DOWNLOAD_DIR}, EXTERNAL_PROJECT_LOG_ARGS: ${EXTERNAL_PROJECT_LOG_ARGS}")
#include_directories(${DIRENT_INC_DIR})
#
#
## DIRENT_INC_DIR: D:/source/tt-android-tool/Paddle-Lite/cmake-build-windows/third_party/install/dirent/include
#set(DIRENT_URL "http://paddle-inference-dist.bj.bcebos.com/PaddleLite_ThirdParty%2Fdirent-1.23.2.zip")
## DIRENT_DOWNLOAD_DIR: D:/source/tt-android-tool/Paddle-Lite/cmake-build-windows/third_party/dirent/src/extern_dirent
## EXTERNAL_PROJECT_LOG_ARGS: LOG_DOWNLOAD;0;LOG_UPDATE;1;LOG_CONFIGURE;1;LOG_BUILD;0;LOG_TEST;1;LOG_INSTALL;0
#ExternalProject_Add(
#    ${DIRENT_PROJECT}
#    ${EXTERNAL_PROJECT_LOG_ARGS}
#    DEPENDS             ""
#    GIT_TAG             "v1.23.2"  # 9 May 2018
#    URL                 ${DIRENT_URL}
#    DOWNLOAD_DIR        ${DIRENT_DOWNLOAD_DIR}
#    DOWNLOAD_NAME       "dirent-1.23.2.zip"
#    DOWNLOAD_NO_PROGRESS 1
#    PREFIX              ${DIRENT_PREFIX_DIR}
#    LOG_DOWNLOAD 1          # 输出下载日志
#    UPDATE_COMMAND      ""
#    CONFIGURE_COMMAND   ""
#    BUILD_COMMAND       ""
#    INSTALL_COMMAND
#        ${CMAKE_COMMAND} -E copy_directory ${DIRENT_DOWNLOAD_DIR}/include ${DIRENT_INC_DIR}
#)

#add_library(dirent INTERFACE)
#add_dependencies(dirent ${DIRENT_PROJECT})
