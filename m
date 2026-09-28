Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64F9BC9833E
	for <qemu-riscv@archiver.kernel.org>; Mon, 28 Sep 2026 05:24:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xB3p0-0004EK-Nx; Mon, 28 Sep 2026 01:22:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xB3oR-0003sG-Ol
 for qemu-riscv@nongnu.org; Mon, 28 Sep 2026 01:22:04 -0400
Received: from mail-dl2-x0e.google.com ([2607:f8b0:4864:38::e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xB3oN-0007tN-M3
 for qemu-riscv@nongnu.org; Mon, 28 Sep 2026 01:22:03 -0400
Received: by mail-dl2-x0e.google.com with SMTP id
 a92af1059eb24-144efd1ea76so1368695c88.1
 for <qemu-riscv@nongnu.org>; Sun, 27 Sep 2026 22:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790572918; x=1791177718; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=OB8lPQA5tlyxT2OTWLHEUe/GeGeDIZ7ICpNG1y+sBIQ=;
 b=bgSFiSKMEEWc+aAnN9BeVHio2sl7zp+2GeCz7ELxvQ2eWeEVcirDFEtgze6220Nu5B
 KuRJhw3cjL8xJaH7H2E7FaKnO6WEzsB5XDqDOgdb7GAfryTeXTjg33RcAWcJQWRhQ6fr
 OSW4RXbpeGdDXiJaAQIDbwOoNFUC/fiAI4dNZAOamSXcywCNDwGeZdAg6ftYBm7wyF/d
 n+JhIlKMCoglzdVtSK3rGnxrpJUh+sKQ/ryOZzglktjUHBzBokBegiMV0+5T2Av+VXrZ
 jb7jI1pJf4VIQxneueRK6VuF/esuUCG9x+1PgvnO9hhhifP0GQXXezFlZ/hYGl/kDkFJ
 FXsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790572918; x=1791177718;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=OB8lPQA5tlyxT2OTWLHEUe/GeGeDIZ7ICpNG1y+sBIQ=;
 b=tIn+0y/5Lz2sSRxb7teZgHkY551YnGeE0yjuataDhwPIKY0JHQQNFvjr4BCXwgzNEu
 3aMAs4zkD6xfIVn8cjykVn1BHFN7s282pZ2+6/WYgiIpwtXwSzxI4zDQJ0hSKEuneQGT
 9vRzQKmCsa1dSB9X0zFhS7StKD4XNlqvPzs69lajMJ+xiFk1x76HuEpeXGIctYYKEKZ7
 3dWEMGhk2qTTJWBw8Cr13QbGXCzKAUirsITprZo3TJQ/pMiE1mtRAZbj6uxcDEpZnfv7
 wrkm/bMM30fLr7Iypb1NXHYLcwLdwC6JEkhWfVeND9hImb2CD3RNGpsz+jQB4HpYv7GO
 vzAQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBybLCVnjDLHKm+OTc07oXNVmdIDg80aJTraBjQya7OSm6cSsv6eHDT9H9lzX3NlWGekRBiJ/Nl9AQVQ@nongnu.org
X-Gm-Message-State: AFuF++lAv1/TfFtBnzMLI/hayTxSdcWI6VRJSZAg7vSG1MZE8f6Kmll8
 54OZ9V/n/SqKs2tTOnBG1s8iys7iqVciPERAu7HeC0HSyfzb1yKKLOgn
X-Gm-Gg: AYBFou1RP5up6cNNRXYgcyGvaEjGXHKQ9ZGyRyeIs6Isas8e5G9FUNXJfk22WI/v3R9
 NnGTEkVaUM9Se+82FzaT6fkD7bvEHj1zWYMHrwHPwuCxL/w3VXAuECe+XWjZHw1ttMBnshRYl08
 ff6yKyEyFPq1/8q9kVu7mBYYIOnvyDRrocUCt8yBF0blYBv14pluRs9o3ypJ57eLVS+fj416oSD
 fa0oJMrKSqg1pHWypzk//ZlaByha7UREjZQ09h0YnoyzzYoaxSuxIO4PQxymdzgqMIyZ31th6In
 TMWMuPebkFZrH1/08B4U4FFPTwrNhjiJfFS0b4vIBCstAT4DDdW3sOoV8IZhcnTGgx8x/iD1HjT
 EkC4m3VK5nXwOgr1X3pdk9ZPcvNPlKmj1E92tQOcSE+YJSZWiTqc1FkOQlkJ8q/CxsruoUyw+XI
 0GW+umopy9LW2fNA1c1X6KSg0uVLPWKZNZKS5tLots0iYtuj3jNRud45KV8xGpbt92+sLCzhkau
 IKdAarifjlMel20yatvNzfls7KAdSs=
X-Received: by 2002:a05:7022:ba2:b0:137:fa50:a242 with SMTP id
 a92af1059eb24-146cdfbbbe5mr11808495c88.1.1790572918005; 
 Sun, 27 Sep 2026 22:21:58 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 a92af1059eb24-146bb6551d9sm14726248c88.9.2026.09.27.22.21.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Sep 2026 22:21:57 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Helge Deller <deller@gmx.de>, Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Weiwei Li <liwei1518@gmail.com>, Brian Cain <brian.cain@oss.qualcomm.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Chao Liu <chao.liu@processmission.com>,
 Aleksandar Rikalo <arikalo@gmail.com>,
 Philippe Mathieu-Daude <philmd@mailo.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Stafford Horne <shorne@gmail.com>, Chinmay Rath <rathc@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Yoshinori Sato <yoshinori.sato@nifty.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Eric Farman <farman@linux.ibm.com>, qemu-riscv@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@kernel.org>, Glenn Miles <milesg@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Song Gao <17746591750@163.com>, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 Michael Rolnik <mrolnik@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-s390x@nongnu.org
Subject: [PATCH v2 07/24] target/sh4: convert raises to raise_excp
Date: Mon, 28 Sep 2026 13:20:33 +0800
Message-ID: <20260928052051.251-8-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260928052051.251-1-luoyonggang@gmail.com>
References: <20260928052051.251-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:38::e;
 envelope-from=luoyonggang@gmail.com; helo=mail-dl2-x0e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Translate illegal and FPU-disable through raise_excp. Drop unused
raise_* TCG helpers and the one-line raise_exception wrapper. Keep
leftover sleep, trapa, and exclusive helpers. Exit unaligned and
tlb_fill through cpu_loop_exit_excp. Log reset, manual reset, TLB
multiple, and user break.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 target/sh4/helper.c    | 82 +++++++++++++++++++++---------------------
 target/sh4/helper.h    |  4 ---
 target/sh4/op_helper.c | 43 +++-------------------
 target/sh4/translate.c | 12 ++++---
 4 files changed, 55 insertions(+), 86 deletions(-)

diff --git a/target/sh4/helper.c b/target/sh4/helper.c
index b6b057f104b..e22f02a5647 100644
--- a/target/sh4/helper.c
+++ b/target/sh4/helper.c
@@ -70,7 +70,7 @@ void superh_cpu_do_interrupt(CPUState *cs)
     do_irq = do_irq && (cs->exception_index == -1);
 
     if (env->sr & (1u << SR_BL)) {
-        if (do_exp && cs->exception_index != 0x1e0) {
+        if (do_exp && cs->exception_index != SH4_EXCP_USER_BREAK) {
             /* In theory a masked exception generates a reset exception,
                which in turn jumps to the reset vector. However this only
                works when using a bootloader. When using a kernel and an
@@ -97,45 +97,57 @@ void superh_cpu_do_interrupt(CPUState *cs)
     if (qemu_loglevel_mask(CPU_LOG_INT)) {
         const char *expname;
         switch (cs->exception_index) {
-        case 0x0e0:
+        case SH4_EXCP_RESET:
+            expname = "reset";
+            break;
+        case SH4_EXCP_MANUAL_RESET:
+            expname = "manual_reset";
+            break;
+        case SH4_EXCP_ADDR_ERROR:
             expname = "addr_error";
             break;
-        case 0x040:
+        case SH4_EXCP_TLB_MISS:
             expname = "tlb_miss";
             break;
-        case 0x0a0:
+        case SH4_EXCP_TLB_MULTIPLE:
+            expname = "tlb_multiple";
+            break;
+        case SH4_EXCP_TLB_VIOLATION:
             expname = "tlb_violation";
             break;
-        case 0x180:
+        case SH4_EXCP_ILLEGAL_INSTRUCTION:
             expname = "illegal_instruction";
             break;
-        case 0x1a0:
+        case SH4_EXCP_SLOT_ILLEGAL_INSTRUCTION:
             expname = "slot_illegal_instruction";
             break;
-        case 0x800:
+        case SH4_EXCP_FPU_DISABLE:
             expname = "fpu_disable";
             break;
-        case 0x820:
+        case SH4_EXCP_SLOT_FPU_DISABLE:
             expname = "slot_fpu";
             break;
-        case 0x100:
+        case SH4_EXCP_DATA_WRITE:
             expname = "data_write";
             break;
-        case 0x060:
+        case SH4_EXCP_DTLB_MISS_WRITE:
             expname = "dtlb_miss_write";
             break;
-        case 0x0c0:
+        case SH4_EXCP_DTLB_VIOLATION_WRITE:
             expname = "dtlb_violation_write";
             break;
-        case 0x120:
+        case SH4_EXCP_FPU:
             expname = "fpu_exception";
             break;
-        case 0x080:
+        case SH4_EXCP_INITIAL_PAGE_WRITE:
             expname = "initial_page_write";
             break;
-        case 0x160:
+        case SH4_EXCP_TRAPA:
             expname = "trapa";
             break;
+        case SH4_EXCP_USER_BREAK:
+            expname = "user_break";
+            break;
         default:
             expname = do_irq ? "interrupt" : "???";
             break;
@@ -161,18 +173,18 @@ void superh_cpu_do_interrupt(CPUState *cs)
     if (do_exp) {
         env->expevt = cs->exception_index;
         switch (cs->exception_index) {
-        case 0x000:
-        case 0x020:
-        case 0x140:
+        case SH4_EXCP_RESET:
+        case SH4_EXCP_MANUAL_RESET:
+        case SH4_EXCP_TLB_MULTIPLE:
             env->sr &= ~(1u << SR_FD);
             env->sr |= 0xf << 4; /* IMASK */
             env->pc = 0xa0000000;
             break;
-        case 0x040:
-        case 0x060:
+        case SH4_EXCP_TLB_MISS:
+        case SH4_EXCP_DTLB_MISS_WRITE:
             env->pc = env->vbr + 0x400;
             break;
-        case 0x160:
+        case SH4_EXCP_TRAPA:
             env->spc += 2; /* special case for TRAPA */
             /* fall through */
         default:
@@ -632,7 +644,7 @@ void cpu_sh4_write_mmaped_utlb_addr(CPUSH4State *s, hwaddr addr,
                     CPUState *cs = env_cpu(s);
 
                     /* Multiple TLB Exception */
-                    cs->exception_index = 0x140;
+                    cs->exception_index = SH4_EXCP_TLB_MULTIPLE;
                     s->tea = addr;
                     break;
                 }
@@ -828,37 +840,27 @@ bool superh_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
     switch (ret) {
     case MMU_ITLB_MISS:
     case MMU_DTLB_MISS_READ:
-        cs->exception_index = 0x040;
-        break;
+        cpu_loop_exit_excp(cs, SH4_EXCP_TLB_MISS, retaddr);
     case MMU_DTLB_MULTIPLE:
     case MMU_ITLB_MULTIPLE:
-        cs->exception_index = 0x140;
-        break;
+        cpu_loop_exit_excp(cs, SH4_EXCP_TLB_MULTIPLE, retaddr);
     case MMU_ITLB_VIOLATION:
-        cs->exception_index = 0x0a0;
-        break;
+        cpu_loop_exit_excp(cs, SH4_EXCP_TLB_VIOLATION, retaddr);
     case MMU_DTLB_MISS_WRITE:
-        cs->exception_index = 0x060;
-        break;
+        cpu_loop_exit_excp(cs, SH4_EXCP_DTLB_MISS_WRITE, retaddr);
     case MMU_DTLB_INITIAL_WRITE:
-        cs->exception_index = 0x080;
-        break;
+        cpu_loop_exit_excp(cs, SH4_EXCP_INITIAL_PAGE_WRITE, retaddr);
     case MMU_DTLB_VIOLATION_READ:
-        cs->exception_index = 0x0a0;
-        break;
+        cpu_loop_exit_excp(cs, SH4_EXCP_TLB_VIOLATION, retaddr);
     case MMU_DTLB_VIOLATION_WRITE:
-        cs->exception_index = 0x0c0;
-        break;
+        cpu_loop_exit_excp(cs, SH4_EXCP_DTLB_VIOLATION_WRITE, retaddr);
     case MMU_IADDR_ERROR:
     case MMU_DADDR_ERROR_READ:
-        cs->exception_index = 0x0e0;
-        break;
+        cpu_loop_exit_excp(cs, SH4_EXCP_ADDR_ERROR, retaddr);
     case MMU_DADDR_ERROR_WRITE:
-        cs->exception_index = 0x100;
-        break;
+        cpu_loop_exit_excp(cs, SH4_EXCP_DATA_WRITE, retaddr);
     default:
         cpu_abort(cs, "Unhandled MMU fault");
     }
-    cpu_loop_exit_restore(cs, retaddr);
 }
 #endif /* !CONFIG_USER_ONLY */
diff --git a/target/sh4/helper.h b/target/sh4/helper.h
index 29011d3dbbb..593b20c0af2 100644
--- a/target/sh4/helper.h
+++ b/target/sh4/helper.h
@@ -1,8 +1,4 @@
 DEF_HELPER_1(ldtlb, void, env)
-DEF_HELPER_1(raise_illegal_instruction, noreturn, env)
-DEF_HELPER_1(raise_slot_illegal_instruction, noreturn, env)
-DEF_HELPER_1(raise_fpu_disable, noreturn, env)
-DEF_HELPER_1(raise_slot_fpu_disable, noreturn, env)
 DEF_HELPER_1(sleep, noreturn, env)
 DEF_HELPER_2(trapa, noreturn, env, i32)
 DEF_HELPER_1(exclusive, noreturn, env)
diff --git a/target/sh4/op_helper.c b/target/sh4/op_helper.c
index 777380f8e40..535bffb08f1 100644
--- a/target/sh4/op_helper.c
+++ b/target/sh4/op_helper.c
@@ -33,15 +33,12 @@ void superh_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
     switch (access_type) {
     case MMU_INST_FETCH:
     case MMU_DATA_LOAD:
-        cs->exception_index = 0x0e0;
-        break;
+        cpu_loop_exit_excp(cs, SH4_EXCP_ADDR_ERROR, retaddr);
     case MMU_DATA_STORE:
-        cs->exception_index = 0x100;
-        break;
+        cpu_loop_exit_excp(cs, SH4_EXCP_DATA_WRITE, retaddr);
     default:
         g_assert_not_reached();
     }
-    cpu_loop_exit_restore(cs, retaddr);
 }
 
 #endif
@@ -55,49 +52,19 @@ void helper_ldtlb(CPUSH4State *env)
 #endif
 }
 
-static inline G_NORETURN
-void raise_exception(CPUSH4State *env, int index,
-                     uintptr_t retaddr)
-{
-    CPUState *cs = env_cpu(env);
-
-    cs->exception_index = index;
-    cpu_loop_exit_restore(cs, retaddr);
-}
-
-void helper_raise_illegal_instruction(CPUSH4State *env)
-{
-    raise_exception(env, 0x180, 0);
-}
-
-void helper_raise_slot_illegal_instruction(CPUSH4State *env)
-{
-    raise_exception(env, 0x1a0, 0);
-}
-
-void helper_raise_fpu_disable(CPUSH4State *env)
-{
-    raise_exception(env, 0x800, 0);
-}
-
-void helper_raise_slot_fpu_disable(CPUSH4State *env)
-{
-    raise_exception(env, 0x820, 0);
-}
-
 void helper_sleep(CPUSH4State *env)
 {
     CPUState *cs = env_cpu(env);
 
     cs->halted = 1;
     env->in_sleep = 1;
-    raise_exception(env, EXCP_HLT, 0);
+    cpu_loop_exit_excp(cs, EXCP_HLT, 0);
 }
 
 void helper_trapa(CPUSH4State *env, uint32_t tra)
 {
     env->tra = tra << 2;
-    raise_exception(env, 0x160, 0);
+    cpu_loop_exit_excp(env_cpu(env), SH4_EXCP_TRAPA, 0);
 }
 
 void helper_exclusive(CPUSH4State *env)
@@ -255,7 +222,7 @@ static void update_fpscr(CPUSH4State *env, uintptr_t retaddr)
         cause = (env->fpscr & FPSCR_CAUSE_MASK) >> FPSCR_CAUSE_SHIFT;
         enable = (env->fpscr & FPSCR_ENABLE_MASK) >> FPSCR_ENABLE_SHIFT;
         if (cause & enable) {
-            raise_exception(env, 0x120, retaddr);
+            cpu_loop_exit_excp(env_cpu(env), SH4_EXCP_FPU, retaddr);
         }
     }
 }
