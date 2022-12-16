Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p6IgU-00040k-Tf
	for mharc-qemu-riscv@gnu.org; Fri, 16 Dec 2022 16:56:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6IgJ-0003qe-Cc
 for qemu-riscv@nongnu.org; Fri, 16 Dec 2022 16:55:52 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6IgF-0003Bu-Tc
 for qemu-riscv@nongnu.org; Fri, 16 Dec 2022 16:55:51 -0500
Received: by mail-ej1-x634.google.com with SMTP id gh17so9234801ejb.6
 for <qemu-riscv@nongnu.org>; Fri, 16 Dec 2022 13:55:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F/kI97qEt1tFARlPg9UOLL2nO8qn7uZqt/zuef1mJmc=;
 b=xcVRZWValRKGYetxMMMbiK+OptPAW5yUPYI+cmkSD5gWnqbLx2ljTMmtZp8MgxS11z
 Qs4pv9pRTXMYjHSJKSgca768dR1xWRwuko7ypg5MHNaGz4xOSZTWT0UfsFGke7pcoooY
 iZZjv4o4RUQhmGQok0I0ETdEr8oiQWbdW6RkKTJOF5niDY0ElZxgCZGcQ0QY7mcmuo/N
 RciT2orQxYJRiecztBs18hNk2WOaGkoA5GrItSPl8BdZXNueScvKBq3JSNmK7KFYnD8J
 IwhRb9QrcotE9efIn24AktUIy7MzV1wv5b0cDFdDhfh7+IqGXfWtd81EW7MG41rt/yGW
 XU9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F/kI97qEt1tFARlPg9UOLL2nO8qn7uZqt/zuef1mJmc=;
 b=e8s6om2FAYkQTfUN9ehnTTna5sfWBOxvKbbqjmw1XZWVXQ7JW6Rpqr8ND25oj00wqS
 LI9he+hRD+cZPAQNmu74pmNLFicgJ9wEsZkgU8mUZ0lyoiArMPkSDgzL+VYeQzcvD0yr
 bwONAan0t3A8a2opNoqP8Y48qBsrYwm8vx3DBWGlkEV+vrf8xtwRLGAI7Yvb0alzLZQS
 JEp9qNVn0Z5M6mm8ca4z2STwVSt1uTD/yRvQytF3RgvEbqnzwEM0LGoEYfNI0L3X/4/u
 x3ckY/+IbMSiCNHLvoFPTs/eqpXe6Uy8RFZviypYDMGGS+TZHecA17O9lt+KL3vktGRI
 sPRQ==
X-Gm-Message-State: AFqh2krOrHIxhjhhPFvL1qWvHLXggFRluI6nImF7VKNsD3bvGDJAGK+f
 dSi/MBBjv58WC68jjc05BHcGyw==
X-Google-Smtp-Source: AMrXdXtKdePQGccI+bgbo/AdcCBdEYZiZnW+w8P1wM1B+oit1r7pdVa7AeCjzmC3+J2WPmlAmjCesg==
X-Received: by 2002:a17:907:9b04:b0:7c0:8578:f4c0 with SMTP id
 kn4-20020a1709079b0400b007c08578f4c0mr8988206ejc.67.1671227743672; 
 Fri, 16 Dec 2022 13:55:43 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 sb25-20020a170906edd900b007ad2da5668csm1275959ejb.112.2022.12.16.13.55.41
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 16 Dec 2022 13:55:43 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>, qemu-ppc@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Yanan Wang <wangyanan55@huawei.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Marek Vasut <marex@denx.de>,
 Bin Meng <bin.meng@windriver.com>, Eduardo Habkost <eduardo@habkost.net>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 qemu-riscv@nongnu.org, kvm@vger.kernel.org,
 Stafford Horne <shorne@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, Chris Wulff <crwulff@gmail.com>,
 Fabiano Rosas <farosas@suse.de>
Subject: [PATCH v3 3/5] gdbstub: Use vaddr type for generic
 insert/remove_breakpoint() API
Date: Fri, 16 Dec 2022 22:55:17 +0100
Message-Id: <20221216215519.5522-4-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221216215519.5522-1-philmd@linaro.org>
References: <20221216215519.5522-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 16 Dec 2022 21:55:54 -0000

Both insert/remove_breakpoint() handlers are used in system and
user emulation. We can not use the 'hwaddr' type on user emulation,
we have to use 'vaddr' which is defined as "wide enough to contain
any #target_ulong virtual address".

