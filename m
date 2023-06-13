Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20A8CC04FDF
	for <qemu-riscv@archiver.kernel.org>; Tue, 13 Jun 2023 13:28:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q94BW-0008ND-LU; Tue, 13 Jun 2023 09:35:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q94BV-0008Jd-JJ
 for qemu-riscv@nongnu.org; Tue, 13 Jun 2023 09:35:45 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q94BT-0002V5-Il
 for qemu-riscv@nongnu.org; Tue, 13 Jun 2023 09:35:45 -0400
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-977e83d536fso785078066b.3
 for <qemu-riscv@nongnu.org>; Tue, 13 Jun 2023 06:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686663342; x=1689255342;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W5VKZg4F+9MZrxoe7cg5j1eqlVZezbWvVtc1kXE6jLI=;
 b=J35vi3VH77ic5CB7eWaFNePExdyljKcZQj01xauILe+x4JUst3Ccvn+1XArbonvZLE
 fyvVfY2fWF4PHdmGDimG/00rBSRngemsdkiopZonH8Z69XHmLdnQTVHHIw52SIYSW1n/
 i/ZH3hF88cTczOQ7UOPG2M62kO9T2ItuW2Fvk7sgFzkNJPo7mMWkEE7fOi1YD3QmSMhs
 A5hcVhzG5NvC4CV9qCQEeY2Q0hVXlIHythAcvOYSnSuDeWvxjX0rrkSajPMVXbmv7DTZ
 rOazquvI7cd80eLY81UoFhaSsH084eqs3rbjHYABRiraAt1Mb9sW3xgEZToCW/wYmxnD
 jFFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686663342; x=1689255342;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W5VKZg4F+9MZrxoe7cg5j1eqlVZezbWvVtc1kXE6jLI=;
 b=JeUEtYOZzFeQZ7X+PazwS7jVOo3x6+QA30RNhW7fdnlOZ61VS2uaeg1YC2A76fdKjI
 1hoJu5w8/9p3VpafsrMtcuDzn+LT1uNL9nNdwqirMYKX5Zi2YcP61/oadrbZJI8EA1h8
 fE004itjyohExVOCJ3OTXlGDb1sYETFxV6XJ/gCmI3lLBf/lx17vS8H5fdoJW932+GIL
 5ne1JBW1m2QGye/iPufHzb27fWTeDTyNWKKdwW4KhEhFc2oAooxA1vbIOjksH3ENqD9w
 ERQKG84yGhQJp4LHsqj/453l6m1LbumfbpW6SjD0XiH+Q4Y4mat3Kmsl5wuaxJFczOON
 w8Tw==
X-Gm-Message-State: AC+VfDyZvdRmgDwsYeXTh2pwN1+sUEC/RZ6E8TQ572xjyDoGmxxFfB9i
 GTfLzoCT6szn7OY7zPV3P5OUqZsP1juIC65UzrY=
X-Google-Smtp-Source: ACHHUZ6+9yQtcr6vv/YSmI0mZdn5emvonq42VnVNLYssP5nUQr3e+ene+geJONoCeiLZ3bN3b0AnxA==
X-Received: by 2002:a17:907:944f:b0:982:1936:ad20 with SMTP id
 dl15-20020a170907944f00b009821936ad20mr4363066ejc.2.1686663342192; 
 Tue, 13 Jun 2023 06:35:42 -0700 (PDT)
Received: from localhost.localdomain ([213.235.133.109])
 by smtp.gmail.com with ESMTPSA id
 kg6-20020a17090776e600b009661484e84esm6639050ejc.191.2023.06.13.06.35.36
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 13 Jun 2023 06:35:41 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Thomas Huth <thuth@redhat.com>,
 qemu-s390x@nongnu.org, qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 3/9] target/m68k: Check for USER_ONLY definition instead of
 SOFTMMU one
Date: Tue, 13 Jun 2023 15:33:41 +0200
Message-Id: <20230613133347.82210-4-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230613133347.82210-1-philmd@linaro.org>
References: <20230613133347.82210-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x631.google.com
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

Since we *might* have user emulation with softmmu,
replace the system emulation check by !user emulation one.

Invert some if() ladders for clarity.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/m68k/helper.h    |  2 +-
 target/m68k/cpu.c       | 14 ++++++--------
 target/m68k/helper.c    |  4 ++--
 target/m68k/translate.c | 28 ++++++++++++++--------------
 4 files changed, 23 insertions(+), 25 deletions(-)

diff --git a/target/m68k/helper.h b/target/m68k/helper.h
index c9bed2b884..2bbe0dc032 100644
--- a/target/m68k/helper.h
+++ b/target/m68k/helper.h
@@ -124,7 +124,7 @@ DEF_HELPER_FLAGS_4(bfffo_mem, TCG_CALL_NO_WG, i64, env, i32, s32, i32)
 DEF_HELPER_3(chk, void, env, s32, s32)
 DEF_HELPER_4(chk2, void, env, s32, s32, s32)
 
