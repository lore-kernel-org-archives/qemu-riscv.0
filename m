Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kyyhU-0001GC-3y
	for mharc-qemu-riscv@gnu.org; Mon, 11 Jan 2021 10:01:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kyyhN-0001Dq-Uv; Mon, 11 Jan 2021 10:01:39 -0500
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:36354)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kyyhJ-0001Si-7s; Mon, 11 Jan 2021 10:01:36 -0500
Received: by mail-ej1-x629.google.com with SMTP id lt17so59704ejb.3;
 Mon, 11 Jan 2021 07:01:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vf/wZ0/y/41t2lXyI9D2kezLuMSTe1BhgghJsOVZPUU=;
 b=T/O1VpQahTfQSxTND+Epa3K10kGhyPr4JFJWUlRboUKfymWu58/DYV7EsO9JlZR4Wo
 owyv7FiWnvYpfWVyplreK6uD9on35nlBmcA7V35qJ4OcxY75JR/BQR2pDLUz9osOJOeg
 AawAGG8HPE66nNBBr1jA48uBiOmMPcFPBhtHM44DUl7q+25q8QxOzI00CDjneqAQaxHC
 puAEcbvNae1ll8IIiTh5MhXBrc3af84XTQeZMkFis5ZqBgXz3oyhBBCleEluo2TYkAgc
 hnKqKrD26LnG1q5iMu+Z/JJWTdoBArVvagq0tTNu45DkMB115OPA5pKOPZEbGGBEz0hI
 tO7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=vf/wZ0/y/41t2lXyI9D2kezLuMSTe1BhgghJsOVZPUU=;
 b=IBLt67gRaeE8raUib2UTEY3GhtUdqESiUsfpneD3uTdqXPP5gksH8ZLxmaWaaNvhGj
 3o+kuEF0UsWmZIHFlR9KeZELKqd1i1LJP11RpFlN7rfkq043PaEacDUiqaNLwHpQMXEh
 Xp5EtFHzPFuqq9exZ1Kayy4u7pv3Nq7NzjSfP+MeLTaY9M0J8GFwCBPwA+msTj9CwBko
 14WWbuKpjGYMeNjZldD7A7xHv9EvA392GEPBJT8m3/b6kaOFDbZdin5Dtej47ITWldBE
 T+GAcKF2h4JktLih/RojIJE1n3U83VFDvhaQLpwg2FTMT+FHMEQV8l/u3sUpBUr5SpfF
 qiSQ==
X-Gm-Message-State: AOAM530KT2/XyWsCkECQbezh6MJxQXtvm6T0sCx5QN935pfYTjt3bxlJ
 PZLtAlb6u1Tw72oZ+xrEvIb52dXz+68=
X-Google-Smtp-Source: ABdhPJxBaleYdSx2Ns1d+A/mXqWtcAFzmwdZEzz+xPUdu3b8aObS789d/hP+MtNjQh1ipvWP3gTgVA==
X-Received: by 2002:a17:906:4756:: with SMTP id
 j22mr11543878ejs.353.1610377290055; 
 Mon, 11 Jan 2021 07:01:30 -0800 (PST)
Received: from x1w.redhat.com (129.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.129])
 by smtp.gmail.com with ESMTPSA id mc25sm7102202ejb.58.2021.01.11.07.01.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 07:01:29 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Huacai Chen <chenhuacai@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Thomas Huth <thuth@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Andrzej Zaborowski <balrogg@gmail.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH 2/5] tcg/ppc: Hoist common argument loads in tcg_out_op()
Date: Mon, 11 Jan 2021 16:01:11 +0100
Message-Id: <20210111150114.1415930-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210111150114.1415930-1-f4bug@amsat.org>
References: <20210111150114.1415930-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x629.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 11 Jan 2021 15:01:43 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tcg/ppc/tcg-target.c.inc | 294 ++++++++++++++++++---------------------
 1 file changed, 138 insertions(+), 156 deletions(-)

diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index 19a4a12f155..d37b519d693 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -2357,15 +2357,23 @@ static void tcg_target_qemu_prologue(TCGContext *s)
     tcg_out32(s, BCLR | BO_ALWAYS);
 }
 
