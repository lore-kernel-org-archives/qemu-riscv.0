Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8CFEC369D9
	for <qemu-riscv@archiver.kernel.org>; Wed, 25 Sep 2024 11:59:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1stQfI-00067A-B4; Wed, 25 Sep 2024 07:58:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cleger@rivosinc.com>)
 id 1stQf3-0005Ar-3M
 for qemu-riscv@nongnu.org; Wed, 25 Sep 2024 07:58:26 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cleger@rivosinc.com>)
 id 1stQez-0000hm-IN
 for qemu-riscv@nongnu.org; Wed, 25 Sep 2024 07:58:23 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-42bb7298bdeso84823095e9.1
 for <qemu-riscv@nongnu.org>; Wed, 25 Sep 2024 04:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1727265499; x=1727870299;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OmvOHShcy/My3760EdrA7kE1YqE58ftN8XZOl4Q1lkU=;
 b=XPpSdRJ/N0wdwX79UvQQK/7+N1L7Dt7ROSpjwU3qlDpeLO19LCM8jlPcc2GcMvrrbG
 7hHJCSO5lI0ie7TOSTfAveDpIeiZFTrYYsp5OWlc+IoFQLldasqs8FgyR3NTTdlz73jg
 IMVkFsVvRl9TukrwcY5ncF53B8nIl6iFqUQKaiKry6I6QM5nJA5OXtCYGlpcPfDIWORw
 sYECFJ995rz3/UvdlIUZ3gMAulfLvjjx6v9nMK0N2jNzy1q0kJOyVM1IUR9J2k17pLCc
 HFjpUS4wsWpaZ43/GZd0s55ayaBtHsrNQmaqOUjl+6fWR+QSUBI0HYeoO26lI5gRKMwE
 40tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727265499; x=1727870299;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OmvOHShcy/My3760EdrA7kE1YqE58ftN8XZOl4Q1lkU=;
 b=NqBw7SLASONwjBBzuxoNJ4dCW9WLrHseJV0KZ9a2srvy8Jal7f2ak0v8k1ZGoMtn4o
 1O/c8EUyoUxIidbff/1S22Bac178q8aO/p0WegVpLZhnUP6ANat5xx+OEaJ8BXc6u60Z
 +YXGLTywrFzhxJb5OZIMC1DJ3MP5evmxoz2OPnnNfWENeTdqh4igSWySLa0klhnyNzum
 PALMktd9z8pXAQpKz76vXlPd1rEMPaIWop5u0LVc1+z19tRnpgDwKouR4ZG+avDtrTAX
 4LsXIxHMuAogiLn/d4GbNBNIFO+HjsEfoKl4+GynMoWj7Q6ZyjMxnJGKgitZHpq0bv5O
 r+qg==
X-Gm-Message-State: AOJu0YzerqVY9RO+15ovgo1cxpR00LYjthvwTaDzjOBQza7PO4B1PvTX
 Pwr2PCxw0HmbMFQYGag+gRCuTeE88hWHG1nmcSokp6V6CwoCWaVV6MuLaSmVV28UYMsKkgd76tn
 F
X-Google-Smtp-Source: AGHT+IG24yHveEaMx+83H3gLaQMNEVCjO3Qu/dT/TF4LTp1Us+M4gNr1FCV0wz2/eycnp/4KvaHj0A==
X-Received: by 2002:a5d:5e05:0:b0:37c:c832:cf95 with SMTP id
 ffacd0b85a97d-37cc832d17amr1103518f8f.50.1727265499595; 
 Wed, 25 Sep 2024 04:58:19 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37cbc2ab52fsm3770612f8f.13.2024.09.25.04.58.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2024 04:58:18 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: qemu-riscv@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Ved Shanbhogue <ved@rivosinc.com>, Atish Patra <atishp@rivosinc.com>,
 qemu-devel@nongnu.org
Subject: [PATCH v2 7/8] target/riscv: Implement Smdbltrp behavior
Date: Wed, 25 Sep 2024 13:58:05 +0200
Message-ID: <20240925115808.77874-8-cleger@rivosinc.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240925115808.77874-1-cleger@rivosinc.com>
References: <20240925115808.77874-1-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=cleger@rivosinc.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

