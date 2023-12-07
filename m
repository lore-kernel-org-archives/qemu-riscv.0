Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73171C4167B
	for <qemu-riscv@archiver.kernel.org>; Thu,  7 Dec 2023 15:39:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rBGSo-0005zC-Hr; Thu, 07 Dec 2023 10:38:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rbradford@rivosinc.com>)
 id 1rBGSk-0005x5-S3
 for qemu-riscv@nongnu.org; Thu, 07 Dec 2023 10:38:55 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rbradford@rivosinc.com>)
 id 1rBGSh-000841-0d
 for qemu-riscv@nongnu.org; Thu, 07 Dec 2023 10:38:54 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-40c2d50bfbfso2440695e9.0
 for <qemu-riscv@nongnu.org>; Thu, 07 Dec 2023 07:38:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1701963529; x=1702568329;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EZsOkKVCnzEhASDCWsz+6dz3ib59l8sYS8/bHQwNiqk=;
 b=2dMy5fn37tw76ytfe6MCjDUW2PL4Ncb3nF13pR2zi8wt4rXM+rnkz8cO7Q5oNPoG7k
 07pBSVVgx7bdCrZLnGF5qaMQTgteNH7Br+4q+bS42+gWvvRPqZVydiTFNln/qdc73eOc
 HpyWEEfUspxIl60MSRlQQMbu5sjQFNirP4Qur+qF58UTLspZr97HOnNZDbwcKBoHIUnA
 sUuWMc04L5Fz28vLgZI9XOZBwjG3iQgeZgEpGAkhy9FZxP4KBguB/DwC7pemzT0e4zLF
 jMsf5LMpeARYverJ/BeEMWn8kWrEynYyKc3Eg0Xk+cqkSaZk7fwAWzBpPB+nGTnHrDlZ
 ukGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701963529; x=1702568329;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EZsOkKVCnzEhASDCWsz+6dz3ib59l8sYS8/bHQwNiqk=;
 b=OL8AKKZzHjcpq8OMeyZIHLrloK4UY/fqQMeyITaVcu9hWZHLbjP3/P7/cjWlgwd/v9
 UHfwU+AIPZ7kd7BWYMV3M/1Cpa/9J84JEJgeIzRl/Werq3xqkM7YtvMJjJiiMlv4oLqA
 v0DcbzyLF2u+Lpf6gPUlgDA/VdMIT0RYoJUJSsV4gt07/UXAAVlLlTF+lZ3Yq6V1TmMo
 9kit+fR5AKxgaBtCIq4T5NJoiOcP3z5LUiFeJgNzFSUm/Y/0NnbM4630AbIFbx29J9yM
 uFiWevG7x0w5k08px4TVwNqNlaPZ9O8dTKQJ5Z4sA120PAhJSCWVogq53dwoGSGxflYm
 asPw==
X-Gm-Message-State: AOJu0YxQU4m8Jr1jfTQqihbrvrZltXltKM3zjOUJmVv+rAOVOQSLk+yY
 69qR9KGCC6tzJaRNqkg2+5pK4w==
X-Google-Smtp-Source: AGHT+IHHYhNYbaEsHGnrXWSoS+nhfKwiDg3dToAGRW2cuifgsKa3lfGlWHBlxoouXBbK9DkK3VOZyA==
X-Received: by 2002:a05:600c:138e:b0:40b:5533:ceb9 with SMTP id
 u14-20020a05600c138e00b0040b5533ceb9mr2724799wmf.7.1701963529064; 
 Thu, 07 Dec 2023 07:38:49 -0800 (PST)
Received: from rockhopper.ba.rivosinc.com (214.11.169.217.in-addr.arpa.
 [217.169.11.214]) by smtp.gmail.com with ESMTPSA id
 b16-20020a5d4b90000000b0033339e03a60sm1711399wrt.59.2023.12.07.07.38.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Dec 2023 07:38:48 -0800 (PST)
From: Rob Bradford <rbradford@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, atishp@rivosinc.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 Rob Bradford <rbradford@rivosinc.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Junqiang Wang <wangjunqiang@iscas.ac.cn>
Subject: [PATCH 1/2] target/riscv: Add support for Zacas extension
Date: Thu,  7 Dec 2023 15:32:30 +0000
Message-ID: <20231207153842.32401-2-rbradford@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231207153842.32401-1-rbradford@rivosinc.com>
References: <20231207153842.32401-1-rbradford@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=rbradford@rivosinc.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Weiwei Li <liweiwei@iscas.ac.cn>

Add support for amocas.w/d/q instructions which are part of the ratified
Zacas extension: https://github.com/riscv/riscv-zacas

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Signed-off-by: Rob Bradford <rbradford@rivosinc.com>
---
 target/riscv/cpu.c                          |   2 +
 target/riscv/cpu_cfg.h                      |   1 +
 target/riscv/insn32.decode                  |   6 +
 target/riscv/insn_trans/trans_rvzacas.c.inc | 150 ++++++++++++++++++++
 target/riscv/tcg/tcg-cpu.c                  |   5 +
 target/riscv/translate.c                    |   1 +
 6 files changed, 165 insertions(+)
 create mode 100644 target/riscv/insn_trans/trans_rvzacas.c.inc

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 83c7c0cf07..a265833b17 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -87,6 +87,7 @@ const RISCVIsaExtData isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(zihintpause, PRIV_VERSION_1_10_0, ext_zihintpause),
     ISA_EXT_DATA_ENTRY(zihpm, PRIV_VERSION_1_12_0, ext_zihpm),
     ISA_EXT_DATA_ENTRY(zmmul, PRIV_VERSION_1_12_0, ext_zmmul),