-static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
-                       const int *const_args)
+static void tcg_out_op(TCGContext *s, TCGOpcode opc,
+                       const TCGArg args[TCG_MAX_OP_ARGS],
+                       const int const_args[TCG_MAX_OP_ARGS])
 {
     TCGArg a0, a1, a2;
-    int c;
+    int c, c1, c2;
+
+    /* Hoist the loads of the most common arguments.  */
+    a0 = args[0];
+    a1 = args[1];
+    a2 = args[2];
+    c1 = const_args[1];
+    c2 = const_args[2];
 
     switch (opc) {
     case INDEX_op_exit_tb:
-        tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_R3, args[0]);
+        tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_R3, a0);
         tcg_out_b(s, 0, tcg_code_gen_epilogue);
         break;
     case INDEX_op_goto_tb:
@@ -2376,24 +2384,24 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
                 if ((uintptr_t)s->code_ptr & 7) {
                     tcg_out32(s, NOP);
                 }
-                s->tb_jmp_insn_offset[args[0]] = tcg_current_code_size(s);
+                s->tb_jmp_insn_offset[a0] = tcg_current_code_size(s);
                 tcg_out32(s, ADDIS | TAI(TCG_REG_TB, TCG_REG_TB, 0));
                 tcg_out32(s, ADDI | TAI(TCG_REG_TB, TCG_REG_TB, 0));
             } else {
-                s->tb_jmp_insn_offset[args[0]] = tcg_current_code_size(s);
+                s->tb_jmp_insn_offset[a0] = tcg_current_code_size(s);
                 tcg_out32(s, B);
-                s->tb_jmp_reset_offset[args[0]] = tcg_current_code_size(s);
+                s->tb_jmp_reset_offset[a0] = tcg_current_code_size(s);
                 break;
             }
         } else {
             /* Indirect jump. */
             tcg_debug_assert(s->tb_jmp_insn_offset == NULL);
             tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_TB, 0,
-                       (intptr_t)(s->tb_jmp_insn_offset + args[0]));
+                       (intptr_t)(s->tb_jmp_insn_offset + a0));
         }
         tcg_out32(s, MTSPR | RS(TCG_REG_TB) | CTR);
         tcg_out32(s, BCCTR | BO_ALWAYS);
