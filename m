Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1675E65D19
	for <qemu-riscv@archiver.kernel.org>; Fri, 22 Nov 2024 03:25:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tEKFq-0005Z2-79; Thu, 21 Nov 2024 22:22:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1tEKFi-0005WH-0p
 for qemu-riscv@nongnu.org; Thu, 21 Nov 2024 22:22:38 -0500
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1tEKFg-0003xR-52
 for qemu-riscv@nongnu.org; Thu, 21 Nov 2024 22:22:37 -0500
Received: by mail-pl1-x644.google.com with SMTP id
 d9443c01a7336-2124a86f4cbso15850465ad.3
 for <qemu-riscv@nongnu.org>; Thu, 21 Nov 2024 19:22:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1732245755; x=1732850555; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1YBszf0JEY6lGH98UF5Cbrpj+6ZfpD+LYDcXM9Rwtik=;
 b=XdEvbXZLO6TelrAqv+NEMhliUGqQodZ+uFAKTqREKZ8tA3TprAp7BVcKiWN9UjsiPX
 vWbkza+2RRklhc5iKSH/NW9EY+x2nJLn0ODf2J4R+rMH02HG+Z9HD51oFVhqMv5ncv0g
 AbXFU7hNnedEGTEPHQ8xauGMTlKqeDJJgsDnELvdw7zkNtfyn620hJTKVT+HntKTI4p6
 DNBTePgeZmD01cyyvjJ7uvw1XXGiQCJjdHPUhHXeuz6Y4y/NYtsrUArSFqAcGMDOyaqH
 Ra6Dki10EiQEIuE2Eo61fs+ZMSaw1pTKSiKfynl+mkW7I4h4aB4CcUVU+o++fQC+2KAm
 sT7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732245755; x=1732850555;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1YBszf0JEY6lGH98UF5Cbrpj+6ZfpD+LYDcXM9Rwtik=;
 b=nEZQxMHTx+yeiY4eR7q/GDNdjrQ0JAN7pEoin4ycz2qGA9L6QKfDkxHAtfl7O527Rs
 nq5RVFo0Ek6jp/EATTbQzz9tOJk7wAQS4R1c/orPXjzhM+O94GchVcjNcltXU884M+gB
 zmt2Gzp6RtpeFDWBbFYufvLatltPYZoDXlKsMnmO73e5KFs+erA29PNVzL4DEuUa+fA7
 gayHwwo6BrduKWl4b7EIc+IS19JLBJuDIpKZTlxulMPgPbFBhTosMhPJtuHXcut8SjTj
 WWMG3ZAgl9WRsrQ4lesZfff4hqv7hWtZjPDOk9ls3VxpIXkEVtj1T1gxiQ8P0sO3ll1z
 pjQQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUWlvxwWc6DGpVOJizPnlK1wug7p4GL56EVYTKH2Uqko9G/nTctjxVuRx87PBwV0hyDk/2c5vfEE2wn@nongnu.org
X-Gm-Message-State: AOJu0Yw8CORmGHfSz/roH5kMofB3Op+BPCO1w6aZYVkHnrSWQQ/ZnI6N
 /0wzlKONMMejsEbiKwpr+WYsmCd5ejPws7z8UJzAJO+yRkC6QCC1eMSI5ROFVkcN4PMlXlzdJ0t
 bIY0opa57
X-Gm-Gg: ASbGncvApXAYlcSjxdk5MuxnSbIkw7tLruUpRYRrJGeck4ETAiqTeZFSpMo+RImPf5B
 bacsPmTGXkLj8YK1Xk7ifvaPovpkB/74gXR5JnChZzNV2wnl+efe/0yr554LODEhjB6VsS2NftT
 hOH8SkJ5Xb0Cd3JoeyKRtEG6mYjKddNf8G4EcjvS/ASSRHVMpXxX2OcOUmRE5ufpI7tsTGH791t
 dQgmIrLDGU/i5xnoYLFYjIANFbewKZjYTKuvR2sXLiW0GAhWrC+itWZH2ARndFw/B6vOO3HDBp/
 Y2sw4w==
X-Google-Smtp-Source: AGHT+IGz2cAU5Huc2RWPukjPwETpxVCtqdBGLAxmmNrMDf4K6KRuzcSfW1Fi2Z+bCb2O1bfbeMgRkg==
X-Received: by 2002:a17:902:d508:b0:212:5bbe:3601 with SMTP id
 d9443c01a7336-2129f783482mr16779585ad.23.1732245754746; 
 Thu, 21 Nov 2024 19:22:34 -0800 (PST)
Received: from fchang-1826.internal.sifive.com ([136.226.240.187])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2129dc157f3sm5506905ad.203.2024.11.21.19.22.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2024 19:22:34 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Tommy Wu <tommy.wu@sifive.com>,
	Frank Chang <frank.chang@sifive.com>
Subject: [PATCH v9 4/6] target/riscv: Add Smrnmi mnret instruction
Date: Fri, 22 Nov 2024 11:22:15 +0800
Message-Id: <20241122032217.3816540-5-frank.chang@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241122032217.3816540-1-frank.chang@sifive.com>
References: <20241122032217.3816540-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::644;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x644.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

From: Tommy Wu <tommy.wu@sifive.com>

This patch adds a new instruction 'mnret'. 'mnret' is an M-mode-only
instruction that uses the values in `mnepc` and `mnstatus` to return to the
program counter, privilege mode, and virtualization mode of the
interrupted context.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Signed-off-by: Tommy Wu <tommy.wu@sifive.com>
---
 target/riscv/helper.h                         |  1 +
 target/riscv/insn32.decode                    |  3 ++
 .../riscv/insn_trans/trans_privileged.c.inc   | 20 +++++++++
 target/riscv/op_helper.c                      | 45 ++++++++++++++++---
 4 files changed, 64 insertions(+), 5 deletions(-)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 451261ce5a..16ea240d26 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -131,6 +131,7 @@ DEF_HELPER_6(csrrw_i128, tl, env, int, tl, tl, tl, tl)
 #ifndef CONFIG_USER_ONLY
 DEF_HELPER_1(sret, tl, env)
 DEF_HELPER_1(mret, tl, env)
