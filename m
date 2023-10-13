Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04E61C41513
	for <qemu-riscv@archiver.kernel.org>; Fri, 13 Oct 2023 12:50:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qrHce-0003sS-W3; Fri, 13 Oct 2023 08:50:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1qrDpW-0007JL-Gr
 for qemu-riscv@nongnu.org; Fri, 13 Oct 2023 04:47:36 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1qrDpQ-0000lY-W0
 for qemu-riscv@nongnu.org; Fri, 13 Oct 2023 04:47:33 -0400
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3296b3f03e5so1653602f8f.2
 for <qemu-riscv@nongnu.org>; Fri, 13 Oct 2023 01:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697186844; x=1697791644; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S+81qnoeaIRqKedK6ibK1NLh6+ch/g09aS5I8Db4XR4=;
 b=WDcexdvfJVURAJoOyT5+nJMQXHeo99yuOPpDkATYWKUw/9gZBCpxN15N6yTZhqfKAE
 PLs0pasZaWvmfP0wtnFr2Vsxz00mY4milJFHnXm9evX3LMAx0oho3cFibVLFdqXqLoN/
 UyxZxh1Xycsj7l87NBO18PWM103zomsDssoB7dp05VTO2qjueMpFuNJqjAkl7bfyb4zi
 8VKJyr+6Kth688MlP7pd6/v/SgyasRV9ujG84j1oPsL5J5Ulu76grrP5cZxjPt4SA51x
 16tdeE8iVaj+w07303mXXg5vZay4V/SQ79sQzsF+2BeSc/1f1TBuqu2pmeuyPo1cHp8z
 obwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697186844; x=1697791644;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=S+81qnoeaIRqKedK6ibK1NLh6+ch/g09aS5I8Db4XR4=;
 b=mOyuXjIp+lWLc47abznxZvpAy0c5R+Cu0rD7jyJwUEO2hYwqHXFPPOFnKI1FPjgKSj
 PXE2Bm6lx6L0qdf36l9c4Ae3HefpNswIPdn6Q4+wdpqSXBrY5a1H0lRLmojhh1p4Uoia
 YoyRLO4Rh5kMyTQXSCo8JCYWvB6/5Xhb+firvt46P/pczNa844VE8l2WiYy6gkAALoZo
 LwJE9EnvXleTjRdTsIuyaBdVfdwsz3g4omsdbslZbRCnjWaUtADEMGwiLjaTBkMKNL7y
 +JsAzRCHmdoZA2D+lKRzGDi+6I99yI44xBIhk4MXa7Uu2vjYRGGaj8RZT3//h8mqCMuD
 iNSg==
X-Gm-Message-State: AOJu0YxTFHq0UuNhRP8ntUQv36s8NwOiUyrp/OrUBtNnf8zX4D035GrK
 StrwbaNOP1XoCZ4Aa5u/nXUnKw==
X-Google-Smtp-Source: AGHT+IGACJZnuZcU9jQMBvVyUWOD2giCke+6elTXnBkNl0+vNAm6KIrkwS/2QTOMMWbQue3N4Fqr/g==
X-Received: by 2002:adf:e382:0:b0:319:7472:f0b6 with SMTP id
 e2-20020adfe382000000b003197472f0b6mr22839614wrm.15.1697186844403; 
 Fri, 13 Oct 2023 01:47:24 -0700 (PDT)
Received: from localhost.localdomain (adsl-170.109.242.226.tellas.gr.
 [109.242.226.170]) by smtp.gmail.com with ESMTPSA id
 v10-20020a5d678a000000b0032d9f32b96csm569185wru.62.2023.10.13.01.47.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Oct 2023 01:47:23 -0700 (PDT)
From: Emmanouil Pitsidianakis <manos.pitsidianakis@linaro.org>
To: qemu-devel@nongnu.org
Cc: Emmanouil Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, WANG Xuerui <git@xen0n.name>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Huacai Chen <chenhuacai@kernel.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, Stefan Weil <sw@weilnetz.de>,
 qemu-arm@nongnu.org (open list:AArch64 TCG target),
 qemu-riscv@nongnu.org (open list:RISC-V TCG target)
Subject: [RFC PATCH v3 06/78] tcg: add fallthrough pseudo-keyword
Date: Fri, 13 Oct 2023 11:45:34 +0300
Message-Id: <3303ac9dd5e2106c732d22a4c649445ce073b97c.1697186560.git.manos.pitsidianakis@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1697186560.git.manos.pitsidianakis@linaro.org>
References: <cover.1697186560.git.manos.pitsidianakis@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 13 Oct 2023 08:50:29 -0400
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

In preparation of raising -Wimplicit-fallthrough to 5, replace all
fall-through comments with the fallthrough attribute pseudo-keyword.

