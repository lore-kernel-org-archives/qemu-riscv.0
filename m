Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BCFEC43602
	for <qemu-riscv@archiver.kernel.org>; Sun,  5 Jul 2026 04:47:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wgEdK-0006lQ-BS; Sun, 05 Jul 2026 00:39:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wgEcF-000529-G4
 for qemu-riscv@nongnu.org; Sun, 05 Jul 2026 00:38:04 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wgEby-0004FZ-W2
 for qemu-riscv@nongnu.org; Sun, 05 Jul 2026 00:38:03 -0400
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-2cc8e87f29bso218165ad.2
 for <qemu-riscv@nongnu.org>; Sat, 04 Jul 2026 21:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783226266; x=1783831066; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DjegbvMJwPTXHgna3JNNhxJJiZH5knkOZAN2effugW0=;
 b=nSgPhLCxMTpYw7C0wbTn8uFEVUbQfp5TxRbnn08MfRlF3h5KFULoWz0RaVCQsL+dEw
 cXejz0aHvgqE4/g8XQFG988AB7bn6H3Vx2Ru5piiWWC5FmKmGp93LrxaMqJVRJ9izr4I
 f3cywcZYZBiVBzfwFUpBl5RnH3/cuHDZJbC44/JkxoalNq83KsW+iRyuxf4LZ3IjQp3D
 cmuB8Sz6zya5OrmiMgs1AUxyO4tSgFwFXdVq1zjRR2z0c9YuE15ym/eZ4jnRazyE9IYi
 hy19kzqL2DkAsR5F35nqaJ6uGE3Fe83Dr5UEp3uI6aj7UCwi+8ISv+ljLWJN0+cgCwT8
 5OKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783226266; x=1783831066;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=DjegbvMJwPTXHgna3JNNhxJJiZH5knkOZAN2effugW0=;
 b=fcDWhh/gSyazovj8QK127p4exkjdhnXTXzCulCWECQWiBeo27E/6AK+7GtNmiNcLyE
 DPAD6RgfLlh07UvbACmh88trCnD7iJyTrKlXLC2rw5Est0hC8eAMtBPXjXo8vON2Nygx
 7FV5pshNo4YFQSbW+jw75HUzrA9aZI77tLoFz7BBvto1rH2ORCIH1HJJrvi9MFf4XmkJ
 rlvp8Hr6auzzsKkNa/FSw7cxWZ+3bhxmWp9pdGyZBSF43msfE1uVX0wuy75sn7JyRH3N
 46/WVfB5jj+GW5hpod0JybSKJaf8qNO/8xWjUYepgmjz2eWHhpPU9pzFJNyGzL0tdG80
 W5Fg==
X-Forwarded-Encrypted: i=1;
 AHgh+RrHIGsvkZNH8Xr+vAXCnTyj9T/dLV9j5NRnAaGQz2pOev2MmoRvNKlb0wSInelLOLoWP2eyQdn3d2fH@nongnu.org
X-Gm-Message-State: AOJu0YzGeQXT4CS4ca2YMj6JetIlWOTWg4q+7iCqi81ir9x07SaZZLfV
 ymZXQL264oKrcVddjABxavc13xO5W8wfgQzU6e4KaGboPspNoxfiKdBhgIxkg2WXfuM=
X-Gm-Gg: AfdE7cmtvVcqabnMr+LlLyIuEYR8h6V/xXfovXhSr2ymacbvM2BsmgU9hp9JD0PlxnR
 52ZdO7gia10zL2QtKsNk1X0n8VDQcueVomKgCJ6Rat7B/7toYTU1tuXeaTqvwHHLH90kQoI7Sj5
 veM7K2nnsQdD5di/C8FVh88ognYs79aCabfPyqwUbKV1XVF5xviCYjtsxp3si8azHT56OmIg8sp
 Ue+JNzsJZP1yZ8GpN17iHCGLIMKwsK/FFnJcn+/wDrGqjbXuVEMXYHt6E/76HkKTo5Dct+STXJ4
 71M7X2QyJ44LK5oitTOmsQaTdX1vEXIPn32R9G3yzftCr/2zshffhp/d3PFh0oaJ5gREQqYMbYx
 nH6ZuQaubQHWaiw1njqEUU31nNGV3tV0zHeltc09GsZ1mRSqd9QxqGGl1ep2tilHPbNL+LIXAhk
 et3FW78QSsycQMlPnBq/F7zD8eOKLi25jeN9ZnYEbWTpYt2Ww=
X-Received: by 2002:a17:903:41c5:b0:2c9:fa31:84f9 with SMTP id
 d9443c01a7336-2cb97e47e42mr53537745ad.5.1783226265503; 
 Sat, 04 Jul 2026 21:37:45 -0700 (PDT)
Received: from stoup.. (71-212-39-188.tukw.qwest.net. [71.212.39.188])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2cad712ca17sm29863785ad.28.2026.07.04.21.37.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2026 21:37:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, philmd@oss.qualcomm.com
Subject: [PATCH v2 21/46] gdbstub: Report actual watchpoint trigger address
Date: Sat,  4 Jul 2026 21:37:00 -0700
Message-ID: <20260705043725.1373137-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260705043725.1373137-1-richard.henderson@linaro.org>
References: <20260705043725.1373137-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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

