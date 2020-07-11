Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1juIDP-0007Sf-6Z
	for mharc-qemu-riscv@gnu.org; Sat, 11 Jul 2020 12:19:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1juIDI-0007FN-C5; Sat, 11 Jul 2020 12:18:56 -0400
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:60698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1juIDD-0001M7-Ix; Sat, 11 Jul 2020 12:18:56 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07440338|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.325301-0.00391217-0.670787;
 FP=0|0|0|0|0|-1|-1|-1; HT=e02c03268; MF=zhiwei_liu@c-sky.com; NM=1; PH=DS;
 RN=10; RT=10; SR=0; TI=SMTPD_---.I0GMGMe_1594484317; 
Received: from L-PF1D6DP4-1208.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.I0GMGMe_1594484317)
 by smtp.aliyun-inc.com(10.147.44.129);
 Sun, 12 Jul 2020 00:18:43 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: richard.henderson@linaro.org, Alistair.Francis@wdc.com,
 chihmin.chao@sifive.com, alex.bennee@linaro.org, peter.maydell@linaro.org,
 wenmeng_zhang@c-sky.com, wxy194768@alibaba-inc.com,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH 11/11] riscv: Add configure script
Date: Sun, 12 Jul 2020 00:16:55 +0800
Message-Id: <20200711161655.2856-12-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200711161655.2856-1-zhiwei_liu@c-sky.com>
References: <20200711161655.2856-1-zhiwei_liu@c-sky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=121.197.200.217;
 envelope-from=zhiwei_liu@c-sky.com; helo=smtp2200-217.mail.aliyun.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/11 12:18:40
