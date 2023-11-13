Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18DDDC4332F
	for <qemu-riscv@archiver.kernel.org>; Mon, 13 Nov 2023 09:57:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r2TgD-00051i-08; Mon, 13 Nov 2023 04:56:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1r2Tg4-000500-Ob
 for qemu-riscv@nongnu.org; Mon, 13 Nov 2023 04:56:21 -0500
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1r2Tfw-0005Vq-LY
 for qemu-riscv@nongnu.org; Mon, 13 Nov 2023 04:56:20 -0500
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-9c53e8b7cf4so630211266b.1
 for <qemu-riscv@nongnu.org>; Mon, 13 Nov 2023 01:56:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull.eu; s=google; t=1699869371; x=1700474171; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iB7fJ0gWQ/iabhlhIhHFNNkXK5uKgJMYdkpTFw7eBpY=;
 b=clLCLodta6XvbP7pxBR8+o9oIuDkrEHHHSRYGyyz/j6rqYIR8ipdR3jhDeDh66XaIL
 Rpr5jRW0KwsmO2w8H4tFAVwFwDszokrviz2rjkDlpl84Va+njokWtuDaF4MzoS+f2XWC
 PFkg1s3MYCMMpk/JrCZZDTrYHQi+0eiTUPDSIkAFIWd9ezVbrwyiCpG/wN9sHGjUVc5M
 6rDyLN1ekKufC1nuX8GwTD5ngiWHHjWGvNYcTeTxSg3Kj9gP7gi+ZLa1Vg+CA5/3K148
 xaFy85BPk1sEevJ3I7pUAuRRB61908lD6f0Jcf7g7rQFTSxJA8VfYyfS0IuyF1nTLy/i
 /9rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699869371; x=1700474171;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iB7fJ0gWQ/iabhlhIhHFNNkXK5uKgJMYdkpTFw7eBpY=;
 b=P+vgwUB1KKdAONkqeKAHIO66khmkxGKYrzKv99llqqHEFZYjF0SwSLy6IQg1Mo1pY0
 5RfvObPRlC0FBx/+lYAk/b8QwqjrNHBpv5lhOk/CzRnrO5wy9NITwz7B5uwSL9smshSa
 sUV9v+JIGE0xXn6mYNCBFCkdCvP6IZ2OCk5z6eO5pzJ4SbyCC2ea6+tEQDw/fGYPXSq3
 2JPkhzUplJYpo9R33zfwwoulwcPaFk12nuljYULaQeJMW6G4pcZORNLVaCZ4/c5qcsUN
 QlKH57L+CQk196NIW886tsaFw3dqGENDUb/q9zB5MYQJ44efDB3rcTCQh/RIVdqp2uNR
 jLbA==
X-Gm-Message-State: AOJu0YyGvFwVcfH5GnAgPrym7amVVEgY1ygulu5jVsJuJT7ru8JSxzpV
 5qXZpA38nBz0UZkLMKj97N3pKrSTVuzAreGpjiQ=
X-Google-Smtp-Source: AGHT+IGwwfO967eP37t2S+yYCQilcSkds0fv7zRJGCtrvHbt96K1FadWFwm237h6m0aNFkmI6RDV7g==
X-Received: by 2002:a17:906:7754:b0:9db:9c5e:a9c5 with SMTP id
 o20-20020a170906775400b009db9c5ea9c5mr3971106ejn.33.1699869370748; 
 Mon, 13 Nov 2023 01:56:10 -0800 (PST)
Received: from beast.fritz.box (62-178-148-172.cable.dynamic.surfer.at.
 [62.178.148.172]) by smtp.gmail.com with ESMTPSA id
 a11-20020a170906190b00b0098d2d219649sm3807321eje.174.2023.11.13.01.56.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Nov 2023 01:56:09 -0800 (PST)
From: Christoph Muellner <christoph.muellner@vrull.eu>
To: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>
Cc: Palmer Dabbelt <palmer@rivosinc.com>,
 =?UTF-8?q?Christoph=20M=C3=BCllner?= <christoph.muellner@vrull.eu>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [RFC PATCH 1/2] RISC-V: Add support for Ztso
Date: Mon, 13 Nov 2023 10:56:02 +0100
Message-ID: <20231113095605.1131443-2-christoph.muellner@vrull.eu>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231113095605.1131443-1-christoph.muellner@vrull.eu>
References: <20231113095605.1131443-1-christoph.muellner@vrull.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=christoph.muellner@vrull.eu; helo=mail-ej1-x629.google.com
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

