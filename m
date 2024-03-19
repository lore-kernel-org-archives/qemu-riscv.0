Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95917CD11C2
	for <qemu-riscv@archiver.kernel.org>; Tue, 19 Mar 2024 15:47:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rmbf4-00036I-Va; Tue, 19 Mar 2024 11:45:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rmbei-0001ss-Bx
 for qemu-riscv@nongnu.org; Tue, 19 Mar 2024 11:45:41 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rmbee-0005sA-0M
 for qemu-riscv@nongnu.org; Tue, 19 Mar 2024 11:45:36 -0400
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-33fd8a2a407so1679870f8f.2
 for <qemu-riscv@nongnu.org>; Tue, 19 Mar 2024 08:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710863130; x=1711467930; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zm2YX9dIHSMGPAJWuVZxhizkFvEayxvFDr7Y720qWo8=;
 b=oCijfxYib3UaiNFQgjrgmHEQNFvDPEuggVgfHkLFxvDFvBGYsojVLz0TDsqNZQHvWD
 iz45irMDhSuIYWcUnKAnVbpY9TXAUfBMp6n+8IiqHKkBkaShj0/TvE8oo2fGUVUb5yXa
 A881nAb0TbfIq9GOWcpE2QBUmobSX60X9oPnnqQbi7xUHhz6gxON1AZrCsF9JxgdFFdT
 EFky9fzaTR6HLyeSbaIyBOxAioFnIdp8gU8mbd1WXeB1CzxB4SAWS0md4XWpJEYA7pxo
 BJl9H0oroHe+6P92lwyRNcUXGLINAuZ5cXhuuAgmb2cpTrkEH3Z6G1B8Lp11phSG78Lm
 1Xxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710863130; x=1711467930;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zm2YX9dIHSMGPAJWuVZxhizkFvEayxvFDr7Y720qWo8=;
 b=kfYoYEI/pHIRNou5Ta2Yx0tJQLN9IKakJI4k5+7UggEJWrS5CKh7aNxEevfSFsay5l
 pm4Q8CetXXwFcFip3hS7Fz2tTbj2DKuh1hOWyiC2H6Nzr+tdQs6+51jzJmjSWyAxuFZF
 V7WmfAQVbej2RZLpfmQH972xcfuHcpqr44sMsbvRIcKO41XMWxSt2d5HRb7tlcHfP7Gi
 ARvnTVfr8BChi7Ffc3AAJaneYtLJTFhs1qpxOpc1BUZXhLjFw3ivuobpV9UABcN1c6Wa
 r5iPIPfl/d+mRH6EIBsPtDRqPunTU88nh58c/fhu9smBLD/ME0ixneP1HWh4gylz7+LB
 iuzg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4JWsbEASbqU2GYBkXTiLdq/tVXhO4QPH1KNB1Ej1Ze26h/cVOJL6KwSVqpVHrh/9VeE7Ge3fDVDD407hEf7v2CPSjM7k=
X-Gm-Message-State: AOJu0Yz2viFp07Y84L7c3ISrZFB5wdKNgVx90rkAq4A2UDk4zoOju3/x
 maJLZGpCO9zERah+ENwtbGRoKwGISGgAzHm9Bq9FYjZclKuf2uCs+Q+ViN2eQLI=
X-Google-Smtp-Source: AGHT+IEktPlHxn6q2XP41lRLpPnm1DICm10F3tQlr1jLUMAsRtYpX6DzfdpwLTi4yhjM+HsmkLeNOA==
X-Received: by 2002:adf:fc8c:0:b0:33e:c7e3:b1bb with SMTP id
 g12-20020adffc8c000000b0033ec7e3b1bbmr9763043wrr.16.1710863130186; 
 Tue, 19 Mar 2024 08:45:30 -0700 (PDT)
Received: from m1x-phil.lan ([176.176.166.129])
 by smtp.gmail.com with ESMTPSA id
 ba29-20020a0560001c1d00b0033ec8b3b3e4sm9758355wrb.79.2024.03.19.08.45.28
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 19 Mar 2024 08:45:29 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Anton Johansson <anjo@rev.ng>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Max Filippov <jcmvbkbc@gmail.com>
Subject: [PATCH-for-9.1 26/27] target/xtensa: Convert to
 TCGCPUOps::get_cpu_state()
Date: Tue, 19 Mar 2024 16:42:55 +0100
Message-ID: <20240319154258.71206-27-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240319154258.71206-1-philmd@linaro.org>
References: <20240319154258.71206-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Convert cpu_get_tb_cpu_state() to TCGCPUOps::get_cpu_state().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/xtensa/cpu.h | 70 ---------------------------------------------
 target/xtensa/cpu.c | 69 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 69 insertions(+), 70 deletions(-)

