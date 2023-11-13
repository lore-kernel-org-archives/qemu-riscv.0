Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19E61C4332F
	for <qemu-riscv@archiver.kernel.org>; Mon, 13 Nov 2023 09:56:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r2TgC-00051h-U1; Mon, 13 Nov 2023 04:56:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1r2Tg4-0004zw-IA
 for qemu-riscv@nongnu.org; Mon, 13 Nov 2023 04:56:21 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1r2Tfz-0005W7-HC
 for qemu-riscv@nongnu.org; Mon, 13 Nov 2023 04:56:19 -0500
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-9e1021dbd28so640798366b.3
 for <qemu-riscv@nongnu.org>; Mon, 13 Nov 2023 01:56:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699869374; x=1700474174;
 h=content-transfer-encoding:errors-to:list-subscribe:list-help
 :list-post:list-archive:list-unsubscribe:list-id:precedence
 :x-beenthere:mime-version:dkim-signature:delivered-to:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=N70t+efzcm2zk5GZnLI1CImtijnhv67cgUkhDj2dnIY=;
 b=fz6nHqVqkEedyDsV9A2Zb7zjJsQN9IhFpe09rftqHd96tP5kRnkYwqTcWK98CVZA2D
 mf1k01kiFKlom2fMzUEciSlSpUwIdUqvlEuGHNpKVPx3zEjXbQ8VcA/up+qovd71szso
 71zPNH2lcOf7gb4+ZqUpKa20bV/esbznJW7AwAwfXVoEaRGh19HCofgxAgvnhGatiZst
 GjA2cTLhjivLzHwbE+dMwsruCGYAC9TfVQWCtzKbOYjLQFcsqxDgLWcaUBNQFY+IIq0r
 aJGtb2P2/8YeVQ2X+vvWsmpM7zJswJJOMu8jt6DDRyDPUDW2ePSpG0XqmUHLYCGNyExa
 Q9XA==
X-Gm-Message-State: AOJu0YxQqoW1NDDo4IYBbZ+OEbHc8wuSgumNc4ul59lx4q4XTVwJI5uq
 uurnOmoORY5P882jIIjR527id/JewdFrxYAPjhs=
X-Google-Smtp-Source: AGHT+IFBxcpJjBK738aGRtmxwQuBc6oMrpZySmOV4cbgNlHmGzIj7v2aQT5rf2iAe30Ak69fS3ZsuQ==
X-Received: by 2002:a17:906:f6d4:b0:9be:30c2:b8fd with SMTP id
 jo20-20020a170906f6d400b009be30c2b8fdmr4130209ejb.66.1699869373889; 
 Mon, 13 Nov 2023 01:56:13 -0800 (PST)
Received: from beast.fritz.box (62-178-148-172.cable.dynamic.surfer.at.
 [62.178.148.172]) by smtp.gmail.com with ESMTPSA id
 a11-20020a170906190b00b0098d2d219649sm3807321eje.174.2023.11.13.01.56.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Nov 2023 01:56:13 -0800 (PST)
From: Christoph Muellner <christoph.muellner@vrull.eu>
To: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [PATCH v2] RISC-V: Add support for Ztso
Date: Mon, 13 Nov 2023 10:56:04 +0100
Message-ID: <20220917072635.11616-1-palmer@rivosinc.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231113095605.1131443-1-christoph.muellner@vrull.eu>
References: <20231113095605.1131443-1-christoph.muellner@vrull.eu>
Authentication-Results: mx.zohomail.com; dkim=pass;
 spf=pass (zohomail.com: domain of gnu.org designates
 209.51.188.17 as permitted sender)
 smtp.mailfrom=qemu-devel-bounces+importer=patchew.org@nongnu.org
ARC-Seal: i=1; a=rsa-sha256; t=1663402487; cv=none; d=zohomail.com; s=zohoarc;
 b=R7igkK9Kb0+addaLSzI47L5iInk/oDdV1YAb/jx/6EtWn+qAA6QPTsiTlgAWD/xgEooDCNjZaKuVK9hpbz5uNXauE/LYIiqTorm4qojhN1Wl+CHYkzTCT7ZRKCAUZ6YVUYlRm6B7Ht93Kkrd0hLNR0Nos0XB7rRWDKGYcBXFsso=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1663402487;
 h=Content-Transfer-Encoding:Cc:Date:From:List-Subscribe:List-Post:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Sender:Subject:To;
 bh=TWycMVycocjvV4pQp24xVeLX4fhJWz2N2KN2+76Tuqw=;
 b=W3kWzCvG24J94WHvET3szPh2L0yISBf05YCtVhTlDiRP2aaDKcesmwzfhtiBLWd/PWkcfKt8T3Tn7bDJADdSNmARL2sPMm8tPV9vLe1tN/EIY2cYiIp5QYSX+7uLc/nCdqqLmQ2E96ozDe+uur9FyEqRSjJHDYNtIkkrlEgOF2E=