While gdb doesn't care either way, it seems more correct to
report the address of the watchpoint hit, rather than the
beginning of the watchpoint region.

Adjust all virtualization hosts which construct a dummy
CPUWatchpoint structure.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 gdbstub/system.c       | 4 ++--
 target/arm/hvf/hvf.c   | 1 +
 target/arm/kvm.c       | 1 +
 target/i386/kvm/kvm.c  | 4 ++--
 target/ppc/kvm.c       | 4 ++--
 target/s390x/kvm/kvm.c | 2 +-
 6 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/gdbstub/system.c b/gdbstub/system.c
index 0b810477ee..017585187f 100644
--- a/gdbstub/system.c
+++ b/gdbstub/system.c
@@ -165,10 +165,10 @@ static void gdb_vm_state_change(void *opaque, bool running, RunState state)
             }
             trace_gdbstub_hit_watchpoint(type,
                                          gdb_get_cpu_index(cpu),
-                                         cpu->watchpoint_hit->vaddr);
+                                         cpu->watchpoint_hit->hitaddr);
             g_string_printf(buf, "T%02xthread:%s;%swatch:%" VADDR_PRIx ";",
                             GDB_SIGNAL_TRAP, tid->str, type,
-                            cpu->watchpoint_hit->vaddr);
+                            cpu->watchpoint_hit->hitaddr);
             cpu->watchpoint_hit = NULL;
             goto send_packet;
         } else {
diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 8b902c6882..0a383b9295 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -2377,6 +2377,7 @@ static int hvf_handle_exception(CPUState *cpu, hv_vcpu_exit_exception_t *excp)
         if (!wp) {
             error_report("EXCP_DEBUG but unknown hw watchpoint");
         }
+        wp->hitaddr = excp->virtual_address;
         cpu->watchpoint_hit = wp;
         break;
     }
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index a54ef51ec2..72a53bd7c3 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -1519,6 +1519,7 @@ static bool kvm_arm_handle_debug(ARMCPU *cpu,
     {
         CPUWatchpoint *wp = find_hw_watchpoint(cs, debug_exit->far);
         if (wp) {
+            wp->hitaddr = debug_exit->far;
             cs->watchpoint_hit = wp;
             return true;
         }
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 54bee753fa..8c9304ddaf 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -6262,13 +6262,13 @@ static int kvm_handle_debug(X86CPU *cpu,
                     case 0x1:
                         ret = EXCP_DEBUG;
                         cs->watchpoint_hit = &hw_watchpoint;
-                        hw_watchpoint.vaddr = hw_breakpoint[n].addr;
+                        hw_watchpoint.hitaddr = hw_breakpoint[n].addr;
                         hw_watchpoint.flags = BP_MEM_WRITE;
                         break;
                     case 0x3:
                         ret = EXCP_DEBUG;
                         cs->watchpoint_hit = &hw_watchpoint;
-                        hw_watchpoint.vaddr = hw_breakpoint[n].addr;
+                        hw_watchpoint.hitaddr = hw_breakpoint[n].addr;
                         hw_watchpoint.flags = BP_MEM_ACCESS;
                         break;
                     }
diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
index c44edac41f..82c1396970 100644
--- a/target/ppc/kvm.c
+++ b/target/ppc/kvm.c
@@ -1587,11 +1587,11 @@ static int kvm_handle_hw_breakpoint(CPUState *cs,
                                         KVMPPC_DEBUG_WATCH_WRITE)) {
             BreakpointFlags flag = 0;
 
-            n = find_hw_watchpoint(arch_info->address,  &flag);
+            n = find_hw_watchpoint(arch_info->address, &flag);
             if (n >= 0) {
                 handle = DEBUG_RETURN_GDB;
                 cs->watchpoint_hit = &hw_watchpoint;
-                hw_watchpoint.vaddr = hw_debug_points[n].addr;
+                hw_watchpoint.hitaddr = arch_info->address;
                 hw_watchpoint.flags = flag;
             }
         }
diff --git a/target/s390x/kvm/kvm.c b/target/s390x/kvm/kvm.c
index 9658534fa6..7cd199578b 100644
--- a/target/s390x/kvm/kvm.c
+++ b/target/s390x/kvm/kvm.c
@@ -1862,7 +1862,7 @@ static int kvm_arch_handle_debug_exit(S390CPU *cpu)
     case KVM_HW_WP_WRITE:
         if (find_hw_breakpoint(arch_info->addr, -1, arch_info->type)) {
             cs->watchpoint_hit = &hw_watchpoint;
-            hw_watchpoint.vaddr = arch_info->addr;
+            hw_watchpoint.hitaddr = arch_info->addr;
             hw_watchpoint.flags = BP_MEM_WRITE;
             ret = EXCP_DEBUG;
         }
-- 
2.43.0