gdbstub.c doesn't require to include "exec/hwaddr.h" anymore.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Fabiano Rosas <farosas@suse.de>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 accel/kvm/kvm-all.c        | 4 ++--
 accel/kvm/kvm-cpus.h       | 4 ++--
 accel/tcg/tcg-accel-ops.c  | 4 ++--
 gdbstub/gdbstub.c          | 1 -
 gdbstub/internals.h        | 6 ++++--
 gdbstub/softmmu.c          | 5 ++---
 gdbstub/user.c             | 5 ++---
 include/sysemu/accel-ops.h | 6 +++---
 8 files changed, 17 insertions(+), 18 deletions(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index e86c33e0e6..1bb324917a 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -3219,7 +3219,7 @@ bool kvm_supports_guest_debug(void)
     return kvm_has_guest_debug;
 }
 
-int kvm_insert_breakpoint(CPUState *cpu, int type, hwaddr addr, hwaddr len)
+int kvm_insert_breakpoint(CPUState *cpu, int type, vaddr addr, vaddr len)
 {
     struct kvm_sw_breakpoint *bp;
     int err;
@@ -3257,7 +3257,7 @@ int kvm_insert_breakpoint(CPUState *cpu, int type, hwaddr addr, hwaddr len)
     return 0;
 }
 
-int kvm_remove_breakpoint(CPUState *cpu, int type, hwaddr addr, hwaddr len)
+int kvm_remove_breakpoint(CPUState *cpu, int type, vaddr addr, vaddr len)
 {
     struct kvm_sw_breakpoint *bp;
     int err;
diff --git a/accel/kvm/kvm-cpus.h b/accel/kvm/kvm-cpus.h
index fd63fe6a59..ca40add32c 100644
--- a/accel/kvm/kvm-cpus.h
+++ b/accel/kvm/kvm-cpus.h
@@ -19,8 +19,8 @@ void kvm_cpu_synchronize_post_reset(CPUState *cpu);
 void kvm_cpu_synchronize_post_init(CPUState *cpu);
 void kvm_cpu_synchronize_pre_loadvm(CPUState *cpu);
 bool kvm_supports_guest_debug(void);
-int kvm_insert_breakpoint(CPUState *cpu, int type, hwaddr addr, hwaddr len);
-int kvm_remove_breakpoint(CPUState *cpu, int type, hwaddr addr, hwaddr len);
+int kvm_insert_breakpoint(CPUState *cpu, int type, vaddr addr, vaddr len);
+int kvm_remove_breakpoint(CPUState *cpu, int type, vaddr addr, vaddr len);
 void kvm_remove_all_breakpoints(CPUState *cpu);
 
 #endif /* KVM_CPUS_H */
diff --git a/accel/tcg/tcg-accel-ops.c b/accel/tcg/tcg-accel-ops.c
index 19cbf1db3a..d9228fd403 100644
--- a/accel/tcg/tcg-accel-ops.c
+++ b/accel/tcg/tcg-accel-ops.c
@@ -116,7 +116,7 @@ static inline int xlat_gdb_type(CPUState *cpu, int gdbtype)
     return cputype;
 }
 
-static int tcg_insert_breakpoint(CPUState *cs, int type, hwaddr addr, hwaddr len)
+static int tcg_insert_breakpoint(CPUState *cs, int type, vaddr addr, vaddr len)
 {
     CPUState *cpu;
     int err = 0;
@@ -147,7 +147,7 @@ static int tcg_insert_breakpoint(CPUState *cs, int type, hwaddr addr, hwaddr len
     }
 }
 
