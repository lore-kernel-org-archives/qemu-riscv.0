Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01E46CD11BF
	for <qemu-riscv@archiver.kernel.org>; Tue, 19 Mar 2024 15:46:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rmbeG-0000Un-Vm; Tue, 19 Mar 2024 11:45:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rmbdx-0007sQ-BN
 for qemu-riscv@nongnu.org; Tue, 19 Mar 2024 11:44:50 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rmbdu-0005Mu-Fu
 for qemu-riscv@nongnu.org; Tue, 19 Mar 2024 11:44:49 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-41462295004so8926695e9.0
 for <qemu-riscv@nongnu.org>; Tue, 19 Mar 2024 08:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710863085; x=1711467885; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NFX4++ImuD2EMXqBk24v8xDkpJQsfeFGsz4R2q2Dmzg=;
 b=v7Nl1bsEgu2N1g2/sg8QQa9gd/k9/esWP9SUTdz0DuVGtHzCGqe4yKZkSKfQjF0CUp
 b3p8YZADPWidLpE+Ck6dWeEg+Ra5gstFKgZd72IHLi7R/s2CA1PgNUqwsfdswFkr9WS5
 EXFkzqfXotXmWfsR79J8rrOPUWozUb4SKt2gVjiSRyc5Hiz/D9JjcTIseQtaqubSG5r5
 dOSd+9uVeyw8RXB9C2Ih/EPX4xEueMGLC1MU9kLsj+PC8m5v8wYqQfVKtcXutDbYPwT0
 MXNOdkFi9rjoFJoXkqFOik2PEzBV5PhGNnWB//irbNqSTnVYnYEzxMxyeav+Nm9I9BvJ
 7YlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710863085; x=1711467885;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NFX4++ImuD2EMXqBk24v8xDkpJQsfeFGsz4R2q2Dmzg=;
 b=qzvZWcvWrrzzkrJHOMPr3Mg1iLRoKC4MUdn2QGGAZTmhQo6OY6OopLcFD/44CJHmIH
 LdmN9ZZBxsmviEfPRNvogERqEbBRSjH2feGQyYC+GKJiDHHjRZ9i814iNAWo+RTidJek
 f9Hs4F748k3QsbMS44A0F99QDZGX0CRBPtYGfnv4h6PkT8IYlEX2BHfdZXrxJnwEjG25
 wygxj1CRrHPAMhBWwNJecoURZj3P9P7AcCiEg20cAMw7Ie0s4d3cazUYK2SgPqjv+s/l
 1HkgHoy7L3RlhxAsP4KVo2XJ4Iw2bv+zDeZd6whANBLhvbo7R2d8J+7p2eDQtMEN20Pn
 q5mA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXg9yCtbiDYXrbM+33NB4MFDMLaoRPOGeS+p/jqptRsb6W7pmWJMMa6OMvZupCpL177ws6wulz7Qd0Z+O/cKpqbCgCPMPQ=
X-Gm-Message-State: AOJu0YzWC7p7LeA+iDevcNdzoJsp3eHRK3eGoPYu+kQUh3GhdTIb3o2c
 SEMKb2xVAjU/HR29+AiHZOGNMjMKaP8T4dlzQXjlHlvqFBdcgwpts+sIgcVHEsw=
X-Google-Smtp-Source: AGHT+IHzPpf9ptxXW9pOcfECwglVsTmJA1zwSgI/vuEbMPwyM7mqdsQjjpPqbYwc+XIFAqUwI2Ws7g==
X-Received: by 2002:a05:600c:1c15:b0:414:c64:f3d0 with SMTP id
 j21-20020a05600c1c1500b004140c64f3d0mr5088397wms.27.1710863084853; 
 Tue, 19 Mar 2024 08:44:44 -0700 (PDT)
Received: from m1x-phil.lan ([176.176.166.129])
 by smtp.gmail.com with ESMTPSA id
 n20-20020a05600c4f9400b00414610d9223sm4091610wmq.14.2024.03.19.08.44.43
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 19 Mar 2024 08:44:44 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Anton Johansson <anjo@rev.ng>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH-for-9.1 18/27] target/ppc: Convert to
 TCGCPUOps::get_cpu_state()
