Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8244C4332F
	for <qemu-riscv@archiver.kernel.org>; Mon, 11 Dec 2023 21:27:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rCnkM-0006Mm-ND; Mon, 11 Dec 2023 16:23:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rCnkL-0006Eu-45
 for qemu-riscv@nongnu.org; Mon, 11 Dec 2023 16:23:25 -0500
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rCnkH-0005u1-Ev
 for qemu-riscv@nongnu.org; Mon, 11 Dec 2023 16:23:24 -0500
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-54dca2a3f16so9102528a12.0
 for <qemu-riscv@nongnu.org>; Mon, 11 Dec 2023 13:23:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702329799; x=1702934599; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TrH87JADUqY5Kw0eD6wsc0cK28jLqdwv6cP8Q5jpsTk=;
 b=Zhh7DdkYVOmQUXE/YCMGhmDQdv7RpNFMEbmvVPMP0FH8nlJmixZLP4t/2mjwug9/lP
 0SpQDK++tg/QSxKGJzi4Zb4eJNdFXEaQk5bP1QcvaINWVlin2yj/R4T+Qe9WRSXhSeg/
 LMZLWXPcBkJ6ITAIJ1WKFYoKCUJyD2ahtGlY1pbok4hjjpFxPYu9MadPiKryXUqY03P2
 AiNTFLdqsvQ7cqSzbxlcJfG2MA06WSUcFwGxIaryMCe3AOsSgDL4dI6kiN5kJRwSNyEq
 iMc4ouCci8YiYQTFnynzVZREhler97kV2y9YMyJ2F5HA7efiA543FXMps1sFwaMKvF4c
 s+2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702329799; x=1702934599;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TrH87JADUqY5Kw0eD6wsc0cK28jLqdwv6cP8Q5jpsTk=;
 b=dR5BvXRLS5tRaKbVzFAzrNpJfNUYXr7rmxnh78xRYMLjJikZ7t29yWkETvv98QOgXQ
 4XG0mZpqUCrfJg635PTflSLSHBi7gCJoVYEQ2rftA/Gq4LeJToIrIeqsgJZuFDv0YwWD
 SM+Qpe8/aozoAMAYFnSI59z+x1IAm8BvguPrbHYayFvc1x6uNYr/P2AWhk8yZFFFK5im
 WV98LBCYHDSYeKVTVTYu2dAvHK7T/y93cZKLsdSk2eyXDZyQMZhrHC9iG0JbDDOljy6P
 1B+CzI5aFXYkEi854QB0NxWmj1wb5jCk0xKFzEiROhRzo8XE+CzLtfip/EQdSbtihdNx
 SWRA==
X-Gm-Message-State: AOJu0YxKLTPoSq3ZEfYkik+2HjCcvtaztGPCEEO9H06Yzz7+KKEqRKLu
 8uYgiMALixMgnpWy9LYFlB0Iow==
X-Google-Smtp-Source: AGHT+IEPs/HLylsdJONZTYAV/A+IZFM5uIjCd/rMDp0pOgH4KEel8fi4LA/CSQJVsXRRElNxsO4tiA==
X-Received: by 2002:a50:8756:0:b0:54c:83d0:39e2 with SMTP id
 22-20020a508756000000b0054c83d039e2mr4605531edv.21.1702329799043; 
 Mon, 11 Dec 2023 13:23:19 -0800 (PST)
Received: from m1x-phil.lan ([176.176.175.193])
 by smtp.gmail.com with ESMTPSA id
 a15-20020a50c30f000000b0054bde4df7f0sm4146593edb.66.2023.12.11.13.23.13
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 11 Dec 2023 13:23:18 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>, Peter Xu <peterx@redhat.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-riscv@nongnu.org, David Hildenbrand <david@redhat.com>,
 Warner Losh <imp@bsdimp.com>, Claudio Fontana <cfontana@suse.de>,
 Brian Cain <bcain@quicinc.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Riku Voipio <riku.voipio@iki.fi>, Kyle Evans <kevans@freebsd.org>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>, Michael Rolnik <mrolnik@gmail.com>,
 Song Gao <gaosong@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>,
 Stafford Horne <shorne@gmail.com>, Nicholas Piggin <npiggin@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liwei1518@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Max Filippov <jcmvbkbc@gmail.com>
Subject: [PATCH 23/24] exec/cpu-all: Extract page-protection definitions to
 page-prot-common.h
Date: Mon, 11 Dec 2023 22:20:00 +0100
Message-ID: <20231211212003.21686-24-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231211212003.21686-1-philmd@linaro.org>
References: <20231211212003.21686-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Extract page-protection definitions from "exec/cpu-all.h"
to "exec/page-prot-common.h".

The list of files requiring the new header was generated
using:

