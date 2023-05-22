Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 471E1C77B75
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 May 2023 13:12:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q15KM-00065y-Gy; Mon, 22 May 2023 09:11:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tommy.wu@sifive.com>)
 id 1q15K4-0005gw-Sz
 for qemu-riscv@nongnu.org; Mon, 22 May 2023 09:11:36 -0400
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tommy.wu@sifive.com>)
 id 1q15K3-0007aN-4M
 for qemu-riscv@nongnu.org; Mon, 22 May 2023 09:11:36 -0400
Received: by mail-ot1-x334.google.com with SMTP id
 46e09a7af769-6af6f633de8so1080686a34.1
 for <qemu-riscv@nongnu.org>; Mon, 22 May 2023 06:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1684761094; x=1687353094;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O4FKPuvL5kSBitwP6XPLo9dKqvV9psvUvxBDFxdR7qg=;
 b=R9w2Ly4qXddg0Wt1oB776RjuZxnnpj5YmbiMGQtQohx5/bidP4cWTraB26wUwCnDsC
 ZqPgzcbjnflQU7u9cAZ75FI6RDQkxG1WU9JeZnltsFwgkeHLX8O4kB0YiFCeeaEW8Qyq
 X+gvLnfVkftCkS/HUMnbnxJzFHkzW0eFP1efhmocUIjXtRIvTvbXyh3Fy/9EoWTOVzWG
 mbdGDw/XBbcOPZ4XZr+N5P4MdorG5E6NtnRa1OOPJXakiSoXCKRDPGHJEveD/sqeT82w
 uNEsfQdxWco5raREk1OxqOhH2w10qyEHY1Oc1fs15fNHkGhiZw0MfjC4GmQeBHNYvsz6
 c7TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684761094; x=1687353094;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O4FKPuvL5kSBitwP6XPLo9dKqvV9psvUvxBDFxdR7qg=;
 b=NUJO5ksWrbfn5E7Q3w6wSe4J0JksNMbUsJ+vVtLruqwWcU7N/zOItyLKC8d9wuy8LT
 ZIuX+wTBps5vFTbR3SbFFTE2nsz8NyVITa6Ikj3XuK0NoWt0BoMzXLQtqVXuT/P88At2
 x6/O3TyU3ZUrc6MEsyRnDiuf/PUuZpdwUnAPiN+eYt9lcCo62HZUtkr8F/UhWR+97oGz
 +oX84x2HEleS9n7BU7UWiLmI7RzO8k1DodZVD+gnYCOZA2JArJ669krInKnmO8XYwxlq
 CcN6Gg/GoDBLcYRJzlM3XzJSY/rtkdAC7AOjQ0bpY1wN5VAMgcNTdqLbLlrgZnj+6Y0z
 iFvw==
X-Gm-Message-State: AC+VfDxb98gThqv32bm9JFrC52tFEvFstaX7gjX2jvtMWUijNeOXTmdR
 0ubY02Tl62kQGj9GYxO8I2z3lFl88CR6794vIC4d+w==
X-Google-Smtp-Source: ACHHUZ5QjJWZ+3mQ6tZ32BVf06yGE3cXM8fxjybJXvPEYTYivAXS1EMHVwM5Ku/gANNG+Yci2rcmbA==
X-Received: by 2002:a9d:6182:0:b0:6ab:216c:e3a2 with SMTP id
 g2-20020a9d6182000000b006ab216ce3a2mr5265225otk.18.1684761093771; 
 Mon, 22 May 2023 06:11:33 -0700 (PDT)
Received: from sw05.internal.sifive.com ([64.62.193.194])
 by smtp.gmail.com with ESMTPSA id
 c3-20020a9d6c83000000b006af731d100fsm1369182otr.75.2023.05.22.06.11.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 May 2023 06:11:33 -0700 (PDT)
From: Tommy Wu <tommy.wu@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: frank.chang@sifive.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, liweiwei@iscas.ac.cn, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, richard.henderson@linaro.org,
 Tommy Wu <tommy.wu@sifive.com>