Date: Tue, 19 Mar 2024 16:42:47 +0100
Message-ID: <20240319154258.71206-19-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240319154258.71206-1-philmd@linaro.org>
References: <20240319154258.71206-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
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

Convert cpu_get_tb_cpu_state() to TCGCPUOps::get_cpu_state(),
unifying with the method declared in target/ppc/helper_regs.c.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/ppc/cpu.h         | 16 +++-------------
 target/ppc/cpu_init.c    |  1 +
 target/ppc/helper_regs.c | 13 +++++++------
 3 files changed, 11 insertions(+), 19 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index ced4e53024..6aa18db335 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -2716,19 +2716,9 @@ void cpu_write_xer(CPUPPCState *env, target_ulong xer);
  */
 #define is_book3s_arch2x(ctx) (!!((ctx)->insns_flags & PPC_SEGMENT_64B))
 
-#define TARGET_HAS_CPU_GET_TB_CPU_STATE
-
-#ifdef CONFIG_DEBUG_TCG
-void cpu_get_tb_cpu_state(CPUPPCState *env, vaddr *pc,
-                          uint64_t *cs_base, uint32_t *flags);
-#else
-static inline void cpu_get_tb_cpu_state(CPUPPCState *env, vaddr *pc,
-                                        uint64_t *cs_base, uint32_t *flags)
-{
-    *pc = env->nip;
-    *cs_base = 0;
-    *flags = env->hflags;
-}
+#ifdef CONFIG_TCG
+void ppc_get_cpu_state(CPUPPCState *env, vaddr *pc,
+                       uint64_t *cs_base, uint32_t *flags);
 #endif
 
 G_NORETURN void raise_exception(CPUPPCState *env, uint32_t exception);
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 464e91faa2..673559b444 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -7362,6 +7362,7 @@ static const struct SysemuCPUOps ppc_sysemu_ops = {
 static const TCGCPUOps ppc_tcg_ops = {
     .initialize = ppc_translate_init,
     .restore_state_to_opc = ppc_restore_state_to_opc,
+    .get_cpu_state = ppc_get_cpu_state,
 
 #ifdef CONFIG_USER_ONLY
     .record_sigsegv = ppc_cpu_record_sigsegv,
diff --git a/target/ppc/helper_regs.c b/target/ppc/helper_regs.c
index 25258986e3..e62591067c 100644
--- a/target/ppc/helper_regs.c
+++ b/target/ppc/helper_regs.c
@@ -217,25 +217,26 @@ void hreg_update_pmu_hflags(CPUPPCState *env)
     env->hflags |= hreg_compute_pmu_hflags_value(env);
 }
 
-#ifdef CONFIG_DEBUG_TCG
-void cpu_get_tb_cpu_state(CPUPPCState *env, vaddr *pc,
-                          uint64_t *cs_base, uint32_t *flags)
+#ifdef CONFIG_TCG
+void ppc_get_cpu_state(CPUPPCState *env, vaddr *pc,
+                       uint64_t *cs_base, uint32_t *flags)
 {
     uint32_t hflags_current = env->hflags;
-    uint32_t hflags_rebuilt;
 
     *pc = env->nip;
     *cs_base = 0;
     *flags = hflags_current;
 
-    hflags_rebuilt = hreg_compute_hflags_value(env);
+#ifdef CONFIG_DEBUG_TCG
+    uint32_t hflags_rebuilt = hreg_compute_hflags_value(env);
     if (unlikely(hflags_current != hflags_rebuilt)) {
         cpu_abort(env_cpu(env),
                   "TCG hflags mismatch (current:0x%08x rebuilt:0x%08x)\n",
                   hflags_current, hflags_rebuilt);
     }
-}
 #endif
+}
+#endif /* CONFIG_TCG */
 
 void cpu_interrupt_exittb(CPUState *cs)
 {
-- 
2.41.0