-        set_jmp_reset_offset(s, args[0]);
+        set_jmp_reset_offset(s, a0);
         if (USE_REG_TB) {
             /* For the unlinked case, need to reset TCG_REG_TB.  */
             tcg_out_mem_long(s, ADDI, ADD, TCG_REG_TB, TCG_REG_TB,
@@ -2401,16 +2409,16 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
         }
         break;
     case INDEX_op_goto_ptr:
-        tcg_out32(s, MTSPR | RS(args[0]) | CTR);
+        tcg_out32(s, MTSPR | RS(a0) | CTR);
         if (USE_REG_TB) {
-            tcg_out_mov(s, TCG_TYPE_PTR, TCG_REG_TB, args[0]);
+            tcg_out_mov(s, TCG_TYPE_PTR, TCG_REG_TB, a0);
         }
         tcg_out32(s, ADDI | TAI(TCG_REG_R3, 0, 0));
         tcg_out32(s, BCCTR | BO_ALWAYS);
         break;
     case INDEX_op_br:
         {
-            TCGLabel *l = arg_label(args[0]);
+            TCGLabel *l = arg_label(a0);
             uint32_t insn = B;
 
             if (l->has_value) {
@@ -2424,50 +2432,49 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
         break;
     case INDEX_op_ld8u_i32:
     case INDEX_op_ld8u_i64:
-        tcg_out_mem_long(s, LBZ, LBZX, args[0], args[1], args[2]);
+        tcg_out_mem_long(s, LBZ, LBZX, a0, a1, a2);
         break;
     case INDEX_op_ld8s_i32:
     case INDEX_op_ld8s_i64:
-        tcg_out_mem_long(s, LBZ, LBZX, args[0], args[1], args[2]);
-        tcg_out32(s, EXTSB | RS(args[0]) | RA(args[0]));
+        tcg_out_mem_long(s, LBZ, LBZX, a0, a1, a2);
+        tcg_out32(s, EXTSB | RS(a0) | RA(a0));
         break;
     case INDEX_op_ld16u_i32:
     case INDEX_op_ld16u_i64:
-        tcg_out_mem_long(s, LHZ, LHZX, args[0], args[1], args[2]);
+        tcg_out_mem_long(s, LHZ, LHZX, a0, a1, a2);
         break;
     case INDEX_op_ld16s_i32:
     case INDEX_op_ld16s_i64:
-        tcg_out_mem_long(s, LHA, LHAX, args[0], args[1], args[2]);
+        tcg_out_mem_long(s, LHA, LHAX, a0, a1, a2);
         break;
     case INDEX_op_ld_i32:
     case INDEX_op_ld32u_i64:
-        tcg_out_mem_long(s, LWZ, LWZX, args[0], args[1], args[2]);
+        tcg_out_mem_long(s, LWZ, LWZX, a0, a1, a2);
         break;
     case INDEX_op_ld32s_i64:
-        tcg_out_mem_long(s, LWA, LWAX, args[0], args[1], args[2]);
+        tcg_out_mem_long(s, LWA, LWAX, a0, a1, a2);
         break;
     case INDEX_op_ld_i64:
-        tcg_out_mem_long(s, LD, LDX, args[0], args[1], args[2]);
+        tcg_out_mem_long(s, LD, LDX, a0, a1, a2);
         break;
     case INDEX_op_st8_i32:
     case INDEX_op_st8_i64:
-        tcg_out_mem_long(s, STB, STBX, args[0], args[1], args[2]);
+        tcg_out_mem_long(s, STB, STBX, a0, a1, a2);
         break;
     case INDEX_op_st16_i32:
     case INDEX_op_st16_i64:
-        tcg_out_mem_long(s, STH, STHX, args[0], args[1], args[2]);
+        tcg_out_mem_long(s, STH, STHX, a0, a1, a2);
         break;
     case INDEX_op_st_i32:
     case INDEX_op_st32_i64:
-        tcg_out_mem_long(s, STW, STWX, args[0], args[1], args[2]);
+        tcg_out_mem_long(s, STW, STWX, a0, a1, a2);
         break;
     case INDEX_op_st_i64:
-        tcg_out_mem_long(s, STD, STDX, args[0], args[1], args[2]);
+        tcg_out_mem_long(s, STD, STDX, a0, a1, a2);
         break;
 
     case INDEX_op_add_i32:
-        a0 = args[0], a1 = args[1], a2 = args[2];
-        if (const_args[2]) {
+        if (c2) {
         do_addi_32:
             tcg_out_mem_long(s, ADDI, ADD, a0, a1, (int32_t)a2);
         } else {
@@ -2475,14 +2482,13 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
         }
         break;
     case INDEX_op_sub_i32:
-        a0 = args[0], a1 = args[1], a2 = args[2];
-        if (const_args[1]) {
-            if (const_args[2]) {
+        if (c1) {
+            if (c2) {
                 tcg_out_movi(s, TCG_TYPE_I32, a0, a1 - a2);
             } else {
                 tcg_out32(s, SUBFIC | TAI(a0, a2, a1));
             }
-        } else if (const_args[2]) {
+        } else if (c2) {
             a2 = -a2;
             goto do_addi_32;
         } else {
@@ -2491,16 +2497,14 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
         break;
 
     case INDEX_op_and_i32:
-        a0 = args[0], a1 = args[1], a2 = args[2];
-        if (const_args[2]) {
+        if (c2) {
             tcg_out_andi32(s, a0, a1, a2);
         } else {
             tcg_out32(s, AND | SAB(a1, a0, a2));
         }
         break;
     case INDEX_op_and_i64:
-        a0 = args[0], a1 = args[1], a2 = args[2];
-        if (const_args[2]) {
+        if (c2) {
             tcg_out_andi64(s, a0, a1, a2);
         } else {
             tcg_out32(s, AND | SAB(a1, a0, a2));
@@ -2508,8 +2512,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
         break;
     case INDEX_op_or_i64:
     case INDEX_op_or_i32:
-        a0 = args[0], a1 = args[1], a2 = args[2];
-        if (const_args[2]) {
+        if (c2) {
             tcg_out_ori32(s, a0, a1, a2);
         } else {
             tcg_out32(s, OR | SAB(a1, a0, a2));
@@ -2517,83 +2520,75 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
         break;
     case INDEX_op_xor_i64:
     case INDEX_op_xor_i32:
-        a0 = args[0], a1 = args[1], a2 = args[2];
-        if (const_args[2]) {
+        if (c2) {
             tcg_out_xori32(s, a0, a1, a2);
         } else {
             tcg_out32(s, XOR | SAB(a1, a0, a2));
         }
         break;
     case INDEX_op_andc_i32:
-        a0 = args[0], a1 = args[1], a2 = args[2];
-        if (const_args[2]) {
+        if (c2) {
             tcg_out_andi32(s, a0, a1, ~a2);
         } else {
             tcg_out32(s, ANDC | SAB(a1, a0, a2));
         }
         break;
     case INDEX_op_andc_i64:
-        a0 = args[0], a1 = args[1], a2 = args[2];
-        if (const_args[2]) {
+        if (c2) {
             tcg_out_andi64(s, a0, a1, ~a2);
         } else {
             tcg_out32(s, ANDC | SAB(a1, a0, a2));
         }
         break;
     case INDEX_op_orc_i32:
-        if (const_args[2]) {
-            tcg_out_ori32(s, args[0], args[1], ~args[2]);
+        if (c2) {
+            tcg_out_ori32(s, a0, a1, ~a2);
             break;
         }
         /* FALLTHRU */
     case INDEX_op_orc_i64:
-        tcg_out32(s, ORC | SAB(args[1], args[0], args[2]));
+        tcg_out32(s, ORC | SAB(a1, a0, a2));
         break;
     case INDEX_op_eqv_i32:
-        if (const_args[2]) {
-            tcg_out_xori32(s, args[0], args[1], ~args[2]);
+        if (c2) {
+            tcg_out_xori32(s, a0, a1, ~a2);
             break;
         }
         /* FALLTHRU */
     case INDEX_op_eqv_i64:
-        tcg_out32(s, EQV | SAB(args[1], args[0], args[2]));
+        tcg_out32(s, EQV | SAB(a1, a0, a2));
         break;
     case INDEX_op_nand_i32:
     case INDEX_op_nand_i64:
-        tcg_out32(s, NAND | SAB(args[1], args[0], args[2]));
+        tcg_out32(s, NAND | SAB(a1, a0, a2));
         break;
     case INDEX_op_nor_i32:
     case INDEX_op_nor_i64:
-        tcg_out32(s, NOR | SAB(args[1], args[0], args[2]));
+        tcg_out32(s, NOR | SAB(a1, a0, a2));
         break;
 
     case INDEX_op_clz_i32:
-        tcg_out_cntxz(s, TCG_TYPE_I32, CNTLZW, args[0], args[1],
-                      args[2], const_args[2]);
+        tcg_out_cntxz(s, TCG_TYPE_I32, CNTLZW, a0, a1, a2, c2);
         break;
     case INDEX_op_ctz_i32:
-        tcg_out_cntxz(s, TCG_TYPE_I32, CNTTZW, args[0], args[1],
-                      args[2], const_args[2]);
+        tcg_out_cntxz(s, TCG_TYPE_I32, CNTTZW, a0, a1, a2, c2);
         break;
     case INDEX_op_ctpop_i32:
-        tcg_out32(s, CNTPOPW | SAB(args[1], args[0], 0));
+        tcg_out32(s, CNTPOPW | SAB(a1, a0, 0));
         break;
 
     case INDEX_op_clz_i64:
-        tcg_out_cntxz(s, TCG_TYPE_I64, CNTLZD, args[0], args[1],
-                      args[2], const_args[2]);
+        tcg_out_cntxz(s, TCG_TYPE_I64, CNTLZD, a0, a1, a2, c2);
         break;
     case INDEX_op_ctz_i64:
-        tcg_out_cntxz(s, TCG_TYPE_I64, CNTTZD, args[0], args[1],
-                      args[2], const_args[2]);
+        tcg_out_cntxz(s, TCG_TYPE_I64, CNTTZD, a0, a1, a2, c2);
         break;
     case INDEX_op_ctpop_i64:
-        tcg_out32(s, CNTPOPD | SAB(args[1], args[0], 0));
+        tcg_out32(s, CNTPOPD | SAB(a1, a0, 0));
         break;
 
     case INDEX_op_mul_i32:
-        a0 = args[0], a1 = args[1], a2 = args[2];
-        if (const_args[2]) {
+        if (c2) {
             tcg_out32(s, MULLI | TAI(a0, a1, a2));
         } else {
             tcg_out32(s, MULLW | TAB(a0, a1, a2));
@@ -2601,62 +2596,58 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
         break;
 
     case INDEX_op_div_i32:
-        tcg_out32(s, DIVW | TAB(args[0], args[1], args[2]));
+        tcg_out32(s, DIVW | TAB(a0, a1, a2));
         break;
 
     case INDEX_op_divu_i32:
-        tcg_out32(s, DIVWU | TAB(args[0], args[1], args[2]));
+        tcg_out32(s, DIVWU | TAB(a0, a1, a2));
         break;
 
     case INDEX_op_shl_i32:
-        if (const_args[2]) {
+        if (c2) {
             /* Limit immediate shift count lest we create an illegal insn.  */
-            tcg_out_shli32(s, args[0], args[1], args[2] & 31);
+            tcg_out_shli32(s, a0, a1, a2 & 31);
         } else {
-            tcg_out32(s, SLW | SAB(args[1], args[0], args[2]));
+            tcg_out32(s, SLW | SAB(a1, a0, a2));
         }
         break;
     case INDEX_op_shr_i32:
-        if (const_args[2]) {
+        if (c2) {
             /* Limit immediate shift count lest we create an illegal insn.  */
-            tcg_out_shri32(s, args[0], args[1], args[2] & 31);
+            tcg_out_shri32(s, a0, a1, a2 & 31);
         } else {
-            tcg_out32(s, SRW | SAB(args[1], args[0], args[2]));
+            tcg_out32(s, SRW | SAB(a1, a0, a2));
         }
         break;
     case INDEX_op_sar_i32:
-        if (const_args[2]) {
+        if (c2) {
             /* Limit immediate shift count lest we create an illegal insn.  */
-            tcg_out32(s, SRAWI | RS(args[1]) | RA(args[0]) | SH(args[2] & 31));
+            tcg_out32(s, SRAWI | RS(a1) | RA(a0) | SH(a2 & 31));
         } else {
-            tcg_out32(s, SRAW | SAB(args[1], args[0], args[2]));
+            tcg_out32(s, SRAW | SAB(a1, a0, a2));
         }
         break;
     case INDEX_op_rotl_i32:
-        if (const_args[2]) {
-            tcg_out_rlw(s, RLWINM, args[0], args[1], args[2], 0, 31);
+        if (c2) {
+            tcg_out_rlw(s, RLWINM, a0, a1, a2, 0, 31);
         } else {
-            tcg_out32(s, RLWNM | SAB(args[1], args[0], args[2])
-                         | MB(0) | ME(31));
+            tcg_out32(s, RLWNM | SAB(a1, a0, a2) | MB(0) | ME(31));
         }
         break;
     case INDEX_op_rotr_i32:
-        if (const_args[2]) {
-            tcg_out_rlw(s, RLWINM, args[0], args[1], 32 - args[2], 0, 31);
+        if (c2) {
+            tcg_out_rlw(s, RLWINM, a0, a1, 32 - a2, 0, 31);
         } else {
-            tcg_out32(s, SUBFIC | TAI(TCG_REG_R0, args[2], 32));
-            tcg_out32(s, RLWNM | SAB(args[1], args[0], TCG_REG_R0)
-                         | MB(0) | ME(31));
+            tcg_out32(s, SUBFIC | TAI(TCG_REG_R0, a2, 32));
+            tcg_out32(s, RLWNM | SAB(a1, a0, TCG_REG_R0) | MB(0) | ME(31));
         }
         break;
 
     case INDEX_op_brcond_i32:
-        tcg_out_brcond(s, args[2], args[0], args[1], const_args[1],
-                       arg_label(args[3]), TCG_TYPE_I32);
+        tcg_out_brcond(s, a2, a0, a1, c1, arg_label(args[3]), TCG_TYPE_I32);
         break;
     case INDEX_op_brcond_i64:
-        tcg_out_brcond(s, args[2], args[0], args[1], const_args[1],
-                       arg_label(args[3]), TCG_TYPE_I64);
+        tcg_out_brcond(s, a2, a0, a1, c1, arg_label(args[3]), TCG_TYPE_I64);
         break;
     case INDEX_op_brcond2_i32:
         tcg_out_brcond2(s, args, const_args);
@@ -2664,17 +2655,16 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
 
     case INDEX_op_neg_i32:
     case INDEX_op_neg_i64:
-        tcg_out32(s, NEG | RT(args[0]) | RA(args[1]));
+        tcg_out32(s, NEG | RT(a0) | RA(a1));
         break;
 
     case INDEX_op_not_i32:
     case INDEX_op_not_i64:
-        tcg_out32(s, NOR | SAB(args[1], args[0], args[1]));
+        tcg_out32(s, NOR | SAB(a1, a0, a1));
         break;
 
     case INDEX_op_add_i64:
-        a0 = args[0], a1 = args[1], a2 = args[2];
-        if (const_args[2]) {
+        if (c2) {
         do_addi_64:
             tcg_out_mem_long(s, ADDI, ADD, a0, a1, a2);
         } else {
@@ -2682,14 +2672,13 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
         }
         break;
     case INDEX_op_sub_i64:
-        a0 = args[0], a1 = args[1], a2 = args[2];
-        if (const_args[1]) {
-            if (const_args[2]) {
+        if (c1) {
+            if (c2) {
                 tcg_out_movi(s, TCG_TYPE_I64, a0, a1 - a2);
             } else {
                 tcg_out32(s, SUBFIC | TAI(a0, a2, a1));
             }
-        } else if (const_args[2]) {
+        } else if (c2) {
             a2 = -a2;
             goto do_addi_64;
         } else {
@@ -2698,58 +2687,57 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
         break;
 
     case INDEX_op_shl_i64:
-        if (const_args[2]) {
+        if (c2) {
             /* Limit immediate shift count lest we create an illegal insn.  */
-            tcg_out_shli64(s, args[0], args[1], args[2] & 63);
+            tcg_out_shli64(s, a0, a1, a2 & 63);
         } else {
-            tcg_out32(s, SLD | SAB(args[1], args[0], args[2]));
+            tcg_out32(s, SLD | SAB(a1, a0, a2));
         }
         break;
     case INDEX_op_shr_i64:
-        if (const_args[2]) {
+        if (c2) {
             /* Limit immediate shift count lest we create an illegal insn.  */
-            tcg_out_shri64(s, args[0], args[1], args[2] & 63);
+            tcg_out_shri64(s, a0, a1, a2 & 63);
         } else {
-            tcg_out32(s, SRD | SAB(args[1], args[0], args[2]));
+            tcg_out32(s, SRD | SAB(a1, a0, a2));
         }
         break;
     case INDEX_op_sar_i64:
-        if (const_args[2]) {
-            int sh = SH(args[2] & 0x1f) | (((args[2] >> 5) & 1) << 1);
-            tcg_out32(s, SRADI | RA(args[0]) | RS(args[1]) | sh);
+        if (c2) {
+            int sh = SH(a2 & 0x1f) | (((a2 >> 5) & 1) << 1);
+            tcg_out32(s, SRADI | RA(a0) | RS(a1) | sh);
         } else {
-            tcg_out32(s, SRAD | SAB(args[1], args[0], args[2]));
+            tcg_out32(s, SRAD | SAB(a1, a0, a2));
         }
         break;
     case INDEX_op_rotl_i64:
-        if (const_args[2]) {
-            tcg_out_rld(s, RLDICL, args[0], args[1], args[2], 0);
+        if (c2) {
+            tcg_out_rld(s, RLDICL, a0, a1, a2, 0);
         } else {
-            tcg_out32(s, RLDCL | SAB(args[1], args[0], args[2]) | MB64(0));
+            tcg_out32(s, RLDCL | SAB(a1, a0, a2) | MB64(0));
         }
         break;
     case INDEX_op_rotr_i64:
-        if (const_args[2]) {
-            tcg_out_rld(s, RLDICL, args[0], args[1], 64 - args[2], 0);
+        if (c2) {
+            tcg_out_rld(s, RLDICL, a0, a1, 64 - a2, 0);
         } else {
-            tcg_out32(s, SUBFIC | TAI(TCG_REG_R0, args[2], 64));
-            tcg_out32(s, RLDCL | SAB(args[1], args[0], TCG_REG_R0) | MB64(0));
+            tcg_out32(s, SUBFIC | TAI(TCG_REG_R0, a2, 64));
+            tcg_out32(s, RLDCL | SAB(a1, a0, TCG_REG_R0) | MB64(0));
         }
         break;
 
     case INDEX_op_mul_i64:
-        a0 = args[0], a1 = args[1], a2 = args[2];
-        if (const_args[2]) {
+        if (c2) {
             tcg_out32(s, MULLI | TAI(a0, a1, a2));
         } else {
             tcg_out32(s, MULLD | TAB(a0, a1, a2));
         }
         break;
     case INDEX_op_div_i64:
-        tcg_out32(s, DIVD | TAB(args[0], args[1], args[2]));
+        tcg_out32(s, DIVD | TAB(a0, a1, a2));
         break;
     case INDEX_op_divu_i64:
-        tcg_out32(s, DIVDU | TAB(args[0], args[1], args[2]));
+        tcg_out32(s, DIVDU | TAB(a0, a1, a2));
         break;
 
     case INDEX_op_qemu_ld_i32:
@@ -2778,19 +2766,19 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
         c = EXTSW;
         goto gen_ext;
     gen_ext:
-        tcg_out32(s, c | RS(args[1]) | RA(args[0]));
+        tcg_out32(s, c | RS(a1) | RA(a0));
         break;
     case INDEX_op_extu_i32_i64:
-        tcg_out_ext32u(s, args[0], args[1]);
+        tcg_out_ext32u(s, a0, a1);
         break;
 
     case INDEX_op_setcond_i32:
-        tcg_out_setcond(s, TCG_TYPE_I32, args[3], args[0], args[1], args[2],
-                        const_args[2]);
+        tcg_out_setcond(s, TCG_TYPE_I32, args[3], a0, a1, a2,
+                        c2);
         break;
     case INDEX_op_setcond_i64:
-        tcg_out_setcond(s, TCG_TYPE_I64, args[3], args[0], args[1], args[2],
-                        const_args[2]);
+        tcg_out_setcond(s, TCG_TYPE_I64, args[3], a0, a1, a2,
+                        c2);
         break;
     case INDEX_op_setcond2_i32:
         tcg_out_setcond2(s, args, const_args);
@@ -2798,7 +2786,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
 
     case INDEX_op_bswap16_i32:
     case INDEX_op_bswap16_i64:
-        a0 = args[0], a1 = args[1];
         /* a1 = abcd */
         if (a0 != a1) {
             /* a0 = (a1 r<< 24) & 0xff # 000c */
@@ -2818,10 +2805,9 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
     case INDEX_op_bswap32_i32:
     case INDEX_op_bswap32_i64:
         /* Stolen from gcc's builtin_bswap32 */
-        a1 = args[1];
-        a0 = args[0] == a1 ? TCG_REG_R0 : args[0];
+        a0 = a0 == a1 ? TCG_REG_R0 : a0;
 
-        /* a1 = args[1] # abcd */
+        /* a1 = a1 # abcd */
         /* a0 = rotate_left (a1, 8) # bcda */
         tcg_out_rlw(s, RLWINM, a0, a1, 8, 0, 31);
         /* a0 = (a0 & ~0xff000000) | ((a1 r<< 24) & 0xff000000) # dcda */
@@ -2830,12 +2816,12 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
         tcg_out_rlw(s, RLWIMI, a0, a1, 24, 16, 23);
 
         if (a0 == TCG_REG_R0) {
-            tcg_out_mov(s, TCG_TYPE_REG, args[0], a0);
+            tcg_out_mov(s, TCG_TYPE_REG, a0, a0);
         }
         break;
 
     case INDEX_op_bswap64_i64:
-        a0 = args[0], a1 = args[1], a2 = TCG_REG_R0;
+        a2 = TCG_REG_R0;
         if (a0 == a1) {
             a0 = TCG_REG_R0;
             a2 = a1;
@@ -2862,44 +2848,42 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
         tcg_out_rlw(s, RLWIMI, a0, a2, 24, 16, 23);
 
         if (a0 == 0) {
-            tcg_out_mov(s, TCG_TYPE_REG, args[0], a0);
+            tcg_out_mov(s, TCG_TYPE_REG, a0, a0);
         }
         break;
 
     case INDEX_op_deposit_i32:
-        if (const_args[2]) {
+        if (c2) {
             uint32_t mask = ((2u << (args[4] - 1)) - 1) << args[3];
-            tcg_out_andi32(s, args[0], args[0], ~mask);
+            tcg_out_andi32(s, a0, a0, ~mask);
         } else {
-            tcg_out_rlw(s, RLWIMI, args[0], args[2], args[3],
+            tcg_out_rlw(s, RLWIMI, a0, a2, args[3],
                         32 - args[3] - args[4], 31 - args[3]);
         }
         break;
     case INDEX_op_deposit_i64:
-        if (const_args[2]) {
+        if (c2) {
             uint64_t mask = ((2ull << (args[4] - 1)) - 1) << args[3];
-            tcg_out_andi64(s, args[0], args[0], ~mask);
+            tcg_out_andi64(s, a0, a0, ~mask);
         } else {
-            tcg_out_rld(s, RLDIMI, args[0], args[2], args[3],
-                        64 - args[3] - args[4]);
+            tcg_out_rld(s, RLDIMI, a0, a2, args[3], 64 - args[3] - args[4]);
         }
         break;
 
     case INDEX_op_extract_i32:
-        tcg_out_rlw(s, RLWINM, args[0], args[1],
-                    32 - args[2], 32 - args[3], 31);
+        tcg_out_rlw(s, RLWINM, a0, a1, 32 - a2, 32 - args[3], 31);
         break;
     case INDEX_op_extract_i64:
-        tcg_out_rld(s, RLDICL, args[0], args[1], 64 - args[2], 64 - args[3]);
+        tcg_out_rld(s, RLDICL, a0, a1, 64 - a2, 64 - args[3]);
         break;
 
     case INDEX_op_movcond_i32:
-        tcg_out_movcond(s, TCG_TYPE_I32, args[5], args[0], args[1], args[2],
-                        args[3], args[4], const_args[2]);
+        tcg_out_movcond(s, TCG_TYPE_I32, args[5], a0, a1, a2,
+                        args[3], args[4], c2);
         break;
     case INDEX_op_movcond_i64:
-        tcg_out_movcond(s, TCG_TYPE_I64, args[5], args[0], args[1], args[2],
-                        args[3], args[4], const_args[2]);
+        tcg_out_movcond(s, TCG_TYPE_I64, args[5], a0, a1, a2,
+                        args[3], args[4], c2);
         break;
 
 #if TCG_TARGET_REG_BITS == 64
@@ -2910,14 +2894,13 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
         /* Note that the CA bit is defined based on the word size of the
            environment.  So in 64-bit mode it's always carry-out of bit 63.
            The fallback code using deposit works just as well for 32-bit.  */
-        a0 = args[0], a1 = args[1];
         if (a0 == args[3] || (!const_args[5] && a0 == args[5])) {
             a0 = TCG_REG_R0;
         }
         if (const_args[4]) {
-            tcg_out32(s, ADDIC | TAI(a0, args[2], args[4]));
+            tcg_out32(s, ADDIC | TAI(a0, a2, args[4]));
         } else {
-            tcg_out32(s, ADDC | TAB(a0, args[2], args[4]));
+            tcg_out32(s, ADDC | TAB(a0, a2, args[4]));
         }
         if (const_args[5]) {
             tcg_out32(s, (args[5] ? ADDME : ADDZE) | RT(a1) | RA(args[3]));
@@ -2925,7 +2908,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
             tcg_out32(s, ADDE | TAB(a1, args[3], args[5]));
         }
         if (a0 != args[0]) {
-            tcg_out_mov(s, TCG_TYPE_REG, args[0], a0);
+            tcg_out_mov(s, TCG_TYPE_REG, a0, a0);
         }
         break;
 
@@ -2934,14 +2917,13 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
 #else
     case INDEX_op_sub2_i32:
 #endif
-        a0 = args[0], a1 = args[1];
         if (a0 == args[5] || (!const_args[3] && a0 == args[3])) {
             a0 = TCG_REG_R0;
         }
-        if (const_args[2]) {
-            tcg_out32(s, SUBFIC | TAI(a0, args[4], args[2]));
+        if (c2) {
+            tcg_out32(s, SUBFIC | TAI(a0, args[4], a2));
         } else {
-            tcg_out32(s, SUBFC | TAB(a0, args[4], args[2]));
+            tcg_out32(s, SUBFC | TAB(a0, args[4], a2));
         }
         if (const_args[3]) {
             tcg_out32(s, (args[3] ? SUBFME : SUBFZE) | RT(a1) | RA(args[5]));
@@ -2949,25 +2931,25 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
             tcg_out32(s, SUBFE | TAB(a1, args[5], args[3]));
         }
         if (a0 != args[0]) {
-            tcg_out_mov(s, TCG_TYPE_REG, args[0], a0);
+            tcg_out_mov(s, TCG_TYPE_REG, a0, a0);
         }
         break;
 
     case INDEX_op_muluh_i32:
-        tcg_out32(s, MULHWU | TAB(args[0], args[1], args[2]));
+        tcg_out32(s, MULHWU | TAB(a0, a1, a2));
         break;
     case INDEX_op_mulsh_i32:
-        tcg_out32(s, MULHW | TAB(args[0], args[1], args[2]));
+        tcg_out32(s, MULHW | TAB(a0, a1, a2));
         break;
     case INDEX_op_muluh_i64:
-        tcg_out32(s, MULHDU | TAB(args[0], args[1], args[2]));
+        tcg_out32(s, MULHDU | TAB(a0, a1, a2));
         break;
     case INDEX_op_mulsh_i64:
-        tcg_out32(s, MULHD | TAB(args[0], args[1], args[2]));
+        tcg_out32(s, MULHD | TAB(a0, a1, a2));
         break;
 
     case INDEX_op_mb:
-        tcg_out_mb(s, args[0]);
+        tcg_out_mb(s, a0);
         break;
 
     case INDEX_op_mov_i32:   /* Always emitted via tcg_out_mov.  */
-- 
2.26.2