Subject: [PATCH v3 3/4] target/riscv: Handle Smrnmi interrupt and exception.
Date: Mon, 22 May 2023 06:11:22 -0700
Message-Id: <20230522131123.3498539-4-tommy.wu@sifive.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230522131123.3498539-1-tommy.wu@sifive.com>
References: <20230522131123.3498539-1-tommy.wu@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::334;
 envelope-from=tommy.wu@sifive.com; helo=mail-ot1-x334.google.com
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

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Signed-off-by: Tommy Wu <tommy.wu@sifive.com>
---
 target/riscv/cpu_helper.c | 60 +++++++++++++++++++++++++++++++++++----
 1 file changed, 55 insertions(+), 5 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index cc7898f103..7bdea0d2ca 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -405,6 +405,19 @@ static int riscv_cpu_local_irq_pending(CPURISCVState *env)
 {
     int virq;
     uint64_t irqs, pending, mie, hsie, vsie;
+    RISCVCPU *cpu = env_archcpu(env);
+
+    /* Priority: RNMI > Other interrupt. */
+    if (cpu->cfg.ext_smrnmi) {
+        /* If mnstatus.NMIE == 0, all interrupts are disabled. */
+        if (!get_field(env->mnstatus, MNSTATUS_NMIE)) {
+            return RISCV_EXCP_NONE;
+        }
+
+        if (env->rnmip) {
+            return ctz64(env->rnmip); /* since non-zero */
+        }
+    }
 
     /* Determine interrupt enable state of all privilege modes */
     if (env->virt_enabled) {
@@ -451,7 +464,9 @@ static int riscv_cpu_local_irq_pending(CPURISCVState *env)
 
 bool riscv_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
 {
-    if (interrupt_request & CPU_INTERRUPT_HARD) {
+    uint32_t mask = CPU_INTERRUPT_HARD | CPU_INTERRUPT_RNMI;
+
+    if (interrupt_request & mask) {
         RISCVCPU *cpu = RISCV_CPU(cs);
         CPURISCVState *env = &cpu->env;
         int interruptno = riscv_cpu_local_irq_pending(env);
@@ -1613,6 +1628,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
     CPURISCVState *env = &cpu->env;
     bool write_gva = false;
     uint64_t s;
+    int mode;
 
     /*
      * cs->exception is 32-bits wide unlike mcause which is XLEN-bits wide
@@ -1625,6 +1641,22 @@ void riscv_cpu_do_interrupt(CPUState *cs)
     target_ulong tinst = 0;
     target_ulong htval = 0;
     target_ulong mtval2 = 0;
+    bool nmi_execp = false;
+
+    if (cpu->cfg.ext_smrnmi) {
+        if (env->rnmip && async) {
+            env->mnstatus = set_field(env->mnstatus, MNSTATUS_NMIE, false);
+            env->mnstatus = set_field(env->mnstatus, MNSTATUS_MNPV,
+                                      env->virt_enabled);
+            env->mnstatus = set_field(env->mnstatus, MNSTATUS_MNPP,
+                                      env->priv);
+            env->mncause = cause | ((target_ulong)1U << (TARGET_LONG_BITS - 1));
+            env->mnepc = env->pc;
+            env->pc = env->rnmi_irqvec;
+            riscv_cpu_set_mode(env, PRV_M);
+            goto handled;
+        }
+    }
 
     if  (cause == RISCV_EXCP_SEMIHOST) {
         do_common_semihosting(cs);
@@ -1711,8 +1743,20 @@ void riscv_cpu_do_interrupt(CPUState *cs)
                   __func__, env->mhartid, async, cause, env->pc, tval,
                   riscv_cpu_get_trap_name(cause, async));
 
-    if (env->priv <= PRV_S &&
-            cause < TARGET_LONG_BITS && ((deleg >> cause) & 1)) {
+    mode = env->priv <= PRV_S &&
+        cause < TARGET_LONG_BITS && ((deleg >> cause) & 1) ? PRV_S : PRV_M;
+
+    /*
+     * If the hart encounters an exception while executing in M-mode,
+     * with the mnstatus.NMIE bit clear, the program counter is set to
+     * the RNMI exception trap handler address.
+     */
+    nmi_execp = cpu->cfg.ext_smrnmi &&
+                !get_field(env->mnstatus, MNSTATUS_NMIE) &&
+                !async &&
+                mode == PRV_M;
+
+    if (mode == PRV_S) {
         /* handle the trap in S-mode */
         if (riscv_has_ext(env, RVH)) {
             uint64_t hdeleg = async ? env->hideleg : env->hedeleg;
@@ -1787,8 +1831,12 @@ void riscv_cpu_do_interrupt(CPUState *cs)
         env->mtval = tval;
         env->mtval2 = mtval2;
         env->mtinst = tinst;
-        env->pc = (env->mtvec >> 2 << 2) +
-                  ((async && (env->mtvec & 3) == 1) ? cause * 4 : 0);
+        if (cpu->cfg.ext_smrnmi && nmi_execp) {
+            env->pc = env->rnmi_excpvec;
+        } else {
+            env->pc = (env->mtvec >> 2 << 2) +
+                      ((async && (env->mtvec & 3) == 1) ? cause * 4 : 0);
+        }
         riscv_cpu_set_mode(env, PRV_M);
     }
 
@@ -1801,6 +1849,8 @@ void riscv_cpu_do_interrupt(CPUState *cs)
 
     env->two_stage_lookup = false;
     env->two_stage_indirect_lookup = false;
+
+handled:
 #endif
     cs->exception_index = RISCV_EXCP_NONE; /* mark handled to qemu */
 }
-- 
2.31.1