X-ACL-Warn: Detected OS   = Linux 3.x [generic] [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, UNPARSEABLE_RELAY=0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sat, 11 Jul 2020 16:18:56 -0000

For RV64 risu, make CFLAGS="-march=rv64g"

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 configure          |   4 +-
 upstream/configure | 204 +++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 207 insertions(+), 1 deletion(-)
 create mode 100644 upstream/configure

diff --git a/configure b/configure
index ca2d7db..00624d3 100755
--- a/configure
+++ b/configure
@@ -58,6 +58,8 @@ guess_arch() {
         ARCH="m68k"
     elif check_define __powerpc64__ ; then
         ARCH="ppc64"
+    elif check_define __riscv && check_define _LP64; then
+        ARCH="riscv64"
     else
         echo "This cpu is not supported by risu. Try -h. " >&2
         exit 1
@@ -139,7 +141,7 @@ Some influential environment variables:
                prefixed with the given string.
 
   ARCH         force target architecture instead of trying to detect it.
-               Valid values=[arm|aarch64|ppc64|ppc64le|m68k]
+               Valid values=[arm|aarch64|ppc64|ppc64le|m68k|riscv64]
 
   CC           C compiler command
   CFLAGS       C compiler flags
diff --git a/upstream/configure b/upstream/configure
new file mode 100644
index 0000000..297cd3a
--- /dev/null
+++ b/upstream/configure
@@ -0,0 +1,204 @@
+#!/bin/sh
+# simple risu configure script
+#
+# Copyright (c) 2013 Linaro Limited
+# All rights reserved. This program and the accompanying materials
+# are made available under the terms of the Eclipse Public License v1.0
+# which accompanies this distribution, and is available at
+# http://www.eclipse.org/legal/epl-v10.html
+#
+# Contributors:
+#      Claudio Fontana (Linaro) - initial implementation
+
+# Locate the directory where this configure script is
+SRCDIR="$(cd "$(dirname "$0")"; pwd)"
+
+# Temporary directory used for files created by this script.
+# Like autoconf (and like QEMU) we put this directory in the
+# build directory, which means we can just give it a fixed name and
+# blow it away when configure is run, and we don't need to jump
+# through complicated hoops to delete it when configure exits
+# abnormally (it may be useful for debug purposes on an
+# abnormal exit).
+tmp_dir="config-temp"
+rm -rf "$tmp_dir"
+mkdir -p "$tmp_dir"
+if [ $? -ne 0 ]; then
+    echo "ERROR: could not create temporary directory"
+    exit 1
+fi
+
+compile() {
+    $CC $CFLAGS -c -o ${1}.o ${1}.c 2>/dev/null
+}
+
+link() {
+    $LD $LDFLAGS -l${2} -o ${1} ${1}.o 2>/dev/null
+}
+
+check_define() {
+    c=${tmp_dir}/check_define_${1}
+    cat > ${c}.c <<EOF
+#if !defined($1)
+#error $1 not defined
+#endif
+int main(void) { return 0; }
+EOF
+    compile $c
+}
+
+guess_arch() {
+    if check_define __aarch64__ ; then
+        ARCH="aarch64"
+    elif check_define __arm__ ; then
+        ARCH="arm"
+    elif check_define __i386__ || check_define __x86_64__ ; then
+        ARCH="i386"
+    elif check_define __m68k__ ; then
+        ARCH="m68k"
+    elif check_define __powerpc64__ ; then
+        ARCH="ppc64"
+    elif check_define __riscv ; then
+        if __riscv_xlen == 64; then
+            ARCH="riscv64"
+        elif __riscv_xlen == 32; then
+            ARCH="riscv32"
+        else
+            echo "__riscv_xlen is not supported by risu. " >&2
+            exit 1
+        fi
+    else
+        echo "This cpu is not supported by risu. Try -h. " >&2
+        exit 1
+    fi
+}
+
+check_type() {
+    c=${tmp_dir}/check_type_${1}
+    cat > ${c}.c <<EOF
+#include <inttypes.h>
+#include <stdint.h>
+#include <sys/types.h>
+#include <sys/socket.h>
+
+int main(void) { $1 thisone; return 0; }
+EOF
+    compile $c
+}
+
+check_lib() {
+    c=${tmp_dir}/check_lib${1}
+    cat > ${c}.c <<EOF
+#include <stdint.h>
+#include <$2.h>
+
+int main(void) { $3; return 0; }
+EOF
+    compile $c && link $c $1
+}
+
+generate_config() {
+    cfg=config.h
+    echo "generating config.h..."
+
+    echo "/* config.h - generated by the 'configure' script */" > $cfg
+    echo "#ifndef CONFIG_H" >> $cfg
+    echo "#define CONFIG_H 1" >> $cfg
+
+    if check_lib z zlib "zlibVersion()"; then
+        echo "#define HAVE_ZLIB 1" >> $cfg
+        LDFLAGS=-lz
+    fi
+
+    echo "#endif /* CONFIG_H */" >> $cfg
+
+    echo "...done"
+}
+
+generate_makefilein() {
+    m=Makefile.in
+    echo "generating Makefile.in..."
+
+    echo "# Makefile.in - generated by the 'configure' script" > $m
+    echo "ARCH:=${ARCH}" >> $m
+    echo "CC:=${CC}" >> $m
+    echo "CPPFLAGS:=${CPPFLAGS}" >> $m
+    echo "LDFLAGS:=${LDFLAGS}" >> $m
+    echo "AS:=${AS}" >> $m
+    echo "OBJCOPY:=${OBJCOPY}" >> $m
+    echo "OBJDUMP:=${OBJDUMP}" >> $m
+    echo "STATIC:=${STATIC}" >> $m
+    echo "SRCDIR:=${SRCDIR}" >> $m
+    echo "BUILD_INC:=${BUILD_INC}" >> $m
+
+    echo "...done"
+}
+
+usage() {
+    cat <<EOF
+Usage: [VAR=VALUE]... ./configure [-h|--help] [-s|--static]
+
+  -s/--static - force a static build of risu
+
+To assign environment variables (e.g., CC, CFLAGS...), specify them as
+VAR=VALUE.  See below for descriptions of some of the useful variables.
+
+Some influential environment variables:
+  CROSS_PREFIX cross-compiler prefix, defaults to gcc and other tools
+               prefixed with the given string.
+
+  ARCH         force target architecture instead of trying to detect it.
+               Valid values=[arm|aarch64|ppc64|ppc64le|m68k|riscv64]
+
+  CC           C compiler command
+  CFLAGS       C compiler flags
+  CPPFLAGS     C preprocessor flags, e.g. -I<include dir>
+
+  AS           assembler command
+  OBJCOPY      object copy utility command
+  OBJDUMP      object dump utility command
+
+EOF
+}
+
+# STARTUP: entry point
+STATIC=""
+
+for opt do
+  case "$opt" in
+      --help | -h)
+          usage;
+          exit 0;;
+      --static | -s)
+          STATIC="-static"
+          ;;
+
+  esac
+done
+
+CC="${CC-${CROSS_PREFIX}gcc}"
+AS="${AS-${CROSS_PREFIX}as}"
+LD="${LD-${CROSS_PREFIX}ld}"
+OBJCOPY="${OBJCOPY-${CROSS_PREFIX}objcopy}"
+OBJDUMP="${OBJDUMP-${CROSS_PREFIX}objdump}"
+
+if test "x${ARCH}" = "x"; then
+    guess_arch
+fi
+
+# Are we in a separate build tree? If so, link the Makefile
+# so that 'make' works.
+if test ! -e Makefile || test -s Makefile; then
+    echo "linking Makefile..."
+    BUILD_INC="-I $(pwd)"
+    ln -sf "${SRCDIR}/Makefile" .
+fi
+
+generate_config
+generate_makefilein
+
+rm -r "$tmp_dir"
+
+echo "type 'make' to start the build"
+exit 0
+
-- 
2.23.0