ARC-Authentication-Results: i=1; mx.zohomail.com; dkim=pass;
 spf=pass (zohomail.com: domain of gnu.org
 designates 209.51.188.17 as permitted sender)
 smtp.mailfrom=qemu-devel-bounces+importer=patchew.org@nongnu.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17]) by
 mx.zohomail.com with SMTPS id 1663402487430365.2086650102375;
 Sat, 17 Sep 2022 01:14:47 -0700 (PDT)
Received: from localhost ([::1]:41984 helo=lists1p.gnu.org) by lists.gnu.org
 with esmtp (Exim 4.90_1) (envelope-from
 <qemu-devel-bounces+importer=patchew.org@nongnu.org>) id 1oZSyM-00012O-2f for
 importer@patchew.org; Sat, 17 Sep 2022 04:14:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39106) by lists.gnu.org with
 esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.90_1) (envelope-from
 <palmer@rivosinc.com>) id 1oZSkX-0007EM-1z for qemu-devel@nongnu.org;
 Sat, 17 Sep 2022 04:00:29 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:38477) by
 eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim
 4.90_1) (envelope-from <palmer@rivosinc.com>) id 1oZSkT-00009n-68 for
 qemu-devel@nongnu.org; Sat, 17 Sep 2022 04:00:28 -0400
Received: by mail-ej1-x631.google.com with SMTP id u9so54133901ejy.5 for
 <qemu-devel@nongnu.org>; Sat, 17 Sep 2022 01:00:21 -0700 (PDT)
Received: from localhost (vpn-konference.ms.mff.cuni.cz. [195.113.20.101]) by
 smtp.gmail.com with ESMTPSA id
 b25-20020a17090630d900b007803083a36asm5194599ejb.115.2022.09.17.01.00.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Sep 2022 01:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
 :subject:from:to:cc:subject:date;
 bh=TWycMVycocjvV4pQp24xVeLX4fhJWz2N2KN2+76Tuqw=;
 b=ziYfczbZkDGQX7x6/xpPAtIEpqJNn1H2ZFvQ612PRVfy9idK5IWyrAECjE6Rt6PrZY
 wzSrH1QTErvt+1v+iR/cvjw9fON8S4SVRfOEghnwBiDWONAlhxC2xKfQlzHf/th8AbVI
 9kRdFci2UGPj9KIgulw/BXRXG8nDClfySMcuWUd/q1lhD67SX1P1xQv2b23FL/kTbCsU
 W6+cJell1Pic7e5zADzUq5iN9ll5G1/3ScBB1mj7EityQbD2ae9VYU788Rw6O5e4PuLl
 qdhVUADFb52dGk4tCiZmV5HfC0iPHVnVEolu/z2PeDwnbO8SS9tCGwGzmku13ABvRvCH mFLQ==
X-Received: by 2002:a17:906:ee8e:b0:730:3646:d178 with SMTP id
 wt14-20020a170906ee8e00b007303646d178mr6083299ejb.426.1663401618717;
 Sat, 17 Sep 2022 01:00:18 -0700 (PDT)
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Received-SPF: pass (zohomail.com: domain of gnu.org designates 209.51.188.17
 as permitted sender) client-ip=209.51.188.17;
 envelope-from=qemu-devel-bounces+importer=patchew.org@nongnu.org;
 helo=lists.gnu.org; 
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=palmer@rivosinc.com; helo=mail-ej1-x631.google.com
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
X-ZohoMail-DKIM: pass (identity @rivosinc-com.20210112.gappssmtp.com)
X-ZM-MESSAGEID: 1663402488338100001
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=christoph.muellner@vrull.eu; helo=mail-ej1-x630.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, MAILING_LIST_MULTI=-1, MSGID_FROM_MTA_HEADER=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
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