diff --git a/target/sh4/translate.c b/target/sh4/translate.c
index 5729a757f19..590b62ba3c1 100644
--- a/target/sh4/translate.c
+++ b/target/sh4/translate.c
@@ -1756,10 +1756,13 @@ static void _decode_opc(DisasContext * ctx)
     if (ctx->envflags & TB_FLAG_DELAY_SLOT_MASK) {
  do_illegal_slot:
         gen_save_cpu_state(ctx, true);
-        gen_helper_raise_slot_illegal_instruction(tcg_env);
+        gen_helper_raise_excp(tcg_env,
+                              tcg_constant_i32(
+                                  SH4_EXCP_SLOT_ILLEGAL_INSTRUCTION));
     } else {
         gen_save_cpu_state(ctx, true);
-        gen_helper_raise_illegal_instruction(tcg_env);
+        gen_helper_raise_excp(tcg_env,
+                              tcg_constant_i32(SH4_EXCP_ILLEGAL_INSTRUCTION));
     }
     ctx->base.is_jmp = DISAS_NORETURN;
     return;
@@ -1767,9 +1770,10 @@ static void _decode_opc(DisasContext * ctx)
  do_fpu_disabled:
     gen_save_cpu_state(ctx, true);
     if (ctx->envflags & TB_FLAG_DELAY_SLOT_MASK) {
-        gen_helper_raise_slot_fpu_disable(tcg_env);
+        gen_helper_raise_excp(tcg_env,
+                              tcg_constant_i32(SH4_EXCP_SLOT_FPU_DISABLE));
     } else {
-        gen_helper_raise_fpu_disable(tcg_env);
+        gen_helper_raise_excp(tcg_env, tcg_constant_i32(SH4_EXCP_FPU_DISABLE));
     }
     ctx->base.is_jmp = DISAS_NORETURN;
 }
-- 
2.52.0.windows.1