+    ISA_EXT_DATA_ENTRY(zacas, PRIV_VERSION_1_12_0, ext_zacas),
     ISA_EXT_DATA_ENTRY(zawrs, PRIV_VERSION_1_12_0, ext_zawrs),
     ISA_EXT_DATA_ENTRY(zfa, PRIV_VERSION_1_12_0, ext_zfa),
     ISA_EXT_DATA_ENTRY(zfbfmin, PRIV_VERSION_1_12_0, ext_zfbfmin),
@@ -1300,6 +1301,7 @@ const RISCVCPUMultiExtConfig riscv_cpu_extensions[] = {
     MULTI_EXT_CFG_BOOL("zicsr", ext_zicsr, true),
     MULTI_EXT_CFG_BOOL("zihintntl", ext_zihintntl, true),
     MULTI_EXT_CFG_BOOL("zihintpause", ext_zihintpause, true),
+    MULTI_EXT_CFG_BOOL("zacas", ext_zacas, false),
     MULTI_EXT_CFG_BOOL("zawrs", ext_zawrs, true),
     MULTI_EXT_CFG_BOOL("zfa", ext_zfa, true),
     MULTI_EXT_CFG_BOOL("zfh", ext_zfh, false),
diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
index f4605fb190..d516de4a44 100644
--- a/target/riscv/cpu_cfg.h
+++ b/target/riscv/cpu_cfg.h
@@ -77,6 +77,7 @@ struct RISCVCPUConfig {
     bool ext_svnapot;
     bool ext_svpbmt;
     bool ext_zdinx;
+    bool ext_zacas;
     bool ext_zawrs;
     bool ext_zfa;
     bool ext_zfbfmin;
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 33597fe2bb..f22df04cfd 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -1004,3 +1004,9 @@ vgmul_vv    101000 1 ..... 10001 010 ..... 1110111 @r2_vm_1
 vsm4k_vi    100001 1 ..... ..... 010 ..... 1110111 @r_vm_1
 vsm4r_vv    101000 1 ..... 10000 010 ..... 1110111 @r2_vm_1
 vsm4r_vs    101001 1 ..... 10000 010 ..... 1110111 @r2_vm_1
+
+# *** RV32 Zacas Standard Extension ***
+amocas_w    00101 . . ..... ..... 010 ..... 0101111 @atom_st
+amocas_d    00101 . . ..... ..... 011 ..... 0101111 @atom_st
+# *** RV64 Zacas Standard Extension ***
+amocas_q    00101 . . ..... ..... 100 ..... 0101111 @atom_st
diff --git a/target/riscv/insn_trans/trans_rvzacas.c.inc b/target/riscv/insn_trans/trans_rvzacas.c.inc
new file mode 100644
index 0000000000..5d274d4c08
--- /dev/null
+++ b/target/riscv/insn_trans/trans_rvzacas.c.inc
@@ -0,0 +1,150 @@
+/*
+ * RISC-V translation routines for the RV64 Zacas Standard Extension.
+ *
+ * Copyright (c) 2020-2023 PLCT Lab
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2 or later, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#define REQUIRE_ZACAS(ctx) do {          \
+    if (!ctx->cfg_ptr->ext_zacas) {      \
+        return false;                     \
+    }                                     \
+} while (0)
+
+static bool gen_cmpxchg(DisasContext *ctx, arg_atomic *a, MemOp mop)
+{
+    TCGv dest = get_gpr(ctx, a->rd, EXT_NONE);
+    TCGv src1 = get_address(ctx, a->rs1, 0);
+    TCGv src2 = get_gpr(ctx, a->rs2, EXT_NONE);
+
+    decode_save_opc(ctx);
+    tcg_gen_atomic_cmpxchg_tl(dest, src1, dest, src2, ctx->mem_idx, mop);
+
+    gen_set_gpr(ctx, a->rd, dest);
+    return true;
+}
+
+static bool trans_amocas_w(DisasContext *ctx, arg_amocas_w *a)
+{
+    REQUIRE_ZACAS(ctx);
+    return gen_cmpxchg(ctx, a, MO_ALIGN | MO_TESL);
+}
+
+static TCGv_i64 get_gpr_pair(DisasContext *ctx, int reg_num)
+{
+    TCGv_i64 t;
+
+    assert(get_ol(ctx) == MXL_RV32);
+
+    if (reg_num == 0) {
+        return tcg_constant_i64(0);
+    }
+
+    t = tcg_temp_new_i64();
+    tcg_gen_concat_tl_i64(t, cpu_gpr[reg_num], cpu_gpr[reg_num + 1]);
+    return t;
+}
+
+static void gen_set_gpr_pair(DisasContext *ctx, int reg_num, TCGv_i64 t)
+{
+    assert(get_ol(ctx) == MXL_RV32);
+
+    if (reg_num != 0) {
+#ifdef TARGET_RISCV32
+        tcg_gen_extr_i64_i32(cpu_gpr[reg_num], cpu_gpr[reg_num + 1], t);
+#else
+        tcg_gen_ext32s_i64(cpu_gpr[reg_num], t);
+        tcg_gen_sari_i64(cpu_gpr[reg_num + 1], t, 32);
+#endif
+
+        if (get_xl_max(ctx) == MXL_RV128) {
+            tcg_gen_sari_tl(cpu_gprh[reg_num], cpu_gpr[reg_num], 63);
+            tcg_gen_sari_tl(cpu_gprh[reg_num + 1], cpu_gpr[reg_num + 1], 63);
+        }
+    }
+}
+
+static bool gen_cmpxchg64(DisasContext *ctx, arg_atomic *a, MemOp mop)
+{
+    /*
+     * Encodings with odd numbered registers specified in rs2 and rd are
+     * reserved.
+     */
+    if ((a->rs2 | a->rd) & 1) {
+        return false;
+    }
+
+    TCGv_i64 dest = get_gpr_pair(ctx, a->rd);
+    TCGv src1 = get_address(ctx, a->rs1, 0);
+    TCGv_i64 src2 = get_gpr_pair(ctx, a->rs2);
+
+    decode_save_opc(ctx);
+    tcg_gen_atomic_cmpxchg_i64(dest, src1, dest, src2, ctx->mem_idx, mop);
+
+    gen_set_gpr_pair(ctx, a->rd, dest);
+    return true;
+}
+
+static bool trans_amocas_d(DisasContext *ctx, arg_amocas_d *a)
+{
+    REQUIRE_ZACAS(ctx);
+    switch (get_ol(ctx)) {
+    case MXL_RV32:
+        return gen_cmpxchg64(ctx, a, MO_ALIGN | MO_TEUQ);
+    case MXL_RV64:
+    case MXL_RV128:
+        return gen_cmpxchg(ctx, a, MO_ALIGN | MO_TEUQ);
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static bool trans_amocas_q(DisasContext *ctx, arg_amocas_q *a)
+{
+    REQUIRE_ZACAS(ctx);
+    REQUIRE_64BIT(ctx);
+
+    /*
+     * Encodings with odd numbered registers specified in rs2 and rd are
+     * reserved.
+     */
+    if ((a->rs2 | a->rd) & 1) {
+        return false;
+    }
+
+#ifdef TARGET_RISCV64
+    TCGv_i128 dest = tcg_temp_new_i128();
+    TCGv src1 = get_address(ctx, a->rs1, 0);
+    TCGv_i128 src2 = tcg_temp_new_i128();
+    TCGv_i64 src2l = get_gpr(ctx, a->rs2, EXT_NONE);
+    TCGv_i64 src2h = get_gpr(ctx, a->rs2 == 0 ? 0 : a->rs2 + 1, EXT_NONE);
+    TCGv_i64 destl = get_gpr(ctx, a->rd, EXT_NONE);
+    TCGv_i64 desth = get_gpr(ctx, a->rd == 0 ? 0 : a->rd + 1, EXT_NONE);
+
+    tcg_gen_concat_i64_i128(src2, src2l, src2h);
+    tcg_gen_concat_i64_i128(dest, destl, desth);
+    decode_save_opc(ctx);
+    tcg_gen_atomic_cmpxchg_i128(dest, src1, dest, src2, ctx->mem_idx,
+                                (MO_ALIGN | MO_TEUO));
+
+    tcg_gen_extr_i128_i64(destl, desth, dest);
+
+    if (a->rd != 0) {
+        gen_set_gpr(ctx, a->rd, destl);
+        gen_set_gpr(ctx, a->rd + 1, desth);
+    }
+#endif
+
+    return true;
+}
diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index 8a35683a34..29b5a88931 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -343,6 +343,11 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         return;
     }
 
+    if ((cpu->cfg.ext_zacas) && !riscv_has_ext(env, RVA)) {
+        error_setg(errp, "Zacas extension requires A extension");
+        return;
+    }
+
     if ((cpu->cfg.ext_zawrs) && !riscv_has_ext(env, RVA)) {
         error_setg(errp, "Zawrs extension requires A extension");
         return;
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index f0be79bb16..071fbad7ef 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -1089,6 +1089,7 @@ static uint32_t opcode_at(DisasContextBase *dcbase, target_ulong pc)
 #include "insn_trans/trans_rvv.c.inc"
 #include "insn_trans/trans_rvb.c.inc"
 #include "insn_trans/trans_rvzicond.c.inc"
+#include "insn_trans/trans_rvzacas.c.inc"
 #include "insn_trans/trans_rvzawrs.c.inc"
 #include "insn_trans/trans_rvzicbo.c.inc"
 #include "insn_trans/trans_rvzfa.c.inc"
-- 
2.43.0