-static int tcg_remove_breakpoint(CPUState *cs, int type, hwaddr addr, hwaddr len)
+static int tcg_remove_breakpoint(CPUState *cs, int type, vaddr addr, vaddr len)
 {
     CPUState *cpu;
     int err = 0;
diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index be88ca0d71..c3fbc31123 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -48,7 +48,6 @@
 #include "sysemu/runstate.h"
 #include "semihosting/semihost.h"
 #include "exec/exec-all.h"
-#include "exec/hwaddr.h"
 #include "sysemu/replay.h"
 
 #include "internals.h"
diff --git a/gdbstub/internals.h b/gdbstub/internals.h
index eabb0341d1..b23999f951 100644
--- a/gdbstub/internals.h
+++ b/gdbstub/internals.h
@@ -9,9 +9,11 @@
 #ifndef _INTERNALS_H_
 #define _INTERNALS_H_
 
+#include "exec/cpu-common.h"
+
 bool gdb_supports_guest_debug(void);
-int gdb_breakpoint_insert(CPUState *cs, int type, hwaddr addr, hwaddr len);
-int gdb_breakpoint_remove(CPUState *cs, int type, hwaddr addr, hwaddr len);
+int gdb_breakpoint_insert(CPUState *cs, int type, vaddr addr, vaddr len);
+int gdb_breakpoint_remove(CPUState *cs, int type, vaddr addr, vaddr len);
 void gdb_breakpoint_remove_all(CPUState *cs);
 
 #endif /* _INTERNALS_H_ */
diff --git a/gdbstub/softmmu.c b/gdbstub/softmmu.c
index f208c6cf15..129575e510 100644
--- a/gdbstub/softmmu.c
+++ b/gdbstub/softmmu.c
@@ -11,7 +11,6 @@
 
 #include "qemu/osdep.h"
 #include "exec/gdbstub.h"
-#include "exec/hwaddr.h"
 #include "sysemu/cpus.h"
 #include "internals.h"
 
@@ -24,7 +23,7 @@ bool gdb_supports_guest_debug(void)
     return false;
 }
 
-int gdb_breakpoint_insert(CPUState *cs, int type, hwaddr addr, hwaddr len)
+int gdb_breakpoint_insert(CPUState *cs, int type, vaddr addr, vaddr len)
 {
     const AccelOpsClass *ops = cpus_get_accel();
     if (ops->insert_breakpoint) {
@@ -33,7 +32,7 @@ int gdb_breakpoint_insert(CPUState *cs, int type, hwaddr addr, hwaddr len)
     return -ENOSYS;
 }
 
-int gdb_breakpoint_remove(CPUState *cs, int type, hwaddr addr, hwaddr len)
+int gdb_breakpoint_remove(CPUState *cs, int type, vaddr addr, vaddr len)
 {
     const AccelOpsClass *ops = cpus_get_accel();
     if (ops->remove_breakpoint) {
diff --git a/gdbstub/user.c b/gdbstub/user.c
index 033e5fdd71..484bd8f461 100644
--- a/gdbstub/user.c
+++ b/gdbstub/user.c
@@ -9,7 +9,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "exec/hwaddr.h"
 #include "exec/gdbstub.h"
 #include "hw/core/cpu.h"
 #include "internals.h"
@@ -20,7 +19,7 @@ bool gdb_supports_guest_debug(void)
     return true;
 }
 
-int gdb_breakpoint_insert(CPUState *cs, int type, hwaddr addr, hwaddr len)
+int gdb_breakpoint_insert(CPUState *cs, int type, vaddr addr, vaddr len)
 {
     CPUState *cpu;
     int err = 0;
@@ -41,7 +40,7 @@ int gdb_breakpoint_insert(CPUState *cs, int type, hwaddr addr, hwaddr len)
     }
 }
 
-int gdb_breakpoint_remove(CPUState *cs, int type, hwaddr addr, hwaddr len)
+int gdb_breakpoint_remove(CPUState *cs, int type, vaddr addr, vaddr len)
 {
     CPUState *cpu;
     int err = 0;
diff --git a/include/sysemu/accel-ops.h b/include/sysemu/accel-ops.h
index 8cc7996def..30690c71bd 100644
--- a/include/sysemu/accel-ops.h
+++ b/include/sysemu/accel-ops.h
@@ -10,7 +10,7 @@
 #ifndef ACCEL_OPS_H
 #define ACCEL_OPS_H
 
-#include "exec/hwaddr.h"
+#include "exec/cpu-common.h"
 #include "qom/object.h"
 
 #define ACCEL_OPS_SUFFIX "-ops"
@@ -48,8 +48,8 @@ struct AccelOpsClass {
 
     /* gdbstub hooks */
     bool (*supports_guest_debug)(void);
-    int (*insert_breakpoint)(CPUState *cpu, int type, hwaddr addr, hwaddr len);
-    int (*remove_breakpoint)(CPUState *cpu, int type, hwaddr addr, hwaddr len);
+    int (*insert_breakpoint)(CPUState *cpu, int type, vaddr addr, vaddr len);
+    int (*remove_breakpoint)(CPUState *cpu, int type, vaddr addr, vaddr len);
     void (*remove_all_breakpoints)(CPUState *cpu);
 };
 
-- 
2.38.1