-#if defined(CONFIG_SOFTMMU)
+#if !defined(CONFIG_USER_ONLY)
 DEF_HELPER_3(ptest, void, env, i32, i32)
 DEF_HELPER_3(pflush, void, env, i32, i32)
 DEF_HELPER_FLAGS_1(reset, TCG_CALL_NO_RWG, void, env)
diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
index 99af1ab541..70d58471dc 100644
--- a/target/m68k/cpu.c
+++ b/target/m68k/cpu.c
@@ -80,10 +80,10 @@ static void m68k_cpu_reset_hold(Object *obj)
     }
 
     memset(env, 0, offsetof(CPUM68KState, end_reset_fields));
-#ifdef CONFIG_SOFTMMU
-    cpu_m68k_set_sr(env, SR_S | SR_I);
-#else
+#ifdef CONFIG_USER_ONLY
     cpu_m68k_set_sr(env, 0);
+#else
+    cpu_m68k_set_sr(env, SR_S | SR_I);
 #endif
     for (i = 0; i < 8; i++) {
         env->fregs[i].d = nan;
@@ -334,7 +334,7 @@ static void m68k_cpu_initfn(Object *obj)
     cpu_set_cpustate_pointers(cpu);
 }
 
-#if defined(CONFIG_SOFTMMU)
+#if !defined(CONFIG_USER_ONLY)
 static bool fpu_needed(void *opaque)
 {
     M68kCPU *s = opaque;
@@ -525,15 +525,13 @@ static const VMStateDescription vmstate_m68k_cpu = {
         NULL
     },
 };
-#endif
 
-#ifndef CONFIG_USER_ONLY
 #include "hw/core/sysemu-cpu-ops.h"
 
 static const struct SysemuCPUOps m68k_sysemu_ops = {
     .get_phys_page_debug = m68k_cpu_get_phys_page_debug,
 };
-#endif
+#endif /* !CONFIG_USER_ONLY */
 
 #include "hw/core/tcg-cpu-ops.h"
 
@@ -568,7 +566,7 @@ static void m68k_cpu_class_init(ObjectClass *c, void *data)
     cc->get_pc = m68k_cpu_get_pc;
     cc->gdb_read_register = m68k_cpu_gdb_read_register;
     cc->gdb_write_register = m68k_cpu_gdb_write_register;
-#if defined(CONFIG_SOFTMMU)
+#if !defined(CONFIG_USER_ONLY)
     dc->vmsd = &vmstate_m68k_cpu;
     cc->sysemu_ops = &m68k_sysemu_ops;
 #endif
diff --git a/target/m68k/helper.c b/target/m68k/helper.c
index 3b3a6ea8bd..01c18a7c59 100644
--- a/target/m68k/helper.c
+++ b/target/m68k/helper.c
@@ -1480,7 +1480,7 @@ void HELPER(set_mac_extu)(CPUM68KState *env, uint32_t val, uint32_t acc)
     env->macc[acc + 1] = res;
 }
 
-#if defined(CONFIG_SOFTMMU)
+#if !defined(CONFIG_USER_ONLY)
 void HELPER(ptest)(CPUM68KState *env, uint32_t addr, uint32_t is_read)
 {
     hwaddr physical;
@@ -1534,4 +1534,4 @@ void HELPER(reset)(CPUM68KState *env)
 {
     /* FIXME: reset all except CPU */
 }
-#endif
+#endif /* !CONFIG_USER_ONLY */
diff --git a/target/m68k/translate.c b/target/m68k/translate.c
index 551ef9e52a..e07161d76f 100644
--- a/target/m68k/translate.c
+++ b/target/m68k/translate.c
@@ -2637,10 +2637,10 @@ DISAS_INSN(swap)
 
 DISAS_INSN(bkpt)
 {
-#if defined(CONFIG_SOFTMMU)
-    gen_exception(s, s->base.pc_next, EXCP_ILLEGAL);
-#else
+#if defined(CONFIG_USER_ONLY)
     gen_exception(s, s->base.pc_next, EXCP_DEBUG);
+#else
+    gen_exception(s, s->base.pc_next, EXCP_ILLEGAL);
 #endif
 }
 
@@ -2838,7 +2838,7 @@ DISAS_INSN(unlk)
     tcg_gen_addi_i32(QREG_SP, src, 4);
 }
 