diff --git a/target/xtensa/cpu.h b/target/xtensa/cpu.h
index 3826b779e4..2b6f2bdea7 100644
--- a/target/xtensa/cpu.h
+++ b/target/xtensa/cpu.h
@@ -734,76 +734,6 @@ static inline uint32_t xtensa_replicate_windowstart(CPUXtensaState *env)
 
 #include "exec/cpu-all.h"
 
-#define TARGET_HAS_CPU_GET_TB_CPU_STATE
-
-static inline void cpu_get_tb_cpu_state(CPUXtensaState *env, vaddr *pc,
-                                        uint64_t *cs_base, uint32_t *flags)
-{
-    *pc = env->pc;
-    *cs_base = 0;
-    *flags = 0;
-    *flags |= xtensa_get_ring(env);
-    if (env->sregs[PS] & PS_EXCM) {
-        *flags |= XTENSA_TBFLAG_EXCM;
-    } else if (xtensa_option_enabled(env->config, XTENSA_OPTION_LOOP)) {
-        target_ulong lend_dist =
-            env->sregs[LEND] - (env->pc & -(1u << TARGET_PAGE_BITS));
-
-        /*
-         * 0 in the csbase_lend field means that there may not be a loopback
-         * for any instruction that starts inside this page. Any other value
-         * means that an instruction that ends at this offset from the page
-         * start may loop back and will need loopback code to be generated.
-         *
-         * lend_dist is 0 when LEND points to the start of the page, but
-         * no instruction that starts inside this page may end at offset 0,
-         * so it's still correct.
-         *
-         * When an instruction ends at a page boundary it may only start in
-         * the previous page. lend_dist will be encoded as TARGET_PAGE_SIZE
-         * for the TB that contains this instruction.
-         */
-        if (lend_dist < (1u << TARGET_PAGE_BITS) + env->config->max_insn_size) {
-            target_ulong lbeg_off = env->sregs[LEND] - env->sregs[LBEG];
-
-            *cs_base = lend_dist;
-            if (lbeg_off < 256) {
-                *cs_base |= lbeg_off << XTENSA_CSBASE_LBEG_OFF_SHIFT;
-            }
-        }
-    }
-    if (xtensa_option_enabled(env->config, XTENSA_OPTION_EXTENDED_L32R) &&
-            (env->sregs[LITBASE] & 1)) {
-        *flags |= XTENSA_TBFLAG_LITBASE;
-    }
-    if (xtensa_option_enabled(env->config, XTENSA_OPTION_DEBUG)) {
-        if (xtensa_get_cintlevel(env) < env->config->debug_level) {
-            *flags |= XTENSA_TBFLAG_DEBUG;
-        }
-        if (xtensa_get_cintlevel(env) < env->sregs[ICOUNTLEVEL]) {
-            *flags |= XTENSA_TBFLAG_ICOUNT;
-        }
-    }
-    if (xtensa_option_enabled(env->config, XTENSA_OPTION_COPROCESSOR)) {
-        *flags |= env->sregs[CPENABLE] << XTENSA_TBFLAG_CPENABLE_SHIFT;
-    }
-    if (xtensa_option_enabled(env->config, XTENSA_OPTION_WINDOWED_REGISTER) &&
-        (env->sregs[PS] & (PS_WOE | PS_EXCM)) == PS_WOE) {
-        uint32_t windowstart = xtensa_replicate_windowstart(env) >>
-            (env->sregs[WINDOW_BASE] + 1);
-        uint32_t w = ctz32(windowstart | 0x8);
-
-        *flags |= (w << XTENSA_TBFLAG_WINDOW_SHIFT) | XTENSA_TBFLAG_CWOE;
-        *flags |= extract32(env->sregs[PS], PS_CALLINC_SHIFT,
-                            PS_CALLINC_LEN) << XTENSA_TBFLAG_CALLINC_SHIFT;
-    } else {
-        *flags |= 3 << XTENSA_TBFLAG_WINDOW_SHIFT;
-    }
-    if (env->yield_needed) {
-        *flags |= XTENSA_TBFLAG_YIELD;
-    }
-}
-
 XtensaCPU *xtensa_cpu_create_with_clock(const char *cpu_type,
                                         Clock *cpu_refclk);
 