+DEF_HELPER_1(mnret, tl, env)
 DEF_HELPER_1(wfi, void, env)
 DEF_HELPER_1(wrs_nto, void, env)
 DEF_HELPER_1(tlb_flush, void, env)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index e9139ec1b9..942c434c6e 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -121,6 +121,9 @@ wfi         0001000    00101 00000 000 00000 1110011
 sfence_vma  0001001    ..... ..... 000 00000 1110011 @sfence_vma
 sfence_vm   0001000    00100 ..... 000 00000 1110011 @sfence_vm
 
+# *** NMI ***
+mnret       0111000    00010 00000 000 00000 1110011
+
 # *** RV32I Base Instruction Set ***
 lui      ....................       ..... 0110111 @u
 {
diff --git a/target/riscv/insn_trans/trans_privileged.c.inc b/target/riscv/insn_trans/trans_privileged.c.inc
index ecd3b8b2c9..73f940d406 100644
--- a/target/riscv/insn_trans/trans_privileged.c.inc
+++ b/target/riscv/insn_trans/trans_privileged.c.inc
@@ -18,6 +18,12 @@
  * this program.  If not, see <http://www.gnu.org/licenses/>.
  */
 
+#define REQUIRE_SMRNMI(ctx) do {     \
+    if (!ctx->cfg_ptr->ext_smrnmi) { \
+        return false;                \
+    }                                \
+} while (0)
+
 static bool trans_ecall(DisasContext *ctx, arg_ecall *a)
 {
     /* always generates U-level ECALL, fixed in do_interrupt handler */
@@ -106,6 +112,20 @@ static bool trans_mret(DisasContext *ctx, arg_mret *a)
 #endif
 }
 
+static bool trans_mnret(DisasContext *ctx, arg_mnret *a)
+{
+#ifndef CONFIG_USER_ONLY
+    REQUIRE_SMRNMI(ctx);
+    decode_save_opc(ctx, 0);
+    gen_helper_mnret(cpu_pc, tcg_env);
+    tcg_gen_exit_tb(NULL, 0); /* no chaining */
+    ctx->base.is_jmp = DISAS_NORETURN;
+    return true;
+#else
+    return false;
+#endif
+}
+
 static bool trans_wfi(DisasContext *ctx, arg_wfi *a)
 {
 #ifndef CONFIG_USER_ONLY
diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
index eddedacf4b..63ec53e992 100644
--- a/target/riscv/op_helper.c
+++ b/target/riscv/op_helper.c
@@ -321,24 +321,30 @@ target_ulong helper_sret(CPURISCVState *env)
     return retpc;
 }
 
-target_ulong helper_mret(CPURISCVState *env)
+static void check_ret_from_m_mode(CPURISCVState *env, target_ulong retpc,
+                                  target_ulong prev_priv)
 {
     if (!(env->priv >= PRV_M)) {
         riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, GETPC());
     }
 
-    target_ulong retpc = env->mepc;
     if (!riscv_has_ext(env, RVC) && (retpc & 0x3)) {
         riscv_raise_exception(env, RISCV_EXCP_INST_ADDR_MIS, GETPC());
     }
 
-    uint64_t mstatus = env->mstatus;
-    target_ulong prev_priv = get_field(mstatus, MSTATUS_MPP);
-
     if (riscv_cpu_cfg(env)->pmp &&
         !pmp_get_num_rules(env) && (prev_priv != PRV_M)) {
         riscv_raise_exception(env, RISCV_EXCP_INST_ACCESS_FAULT, GETPC());
     }
+}
+
+target_ulong helper_mret(CPURISCVState *env)
+{
+    target_ulong retpc = env->mepc;
+    uint64_t mstatus = env->mstatus;
+    target_ulong prev_priv = get_field(mstatus, MSTATUS_MPP);
+
+    check_ret_from_m_mode(env, retpc, prev_priv);
 
     target_ulong prev_virt = get_field(env->mstatus, MSTATUS_MPV) &&
                              (prev_priv != PRV_M);
@@ -370,6 +376,35 @@ target_ulong helper_mret(CPURISCVState *env)
     return retpc;
 }
 
+target_ulong helper_mnret(CPURISCVState *env)
+{
+    target_ulong retpc = env->mnepc;
+    target_ulong prev_priv = get_field(env->mnstatus, MNSTATUS_MNPP);
+    target_ulong prev_virt;
+
+    check_ret_from_m_mode(env, retpc, prev_priv);
+
+    prev_virt = get_field(env->mnstatus, MNSTATUS_MNPV) &&
+                (prev_priv != PRV_M);
+    env->mnstatus = set_field(env->mnstatus, MNSTATUS_NMIE, true);
+
+    /*
+     * If MNRET changes the privilege mode to a mode
+     * less privileged than M, it also sets mstatus.MPRV to 0.
+     */
+    if (prev_priv < PRV_M) {
+        env->mstatus = set_field(env->mstatus, MSTATUS_MPRV, false);
+    }
+
+    if (riscv_has_ext(env, RVH) && prev_virt) {
+        riscv_cpu_swap_hypervisor_regs(env);
+    }
+
+    riscv_cpu_set_mode(env, prev_priv, prev_virt);
+
+    return retpc;
+}
+
 void helper_wfi(CPURISCVState *env)
 {
     CPUState *cs = env_cpu(env);
-- 
2.34.1


