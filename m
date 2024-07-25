Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FB4EC3DA70
	for <qemu-riscv@archiver.kernel.org>; Thu, 25 Jul 2024 23:49:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sX8Ab-0000rZ-JE; Thu, 25 Jul 2024 19:46:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1sX8AN-0008Kp-1A
 for qemu-riscv@nongnu.org; Thu, 25 Jul 2024 19:46:35 -0400
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1sX8AK-0005Kb-NV
 for qemu-riscv@nongnu.org; Thu, 25 Jul 2024 19:46:34 -0400
Received: by mail-oi1-x229.google.com with SMTP id
 5614622812f47-3db14339fb0so258251b6e.2
 for <qemu-riscv@nongnu.org>; Thu, 25 Jul 2024 16:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721951191; x=1722555991;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iy2RtCvQM5Izk8U1ElO9Cl5d6+0t6yQiX5e7wEg0d5I=;
 b=bFdND8Ih4Ovl/pQtI9rP/b9vjTpmhxGlb0/UWb5UuInj6QOImIqN6eFbZxPzNneD2h
 M4c3iFYv2Xybq1v3F5aXcYuhYz8luR1tdTg18+vkSx0yQVBotISn36t4D3ZAw/aOKq7Y
 xtOAqeNhFugSb629jdmMab6PmOMVYl9vXz0qI1gawyBAJf7X/cvZD3KNWHD6oI3iRDt8
 6vA/SYkqfSRlu+gIptUvmkHWj8e3BzHH+ePQhS6mfvl4y2w8Ucvd2kibX2Mm0yP/h5Pc
 Dy7sSkfMvoXvpGWDVkP0d/k0IKsY0W9mKUCca4X75XF/yEHEh0ClRJFYe9j3wxVgWlUR
 a2dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721951191; x=1722555991;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iy2RtCvQM5Izk8U1ElO9Cl5d6+0t6yQiX5e7wEg0d5I=;
 b=K20lnQg3PGIE9CtobgRluPHmqBXZf1V2dB0fcoykStm5zGfsEI7KwuzXRalazCe4OR
 fAG9OMqWVdYDiPe7pJqsWFK+3lkPJSKqbwh7Cuw6+NTjHIJf+8kSUvkfCAuT+8om+nJu
 gqIh+PyKx3kuIUK64gyE40nwoKk5+LDgAlJ/PiZzBjOWgPK2jVF7QXz43u+iGAh+emvC
 eqQcJWQ1h7sfdjIhDueVcPxCTqkmiBl/1Ce0Z0xQhvhEV505KIVfPYJNHKFS/o6RXMfQ
 0h6ipPDcQ6LNE9tEdlrd/JNmlu8GsO5ojCJ/7d3j9ETahBZmR9FNnDt0eF++bfC+x3Qa
 RkEA==
X-Gm-Message-State: AOJu0YzdhStLJqiYZbJmaK8L1upDW1g9u0qhHVUY8hGtEqZjn3j/0VSw
 aLY2/PlzdgAw5BPq3AyZSNL/4HcT6PhlkB79y5ZtCCAV505pNFWsV9ciM9DzckmzZa1nJ++vnJ2
 0
X-Google-Smtp-Source: AGHT+IHH+LRvZy2lO44+sB35EQn3Ae71JOHLStYRA2w8mljFOucWrzbONIZeFaZDji1rdvec+EWxvw==
X-Received: by 2002:a05:6808:2190:b0:3d9:28cc:5329 with SMTP id
 5614622812f47-3db10f192c6mr5392527b6e.17.1721951191390; 
 Thu, 25 Jul 2024 16:46:31 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70ead8128d0sm1647565b3a.118.2024.07.25.16.46.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jul 2024 16:46:31 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
To: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, jim.shu@sifive.com,
 andy.chiu@sifive.com, jesse.huang@sifive.com, kito.cheng@sifive.com
Cc: palmer@dabbelt.com, Alistair.Francis@wdc.com, laurent@vivier.eu,
 bmeng.cn@gmail.com, liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, Deepak Gupta <debug@rivosinc.com>
