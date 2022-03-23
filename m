Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nX3Qo-0006D5-Ls
	for mharc-qemu-riscv@gnu.org; Wed, 23 Mar 2022 12:01:57 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nX3QX-00064C-Rc
 for qemu-riscv@nongnu.org; Wed, 23 Mar 2022 12:01:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40376)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nX3QV-0005gk-Fq
 for qemu-riscv@nongnu.org; Wed, 23 Mar 2022 12:01:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648051294;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FNWeXhVmSyFUF005KTrVBR4V46blkLYJSBcsUWzAiZY=;
 b=LKJHYr1YHiavRIZu/alnGl24WcqZ4k9GqDW0HaNTPdIHK8u1dxZfagXqvQCwQUoZLRU3yF
 5AHjeXITWMUs0vcrUeH8YMPPk7cxEmdJdAcRMoo8yZX3MzGDG7s6QINuqnSZceemgq5Pja
 qgrqWnQLcy3AIWNcG5vGJofjddQBdGo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-133-emE5kjG1PMyURttWnSez8Q-1; Wed, 23 Mar 2022 12:01:33 -0400
X-MC-Unique: emE5kjG1PMyURttWnSez8Q-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6635C899EE1;
 Wed, 23 Mar 2022 16:01:31 +0000 (UTC)
Received: from localhost (unknown [10.39.208.32])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A9D7C401E36;
 Wed, 23 Mar 2022 16:01:28 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Stafford Horne <shorne@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Max Filippov <jcmvbkbc@gmail.com>,
 qemu-arm@nongnu.org (open list:ARM TCG CPUs),
 qemu-ppc@nongnu.org (open list:PowerPC TCG CPUs),
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs),
 qemu-s390x@nongnu.org (open list:S390 TCG CPUs)
Subject: [PATCH 28/32] Move CPU softfloat unions to cpu-float.h
Date: Wed, 23 Mar 2022 19:57:39 +0400
Message-Id: <20220323155743.1585078-29-marcandre.lureau@redhat.com>
In-Reply-To: <20220323155743.1585078-1-marcandre.lureau@redhat.com>
References: <20220323155743.1585078-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 23 Mar 2022 16:01:42 -0000

From: Marc-André Lureau <marcandre.lureau@redhat.com>

The types are no longer used in bswap.h since commit
f930224fffe ("bswap.h: Remove unused float-access functions"), there
isn't much sense in keeping it there and having a dependency on fpu/.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 include/qemu/bswap.h      | 60 ------------------------------------
 include/qemu/cpu-float.h  | 64 +++++++++++++++++++++++++++++++++++++++
 target/alpha/cpu.h        |  1 +
 target/arm/cpu.h          |  1 +
 target/hppa/cpu.h         |  1 +
 target/i386/cpu.h         |  1 +
 target/m68k/cpu.h         |  1 +
 target/microblaze/cpu.h   |  2 +-
 target/openrisc/cpu.h     |  1 +
 target/ppc/cpu.h          |  1 +
 target/riscv/cpu.h        |  2 +-
 target/rx/cpu.h           |  1 +
 target/s390x/cpu.h        |  1 +
 target/sh4/cpu.h          |  1 +
 target/sparc/cpu.h        |  1 +
 target/tricore/cpu.h      |  1 +
 target/xtensa/cpu.h       |  1 +
 migration/vmstate-types.c |  1 +
 18 files changed, 80 insertions(+), 62 deletions(-)
 create mode 100644 include/qemu/cpu-float.h