Signed-off-by: Emmanouil Pitsidianakis <manos.pitsidianakis@linaro.org>
---
 target/i386/tcg/translate.c      |  3 +++
 tcg/aarch64/tcg-target.c.inc     | 15 ++++++++++++++-
 tcg/arm/tcg-target.c.inc         |  5 +++--
 tcg/i386/tcg-target.c.inc        | 20 ++++++++++++++------
 tcg/loongarch64/tcg-target.c.inc |  4 ++--
 tcg/mips/tcg-target.c.inc        |  8 ++++++--
 tcg/ppc/tcg-target.c.inc         | 19 ++++++++++++++-----
 tcg/riscv/tcg-target.c.inc       |  5 +++--
 tcg/s390x/tcg-target.c.inc       |  8 ++++++--
 tcg/tcg-op-gvec.c                | 24 ++++++++++++------------
 tcg/tcg-op-ldst.c                |  2 +-
 tcg/tcg.c                        | 24 +++++++++++++-----------
 tcg/tci.c                        |  2 +-
 tcg/tci/tcg-target.c.inc         |  2 +-
 14 files changed, 93 insertions(+), 48 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index d2061ec44a..e42e3dd653 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -1996,6 +1996,7 @@ static void gen_shiftd_rm_T1(DisasContext *s, MemOp ot, int op1,
          * If TARGET_X86_64 defined then fall through into MO_32 case,
          * otherwise fall through default case.
          */
+        fallthrough;
     case MO_32:
 #ifdef TARGET_X86_64
         /* Concatenate the two 32-bit values and use a 64-bit shift.  */
@@ -3298,6 +3299,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
         if (CODE64(s))
             goto illegal_op;
         /* fall through */
+        fallthrough;
     case 0x80: /* GRP1 */
     case 0x81:
     case 0x83:
@@ -7046,6 +7048,7 @@ static void i386_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
         gen_update_cc_op(dc);
         gen_update_eip_cur(dc);
         /* fall through */
+        fallthrough;
     case DISAS_EOB_ONLY:
         gen_eob(dc);
         break;
diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index 3afb896a3a..1af7640aab 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -298,7 +298,7 @@ static bool tcg_target_const_match(int64_t val, TCGType type, int ct, int vece)
         break;
     case TCG_CT_CONST_ANDI:
         val = ~val;
-        /* fallthru */
+        fallthrough;
     case TCG_CT_CONST_ORRI:
         if (val == deposit64(val, 32, 32, val)) {
             int cmode, imm8;
@@ -1190,6 +1190,7 @@ static bool tcg_out_mov(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg)
             break;
         }
         /* FALLTHRU */
+        fallthrough;
 
     case TCG_TYPE_V64:
         tcg_debug_assert(ret >= 32 && arg >= 32);
@@ -2090,6 +2091,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_add_i32:
         a2 = (int32_t)a2;
         /* FALLTHRU */
+        fallthrough;
     case INDEX_op_add_i64:
         if (c2) {
             tcg_out_addsubi(s, ext, a0, a1, a2);
@@ -2101,6 +2103,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_sub_i32:
         a2 = (int32_t)a2;
         /* FALLTHRU */
+        fallthrough;
     case INDEX_op_sub_i64:
         if (c2) {
             tcg_out_addsubi(s, ext, a0, a1, -a2);
@@ -2117,6 +2120,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_and_i32:
         a2 = (int32_t)a2;
         /* FALLTHRU */
+        fallthrough;
     case INDEX_op_and_i64:
         if (c2) {
             tcg_out_logicali(s, I3404_ANDI, ext, a0, a1, a2);
@@ -2128,6 +2132,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_andc_i32:
         a2 = (int32_t)a2;
         /* FALLTHRU */
+        fallthrough;
     case INDEX_op_andc_i64:
         if (c2) {
             tcg_out_logicali(s, I3404_ANDI, ext, a0, a1, ~a2);
@@ -2139,6 +2144,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_or_i32:
         a2 = (int32_t)a2;
         /* FALLTHRU */
+        fallthrough;
     case INDEX_op_or_i64:
         if (c2) {
             tcg_out_logicali(s, I3404_ORRI, ext, a0, a1, a2);
@@ -2150,6 +2156,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_orc_i32:
         a2 = (int32_t)a2;
         /* FALLTHRU */
+        fallthrough;
     case INDEX_op_orc_i64:
         if (c2) {
             tcg_out_logicali(s, I3404_ORRI, ext, a0, a1, ~a2);
@@ -2161,6 +2168,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_xor_i32:
         a2 = (int32_t)a2;
         /* FALLTHRU */
+        fallthrough;
     case INDEX_op_xor_i64:
         if (c2) {
             tcg_out_logicali(s, I3404_EORI, ext, a0, a1, a2);
@@ -2172,6 +2180,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_eqv_i32:
         a2 = (int32_t)a2;
         /* FALLTHRU */
+        fallthrough;
     case INDEX_op_eqv_i64:
         if (c2) {
             tcg_out_logicali(s, I3404_EORI, ext, a0, a1, ~a2);
@@ -2268,6 +2277,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_brcond_i32:
         a1 = (int32_t)a1;
         /* FALLTHRU */
+        fallthrough;
     case INDEX_op_brcond_i64:
         tcg_out_brcond(s, ext, a2, a0, a1, const_args[1], arg_label(args[3]));
         break;
@@ -2275,6 +2285,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_setcond_i32:
         a2 = (int32_t)a2;
         /* FALLTHRU */
+        fallthrough;
     case INDEX_op_setcond_i64:
         tcg_out_cmp(s, ext, a1, a2, c2);
         /* Use CSET alias of CSINC Wd, WZR, WZR, invert(cond).  */
@@ -2285,6 +2296,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_negsetcond_i32:
         a2 = (int32_t)a2;
         /* FALLTHRU */
+        fallthrough;
     case INDEX_op_negsetcond_i64:
         tcg_out_cmp(s, ext, a1, a2, c2);
         /* Use CSETM alias of CSINV Wd, WZR, WZR, invert(cond).  */
@@ -2295,6 +2307,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_movcond_i32:
         a2 = (int32_t)a2;
         /* FALLTHRU */
+        fallthrough;
     case INDEX_op_movcond_i64:
         tcg_out_cmp(s, ext, a1, a2, c2);
         tcg_out_insn(s, 3506, CSEL, ext, a0, REG0(3), REG0(4), args[5]);
diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index 0d9c2d157b..ceb747183d 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -529,6 +529,7 @@ static bool tcg_target_const_match(int64_t val, TCGType type, int ct, int vece)
     case TCG_CT_CONST_ANDI:
         val = ~val;
         /* fallthru */
+        fallthrough;
     case TCG_CT_CONST_ORRI:
         if (val == deposit64(val, 32, 32, val)) {
             int cmode, imm8;
@@ -2677,7 +2678,7 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
             return;
         }
         a2 = ~a2;
-        /* fall through */
+        fallthrough;
     case INDEX_op_and_vec:
         if (const_args[2]) {
             is_shimm1632(~a2, &cmode, &imm8);
@@ -2697,7 +2698,7 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
             return;
         }
         a2 = ~a2;
-        /* fall through */
+        fallthrough;
     case INDEX_op_or_vec:
         if (const_args[2]) {
             is_shimm1632(a2, &cmode, &imm8);
diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 788d608150..8f0764156e 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -181,6 +181,7 @@ static bool patch_reloc(tcg_insn_unit *code_ptr, int type,
             return false;
         }
         /* FALLTHRU */
+        fallthrough;
     case R_386_32:
         tcg_patch32(code_ptr, value);
         break;
@@ -845,6 +846,7 @@ static bool tcg_out_mov(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg)
     case TCG_TYPE_I64:
         rexw = P_REXW;
         /* fallthru */
+        fallthrough;
     case TCG_TYPE_I32:
         if (ret < 16) {
             if (arg < 16) {
@@ -898,10 +900,12 @@ static bool tcg_out_dup_vec(TCGContext *s, TCGType type, unsigned vece,
             tcg_out_vex_modrm(s, OPC_PUNPCKLBW, r, a, a);
             a = r;
             /* FALLTHRU */
+            fallthrough;
         case MO_16:
             tcg_out_vex_modrm(s, OPC_PUNPCKLWD, r, a, a);
             a = r;
             /* FALLTHRU */
+            fallthrough;
         case MO_32:
             tcg_out_vex_modrm(s, OPC_PSHUFD, r, 0, a);
             /* imm8 operand: all output lanes selected from input lane 0.  */
@@ -1126,6 +1130,7 @@ static void tcg_out_ld(TCGContext *s, TCGType type, TCGReg ret,
             break;
         }
         /* FALLTHRU */
+        fallthrough;
     case TCG_TYPE_V64:
         /* There is no instruction that can validate 8-byte alignment.  */
         tcg_debug_assert(ret >= 16);
@@ -1171,6 +1176,7 @@ static void tcg_out_st(TCGContext *s, TCGType type, TCGReg arg,
             break;
         }
         /* FALLTHRU */
+        fallthrough;
     case TCG_TYPE_V64:
         /* There is no instruction that can validate 8-byte alignment.  */
         tcg_debug_assert(arg >= 16);
@@ -1537,7 +1543,7 @@ static void tcg_out_setcond(TCGContext *s, int rexw, TCGCond cond,
     switch (cond) {
     case TCG_COND_NE:
         inv = true;
-        /* fall through */
+        fallthrough;
     case TCG_COND_EQ:
         /* If arg2 is 0, convert to LTU/GEU vs 1. */
         if (const_arg2 && arg2 == 0) {
@@ -1548,7 +1554,7 @@ static void tcg_out_setcond(TCGContext *s, int rexw, TCGCond cond,
 
     case TCG_COND_LEU:
         inv = true;
-        /* fall through */
+        fallthrough;
     case TCG_COND_GTU:
         /* If arg2 is a register, swap for LTU/GEU. */
         if (!const_arg2) {
@@ -1561,7 +1567,7 @@ static void tcg_out_setcond(TCGContext *s, int rexw, TCGCond cond,
 
     case TCG_COND_GEU:
         inv = true;
-        /* fall through */
+        fallthrough;
     case TCG_COND_LTU:
     do_ltu:
         /*
@@ -1587,7 +1593,7 @@ static void tcg_out_setcond(TCGContext *s, int rexw, TCGCond cond,
 
     case TCG_COND_GE:
         inv = true;
-        /* fall through */
+        fallthrough;
     case TCG_COND_LT:
         /* If arg2 is 0, extract the sign bit. */
         if (const_arg2 && arg2 == 0) {
@@ -2443,6 +2449,7 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
 # define OP_32_64(x) \
         case glue(glue(INDEX_op_, x), _i64): \
             rexw = P_REXW; /* FALLTHRU */    \
+            fallthrough;                     \
         case glue(glue(INDEX_op_, x), _i32)
 #else
 # define OP_32_64(x) \
@@ -2689,7 +2696,7 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
             tcg_out_qemu_ld(s, a0, -1, a1, a2, args[3], TCG_TYPE_I32);
             break;
         }
-        /* fall through */
+        fallthrough;
     case INDEX_op_qemu_ld_a32_i32:
         tcg_out_qemu_ld(s, a0, -1, a1, -1, a2, TCG_TYPE_I32);
         break;
@@ -2719,7 +2726,7 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
             tcg_out_qemu_st(s, a0, -1, a1, a2, args[3], TCG_TYPE_I32);
             break;
         }
-        /* fall through */
+        fallthrough;
     case INDEX_op_qemu_st_a32_i32:
     case INDEX_op_qemu_st8_a32_i32:
         tcg_out_qemu_st(s, a0, -1, a1, -1, a2, TCG_TYPE_I32);
@@ -2846,6 +2853,7 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
             break;
         }
         /* FALLTHRU */
+        fallthrough;
     case INDEX_op_extract_i32:
         /* On the off-chance that we can use the high-byte registers.
            Otherwise we emit the same ext16 + shift pattern that we
diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index 801302d85d..728384ce51 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -1013,7 +1013,7 @@ static void tcg_out_qemu_ld_indexed(TCGContext *s, MemOp opc, TCGType type,
             tcg_out_opc_ldx_wu(s, rd, h.base, h.index);
             break;
         }
-        /* fallthrough */
+        fallthrough;
     case MO_SL:
         tcg_out_opc_ldx_w(s, rd, h.base, h.index);
         break;
@@ -1303,7 +1303,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_bswap32_i32:
         /* All 32-bit values are computed sign-extended in the register.  */
         a2 = TCG_BSWAP_OS;
-        /* fallthrough */
+        fallthrough;
     case INDEX_op_bswap32_i64:
         tcg_out_opc_revb_2w(s, a0, a1);
         if (a2 & TCG_BSWAP_OS) {
diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index e2892edc6a..0effa5320a 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -917,6 +917,7 @@ static void tcg_out_setcond(TCGContext *s, TCGCond cond, TCGReg ret,
     case TCG_COND_GT:
         s_opc = OPC_SLT;
         /* FALLTHRU */
+        fallthrough;
 
     case TCG_COND_LTU:
     case TCG_COND_GEU:
@@ -974,6 +975,7 @@ static void tcg_out_brcond(TCGContext *s, TCGCond cond, TCGReg arg1,
         }
         s_opc = OPC_SLT;
         /* FALLTHRU */
+        fallthrough;
 
     case TCG_COND_LTU:
     case TCG_COND_GTU:
@@ -1109,6 +1111,7 @@ static void tcg_out_movcond(TCGContext *s, TCGCond cond, TCGReg ret,
     case TCG_COND_EQ:
         eqz = true;
         /* FALLTHRU */
+        fallthrough;
     case TCG_COND_NE:
         if (c2 != 0) {
             tcg_out_opc_reg(s, OPC_XOR, TCG_TMP0, c1, c2);
@@ -1430,6 +1433,7 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, TCGReg lo, TCGReg hi,
             break;
         }
         /* FALLTHRU */
+        fallthrough;
     case MO_SL:
         tcg_out_opc_imm(s, OPC_LW, lo, base, 0);
         break;
@@ -2117,7 +2121,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
             tcg_out_qemu_ld(s, a0, 0, a1, a2, args[3], TCG_TYPE_I32);
             break;
         }
-        /* fall through */
+        fallthrough;
     case INDEX_op_qemu_ld_a32_i32:
         tcg_out_qemu_ld(s, a0, 0, a1, 0, a2, TCG_TYPE_I32);
         break;
@@ -2141,7 +2145,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
             tcg_out_qemu_st(s, a0, 0, a1, a2, args[3], TCG_TYPE_I32);
             break;
         }
-        /* fall through */
+        fallthrough;
     case INDEX_op_qemu_st_a32_i32:
         tcg_out_qemu_st(s, a0, 0, a1, 0, a2, TCG_TYPE_I32);
         break;
diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index 5c873b2161..a438a02045 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -724,6 +724,7 @@ static bool tcg_out_mov(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg)
     case TCG_TYPE_I64:
         tcg_debug_assert(TCG_TARGET_REG_BITS == 64);
         /* fallthru */
+        fallthrough;
     case TCG_TYPE_I32:
         if (ret < TCG_REG_V0) {
             if (arg < TCG_REG_V0) {
@@ -748,6 +749,7 @@ static bool tcg_out_mov(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg)
             }
         }
         /* fallthru */
+        fallthrough;
     case TCG_TYPE_V64:
     case TCG_TYPE_V128:
         tcg_debug_assert(ret >= TCG_REG_V0 && arg >= TCG_REG_V0);
@@ -1300,6 +1302,7 @@ static void tcg_out_mem_long(TCGContext *s, int opi, int opx, TCGReg rt,
     case LD: case LWA:
         align = 3;
         /* FALLTHRU */
+        fallthrough;
     default:
         if (rt > TCG_REG_R0 && rt < TCG_REG_V0) {
             rs = rt;
@@ -1317,6 +1320,7 @@ static void tcg_out_mem_long(TCGContext *s, int opi, int opx, TCGReg rt,
     case STD:
         align = 3;
         /* FALLTHRU */
+        fallthrough;
     case STB: case STH: case STW:
         is_int_store = true;
         break;
@@ -1389,6 +1393,7 @@ static void tcg_out_ld(TCGContext *s, TCGType type, TCGReg ret,
             break;
         }
         /* fallthru */
+        fallthrough;
     case TCG_TYPE_V64:
         tcg_debug_assert(ret >= TCG_REG_V0);
         if (have_vsx) {
@@ -1444,6 +1449,7 @@ static void tcg_out_st(TCGContext *s, TCGType type, TCGReg arg,
             break;
         }
         /* fallthru */
+        fallthrough;
     case TCG_TYPE_V64:
         tcg_debug_assert(arg >= TCG_REG_V0);
         if (have_vsx) {
@@ -1659,6 +1665,7 @@ static void tcg_out_setcond(TCGContext *s, TCGType type, TCGCond cond,
             tcg_out32(s, NOR | SAB(arg1, arg0, arg1));
             arg1 = arg0;
             /* FALLTHRU */
+            fallthrough;
         case TCG_COND_LT:
             /* Extract the sign bit.  */
             if (type == TCG_TYPE_I32) {
@@ -1719,7 +1726,7 @@ static void tcg_out_setcond(TCGContext *s, TCGType type, TCGCond cond,
     case TCG_COND_LE:
     case TCG_COND_LEU:
         inv = true;
-        /* fall through */
+        fallthrough;
     case TCG_COND_GT:
     case TCG_COND_GTU:
         sh = 30; /* CR7 CR_GT */
@@ -1728,7 +1735,7 @@ static void tcg_out_setcond(TCGContext *s, TCGType type, TCGCond cond,
     case TCG_COND_GE:
     case TCG_COND_GEU:
         inv = true;
-        /* fall through */
+        fallthrough;
     case TCG_COND_LT:
     case TCG_COND_LTU:
         sh = 29; /* CR7 CR_LT */
@@ -2744,6 +2751,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
             break;
         }
         /* FALLTHRU */
+        fallthrough;
     case INDEX_op_orc_i64:
         tcg_out32(s, ORC | SAB(args[1], args[0], args[2]));
         break;
@@ -2753,6 +2761,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
             break;
         }
         /* FALLTHRU */
+        fallthrough;
     case INDEX_op_eqv_i64:
         tcg_out32(s, EQV | SAB(args[1], args[0], args[2]));
         break;
@@ -2968,7 +2977,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
                             args[3], TCG_TYPE_I32);
             break;
         }
-        /* fall through */
+        fallthrough;
     case INDEX_op_qemu_ld_a32_i32:
         tcg_out_qemu_ld(s, args[0], -1, args[1], -1, args[2], TCG_TYPE_I32);
         break;
@@ -3002,7 +3011,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
                             args[3], TCG_TYPE_I32);
             break;
         }
-        /* fall through */
+        fallthrough;
     case INDEX_op_qemu_st_a32_i32:
         tcg_out_qemu_st(s, args[0], -1, args[1], -1, args[2], TCG_TYPE_I32);
         break;
@@ -3591,7 +3600,7 @@ static void expand_vec_cmp(TCGType type, unsigned vece, TCGv_vec v0,
         if (have_isa_3_00 && vece <= MO_32) {
             break;
         }
-        /* fall through */
+        fallthrough;
     case TCG_COND_LE:
     case TCG_COND_LEU:
         need_inv = true;
diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index d6dbcaf3cb..8b0e7b000c 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -948,7 +948,7 @@ static void tcg_out_negsetcond(TCGContext *s, TCGCond cond, TCGReg ret,
         case TCG_COND_GE:
             tcg_out_opc_imm(s, OPC_XORI, ret, arg1, -1);
             arg1 = ret;
-            /* fall through */
+            fallthrough;
         case TCG_COND_LT:
             tcg_out_opc_imm(s, OPC_SRAI, ret, arg1, TCG_TARGET_REG_BITS - 1);
             return;
@@ -1373,6 +1373,7 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, TCGReg val,
             break;
         }
         /* FALLTHRU */
+        fallthrough;
     case MO_SL:
         tcg_out_opc_imm(s, OPC_LW, val, base, 0);
         break;
@@ -1754,7 +1755,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         break;
     case INDEX_op_bswap32_i32:
         a2 = 0;
-        /* fall through */
+        fallthrough;
     case INDEX_op_bswap32_i64:
         tcg_out_opc_imm(s, OPC_REV8, a0, a1, 0);
         if (a2 & TCG_BSWAP_OZ) {
diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index 4ef9ac3d5b..3656b8ddf0 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -809,7 +809,7 @@ static bool tcg_out_mov(TCGContext *s, TCGType type, TCGReg dst, TCGReg src)
             tcg_out_insn(s, RR, LR, dst, src);
             break;
         }
-        /* fallthru */
+        fallthrough;
 
     case TCG_TYPE_I64:
         if (likely(is_general_reg(dst))) {
@@ -823,7 +823,7 @@ static bool tcg_out_mov(TCGContext *s, TCGType type, TCGReg dst, TCGReg src)
             tcg_out_insn(s, VRSb, VLVG, dst, 0, 0, src, 3);
             break;
         }
-        /* fallthru */
+        fallthrough;
 
     case TCG_TYPE_V64:
     case TCG_TYPE_V128:
@@ -981,6 +981,7 @@ static void tcg_out_ld(TCGContext *s, TCGType type, TCGReg data,
             break;
         }
         /* fallthru */
+        fallthrough;
 
     case TCG_TYPE_V64:
         tcg_out_vrx_mem(s, VRX_VLLEZ, data, base, TCG_REG_NONE, ofs, MO_64);
@@ -1014,6 +1015,7 @@ static void tcg_out_st(TCGContext *s, TCGType type, TCGReg data,
             break;
         }
         /* fallthru */
+        fallthrough;
 
     case TCG_TYPE_V64:
         tcg_out_vrx_mem(s, VRX_VSTEG, data, base, TCG_REG_NONE, ofs, 0);
@@ -1306,6 +1308,7 @@ static void tgen_setcond(TCGContext *s, TCGType type, TCGCond cond,
             break;
         }
         /* fallthru */
+        fallthrough;
 
     case TCG_COND_GTU:
     case TCG_COND_GT:
@@ -1333,6 +1336,7 @@ static void tgen_setcond(TCGContext *s, TCGType type, TCGCond cond,
             break;
         }
         /* fallthru */
+        fallthrough;
 
     case TCG_COND_LEU:
     case TCG_COND_LE:
diff --git a/tcg/tcg-op-gvec.c b/tcg/tcg-op-gvec.c
index feb2d3686b..35e47902f1 100644
--- a/tcg/tcg-op-gvec.c
+++ b/tcg/tcg-op-gvec.c
@@ -496,7 +496,7 @@ static void do_dup_store(TCGType type, uint32_t dofs, uint32_t oprsz,
         for (; i + 32 <= oprsz; i += 32) {
             tcg_gen_stl_vec(t_vec, tcg_env, dofs + i, TCG_TYPE_V256);
         }
-        /* fallthru */
+        fallthrough;
     case TCG_TYPE_V128:
         for (; i + 16 <= oprsz; i += 16) {
             tcg_gen_stl_vec(t_vec, tcg_env, dofs + i, TCG_TYPE_V128);
@@ -1229,7 +1229,7 @@ void tcg_gen_gvec_2(uint32_t dofs, uint32_t aofs,
         aofs += some;
         oprsz -= some;
         maxsz -= some;
-        /* fallthru */
+        fallthrough;
     case TCG_TYPE_V128:
         expand_2_vec(g->vece, dofs, aofs, oprsz, 16, TCG_TYPE_V128,
                      g->load_dest, g->fniv);
@@ -1293,7 +1293,7 @@ void tcg_gen_gvec_2i(uint32_t dofs, uint32_t aofs, uint32_t oprsz,
         aofs += some;
         oprsz -= some;
         maxsz -= some;
-        /* fallthru */
+        fallthrough;
     case TCG_TYPE_V128:
         expand_2i_vec(g->vece, dofs, aofs, oprsz, 16, TCG_TYPE_V128,
                       c, g->load_dest, g->fniv);
@@ -1367,7 +1367,7 @@ void tcg_gen_gvec_2s(uint32_t dofs, uint32_t aofs, uint32_t oprsz,
             aofs += some;
             oprsz -= some;
             maxsz -= some;
-            /* fallthru */
+            fallthrough;
 
         case TCG_TYPE_V128:
             expand_2s_vec(g->vece, dofs, aofs, oprsz, 16, TCG_TYPE_V128,
@@ -1440,7 +1440,7 @@ void tcg_gen_gvec_3(uint32_t dofs, uint32_t aofs, uint32_t bofs,
         bofs += some;
         oprsz -= some;
         maxsz -= some;
-        /* fallthru */
+        fallthrough;
     case TCG_TYPE_V128:
         expand_3_vec(g->vece, dofs, aofs, bofs, oprsz, 16, TCG_TYPE_V128,
                      g->load_dest, g->fniv);
@@ -1508,7 +1508,7 @@ void tcg_gen_gvec_3i(uint32_t dofs, uint32_t aofs, uint32_t bofs,
         bofs += some;
         oprsz -= some;
         maxsz -= some;
-        /* fallthru */
+        fallthrough;
     case TCG_TYPE_V128:
         expand_3i_vec(g->vece, dofs, aofs, bofs, oprsz, 16, TCG_TYPE_V128,
                       c, g->load_dest, g->fniv);
@@ -1574,7 +1574,7 @@ void tcg_gen_gvec_4(uint32_t dofs, uint32_t aofs, uint32_t bofs, uint32_t cofs,
         cofs += some;
         oprsz -= some;
         maxsz -= some;
-        /* fallthru */
+        fallthrough;
     case TCG_TYPE_V128:
         expand_4_vec(g->vece, dofs, aofs, bofs, cofs, oprsz,
                      16, TCG_TYPE_V128, g->write_aofs, g->fniv);
@@ -1645,7 +1645,7 @@ void tcg_gen_gvec_4i(uint32_t dofs, uint32_t aofs, uint32_t bofs, uint32_t cofs,
         cofs += some;
         oprsz -= some;
         maxsz -= some;
-        /* fallthru */
+        fallthrough;
     case TCG_TYPE_V128:
         expand_4i_vec(g->vece, dofs, aofs, bofs, cofs, oprsz,
                        16, TCG_TYPE_V128, c, g->fniv);
@@ -3173,7 +3173,7 @@ do_gvec_shifts(unsigned vece, uint32_t dofs, uint32_t aofs, TCGv_i32 shift,
             aofs += some;
             oprsz -= some;
             maxsz -= some;
-            /* fallthru */
+            fallthrough;
         case TCG_TYPE_V128:
             expand_2sh_vec(vece, dofs, aofs, oprsz, 16,
                            TCG_TYPE_V128, shift, g->fniv_s);
@@ -3216,7 +3216,7 @@ do_gvec_shifts(unsigned vece, uint32_t dofs, uint32_t aofs, TCGv_i32 shift,
             aofs += some;
             oprsz -= some;
             maxsz -= some;
-            /* fallthru */
+            fallthrough;
         case TCG_TYPE_V128:
             expand_2s_vec(vece, dofs, aofs, oprsz, 16, TCG_TYPE_V128,
                           v_shift, false, g->fniv_v);
@@ -3808,7 +3808,7 @@ void tcg_gen_gvec_cmp(TCGCond cond, unsigned vece, uint32_t dofs,
         bofs += some;
         oprsz -= some;
         maxsz -= some;
-        /* fallthru */
+        fallthrough;
     case TCG_TYPE_V128:
         expand_cmp_vec(vece, dofs, aofs, bofs, oprsz, 16, TCG_TYPE_V128, cond);
         break;
@@ -3926,7 +3926,7 @@ void tcg_gen_gvec_cmps(TCGCond cond, unsigned vece, uint32_t dofs,
             dofs += some;
             oprsz -= some;
             maxsz -= some;
-            /* fallthru */
+            fallthrough;
 
         case TCG_TYPE_V128:
             some = QEMU_ALIGN_DOWN(oprsz, 16);
diff --git a/tcg/tcg-op-ldst.c b/tcg/tcg-op-ldst.c
index df4f22c427..5ad51c8cb8 100644
--- a/tcg/tcg-op-ldst.c
+++ b/tcg/tcg-op-ldst.c
@@ -70,7 +70,7 @@ static MemOp tcg_canonicalize_memop(MemOp op, bool is64, bool st)
             op &= ~MO_SIGN;
             break;
         }
-        /* fall through */
+        fallthrough;
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 637b9e6870..84e74badcf 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -23,6 +23,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/compiler.h"
 
 /* Define to jump the ELF file used to communicate with GDB.  */
 #undef DEBUG_JIT
@@ -1192,7 +1193,7 @@ static void init_call_layout(TCGHelperInfo *info)
             switch (TCG_TARGET_CALL_ARG_I32) {
             case TCG_CALL_ARG_EVEN:
                 layout_arg_even(&cum);
-                /* fall through */
+                fallthrough;
             case TCG_CALL_ARG_NORMAL:
                 layout_arg_1(&cum, info, TCG_CALL_ARG_NORMAL);
                 break;
@@ -1209,7 +1210,7 @@ static void init_call_layout(TCGHelperInfo *info)
             switch (TCG_TARGET_CALL_ARG_I64) {
             case TCG_CALL_ARG_EVEN:
                 layout_arg_even(&cum);
-                /* fall through */
+                fallthrough;
             case TCG_CALL_ARG_NORMAL:
                 if (TCG_TARGET_REG_BITS == 32) {
                     layout_arg_normal_n(&cum, info, 2);
@@ -1226,7 +1227,7 @@ static void init_call_layout(TCGHelperInfo *info)
             switch (TCG_TARGET_CALL_ARG_I128) {
             case TCG_CALL_ARG_EVEN:
                 layout_arg_even(&cum);
-                /* fall through */
+                fallthrough;
             case TCG_CALL_ARG_NORMAL:
                 layout_arg_normal_n(&cum, info, 128 / TCG_TARGET_REG_BITS);
                 break;
@@ -2299,7 +2300,7 @@ static void tcg_reg_alloc_start(TCGContext *s)
             break;
         case TEMP_EBB:
             val = TEMP_VAL_DEAD;
-            /* fall through */
+            fallthrough;
         case TEMP_TB:
             ts->mem_allocated = 0;
             break;
@@ -3556,7 +3557,7 @@ liveness_pass_1(TCGContext *s)
                                 *la_temp_pref(ts) = 0;
                                 break;
                             }
-                            /* fall through */
+                            fallthrough;
                         default:
                             *la_temp_pref(ts) =
                                 tcg_target_available_regs[ts->type];
@@ -4135,7 +4136,7 @@ static void temp_sync(TCGContext *s, TCGTemp *ts, TCGRegSet allocated_regs,
             }
             temp_load(s, ts, tcg_target_available_regs[ts->type],
                       allocated_regs, preferred_regs);
-            /* fallthrough */
+            fallthrough;
 
         case TEMP_VAL_REG:
             tcg_out_st(s, ts->type, ts->reg,
@@ -4622,7 +4623,7 @@ static void tcg_reg_alloc_dup(TCGContext *s, const TCGOp *op)
             /* Sync the temp back to its slot and load from there.  */
             temp_sync(s, its, s->reserved_regs, 0, 0);
         }
-        /* fall through */
+        fallthrough;
 
     case TEMP_VAL_MEM:
         lowpart_ofs = 0;
@@ -5289,6 +5290,7 @@ static void tcg_reg_alloc_call(TCGContext *s, TCGOp *op)
                        ts->mem_base->reg, ts->mem_offset);
         }
         /* fall through to mark all parts in memory */
+        fallthrough;
 
     case TCG_CALL_RET_BY_REF:
         /* The callee has performed a write through the reference. */
@@ -5489,7 +5491,7 @@ static void tcg_out_helper_load_slots(TCGContext *s,
 
         /* No conflicts: perform this move and continue. */
         tcg_out_movext1(s, &mov[3]);
-        /* fall through */
+        fallthrough;
 
     case 3:
         tcg_out_movext3(s, mov, mov + 1, mov + 2,
@@ -5741,7 +5743,7 @@ static void tcg_out_ld_helper_ret(TCGContext *s, const TCGLabelQemuLdst *ldst,
         if (TCG_TARGET_REG_BITS == 32) {
             break;
         }
-        /* fall through */
+        fallthrough;
 
     case TCG_TYPE_I32:
         mov[0].dst = ldst->datalo_reg;
@@ -5781,7 +5783,7 @@ static void tcg_out_ld_helper_ret(TCGContext *s, const TCGLabelQemuLdst *ldst,
             tcg_out_st(s, TCG_TYPE_V128,
                        tcg_target_call_oarg_reg(TCG_CALL_RET_BY_VEC, 0),
                        TCG_REG_CALL_STACK, ofs_slot0);
-            /* fall through */
+            fallthrough;
         case TCG_CALL_RET_BY_REF:
             tcg_out_ld(s, TCG_TYPE_I64, ldst->datalo_reg,
                        TCG_REG_CALL_STACK, ofs_slot0 + 8 * HOST_BIG_ENDIAN);
@@ -6069,7 +6071,7 @@ int tcg_gen_code(TCGContext *s, TranslationBlock *tb, uint64_t pc_start)
             if (tcg_reg_alloc_dup2(s, op)) {
                 break;
             }
-            /* fall through */
+            fallthrough;
         default:
             /* Sanity check that we've not introduced any unhandled opcodes. */
             tcg_debug_assert(tcg_op_supported(opc));
diff --git a/tcg/tci.c b/tcg/tci.c
index 4640902c88..3368941953 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -1310,7 +1310,7 @@ int print_insn_tci(bfd_vma addr, disassemble_info *info)
             info->fprintf_func(info->stream, "align");
             break;
         }
-        /* fall through */
+        fallthrough;
 
     default:
         info->fprintf_func(info->stream, "illegal opcode %d", op);
diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index 461f4b47ff..f60d0ba037 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -524,7 +524,7 @@ static void tcg_out_movi(TCGContext *s, TCGType type,
     case TCG_TYPE_I32:
 #if TCG_TARGET_REG_BITS == 64
         arg = (int32_t)arg;
-        /* fall through */
+        fallthrough;
     case TCG_TYPE_I64:
 #endif
         break;
-- 
2.39.2