diff --git a/target/xtensa/cpu.c b/target/xtensa/cpu.c
index 875cf843c9..35c66432a1 100644
--- a/target/xtensa/cpu.c
+++ b/target/xtensa/cpu.c
@@ -63,6 +63,74 @@ static void xtensa_restore_state_to_opc(CPUState *cs,
     cpu->env.pc = data[0];
 }
 
+static void xtensa_get_cpu_state(CPUXtensaState *env, vaddr *pc,
+                                 uint64_t *cs_base, uint32_t *flags)
+{
+    *pc = env->pc;
+    *cs_base = 0;
+    *flags = 0;
+    *flags |= xtensa_get_ring(env);
+    if (env->sregs[PS] & PS_EXCM) {
+        *flags |= XTENSA_TBFLAG_EXCM;
+    } else if (xtensa_option_enabled(env->config, XTENSA_OPTION_LOOP)) {
+        target_ulong lend_dist =
+            env->sregs[LEND] - (env->pc & -(1u << TARGET_PAGE_BITS));
+
+        /*
+         * 0 in the csbase_lend field means that there may not be a loopback
+         * for any instruction that starts inside this page. Any other value
+         * means that an instruction that ends at this offset from the page
+         * start may loop back and will need loopback code to be generated.
+         *
+         * lend_dist is 0 when LEND points to the start of the page, but
+         * no instruction that starts inside this page may end at offset 0,
+         * so it's still correct.
+         *
+         * When an instruction ends at a page boundary it may only start in
+         * the previous page. lend_dist will be encoded as TARGET_PAGE_SIZE
+         * for the TB that contains this instruction.
+         */
+        if (lend_dist < (1u << TARGET_PAGE_BITS) + env->config->max_insn_size) {
+            target_ulong lbeg_off = env->sregs[LEND] - env->sregs[LBEG];
+
+            *cs_base = lend_dist;
+            if (lbeg_off < 256) {
+                *cs_base |= lbeg_off << XTENSA_CSBASE_LBEG_OFF_SHIFT;
+            }
+        }
+    }
+    if (xtensa_option_enabled(env->config, XTENSA_OPTION_EXTENDED_L32R) &&
+            (env->sregs[LITBASE] & 1)) {
+        *flags |= XTENSA_TBFLAG_LITBASE;
+    }
+    if (xtensa_option_enabled(env->config, XTENSA_OPTION_DEBUG)) {
+        if (xtensa_get_cintlevel(env) < env->config->debug_level) {
+            *flags |= XTENSA_TBFLAG_DEBUG;
+        }
+        if (xtensa_get_cintlevel(env) < env->sregs[ICOUNTLEVEL]) {
+            *flags |= XTENSA_TBFLAG_ICOUNT;
+        }
+    }
+    if (xtensa_option_enabled(env->config, XTENSA_OPTION_COPROCESSOR)) {
+        *flags |= env->sregs[CPENABLE] << XTENSA_TBFLAG_CPENABLE_SHIFT;
+    }
+    if (xtensa_option_enabled(env->config, XTENSA_OPTION_WINDOWED_REGISTER) &&
+        (env->sregs[PS] & (PS_WOE | PS_EXCM)) == PS_WOE) {
+        uint32_t windowstart = xtensa_replicate_windowstart(env) >>
+            (env->sregs[WINDOW_BASE] + 1);
+        uint32_t w = ctz32(windowstart | 0x8);
+
+        *flags |= (w << XTENSA_TBFLAG_WINDOW_SHIFT) | XTENSA_TBFLAG_CWOE;
+        *flags |= extract32(env->sregs[PS], PS_CALLINC_SHIFT,
+                            PS_CALLINC_LEN) << XTENSA_TBFLAG_CALLINC_SHIFT;
+    } else {
+        *flags |= 3 << XTENSA_TBFLAG_WINDOW_SHIFT;
+    }
+    if (env->yield_needed) {
+        *flags |= XTENSA_TBFLAG_YIELD;
+    }
+}
+
 static bool xtensa_cpu_has_work(CPUState *cs)
 {
 #ifndef CONFIG_USER_ONLY
@@ -230,6 +298,7 @@ static const TCGCPUOps xtensa_tcg_ops = {
     .initialize = xtensa_translate_init,
     .debug_excp_handler = xtensa_breakpoint_handler,
     .restore_state_to_opc = xtensa_restore_state_to_opc,
+    .get_cpu_state = xtensa_get_cpu_state,
 
 #ifndef CONFIG_USER_ONLY
     .tlb_fill = xtensa_cpu_tlb_fill,
-- 
2.41.0