Subject: [PATCH 06/24] target/riscv: zicfilp `lpad` impl and branch tracking
Date: Thu, 25 Jul 2024 16:45:55 -0700
Message-ID: <20240725234614.3850142-7-debug@rivosinc.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240725234614.3850142-1-debug@rivosinc.com>
References: <20240725234614.3850142-1-debug@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::229;
 envelope-from=debug@rivosinc.com; helo=mail-oi1-x229.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Implements setting lp expected when `jalr` is encountered and implements
`lpad` instruction of zicfilp. `lpad` instruction is taken out of
auipc x0, <imm_20>. This is an existing HINTNOP space. If `lpad` is
target of an indirect branch, cpu checks for 20 bit value in x7 upper
with 20 bit value embedded in `lpad`. If they don't match, cpu raises a
sw check exception with tval = 2.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
Co-developed-by: Jim Shu <jim.shu@sifive.com>
Co-developed-by: Andy Chiu <andy.chiu@sifive.com>
---
 target/riscv/cpu_user.h                 |  1 +
 target/riscv/helper.h                   |  4 ++
 target/riscv/insn32.decode              |  6 ++-
 target/riscv/insn_trans/trans_rvi.c.inc | 51 +++++++++++++++++++++++++
 target/riscv/op_helper.c                | 32 ++++++++++++++++
 5 files changed, 93 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu_user.h b/target/riscv/cpu_user.h
index 02afad608b..e6927ff847 100644
--- a/target/riscv/cpu_user.h
+++ b/target/riscv/cpu_user.h
@@ -15,5 +15,6 @@
 #define xA6 16
 #define xA7 17  /* syscall number for RVI ABI */
 #define xT0 5   /* syscall number for RVE ABI */
+#define xT2 7
 
 #endif
diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 451261ce5a..ab55bbbf73 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -121,6 +121,10 @@ DEF_HELPER_2(cbo_clean_flush, void, env, tl)
 DEF_HELPER_2(cbo_inval, void, env, tl)
 DEF_HELPER_2(cbo_zero, void, env, tl)
 
+/* Forward CFI label checking */
+DEF_HELPER_2(cfi_jalr, void, env, int)
+DEF_HELPER_2(cfi_check_landing_pad, void, env, int)
+
 /* Special functions */
 DEF_HELPER_2(csrr, tl, env, int)
 DEF_HELPER_3(csrw, void, env, int, tl)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index c45b8fa1d8..c963c59c8e 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -40,6 +40,7 @@
 %imm_z6   26:1 15:5
 %imm_mop5 30:1 26:2 20:2
 %imm_mop3 30:1 26:2
+%imm_cfi20 12:20
 
 # Argument sets:
 &empty
@@ -123,7 +124,10 @@ sfence_vm   0001000    00100 ..... 000 00000 1110011 @sfence_vm
 
 # *** RV32I Base Instruction Set ***
 lui      ....................       ..... 0110111 @u
-auipc    ....................       ..... 0010111 @u
+{
+  lpad     ....................       00000 0010111 %imm_cfi20
+  auipc    ....................       ..... 0010111 @u
+}
 jal      ....................       ..... 1101111 @j
 jalr     ............     ..... 000 ..... 1100111 @i
 beq      ....... .....    ..... 000 ..... 1100011 @b
diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
index 98e3806d5e..ee868c5fcb 100644
--- a/target/riscv/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/insn_trans/trans_rvi.c.inc
@@ -36,6 +36,44 @@ static bool trans_lui(DisasContext *ctx, arg_lui *a)
     return true;
 }
 