$ git grep -wE \
  'PAGE_(READ|WRITE|EXEC|BITS|VALID|ANON|RESERVED|TARGET_.|PASSTHROUGH)'

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 bsd-user/bsd-mem.h                   |  1 +
 bsd-user/qemu.h                      |  1 +
 include/exec/cpu-all.h               | 35 +------------------------
 include/exec/page-prot-common.h      | 38 ++++++++++++++++++++++++++++
 include/semihosting/uaccess.h        |  1 +
 target/arm/cpu.h                     |  1 +
 target/ppc/internal.h                |  1 +
 target/ppc/mmu-radix64.h             |  2 ++
 accel/tcg/cputlb.c                   |  1 +
 accel/tcg/tb-maint.c                 |  1 +
 accel/tcg/user-exec.c                |  1 +
 bsd-user/mmap.c                      |  1 +
 bsd-user/signal.c                    |  1 +
 cpu-target.c                         |  1 +
 hw/ppc/ppc440_bamboo.c               |  1 +
 hw/ppc/sam460ex.c                    |  1 +
 hw/ppc/virtex_ml507.c                |  1 +
 linux-user/arm/cpu_loop.c            |  1 +
 linux-user/elfload.c                 |  1 +
 linux-user/mmap.c                    |  1 +
 linux-user/nios2/cpu_loop.c          |  1 +
 linux-user/signal.c                  |  1 +
 linux-user/syscall.c                 |  1 +
 system/physmem.c                     |  1 +
 target/alpha/helper.c                |  1 +
 target/arm/ptw.c                     |  1 +
 target/arm/tcg/m_helper.c            |  1 +
 target/arm/tcg/mte_helper.c          |  1 +
 target/arm/tcg/sve_helper.c          |  1 +
 target/avr/helper.c                  |  1 +
 target/cris/mmu.c                    |  1 +
 target/hppa/mem_helper.c             |  1 +
 target/hppa/translate.c              |  1 +
 target/i386/tcg/sysemu/excp_helper.c |  1 +
 target/loongarch/tlb_helper.c        |  1 +
 target/m68k/helper.c                 |  1 +
 target/microblaze/helper.c           |  1 +
 target/microblaze/mmu.c              |  1 +
 target/mips/sysemu/physaddr.c        |  1 +
 target/mips/tcg/sysemu/tlb_helper.c  |  1 +
 target/nios2/helper.c                |  1 +
 target/nios2/mmu.c                   |  1 +
 target/openrisc/mmu.c                |  1 +
 target/ppc/mmu-hash32.c              |  1 +
 target/ppc/mmu-hash64.c              |  1 +
 target/ppc/mmu-radix64.c             |  1 +
 target/ppc/mmu_common.c              |  1 +
 target/ppc/mmu_helper.c              |  1 +
 target/riscv/cpu_helper.c            |  1 +
 target/riscv/pmp.c                   |  1 +
 target/riscv/vector_helper.c         |  1 +
 target/rx/cpu.c                      |  1 +
 target/s390x/mmu_helper.c            |  1 +
 target/s390x/tcg/mem_helper.c        |  1 +
 target/sh4/helper.c                  |  1 +
 target/sparc/ldst_helper.c           |  1 +
 target/sparc/mmu_helper.c            |  1 +
 target/tricore/helper.c              |  1 +
 target/xtensa/mmu_helper.c           |  1 +
 target/xtensa/op_helper.c            |  1 +
 60 files changed, 98 insertions(+), 34 deletions(-)
 create mode 100644 include/exec/page-prot-common.h

diff --git a/bsd-user/bsd-mem.h b/bsd-user/bsd-mem.h
index 21d9bab889..f95472bcab 100644
--- a/bsd-user/bsd-mem.h
+++ b/bsd-user/bsd-mem.h
@@ -56,6 +56,7 @@
 #include <fcntl.h>
 
 #include "qemu-bsd.h"
+#include "exec/page-prot-common.h"
 
 extern struct bsd_shm_regions bsd_shm_regions[];
 extern abi_ulong target_brk;
diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
index dc842fffa7..1e38d2cb66 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -36,6 +36,7 @@ extern char **environ;
 #include "target_os_signal.h"
 #include "target.h"
 #include "exec/gdbstub.h"
+#include "exec/page-prot-common.h"
 #include "qemu/clang-tsa.h"
 
 #include "qemu-os.h"
diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index 5b75d04ff6..881288a4de 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -19,6 +19,7 @@
 #ifndef CPU_ALL_H
 #define CPU_ALL_H
 
+#include "exec/page-prot-common.h"
 #include "exec/cpu-common.h"
 #include "exec/memory.h"
 #include "exec/tswap.h"
@@ -165,40 +166,6 @@ extern const TargetPageBits target_page;
 
 #define TARGET_PAGE_ALIGN(addr) ROUND_UP((addr), TARGET_PAGE_SIZE)
 