When the Smsdbltrp ISA extension is enabled, MSTATUS.MDT bit is enabled
at reset and set upon trap. If a trap happens while MSTATUS.MDT is
already set, it will trigger an abort or an NMI is the Smrnmi extension
is available.

Signed-off-by: Clément Léger <cleger@rivosinc.com>
---
 target/riscv/cpu.c        |  3 +++
 target/riscv/cpu_helper.c | 35 ++++++++++++++++++++++++++---------
 2 files changed, 29 insertions(+), 9 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 4f52cf7ac0..dd3351832a 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -946,6 +946,9 @@ static void riscv_cpu_reset_hold(Object *obj, ResetType type)
             env->mstatus_hs = set_field(env->mstatus_hs,
                                         MSTATUS64_UXL, env->misa_mxl);
         }
+        if (riscv_cpu_cfg(env)->ext_smdbltrp) {
+            env->mstatus = set_field(env->mstatus, MSTATUS_MDT, 1);
+        }
     }
     env->mcause = 0;
     env->miclaim = MIP_SGEIP;
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 69da3c3384..5a30d1b8a8 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -1697,6 +1697,17 @@ static target_ulong riscv_transformed_insn(CPURISCVState *env,
     return xinsn;
 }
 
+static void riscv_do_nmi(CPURISCVState *env, target_ulong cause, bool virt)
+{
+    env->mnstatus = set_field(env->mnstatus, MNSTATUS_NMIE, false);
+    env->mnstatus = set_field(env->mnstatus, MNSTATUS_MNPV, virt);
+    env->mnstatus = set_field(env->mnstatus, MNSTATUS_MNPP, env->priv);
+    env->mncause = cause;
+    env->mnepc = env->pc;
+    env->pc = env->rnmi_irqvec;
+    riscv_cpu_set_mode(env, PRV_M, virt);
+}
+
 /*
  * Handle Traps
  *
@@ -1733,15 +1744,8 @@ void riscv_cpu_do_interrupt(CPUState *cs)
     bool nmi_execp = false;
 
     if (cpu->cfg.ext_smrnmi && env->rnmip && async) {
-        env->mnstatus = set_field(env->mnstatus, MNSTATUS_NMIE, false);
-        env->mnstatus = set_field(env->mnstatus, MNSTATUS_MNPV,
-                                  env->virt_enabled);
-        env->mnstatus = set_field(env->mnstatus, MNSTATUS_MNPP,
-                                  env->priv);
-        env->mncause = cause | ((target_ulong)1U << (TARGET_LONG_BITS - 1));
-        env->mnepc = env->pc;
-        env->pc = env->rnmi_irqvec;
-        riscv_cpu_set_mode(env, PRV_M, virt);
+        riscv_do_nmi(env, cause | ((target_ulong)1U << (TARGET_LONG_BITS - 1)),
+                     virt);
         return;
     }
 
@@ -1937,6 +1941,19 @@ void riscv_cpu_do_interrupt(CPUState *cs)
         s = set_field(s, MSTATUS_MPIE, get_field(s, MSTATUS_MIE));
         s = set_field(s, MSTATUS_MPP, env->priv);
         s = set_field(s, MSTATUS_MIE, 0);
+        if (cpu->cfg.ext_smdbltrp) {
+            if (env->mstatus & MSTATUS_MDT) {
+                assert(env->priv == PRV_M);
+                if (!cpu->cfg.ext_smrnmi || nmi_execp) {
+                    cpu_abort(CPU(cpu), "M-mode double trap\n");
+                } else {
+                    riscv_do_nmi(env, cause, false);
+                    return;
+                }
+            }
+
+            s = set_field(s, MSTATUS_MDT, 1);
+        }
         env->mstatus = s;
         env->mcause = cause | ~(((target_ulong)-1) >> async);
         if (smode_double_trap) {
-- 
2.45.2