+static bool trans_lpad(DisasContext *ctx, arg_lpad *a)
+{
+    /* zicfilp only supported on 32bit and 64bit */
+    if (get_xl(ctx) != MXL_RV32 && get_xl(ctx) != MXL_RV64) {
+        return false;
+    }
+
+    /* forward cfi not enabled, return false */
+    if (!ctx->fcfi_enabled) {
+        return false;
+    }
+
+    /*
+     * If this is the first instruction of the TB, let the translator
+     * know the landing pad requirement was satisfied. No need to bother
+     * checking for CFI feature or enablement.
+     */
+
+    if (ctx->base.pc_next == ctx->base.pc_first) {
+        ctx->fcfi_lp_expected = false;
+        /* PC must be 4 byte aligned */
+        if (ctx->fcfi_enabled && ((ctx->base.pc_next) & 0x3)) {
+            /*
+             * misaligned, according to spec we should raise sw check exception
+             */
+            tcg_gen_st_tl(
+                    tcg_constant_tl(RISCV_EXCP_SW_CHECK_FCFI_TVAL),
+                    tcg_env, offsetof(CPURISCVState, sw_check_code));
+            generate_exception(ctx, RISCV_EXCP_SW_CHECK);
+            return true;
+        }
+    }
+
+    /* use helper to do label check */
+    gen_helper_cfi_check_landing_pad(tcg_env, tcg_constant_i32(a->imm_cfi20));
+    return true;
+}
+
 static bool trans_auipc(DisasContext *ctx, arg_auipc *a)
 {
     TCGv target_pc = dest_gpr(ctx, a->rd);
@@ -75,6 +113,19 @@ static bool trans_jalr(DisasContext *ctx, arg_jalr *a)
     gen_set_gpr(ctx, a->rd, succ_pc);
 
     tcg_gen_mov_tl(cpu_pc, target_pc);
+    if (ctx->cfg_ptr->ext_zicfilp) {
+        /*
+         * Rely on a helper to check the forward CFI enable for the
+         * current process mode. The alternatives would be (1) include
+         * "fcfi enabled" in the cflags or (2) maintain a "fcfi
+         * currently enabled" in tcg_env and emit TCG code to access
+         * and test it.
+         */
+        if (a->rs1 != xRA && a->rs1 != xT0 && a->rs1 != xT2) {
+            gen_helper_cfi_jalr(tcg_env, tcg_constant_i32(LP_EXPECTED));
+        }
+    }
+
     lookup_and_goto_ptr(ctx);
 
     if (misaligned) {
diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
index 488116cc2e..2d152f0a00 100644
--- a/target/riscv/op_helper.c
+++ b/target/riscv/op_helper.c
@@ -259,6 +259,38 @@ void helper_cbo_inval(CPURISCVState *env, target_ulong address)
     /* We don't emulate the cache-hierarchy, so we're done. */
 }
 
+void helper_cfi_jalr(CPURISCVState *env, int elp)
+{
+    /*
+     * The translation routine doesn't know if forward CFI is enabled
+     * in the current processor mode or not. It's not worth burning a
+     * cflags bit to encode this, or tracking the current-mode-fcfi
+     * enable in a dedicated member of 'env'. Just come out to a helper
+     * for jump/call on a core with CFI.
+     */
+    if (cpu_get_fcfien(env)) {
+        env->elp = elp;
+    }
+}
+
+void helper_cfi_check_landing_pad(CPURISCVState *env, int lbl)
+{
+    if ((env->elp == LP_EXPECTED) && cpu_get_fcfien(env)) {
+        /*
+         * Check for the 20bit label match. We already checked 4 byte
+         * alignment in tcg
+         * High 20bits (b31:12) in x7/t2 hold label. We need drop bits
+         * greater than 31 and then shift 12 right
+         */
+        if (lbl && (lbl != ((env->gpr[xT2] & 0xFFFFFFFF) >> 12))) {
+            env->sw_check_code = RISCV_EXCP_SW_CHECK_FCFI_TVAL;
+            riscv_raise_exception(env, RISCV_EXCP_SW_CHECK, GETPC());
+        }
+
+        env->elp = NO_LP_EXPECTED;
+    }
+}
+
 #ifndef CONFIG_USER_ONLY
 
 target_ulong helper_sret(CPURISCVState *env)
-- 
2.44.0