-/* same as PROT_xxx */
-#define PAGE_READ      0x0001
-#define PAGE_WRITE     0x0002
-#define PAGE_EXEC      0x0004
-#define PAGE_BITS      (PAGE_READ | PAGE_WRITE | PAGE_EXEC)
-#define PAGE_VALID     0x0008
-/*
- * Original state of the write flag (used when tracking self-modifying code)
- */
-#define PAGE_WRITE_ORG 0x0010
-/*
- * Invalidate the TLB entry immediately, helpful for s390x
- * Low-Address-Protection. Used with PAGE_WRITE in tlb_set_page_with_attrs()
- */
-#define PAGE_WRITE_INV 0x0020
-/* For use with page_set_flags: page is being replaced; target_data cleared. */
-#define PAGE_RESET     0x0040
-/* For linux-user, indicates that the page is MAP_ANON. */
-#define PAGE_ANON      0x0080
-
-#if defined(CONFIG_BSD) && defined(CONFIG_USER_ONLY)
-/* FIXME: Code that sets/uses this is broken and needs to go away.  */
-#define PAGE_RESERVED  0x0100
-#endif
-/* Target-specific bits that will be used via page_get_flags().  */
-#define PAGE_TARGET_1  0x0200
-#define PAGE_TARGET_2  0x0400
-
-/*
- * For linux-user, indicates that the page is mapped with the same semantics
- * in both guest and host.
- */
-#define PAGE_PASSTHROUGH 0x0800
-
 #if defined(CONFIG_USER_ONLY)
 void page_dump(FILE *f);
 
diff --git a/include/exec/page-prot-common.h b/include/exec/page-prot-common.h
new file mode 100644
index 0000000000..a38157e8b9
--- /dev/null
+++ b/include/exec/page-prot-common.h
@@ -0,0 +1,38 @@
+#ifndef EXEC_PAGE_PROT_COMMON_H
+#define EXEC_PAGE_PROT_COMMON_H
+
+/* same as PROT_xxx */
+#define PAGE_READ      0x0001
+#define PAGE_WRITE     0x0002
+#define PAGE_EXEC      0x0004
+#define PAGE_BITS      (PAGE_READ | PAGE_WRITE | PAGE_EXEC)
+#define PAGE_VALID     0x0008
+/*
+ * Original state of the write flag (used when tracking self-modifying code)
+ */
+#define PAGE_WRITE_ORG 0x0010
+/*
+ * Invalidate the TLB entry immediately, helpful for s390x
+ * Low-Address-Protection. Used with PAGE_WRITE in tlb_set_page_with_attrs()
+ */
+#define PAGE_WRITE_INV 0x0020
+/* For use with page_set_flags: page is being replaced; target_data cleared. */
+#define PAGE_RESET     0x0040
+/* For linux-user, indicates that the page is MAP_ANON. */
+#define PAGE_ANON      0x0080
+
+#if defined(CONFIG_BSD) && defined(CONFIG_USER_ONLY)
+/* FIXME: Code that sets/uses this is broken and needs to go away.  */
+#define PAGE_RESERVED  0x0100
+#endif
+/* Target-specific bits that will be used via page_get_flags().  */
+#define PAGE_TARGET_1  0x0200
+#define PAGE_TARGET_2  0x0400
+
+/*
+ * For linux-user, indicates that the page is mapped with the same semantics
+ * in both guest and host.
+ */
+#define PAGE_PASSTHROUGH 0x0800
+
+#endif
diff --git a/include/semihosting/uaccess.h b/include/semihosting/uaccess.h
index 6c8835fbcb..02783cca33 100644
--- a/include/semihosting/uaccess.h
+++ b/include/semihosting/uaccess.h
@@ -15,6 +15,7 @@
 #endif
 
 #include "exec/cpu-defs.h"