From: Palmer Dabbelt <palmer@rivosinc.com>

The Ztso extension is already ratified, this adds it as a CPU property
and adds various fences throughout the port in order to allow TSO
targets to function on weaker hosts.  We need no fences for AMOs as
they're already SC, the placess we need barriers are described.
These fences are placed in the RISC-V backend rather than TCG as is
planned for x86-on-arm64 because RISC-V allows heterogenous (and
likely soon dynamic) hart memory models.

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
Signed-off-by: Christoph Müllner <christoph.muellner@vrull.eu>
---
 target/riscv/cpu.c                      |  2 ++
 target/riscv/cpu_cfg.h                  |  1 +
 target/riscv/insn_trans/trans_rva.c.inc | 11 ++++++++---
 target/riscv/insn_trans/trans_rvi.c.inc | 16 ++++++++++++++--
 target/riscv/insn_trans/trans_rvv.c.inc | 20 ++++++++++++++++++++
 target/riscv/translate.c                |  3 +++
 6 files changed, 48 insertions(+), 5 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 83c7c0cf07..b446e553b1 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -118,6 +118,7 @@ const RISCVIsaExtData isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(zksed, PRIV_VERSION_1_12_0, ext_zksed),
     ISA_EXT_DATA_ENTRY(zksh, PRIV_VERSION_1_12_0, ext_zksh),
     ISA_EXT_DATA_ENTRY(zkt, PRIV_VERSION_1_12_0, ext_zkt),
+    ISA_EXT_DATA_ENTRY(ztso, PRIV_VERSION_1_12_0, ext_ztso),
     ISA_EXT_DATA_ENTRY(zvbb, PRIV_VERSION_1_12_0, ext_zvbb),
     ISA_EXT_DATA_ENTRY(zvbc, PRIV_VERSION_1_12_0, ext_zvbc),
     ISA_EXT_DATA_ENTRY(zve32f, PRIV_VERSION_1_10_0, ext_zve32f),