diff --git a/include/qemu/bswap.h b/include/qemu/bswap.h
index 9dff7c7dbbc9..346d05f2aab3 100644
--- a/include/qemu/bswap.h
+++ b/include/qemu/bswap.h
@@ -19,8 +19,6 @@
 extern "C" {
 #endif
 
-#include "fpu/softfloat-types.h"
-
 #ifdef BSWAP_FROM_BYTESWAP
 static inline uint16_t bswap16(uint16_t x)
 {
@@ -202,64 +200,6 @@ CPU_CONVERT(le, 64, uint64_t)
 # define const_le16(_x) (_x)
 #endif
 
-/* Unions for reinterpreting between floats and integers.  */
-
-typedef union {
-    float32 f;
-    uint32_t l;
-} CPU_FloatU;
-
-typedef union {
-    float64 d;
-#if HOST_BIG_ENDIAN
-    struct {
-        uint32_t upper;
-        uint32_t lower;
-    } l;
-#else
-    struct {
-        uint32_t lower;
-        uint32_t upper;
-    } l;
-#endif
-    uint64_t ll;
-} CPU_DoubleU;
-
-typedef union {
-     floatx80 d;
-     struct {
-         uint64_t lower;
-         uint16_t upper;
-     } l;
-} CPU_LDoubleU;
-
-typedef union {
-    float128 q;
-#if HOST_BIG_ENDIAN
-    struct {
-        uint32_t upmost;
-        uint32_t upper;
-        uint32_t lower;
-        uint32_t lowest;
-    } l;
-    struct {
-        uint64_t upper;
-        uint64_t lower;
-    } ll;
-#else
-    struct {
-        uint32_t lowest;
-        uint32_t lower;
-        uint32_t upper;
-        uint32_t upmost;
-    } l;
-    struct {
-        uint64_t lower;
-        uint64_t upper;
-    } ll;
-#endif
-} CPU_QuadU;
-
 /* unaligned/endian-independent pointer access */
 
 /*
diff --git a/include/qemu/cpu-float.h b/include/qemu/cpu-float.h
new file mode 100644
index 000000000000..911099499ffb
--- /dev/null
+++ b/include/qemu/cpu-float.h
@@ -0,0 +1,64 @@
+#ifndef QEMU_CPU_FLOAT_H_
+#define QEMU_CPU_FLOAT_H_
+
+#include "fpu/softfloat-types.h"
+
+/* Unions for reinterpreting between floats and integers.  */
+
+typedef union {
+    float32 f;
+    uint32_t l;
+} CPU_FloatU;
+
+typedef union {
+    float64 d;
+#if HOST_BIG_ENDIAN
+    struct {
+        uint32_t upper;
+        uint32_t lower;
+    } l;
+#else
+    struct {
+        uint32_t lower;
+        uint32_t upper;
+    } l;
+#endif
+    uint64_t ll;
+} CPU_DoubleU;
+
+typedef union {
+     floatx80 d;
+     struct {
+         uint64_t lower;
+         uint16_t upper;
+     } l;
+} CPU_LDoubleU;
+
+typedef union {
+    float128 q;
+#if HOST_BIG_ENDIAN
+    struct {
+        uint32_t upmost;
+        uint32_t upper;
+        uint32_t lower;
+        uint32_t lowest;
+    } l;
+    struct {
+        uint64_t upper;
+        uint64_t lower;
+    } ll;
+#else
+    struct {
+        uint32_t lowest;
+        uint32_t lower;
+        uint32_t upper;
+        uint32_t upmost;
+    } l;
+    struct {
+        uint64_t lower;
+        uint64_t upper;
+    } ll;
+#endif
+} CPU_QuadU;
+
+#endif /* QEMU_CPU_FLOAT_H_ */
diff --git a/target/alpha/cpu.h b/target/alpha/cpu.h
index 58f00b7814fd..994a018b910d 100644
--- a/target/alpha/cpu.h
+++ b/target/alpha/cpu.h
@@ -22,6 +22,7 @@
 
 #include "cpu-qom.h"
 #include "exec/cpu-defs.h"
+#include "qemu/cpu-float.h"
 
 /* Alpha processors have a weak memory model */
 #define TCG_GUEST_DEFAULT_MO      (0)
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index ccf635ac5cbc..cb5359a74702 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -21,6 +21,7 @@
 #define ARM_CPU_H
 
 #include "kvm-consts.h"
+#include "qemu/cpu-float.h"
 #include "hw/registerfields.h"
 #include "cpu-qom.h"
 #include "exec/cpu-defs.h"
diff --git a/target/hppa/cpu.h b/target/hppa/cpu.h
index 4cc936b6bfda..c43b93a68f14 100644
--- a/target/hppa/cpu.h
+++ b/target/hppa/cpu.h
@@ -22,6 +22,7 @@
 
 #include "cpu-qom.h"
 #include "exec/cpu-defs.h"
+#include "qemu/cpu-float.h"
 
 /* PA-RISC 1.x processors have a strong memory model.  */
 /* ??? While we do not yet implement PA-RISC 2.0, those processors have
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 5124c1e307b5..796e2cf6d664 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -25,6 +25,7 @@
 #include "kvm/hyperv-proto.h"
 #include "exec/cpu-defs.h"
 #include "qapi/qapi-types-common.h"
+#include "qemu/cpu-float.h"
 
 /* The x86 has a strong memory model with some store-after-load re-ordering */
 #define TCG_GUEST_DEFAULT_MO      (TCG_MO_ALL & ~TCG_MO_ST_LD)
diff --git a/target/m68k/cpu.h b/target/m68k/cpu.h
index 872e8ce63758..9b3bf7a44819 100644
--- a/target/m68k/cpu.h
+++ b/target/m68k/cpu.h
@@ -22,6 +22,7 @@
 #define M68K_CPU_H
 
 #include "exec/cpu-defs.h"
+#include "qemu/cpu-float.h"
 #include "cpu-qom.h"
 
 #define OS_BYTE     0
diff --git a/target/microblaze/cpu.h b/target/microblaze/cpu.h
index 0a0ce71b6a5c..67aa88b8db5b 100644
--- a/target/microblaze/cpu.h
+++ b/target/microblaze/cpu.h
@@ -22,7 +22,7 @@
 
 #include "cpu-qom.h"
 #include "exec/cpu-defs.h"
-#include "fpu/softfloat-types.h"
+#include "qemu/cpu-float.h"
 
 typedef struct CPUArchState CPUMBState;
 #if !defined(CONFIG_USER_ONLY)
diff --git a/target/openrisc/cpu.h b/target/openrisc/cpu.h
index bdf29d2dc4c3..b9584f10d452 100644
--- a/target/openrisc/cpu.h
+++ b/target/openrisc/cpu.h
@@ -21,6 +21,7 @@
 #define OPENRISC_CPU_H
 
 #include "exec/cpu-defs.h"
+#include "fpu/softfloat-types.h"
 #include "hw/core/cpu.h"
 #include "qom/object.h"
 
diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 627e574127ba..473436a49eb5 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -21,6 +21,7 @@
 #define PPC_CPU_H
 
 #include "qemu/int128.h"
+#include "qemu/cpu-float.h"
 #include "exec/cpu-defs.h"
 #include "cpu-qom.h"
 #include "qom/object.h"
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index c069fe85fa1b..e1d976bdef06 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -23,7 +23,7 @@
 #include "hw/core/cpu.h"
 #include "hw/registerfields.h"
 #include "exec/cpu-defs.h"
-#include "fpu/softfloat-types.h"
+#include "qemu/cpu-float.h"
 #include "qom/object.h"
 #include "qemu/int128.h"
 #include "cpu_bits.h"
diff --git a/target/rx/cpu.h b/target/rx/cpu.h
index b4abd90ccd1e..1c267f83bfd2 100644
--- a/target/rx/cpu.h
+++ b/target/rx/cpu.h
@@ -24,6 +24,7 @@
 #include "cpu-qom.h"
 
 #include "exec/cpu-defs.h"
+#include "qemu/cpu-float.h"
 
 /* PSW define */
 REG32(PSW, 0)
diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
index c49c8466e74d..7d6d01325b2d 100644
--- a/target/s390x/cpu.h
+++ b/target/s390x/cpu.h
@@ -28,6 +28,7 @@
 #include "cpu-qom.h"
 #include "cpu_models.h"
 #include "exec/cpu-defs.h"
+#include "qemu/cpu-float.h"
 
 #define ELF_MACHINE_UNAME "S390X"
 
diff --git a/target/sh4/cpu.h b/target/sh4/cpu.h
index c72a30edfd41..14d490ac4705 100644
--- a/target/sh4/cpu.h
+++ b/target/sh4/cpu.h
@@ -22,6 +22,7 @@
 
 #include "cpu-qom.h"
 #include "exec/cpu-defs.h"
+#include "qemu/cpu-float.h"
 
 /* CPU Subtypes */
 #define SH_CPU_SH7750  (1 << 0)
diff --git a/target/sparc/cpu.h b/target/sparc/cpu.h
index abb38db6749d..dd9e2f5cdb6a 100644
--- a/target/sparc/cpu.h
+++ b/target/sparc/cpu.h
@@ -4,6 +4,7 @@
 #include "qemu/bswap.h"
 #include "cpu-qom.h"
 #include "exec/cpu-defs.h"
+#include "qemu/cpu-float.h"
 
 #if !defined(TARGET_SPARC64)
 #define TARGET_DPREGS 16
diff --git a/target/tricore/cpu.h b/target/tricore/cpu.h
index 108d6b8288fb..3b9c533a7c3b 100644
--- a/target/tricore/cpu.h
+++ b/target/tricore/cpu.h
@@ -22,6 +22,7 @@
 
 #include "cpu-qom.h"
 #include "exec/cpu-defs.h"
+#include "qemu/cpu-float.h"
 #include "tricore-defs.h"
 
 struct tricore_boot_info;
diff --git a/target/xtensa/cpu.h b/target/xtensa/cpu.h
index f10cfabdc35c..71142ea8f453 100644
--- a/target/xtensa/cpu.h
+++ b/target/xtensa/cpu.h
@@ -29,6 +29,7 @@
 #define XTENSA_CPU_H
 
 #include "cpu-qom.h"
+#include "qemu/cpu-float.h"
 #include "exec/cpu-defs.h"
 #include "xtensa-isa.h"
 
diff --git a/migration/vmstate-types.c b/migration/vmstate-types.c
index bf4d440308ea..e83bfccb9ecf 100644
--- a/migration/vmstate-types.c
+++ b/migration/vmstate-types.c
@@ -11,6 +11,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/cpu-float.h"
 #include "qemu-file.h"
 #include "migration.h"
 #include "migration/vmstate.h"
-- 
2.35.1.273.ge6ebfd0e8cbb