+#include "exec/page-prot-common.h"
 
 #define get_user_u64(val, addr)                                         \
     ({ uint64_t val_ = 0;                                               \
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index ea5c8660dc..c14012e07d 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -25,6 +25,7 @@
 #include "hw/registerfields.h"
 #include "cpu-qom.h"
 #include "exec/cpu-defs.h"
+#include "exec/page-prot-common.h"
 #include "qapi/qapi-types-common.h"
 
 #ifdef TARGET_AARCH64
diff --git a/target/ppc/internal.h b/target/ppc/internal.h
index 5b20ecbd33..6bcfbcbed8 100644
--- a/target/ppc/internal.h
+++ b/target/ppc/internal.h
@@ -19,6 +19,7 @@
 #define PPC_INTERNAL_H
 
 #include "hw/registerfields.h"
+#include "exec/page-prot-common.h"
 
 /* PM instructions */
 typedef enum {
diff --git a/target/ppc/mmu-radix64.h b/target/ppc/mmu-radix64.h
index 4c768aa5cc..1a3fd8f65b 100644
--- a/target/ppc/mmu-radix64.h
+++ b/target/ppc/mmu-radix64.h
@@ -3,6 +3,8 @@
 
 #ifndef CONFIG_USER_ONLY
 
+#include "exec/page-prot-common.h"
+
 /* Radix Quadrants */
 #define R_EADDR_MASK            0x3FFFFFFFFFFFFFFF
 #define R_EADDR_VALID_MASK      0xC00FFFFFFFFFFFFF
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index c4500d3261..db154fe5ff 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -21,6 +21,7 @@
 #include "qemu/main-loop.h"
 #include "hw/core/tcg-cpu-ops.h"
 #include "exec/exec-all.h"
+#include "exec/page-prot-common.h"
 #include "exec/memory.h"
 #include "exec/cpu_ldst.h"
 #include "exec/cputlb.h"
diff --git a/accel/tcg/tb-maint.c b/accel/tcg/tb-maint.c
index da39a43bd8..717e31e602 100644
--- a/accel/tcg/tb-maint.c
+++ b/accel/tcg/tb-maint.c
@@ -23,6 +23,7 @@
 #include "exec/cputlb.h"
 #include "exec/log.h"
 #include "exec/exec-all.h"
+#include "exec/page-prot-common.h"
 #include "exec/tb-flush.h"
 #include "exec/translate-all.h"
 #include "sysemu/tcg.h"
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index 2575f0842f..5ce602b8d6 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -25,6 +25,7 @@
 #include "qemu/rcu.h"
 #include "exec/cpu_ldst.h"
 #include "exec/translate-all.h"
+#include "exec/page-prot-common.h"
 #include "exec/helper-proto.h"
 #include "qemu/atomic128.h"
 #include "trace/trace-root.h"
diff --git a/bsd-user/mmap.c b/bsd-user/mmap.c
index 3ef11b2807..deb384605e 100644
--- a/bsd-user/mmap.c
+++ b/bsd-user/mmap.c
@@ -17,6 +17,7 @@
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 #include "qemu/osdep.h"
+#include "exec/page-prot-common.h"
 
 #include "qemu.h"
 
diff --git a/bsd-user/signal.c b/bsd-user/signal.c
index ca31470772..faf2062123 100644
--- a/bsd-user/signal.c
+++ b/bsd-user/signal.c
@@ -21,6 +21,7 @@
 #include "qemu/osdep.h"
 #include "qemu/log.h"
 #include "qemu.h"
+#include "exec/page-prot-common.h"
 #include "gdbstub/user.h"
 #include "signal-common.h"
 #include "trace.h"
diff --git a/cpu-target.c b/cpu-target.c
index 997ca2e846..d1953ec037 100644
--- a/cpu-target.c
+++ b/cpu-target.c
@@ -21,6 +21,7 @@
 #include "qapi/error.h"
 
 #include "exec/target_page.h"
+#include "exec/page-prot-common.h"
 #include "hw/qdev-core.h"
 #include "hw/qdev-properties.h"
 #include "qemu/error-report.h"
diff --git a/hw/ppc/ppc440_bamboo.c b/hw/ppc/ppc440_bamboo.c
index a189942de4..45a215be6d 100644
--- a/hw/ppc/ppc440_bamboo.c
+++ b/hw/ppc/ppc440_bamboo.c
@@ -15,6 +15,7 @@
 #include "qemu/units.h"
 #include "qemu/datadir.h"
 #include "qemu/error-report.h"
+#include "exec/page-prot-common.h"
 #include "net/net.h"
 #include "hw/pci/pci.h"
 #include "hw/boards.h"
diff --git a/hw/ppc/sam460ex.c b/hw/ppc/sam460ex.c
index 1e615b8d35..ffe467fb16 100644
--- a/hw/ppc/sam460ex.c
+++ b/hw/ppc/sam460ex.c
@@ -21,6 +21,7 @@
 #include "kvm_ppc.h"
 #include "sysemu/device_tree.h"
 #include "sysemu/block-backend.h"
+#include "exec/page-prot-common.h"
 #include "hw/loader.h"
 #include "elf.h"
 #include "exec/memory.h"
diff --git a/hw/ppc/virtex_ml507.c b/hw/ppc/virtex_ml507.c
index d02f330650..e2da13c064 100644
--- a/hw/ppc/virtex_ml507.c
+++ b/hw/ppc/virtex_ml507.c
@@ -25,6 +25,7 @@
 #include "qemu/osdep.h"
 #include "qemu/datadir.h"
 #include "qemu/units.h"
+#include "exec/page-prot-common.h"
 #include "cpu.h"
 #include "hw/sysbus.h"
 #include "hw/char/serial.h"
diff --git a/linux-user/arm/cpu_loop.c b/linux-user/arm/cpu_loop.c
index b404117ff3..0d05daea91 100644
--- a/linux-user/arm/cpu_loop.c
+++ b/linux-user/arm/cpu_loop.c
@@ -24,6 +24,7 @@
 #include "cpu_loop-common.h"
 #include "signal-common.h"
 #include "semihosting/common-semi.h"
+#include "exec/page-prot-common.h"
 #include "target/arm/syndrome.h"
 
 #define get_user_code_u32(x, gaddr, env)                \
diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index f9e9ac1760..11c45ab293 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -7,6 +7,7 @@
 
 #include "qemu.h"
 #include "exec/user/guest-base.h"
+#include "exec/page-prot-common.h"
 #include "user-internals.h"
 #include "signal-common.h"
 #include "loader.h"
diff --git a/linux-user/mmap.c b/linux-user/mmap.c
index 96c9433e27..d37803fc8c 100644
--- a/linux-user/mmap.c
+++ b/linux-user/mmap.c
@@ -20,6 +20,7 @@
 #include <sys/shm.h>
 #include "trace.h"
 #include "exec/log.h"
+#include "exec/page-prot-common.h"
 #include "qemu.h"
 #include "user-internals.h"
 #include "user-mmap.h"
diff --git a/linux-user/nios2/cpu_loop.c b/linux-user/nios2/cpu_loop.c
index da77ede76b..03434abe3b 100644
--- a/linux-user/nios2/cpu_loop.c
+++ b/linux-user/nios2/cpu_loop.c
@@ -22,6 +22,7 @@
 #include "user-internals.h"
 #include "cpu_loop-common.h"
 #include "signal-common.h"
+#include "exec/page-prot-common.h"
 
 void cpu_loop(CPUNios2State *env)
 {
diff --git a/linux-user/signal.c b/linux-user/signal.c
index b35d1e512f..50cba136db 100644
--- a/linux-user/signal.c
+++ b/linux-user/signal.c
@@ -19,6 +19,7 @@
 #include "qemu/osdep.h"
 #include "qemu/bitops.h"
 #include "gdbstub/user.h"
+#include "exec/page-prot-common.h"
 #include "hw/core/tcg-cpu-ops.h"
 
 #include <sys/ucontext.h>
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index e384e14248..3d2467d7c8 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -25,6 +25,7 @@
 #include "qemu/plugin.h"
 #include "tcg/startup.h"
 #include "target_mman.h"
+#include "exec/page-prot-common.h"
 #include <elf.h>
 #include <endian.h>
 #include <grp.h>
diff --git a/system/physmem.c b/system/physmem.c
index 4bdb3d0592..0bea47b5d2 100644
--- a/system/physmem.c
+++ b/system/physmem.c
@@ -31,6 +31,7 @@
 #endif /* CONFIG_TCG */
 
 #include "exec/exec-all.h"
+#include "exec/page-prot-common.h"
 #include "exec/target_page.h"
 #include "hw/qdev-core.h"
 #include "hw/qdev-properties.h"
diff --git a/target/alpha/helper.c b/target/alpha/helper.c
index 970c869771..ea7a769644 100644
--- a/target/alpha/helper.c
+++ b/target/alpha/helper.c
@@ -21,6 +21,7 @@
 #include "qemu/log.h"
 #include "cpu.h"
 #include "exec/exec-all.h"
+#include "exec/page-prot-common.h"
 #include "fpu/softfloat-types.h"
 #include "exec/helper-proto.h"
 #include "qemu/qemu-print.h"
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 1762b058ae..5eca492db4 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -11,6 +11,7 @@
 #include "qemu/range.h"
 #include "qemu/main-loop.h"
 #include "exec/exec-all.h"
+#include "exec/page-prot-common.h"
 #include "cpu.h"
 #include "internals.h"
 #include "cpu-features.h"
diff --git a/target/arm/tcg/m_helper.c b/target/arm/tcg/m_helper.c
index a26adb75aa..1198b32929 100644
--- a/target/arm/tcg/m_helper.c
+++ b/target/arm/tcg/m_helper.c
@@ -16,6 +16,7 @@
 #include "qemu/bitops.h"
 #include "qemu/log.h"
 #include "exec/exec-all.h"
+#include "exec/page-prot-common.h"
 #ifdef CONFIG_TCG
 #include "exec/cpu_ldst.h"
 #include "semihosting/common-semi.h"
diff --git a/target/arm/tcg/mte_helper.c b/target/arm/tcg/mte_helper.c
index ffb8ea1c34..47f512e6c6 100644
--- a/target/arm/tcg/mte_helper.c
+++ b/target/arm/tcg/mte_helper.c
@@ -22,6 +22,7 @@
 #include "cpu.h"
 #include "internals.h"
 #include "exec/exec-all.h"
+#include "exec/page-prot-common.h"
 #include "exec/ram_addr.h"
 #include "exec/cpu_ldst.h"
 #include "exec/helper-proto.h"
diff --git a/target/arm/tcg/sve_helper.c b/target/arm/tcg/sve_helper.c
index f006d152cc..7713b7a4d4 100644
--- a/target/arm/tcg/sve_helper.c
+++ b/target/arm/tcg/sve_helper.c
@@ -21,6 +21,7 @@
 #include "cpu.h"
 #include "internals.h"
 #include "exec/exec-all.h"
+#include "exec/page-prot-common.h"
 #include "exec/helper-proto.h"
 #include "tcg/tcg-gvec-desc.h"
 #include "fpu/softfloat.h"
diff --git a/target/avr/helper.c b/target/avr/helper.c
index fdc9884ea0..62758b00ed 100644
--- a/target/avr/helper.c
+++ b/target/avr/helper.c
@@ -24,6 +24,7 @@
 #include "cpu.h"
 #include "hw/core/tcg-cpu-ops.h"
 #include "exec/exec-all.h"
+#include "exec/page-prot-common.h"
 #include "exec/cpu_ldst.h"
 #include "exec/address-spaces.h"
 #include "exec/helper-proto.h"
diff --git a/target/cris/mmu.c b/target/cris/mmu.c
index b574ec6e5b..dee485419d 100644
--- a/target/cris/mmu.c
+++ b/target/cris/mmu.c
@@ -21,6 +21,7 @@
 #include "qemu/osdep.h"
 #include "cpu.h"
 #include "exec/exec-all.h"
+#include "exec/page-prot-common.h"
 #include "mmu.h"
 
 #ifdef DEBUG
diff --git a/target/hppa/mem_helper.c b/target/hppa/mem_helper.c
index 08abd1a9f9..0d78e273f6 100644
--- a/target/hppa/mem_helper.c
+++ b/target/hppa/mem_helper.c
@@ -21,6 +21,7 @@
 #include "qemu/log.h"
 #include "cpu.h"
 #include "exec/exec-all.h"
+#include "exec/page-prot-common.h"
 #include "exec/helper-proto.h"
 #include "hw/core/cpu.h"
 #include "trace.h"
diff --git a/target/hppa/translate.c b/target/hppa/translate.c
index 3ef39b1bd7..7e3867e4aa 100644
--- a/target/hppa/translate.c
+++ b/target/hppa/translate.c
@@ -22,6 +22,7 @@
 #include "disas/disas.h"
 #include "qemu/host-utils.h"
 #include "exec/exec-all.h"
+#include "exec/page-prot-common.h"
 #include "tcg/tcg-op.h"
 #include "tcg/tcg-op-gvec.h"
 #include "exec/helper-proto.h"
diff --git a/target/i386/tcg/sysemu/excp_helper.c b/target/i386/tcg/sysemu/excp_helper.c
index 5b86f439ad..a3bf3b7292 100644
--- a/target/i386/tcg/sysemu/excp_helper.c
+++ b/target/i386/tcg/sysemu/excp_helper.c
@@ -21,6 +21,7 @@
 #include "cpu.h"
 #include "exec/cpu_ldst.h"
 #include "exec/exec-all.h"
+#include "exec/page-prot-common.h"
 #include "tcg/helper-tcg.h"
 
 typedef struct TranslateParams {
diff --git a/target/loongarch/tlb_helper.c b/target/loongarch/tlb_helper.c
index 449043c68b..7f0e413e1e 100644
--- a/target/loongarch/tlb_helper.c
+++ b/target/loongarch/tlb_helper.c
@@ -13,6 +13,7 @@
 #include "internals.h"
 #include "exec/helper-proto.h"
 #include "exec/exec-all.h"
+#include "exec/page-prot-common.h"
 #include "exec/cpu_ldst.h"
 #include "exec/log.h"
 #include "cpu-csr.h"
diff --git a/target/m68k/helper.c b/target/m68k/helper.c
index 0a1544cd68..7a69c4a28d 100644
--- a/target/m68k/helper.c
+++ b/target/m68k/helper.c
@@ -21,6 +21,7 @@
 #include "qemu/osdep.h"
 #include "cpu.h"
 #include "exec/exec-all.h"
+#include "exec/page-prot-common.h"
 #include "exec/gdbstub.h"
 #include "exec/helper-proto.h"
 #include "gdbstub/helpers.h"
diff --git a/target/microblaze/helper.c b/target/microblaze/helper.c
index 98bdb82de8..e4ce57560d 100644
--- a/target/microblaze/helper.c
+++ b/target/microblaze/helper.c
@@ -21,6 +21,7 @@
 #include "qemu/osdep.h"
 #include "cpu.h"
 #include "exec/exec-all.h"
+#include "exec/page-prot-common.h"
 #include "qemu/host-utils.h"
 #include "exec/log.h"
 
diff --git a/target/microblaze/mmu.c b/target/microblaze/mmu.c
index 75651979a9..c0b0844f71 100644
--- a/target/microblaze/mmu.c
+++ b/target/microblaze/mmu.c
@@ -22,6 +22,7 @@
 #include "qemu/log.h"
 #include "cpu.h"
 #include "exec/exec-all.h"
+#include "exec/page-prot-common.h"
 
 static unsigned int tlb_decode_size(unsigned int f)
 {
diff --git a/target/mips/sysemu/physaddr.c b/target/mips/sysemu/physaddr.c
index 05990aa5bb..7ac51c6019 100644
--- a/target/mips/sysemu/physaddr.c
+++ b/target/mips/sysemu/physaddr.c
@@ -19,6 +19,7 @@
 #include "qemu/osdep.h"
 #include "cpu.h"
 #include "exec/exec-all.h"
+#include "exec/page-prot-common.h"
 #include "../internal.h"
 
 static int is_seg_am_mapped(unsigned int am, bool eu, int mmu_idx)
diff --git a/target/mips/tcg/sysemu/tlb_helper.c b/target/mips/tcg/sysemu/tlb_helper.c
index 4ede904800..d0cb46bd1b 100644
--- a/target/mips/tcg/sysemu/tlb_helper.c
+++ b/target/mips/tcg/sysemu/tlb_helper.c
@@ -22,6 +22,7 @@
 #include "cpu.h"
 #include "internal.h"
 #include "exec/exec-all.h"
+#include "exec/page-prot-common.h"
 #include "exec/cpu_ldst.h"
 #include "exec/log.h"
 #include "exec/helper-proto.h"
diff --git a/target/nios2/helper.c b/target/nios2/helper.c
index bb3b09e5a7..b64caa11f6 100644
--- a/target/nios2/helper.c
+++ b/target/nios2/helper.c
@@ -23,6 +23,7 @@
 #include "cpu.h"
 #include "qemu/host-utils.h"
 #include "exec/exec-all.h"
+#include "exec/page-prot-common.h"
 #include "exec/cpu_ldst.h"
 #include "exec/log.h"
 #include "exec/helper-proto.h"
diff --git a/target/nios2/mmu.c b/target/nios2/mmu.c
index d9b690b78e..da7f20cc07 100644
--- a/target/nios2/mmu.c
+++ b/target/nios2/mmu.c
@@ -22,6 +22,7 @@
 #include "qemu/qemu-print.h"
 #include "cpu.h"
 #include "exec/exec-all.h"
+#include "exec/page-prot-common.h"
 #include "mmu.h"
 #include "exec/helper-proto.h"
 #include "trace/trace-target_nios2.h"
diff --git a/target/openrisc/mmu.c b/target/openrisc/mmu.c
index 603c26715e..6ca7cc023e 100644
--- a/target/openrisc/mmu.c
+++ b/target/openrisc/mmu.c
@@ -22,6 +22,7 @@
 #include "qemu/log.h"
 #include "cpu.h"
 #include "exec/exec-all.h"
+#include "exec/page-prot-common.h"
 #include "gdbstub/helpers.h"
 #include "qemu/host-utils.h"
 #include "hw/loader.h"
diff --git a/target/ppc/mmu-hash32.c b/target/ppc/mmu-hash32.c
index 3976416840..da446632c9 100644
--- a/target/ppc/mmu-hash32.c
+++ b/target/ppc/mmu-hash32.c
@@ -21,6 +21,7 @@
 #include "qemu/osdep.h"
 #include "cpu.h"
 #include "exec/exec-all.h"
+#include "exec/page-prot-common.h"
 #include "sysemu/kvm.h"
 #include "kvm_ppc.h"
 #include "internal.h"
diff --git a/target/ppc/mmu-hash64.c b/target/ppc/mmu-hash64.c
index d645c0bb94..1633a0e5d0 100644
--- a/target/ppc/mmu-hash64.c
+++ b/target/ppc/mmu-hash64.c
@@ -21,6 +21,7 @@
 #include "qemu/units.h"
 #include "cpu.h"
 #include "exec/exec-all.h"
+#include "exec/page-prot-common.h"
 #include "qemu/error-report.h"
 #include "qemu/qemu-print.h"
 #include "sysemu/hw_accel.h"
diff --git a/target/ppc/mmu-radix64.c b/target/ppc/mmu-radix64.c
index 5823e039e6..13f5ed7fb7 100644
--- a/target/ppc/mmu-radix64.c
+++ b/target/ppc/mmu-radix64.c
@@ -20,6 +20,7 @@
 #include "qemu/osdep.h"
 #include "cpu.h"
 #include "exec/exec-all.h"
+#include "exec/page-prot-common.h"
 #include "qemu/error-report.h"
 #include "sysemu/kvm.h"
 #include "kvm_ppc.h"
diff --git a/target/ppc/mmu_common.c b/target/ppc/mmu_common.c
index 6ca5d12207..83a91a92ea 100644
--- a/target/ppc/mmu_common.c
+++ b/target/ppc/mmu_common.c
@@ -25,6 +25,7 @@
 #include "mmu-hash64.h"
 #include "mmu-hash32.h"
 #include "exec/exec-all.h"
+#include "exec/page-prot-common.h"
 #include "exec/log.h"
 #include "helper_regs.h"
 #include "qemu/error-report.h"
diff --git a/target/ppc/mmu_helper.c b/target/ppc/mmu_helper.c
index f87d35379a..6368dceb16 100644
--- a/target/ppc/mmu_helper.c
+++ b/target/ppc/mmu_helper.c
@@ -25,6 +25,7 @@
 #include "mmu-hash64.h"
 #include "mmu-hash32.h"
 #include "exec/exec-all.h"
+#include "exec/page-prot-common.h"
 #include "exec/log.h"
 #include "helper_regs.h"
 #include "qemu/error-report.h"
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index e7e23b34f4..565e6614d9 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -24,6 +24,7 @@
 #include "internals.h"
 #include "pmu.h"
 #include "exec/exec-all.h"
+#include "exec/page-prot-common.h"
 #include "instmap.h"
 #include "tcg/tcg-op.h"
 #include "trace.h"
diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
index 162e88a90a..59f4c3d481 100644
--- a/target/riscv/pmp.c
+++ b/target/riscv/pmp.c
@@ -25,6 +25,7 @@
 #include "cpu.h"
 #include "trace.h"
 #include "exec/exec-all.h"
+#include "exec/page-prot-common.h"
 
 static bool pmp_write_cfg(CPURISCVState *env, uint32_t addr_index,
                           uint8_t val);
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index c1c3a4d1ea..968bff34f2 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -22,6 +22,7 @@
 #include "cpu.h"
 #include "exec/memop.h"
 #include "exec/exec-all.h"
+#include "exec/page-prot-common.h"
 #include "exec/cpu_ldst.h"
 #include "exec/helper-proto.h"
 #include "fpu/softfloat.h"
diff --git a/target/rx/cpu.c b/target/rx/cpu.c
index 9cc9d9d15e..6cc3173a1e 100644
--- a/target/rx/cpu.c
+++ b/target/rx/cpu.c
@@ -22,6 +22,7 @@
 #include "cpu.h"
 #include "migration/vmstate.h"
 #include "exec/exec-all.h"
+#include "exec/page-prot-common.h"
 #include "hw/loader.h"
 #include "fpu/softfloat.h"
 #include "tcg/debug-assert.h"
diff --git a/target/s390x/mmu_helper.c b/target/s390x/mmu_helper.c
index fbb2f1b4d4..0b2240e39a 100644
--- a/target/s390x/mmu_helper.c
+++ b/target/s390x/mmu_helper.c
@@ -24,6 +24,7 @@
 #include "sysemu/kvm.h"
 #include "sysemu/tcg.h"
 #include "exec/exec-all.h"
+#include "exec/page-prot-common.h"
 #include "trace.h"
 #include "hw/hw.h"
 #include "hw/s390x/storage-keys.h"
diff --git a/target/s390x/tcg/mem_helper.c b/target/s390x/tcg/mem_helper.c
index 84103251b9..2a8ee4df6b 100644
--- a/target/s390x/tcg/mem_helper.c
+++ b/target/s390x/tcg/mem_helper.c
@@ -25,6 +25,7 @@
 #include "tcg_s390x.h"
 #include "exec/helper-proto.h"
 #include "exec/exec-all.h"
+#include "exec/page-prot-common.h"
 #include "exec/cpu_ldst.h"
 #include "hw/core/tcg-cpu-ops.h"
 #include "qemu/int128.h"
diff --git a/target/sh4/helper.c b/target/sh4/helper.c
index 5a6f653c12..c9f41d1e2e 100644
--- a/target/sh4/helper.c
+++ b/target/sh4/helper.c
@@ -21,6 +21,7 @@
 
 #include "cpu.h"
 #include "exec/exec-all.h"
+#include "exec/page-prot-common.h"
 #include "exec/log.h"
 
 #if !defined(CONFIG_USER_ONLY)
diff --git a/target/sparc/ldst_helper.c b/target/sparc/ldst_helper.c
index 09066d5487..078e25e363 100644
--- a/target/sparc/ldst_helper.c
+++ b/target/sparc/ldst_helper.c
@@ -23,6 +23,7 @@
 #include "tcg/tcg.h"
 #include "exec/helper-proto.h"
 #include "exec/exec-all.h"
+#include "exec/page-prot-common.h"
 #include "exec/cpu_ldst.h"
 #include "asi.h"
 
diff --git a/target/sparc/mmu_helper.c b/target/sparc/mmu_helper.c
index 453498c670..e723868148 100644
--- a/target/sparc/mmu_helper.c
+++ b/target/sparc/mmu_helper.c
@@ -21,6 +21,7 @@
 #include "qemu/log.h"
 #include "cpu.h"
 #include "exec/exec-all.h"
+#include "exec/page-prot-common.h"
 #include "qemu/qemu-print.h"
 #include "trace.h"
 
diff --git a/target/tricore/helper.c b/target/tricore/helper.c
index 7e5da3cb23..e736630a79 100644
--- a/target/tricore/helper.c
+++ b/target/tricore/helper.c
@@ -20,6 +20,7 @@
 #include "hw/registerfields.h"
 #include "cpu.h"
 #include "exec/exec-all.h"
+#include "exec/page-prot-common.h"
 #include "fpu/softfloat-helpers.h"
 #include "qemu/qemu-print.h"
 
diff --git a/target/xtensa/mmu_helper.c b/target/xtensa/mmu_helper.c
index 12552a3347..d7611f1168 100644
--- a/target/xtensa/mmu_helper.c
+++ b/target/xtensa/mmu_helper.c
@@ -33,6 +33,7 @@
 #include "exec/helper-proto.h"
 #include "qemu/host-utils.h"
 #include "exec/exec-all.h"
+#include "exec/page-prot-common.h"
 
 #define XTENSA_MPU_SEGMENT_MASK 0x0000001f
 #define XTENSA_MPU_ACC_RIGHTS_MASK 0x00000f00
diff --git a/target/xtensa/op_helper.c b/target/xtensa/op_helper.c
index 496754ba57..a9048ad6ac 100644
--- a/target/xtensa/op_helper.c
+++ b/target/xtensa/op_helper.c
@@ -28,6 +28,7 @@
 #include "qemu/osdep.h"
 #include "cpu.h"
 #include "exec/helper-proto.h"
+#include "exec/page-prot-common.h"
 #include "qemu/host-utils.h"
 #include "exec/exec-all.h"
 #include "qemu/atomic.h"
-- 
2.41.0


