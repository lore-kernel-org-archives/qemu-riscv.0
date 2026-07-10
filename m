Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A320C43458
	for <qemu-riscv@archiver.kernel.org>; Fri, 10 Jul 2026 20:55:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wiIF3-0001da-Oq; Fri, 10 Jul 2026 16:54:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wiIF1-0001a1-P6
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2026 16:54:35 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wiIEo-0000km-IR
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2026 16:54:35 -0400
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-8478fe07f0fso1455758b3a.0
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2026 13:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783716861; x=1784321661; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=9b7zTETWU90o56GcX57svy4revXN3qZdBYXrx4oYXfA=;
 b=YNqTHRTdrERMIIJfD8UxOqF0hYvmFQ64eCYxJy05/PSJB6sPhbguUY7SVCdrGMXFyB
 zz8WTZnxn9GNNGnpLnG0QyNY6LbFc3oi3sccENFYyu4hISfztHWTtWBtZEli31mJa3g+
 aM2zwmrNq1PGu2whbavryzv2H2gyt8i3YOSb0XsaU4Zm8JrA3HVFf056o05JWH3a7VO9
 eNX92ugdo2042ifgCbL2Ud83NqgN/UHZ1jXgDIsyaBWSkVHBpO6NABTC8HdqYTsrhO5i
 49J7VDydY/mKGI9nzauFY/oVmJv82mI0Hz2+MwZpLlF2y4+Nn/PxgA/M5y87hyk99vgc
 YAhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783716861; x=1784321661;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=9b7zTETWU90o56GcX57svy4revXN3qZdBYXrx4oYXfA=;
 b=TYisBcRPRw7GVjqJF8b6XhZiniIG4Bzd+limR23bLjstEtOCqeEoach0rCUz+nmLJy
 YZaQ0XqGHKVcbKC1JXl0E/sO6Wa3B6GE0Rr7bnvu+YI/oschD8bWLvHIXfrjA/aJ071m
 +jde0WqjcJrOrZBluyV7PpKML+CksVAg2PHInPl84b/3rTRF6aV4budllMdD3aSqjxfl
 ZNUqyag8zeCqrkPWNkAkUFLAIl8XLU3M91C7DRkrEwDP88x4eDmRbVtbVHa6Ig2weBMw
 fdmr44T9FBvDSouLCrHbN3n88b4MwQ1wiicCYa+id+mCuVXx0Cj4W1zvGj3c2hyjNbFP
 r9vA==
X-Forwarded-Encrypted: i=1;
 AHgh+RqsSmhOdbs6bxQ8HwYQNSg49HrBRiPPDm0dPL5gfUJlethzlUz/ccEECifhJfrG/Jyj9maJjA7+BNGx@nongnu.org
X-Gm-Message-State: AOJu0YxYFndDGIt7IFCsaw625g7CieNw8yNabUsqXGYzUn7yTGG5IlDV
 IaQ0YLZ9NvI7QwEws+85LsS1uAhCUYfmfd49ggjZp+6ITpu84ZvwbedXN7yqlh0ohzs=
X-Gm-Gg: AfdE7cnq8jSdJzFgUFsaZxTQ+m3U3nqMDCdeC+2Mrkc3roZnLHuPErB15bE7rro46fH
 hI+pxYsUo/CHIk+lZoRqo2UhUC+RsNtRIgDbc4cmFhP9MAv1J8+JxvjBUEa1KGDG7geEMuNn3s/
 LO7qF3tvov+iNpYcPPjpoGZyW/Z5fPNZnRR3oIKS5yWgM8AClsP59QvFyGIcShZmWpjC3Cr4VJ8
 hZKkQh+yPP0GbT7ocv5YjiqTI/3bWbO/TNF5snHP8L1fyCoC0w0Q41H2U9x3gTawE24h4GO4L/x
 EDpRNmRs5y2aUEh5pm49K4RzuDjARlnDkcvYtb9tukwcfjAWQR0sruaPrgtP0FsHgDN1ynd4S9r
 7IdPp4JakKYl4bC+YSi3C5ALhelBIvTs76jGoCG9lHApgKQ6BTCiXm3np5oIdgcJ7ndjWAai3Fp
 JYT634t93qpevKvT6wMg==
X-Received: by 2002:a05:6a00:b47:b0:837:e9cc:d474 with SMTP id
 d2e1a72fcca58-8488974f808mr577808b3a.2.1783716861043; 
 Fri, 10 Jul 2026 13:54:21 -0700 (PDT)
Received: from stoup.. ([71.212.146.49]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-847f6d76106sm10780574b3a.40.2026.07.10.13.54.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2026 13:54:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com
Subject: [PATCH v3 17/51] gdbstub: Report actual watchpoint trigger address
Date: Fri, 10 Jul 2026 13:53:27 -0700
Message-ID: <20260710205401.836304-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260710205401.836304-1-richard.henderson@linaro.org>
References: <20260710205401.836304-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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
index 724fd24c00..b36e957b95 100644
--- a/gdbstub/system.c
+++ b/gdbstub/system.c
@@ -166,10 +166,10 @@ static void gdb_vm_state_change(void *opaque, bool running, RunState state)
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
index da3ec521fc..70edb2f219 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -2375,6 +2375,7 @@ static int hvf_handle_exception(CPUState *cpu, hv_vcpu_exit_exception_t *excp)
         if (!wp) {
             error_report("EXCP_DEBUG but unknown hw watchpoint");
         }
+        wp->hitaddr = excp->virtual_address;
         cpu->watchpoint_hit = wp;
         break;
     }
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index d40a6a9859..ebe4ecbb77 100644
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
index 8161831de2..51ff5cd767 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -6264,13 +6264,13 @@ static int kvm_handle_debug(X86CPU *cpu,
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
index 1a093e1f83..2a98ed89c8 100644
--- a/target/ppc/kvm.c
+++ b/target/ppc/kvm.c
@@ -1589,11 +1589,11 @@ static int kvm_handle_hw_breakpoint(CPUState *cs,
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
index 6f7f75f601..89e90a84ec 100644
--- a/target/s390x/kvm/kvm.c
+++ b/target/s390x/kvm/kvm.c
@@ -1864,7 +1864,7 @@ static int kvm_arch_handle_debug_exit(S390CPU *cpu)
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