The Ztso extension was recently frozen, this adds it as a CPU property
and adds various fences throughout the port in order to allow TSO
targets to function on weaker hosts.  We need no fences for AMOs as
they're already SC, the placess we need barriers are described.

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
Like the v1 this has been pretty minimally tested, but I figured I'd
just send it.  This is what I would have done the first time had I not
read that comment near TCG_GUEST_DEFAULT_MO, I think trying to describe
that when I ran into Richard at the Cauldron was probably more confusing
than just digging up the code and sending it along.
---
 target/riscv/cpu.c                      |  3 +++
 target/riscv/cpu.h                      |  1 +
 target/riscv/insn_trans/trans_rva.c.inc | 11 ++++++++---
 target/riscv/insn_trans/trans_rvi.c.inc | 16 ++++++++++++++--
 target/riscv/insn_trans/trans_rvv.c.inc | 20 ++++++++++++++++++++
 target/riscv/translate.c                |  3 +++
 6 files changed, 49 insertions(+), 5 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index ac6f82ebd0..d66169efa5 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -919,6 +919,8 @@ static Property riscv_cpu_extensions[] = {
     DEFINE_PROP_BOOL("zhinx", RISCVCPU, cfg.ext_zhinx, false),
     DEFINE_PROP_BOOL("zhinxmin", RISCVCPU, cfg.ext_zhinxmin, false),
 
+    DEFINE_PROP_BOOL("ztso", RISCVCPU, cfg.ext_ztso, false),
+
     /* Vendor-specific custom extensions */
     DEFINE_PROP_BOOL("xventanacondops", RISCVCPU, cfg.ext_XVentanaCondOps, false),
 
@@ -1094,6 +1096,7 @@ static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str, int max_str_len)
         ISA_EDATA_ENTRY(zksed, ext_zksed),
         ISA_EDATA_ENTRY(zksh, ext_zksh),
         ISA_EDATA_ENTRY(zkt, ext_zkt),
+        ISA_EDATA_ENTRY(ztso, ext_ztso),
         ISA_EDATA_ENTRY(zve32f, ext_zve32f),
         ISA_EDATA_ENTRY(zve64f, ext_zve64f),
         ISA_EDATA_ENTRY(zhinx, ext_zhinx),
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 5c7acc055a..c64fd4e258 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -433,6 +433,7 @@ struct RISCVCPUConfig {
     bool ext_zve32f;
     bool ext_zve64f;
     bool ext_zmmul;
+    bool ext_ztso;
     bool rvv_ta_all_1s;
 
     uint32_t mvendorid;
diff --git a/target/riscv/insn_trans/trans_rva.c.inc b/target/riscv/insn_trans/trans_rva.c.inc
index 45db82c9be..9066e1bde3 100644
--- a/target/riscv/insn_trans/trans_rva.c.inc
+++ b/target/riscv/insn_trans/trans_rva.c.inc
@@ -26,7 +26,11 @@ static bool gen_lr(DisasContext *ctx, arg_atomic *a, MemOp mop)
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
 
@@ -61,9 +65,10 @@ static bool gen_sc(DisasContext *ctx, arg_atomic *a, MemOp mop)
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
index ca8e3d1ea1..9bef42a3e5 100644
--- a/target/riscv/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/insn_trans/trans_rvi.c.inc
@@ -261,11 +261,19 @@ static bool gen_load_i128(DisasContext *ctx, arg_lb *a, MemOp memop)
 
 static bool gen_load(DisasContext *ctx, arg_lb *a, MemOp memop)
 {
+    bool out;
+
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
@@ -322,6 +330,10 @@ static bool gen_store_tl(DisasContext *ctx, arg_sb *a, MemOp memop)
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
index 6c091824b6..1994b38035 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -671,8 +671,28 @@ static bool ldst_us_trans(uint32_t vd, uint32_t rs1, uint32_t data,
     tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, vd));
     tcg_gen_addi_ptr(mask, cpu_env, vreg_ofs(s, 0));
 
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
+      tcg_gen_mb(TCG_MO_ALL | TCG_BAR_STRL);
+    }
+
     fn(dest, mask, base, cpu_env, desc);
 
+    if (!is_store && s->ztso) {
+      tcg_gen_mb(TCG_MO_ALL | TCG_BAR_LDAQ);
+    }
+
     tcg_temp_free_ptr(dest);
     tcg_temp_free_ptr(mask);
 
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 63b04e8a94..c7c574b09f 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -109,6 +109,8 @@ typedef struct DisasContext {
     /* PointerMasking extension */
     bool pm_mask_enabled;
     bool pm_base_enabled;
+    /* Ztso */
+    bool ztso;
     /* TCG of the current insn_start */
     TCGOp *insn_start;
 } DisasContext;
@@ -1109,6 +1111,7 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     memset(ctx->ftemp, 0, sizeof(ctx->ftemp));
     ctx->pm_mask_enabled = FIELD_EX32(tb_flags, TB_FLAGS, PM_MASK_ENABLED);
     ctx->pm_base_enabled = FIELD_EX32(tb_flags, TB_FLAGS, PM_BASE_ENABLED);
+    ctx->ztso = cpu->cfg.ext_ztso;
     ctx->zero = tcg_constant_tl(0);
 }
 
-- 
2.34.1