-#if defined(CONFIG_SOFTMMU)
+#if !defined(CONFIG_USER_ONLY)
 DISAS_INSN(reset)
 {
     if (IS_USER(s)) {
@@ -4398,7 +4398,7 @@ DISAS_INSN(move_from_sr)
     DEST_EA(env, insn, OS_WORD, sr, NULL);
 }
 
-#if defined(CONFIG_SOFTMMU)
+#if !defined(CONFIG_USER_ONLY)
 DISAS_INSN(moves)
 {
     int opsize;
@@ -4605,7 +4605,7 @@ DISAS_INSN(cinv)
     /* Invalidate cache line.  Implement as no-op.  */
 }
 
-#if defined(CONFIG_SOFTMMU)
+#if !defined(CONFIG_USER_ONLY)
 DISAS_INSN(pflush)
 {
     TCGv opmode;
@@ -5352,7 +5352,7 @@ DISAS_INSN(ftrapcc)
     do_trapcc(s, &c);
 }
 
-#if defined(CONFIG_SOFTMMU)
+#if !defined(CONFIG_USER_ONLY)
 DISAS_INSN(frestore)
 {
     TCGv addr;
@@ -5795,7 +5795,7 @@ void register_m68k_insns (CPUM68KState *env)
     BASE(bitop_im,  08c0, ffc0);
     INSN(arith_im,  0a80, fff8, CF_ISA_A);
     INSN(arith_im,  0a00, ff00, M68K);
-#if defined(CONFIG_SOFTMMU)
+#if !defined(CONFIG_USER_ONLY)
     INSN(moves,     0e00, ff00, M68K);
 #endif
     INSN(cas,       0ac0, ffc0, CAS);
@@ -5824,7 +5824,7 @@ void register_m68k_insns (CPUM68KState *env)
     BASE(move_to_ccr, 44c0, ffc0);
     INSN(not,       4680, fff8, CF_ISA_A);
     INSN(not,       4600, ff00, M68K);
-#if defined(CONFIG_SOFTMMU)
+#if !defined(CONFIG_USER_ONLY)
     BASE(move_to_sr, 46c0, ffc0);
 #endif
     INSN(nbcd,      4800, ffc0, M68K);
@@ -5841,7 +5841,7 @@ void register_m68k_insns (CPUM68KState *env)
     BASE(tst,       4a00, ff00);
     INSN(tas,       4ac0, ffc0, CF_ISA_B);
     INSN(tas,       4ac0, ffc0, M68K);
-#if defined(CONFIG_SOFTMMU)
+#if !defined(CONFIG_USER_ONLY)
     INSN(halt,      4ac8, ffff, CF_ISA_A);
     INSN(halt,      4ac8, ffff, M68K);
 #endif
@@ -5855,7 +5855,7 @@ void register_m68k_insns (CPUM68KState *env)
     BASE(trap,      4e40, fff0);
     BASE(link,      4e50, fff8);
     BASE(unlk,      4e58, fff8);
-#if defined(CONFIG_SOFTMMU)
+#if !defined(CONFIG_USER_ONLY)
     INSN(move_to_usp, 4e60, fff8, USP);
     INSN(move_from_usp, 4e68, fff8, USP);
     INSN(reset,     4e70, ffff, M68K);
@@ -5980,7 +5980,7 @@ void register_m68k_insns (CPUM68KState *env)
     INSN(ftrapcc,   f27a, fffe, FPU);       /* opmode 010, 011 */
     INSN(ftrapcc,   f27c, ffff, FPU);       /* opmode 100 */
     INSN(fbcc,      f280, ff80, FPU);
-#if defined(CONFIG_SOFTMMU)
+#if !defined(CONFIG_USER_ONLY)
     INSN(frestore,  f340, ffc0, CF_FPU);
     INSN(fsave,     f300, ffc0, CF_FPU);
     INSN(frestore,  f340, ffc0, FPU);
@@ -6190,7 +6190,7 @@ void m68k_cpu_dump_state(CPUState *cs, FILE *f, int flags)
         break;
     }
     qemu_fprintf(f, "\n");
-#ifdef CONFIG_SOFTMMU
+#ifndef CONFIG_USER_ONLY
     qemu_fprintf(f, "%sA7(MSP) = %08x %sA7(USP) = %08x %sA7(ISP) = %08x\n",
                  env->current_sp == M68K_SSP ? "->" : "  ", env->sp[M68K_SSP],
                  env->current_sp == M68K_USP ? "->" : "  ", env->sp[M68K_USP],
@@ -6204,5 +6204,5 @@ void m68k_cpu_dump_state(CPUState *cs, FILE *f, int flags)
                  env->mmu.ttr[M68K_ITTR0], env->mmu.ttr[M68K_ITTR1]);
     qemu_fprintf(f, "MMUSR %08x, fault at %08x\n",
                  env->mmu.mmusr, env->mmu.ar);
-#endif
+#endif /* !CONFIG_USER_ONLY */
 }
-- 
2.38.1