@@ -1336,6 +1337,7 @@ const RISCVCPUMultiExtConfig riscv_cpu_extensions[] = {
     MULTI_EXT_CFG_BOOL("zksed", ext_zksed, false),
     MULTI_EXT_CFG_BOOL("zksh", ext_zksh, false),
     MULTI_EXT_CFG_BOOL("zkt", ext_zkt, false),
+    MULTI_EXT_CFG_BOOL("ztso", ext_ztso, false),
 
     MULTI_EXT_CFG_BOOL("zdinx", ext_zdinx, false),
     MULTI_EXT_CFG_BOOL("zfinx", ext_zfinx, false),
diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
index f4605fb190..a0f951d9c1 100644
--- a/target/riscv/cpu_cfg.h
+++ b/target/riscv/cpu_cfg.h
@@ -70,6 +70,7 @@ struct RISCVCPUConfig {
     bool ext_zihintntl;
     bool ext_zihintpause;
     bool ext_zihpm;
+    bool ext_ztso;
     bool ext_smstateen;
     bool ext_sstc;
     bool ext_svadu;
diff --git a/target/riscv/insn_trans/trans_rva.c.inc b/target/riscv/insn_trans/trans_rva.c.inc
index 5f194a447b..85c7e31f2a 100644
--- a/target/riscv/insn_trans/trans_rva.c.inc
+++ b/target/riscv/insn_trans/trans_rva.c.inc
@@ -28,7 +28,11 @@ static bool gen_lr(DisasContext *ctx, arg_atomic *a, MemOp mop)
         tcg_gen_mb(TCG_MO_ALL | TCG_BAR_STRL);
     }
     tcg_gen_qemu_ld_tl(load_val, src1, ctx->mem_idx, mop);
-    if (a->aq) {
+    /*
+     * TSO defines AMOs as acquire+release-RCsc, but does not define LR/SC as
+     * AMOs.  Instead treat them like loads.
+     */
+    if (a->aq || ctx->ztso) {
         tcg_gen_mb(TCG_MO_ALL | TCG_BAR_LDAQ);
     }
 
@@ -64,9 +68,10 @@ static bool gen_sc(DisasContext *ctx, arg_atomic *a, MemOp mop)
     gen_set_label(l1);
     /*
      * Address comparison failure.  However, we still need to
-     * provide the memory barrier implied by AQ/RL.
+     * provide the memory barrier implied by AQ/RL/TSO.
      */
-    tcg_gen_mb(TCG_MO_ALL + a->aq * TCG_BAR_LDAQ + a->rl * TCG_BAR_STRL);
+    TCGBar bar_strl = (ctx->ztso || a->rl) ? TCG_BAR_STRL : 0;
+    tcg_gen_mb(TCG_MO_ALL + a->aq * TCG_BAR_LDAQ + bar_strl);
     gen_set_gpr(ctx, a->rd, tcg_constant_tl(1));
 
     gen_set_label(l2);
diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
index faf6d65064..ad40d3e87f 100644
--- a/target/riscv/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/insn_trans/trans_rvi.c.inc
@@ -266,12 +266,20 @@ static bool gen_load_i128(DisasContext *ctx, arg_lb *a, MemOp memop)
 
 static bool gen_load(DisasContext *ctx, arg_lb *a, MemOp memop)
 {
+    bool out;
+
     decode_save_opc(ctx);
     if (get_xl(ctx) == MXL_RV128) {
-        return gen_load_i128(ctx, a, memop);
+        out = gen_load_i128(ctx, a, memop);
     } else {
-        return gen_load_tl(ctx, a, memop);
+        out = gen_load_tl(ctx, a, memop);
+    }
+
+    if (ctx->ztso) {
+        tcg_gen_mb(TCG_MO_ALL | TCG_BAR_LDAQ);
     }
+
+    return out;
 }
 
 static bool trans_lb(DisasContext *ctx, arg_lb *a)
@@ -328,6 +336,10 @@ static bool gen_store_tl(DisasContext *ctx, arg_sb *a, MemOp memop)
     TCGv addr = get_address(ctx, a->rs1, a->imm);
     TCGv data = get_gpr(ctx, a->rs2, EXT_NONE);
 
+    if (ctx->ztso) {
+        tcg_gen_mb(TCG_MO_ALL | TCG_BAR_STRL);
+    }
+
     tcg_gen_qemu_st_tl(data, addr, ctx->mem_idx, memop);
     return true;
 }
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 78bd363310..76e63fcbca 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -636,8 +636,28 @@ static bool ldst_us_trans(uint32_t vd, uint32_t rs1, uint32_t data,
     tcg_gen_addi_ptr(dest, tcg_env, vreg_ofs(s, vd));
     tcg_gen_addi_ptr(mask, tcg_env, vreg_ofs(s, 0));
 
+    /*
+     * According to the specification
+     *
+     *   Additionally, if the Ztso extension is implemented, then vector memory
+     *   instructions in the V extension and Zve family of extensions follow
+     *   RVTSO at the instruction level.  The Ztso extension does not
+     *   strengthen the ordering of intra-instruction element accesses.
+     *
+     * as a result neither ordered nor unordered accesses from the V
+     * instructions need ordering within the loop but we do still need barriers
+     * around the loop.
+     */
+    if (is_store && s->ztso) {
+        tcg_gen_mb(TCG_MO_ALL | TCG_BAR_STRL);
+    }
+
     fn(dest, mask, base, tcg_env, desc);
 
+    if (!is_store && s->ztso) {
+        tcg_gen_mb(TCG_MO_ALL | TCG_BAR_LDAQ);
+    }
+
     if (!is_store) {
         mark_vs_dirty(s);
     }
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index f0be79bb16..ab56051d6d 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -109,6 +109,8 @@ typedef struct DisasContext {
     /* PointerMasking extension */
     bool pm_mask_enabled;
     bool pm_base_enabled;
+    /* Ztso */
+    bool ztso;
     /* Use icount trigger for native debug */
     bool itrigger;
     /* FRM is known to contain a valid value. */
@@ -1194,6 +1196,7 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->cs = cs;
     ctx->pm_mask_enabled = FIELD_EX32(tb_flags, TB_FLAGS, PM_MASK_ENABLED);
     ctx->pm_base_enabled = FIELD_EX32(tb_flags, TB_FLAGS, PM_BASE_ENABLED);
+    ctx->ztso = cpu->cfg.ext_ztso;
     ctx->itrigger = FIELD_EX32(tb_flags, TB_FLAGS, ITRIGGER);
     ctx->zero = tcg_constant_tl(0);
     ctx->virt_inst_excp = false;
-- 
2.41.0


