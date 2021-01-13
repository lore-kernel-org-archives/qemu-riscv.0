Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kzjuJ-0000LW-EX
	for mharc-qemu-riscv@gnu.org; Wed, 13 Jan 2021 12:26:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kzjta-00008A-U6; Wed, 13 Jan 2021 12:25:22 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:41523)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kzjtY-00063H-A2; Wed, 13 Jan 2021 12:25:22 -0500
Received: by mail-wr1-x430.google.com with SMTP id a12so2952710wrv.8;
 Wed, 13 Jan 2021 09:25:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cGAPxmq968bmJMMpj0rkaQPnnLWtPOzEXjKRRKbvSdA=;
 b=CjqDk99CHQvO8S5MphJazHsM3oTPO5KmXjVcAja4K50Zty9GvOr2KB4u7wbL51E5ad
 GJfXYHxpE22HSyWFbxgE3m7rRVTpLL8uYfn7FFBEDN67nueb2KDmxGgNSWbsLWS2o7uR
 p9iXqmHgErwQxWUO7oLtH7EIbn9U1xrUcua17cl55b3OO5Yk1gF6B5Tz4PsNQLzXfrGh
 j1ok/O9S/fT2yOwgFElA1zdtuN//KRzxAYn0RzbJW2RpuhcBXE2r05H+0xwBlTawl7jS
 OJaJMD3YzLA8z5UqjrSHJQFFr5eCwkGpVdrdh6pS8CTcI978zec7QiaKVp/CFcPXxC5i
 XVTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=cGAPxmq968bmJMMpj0rkaQPnnLWtPOzEXjKRRKbvSdA=;
 b=VCIkCu77z2+8O0/uNgfZmkB55EWMS50J4wAJHJgqYsGVM+AApKQtLm7gKqBJd1SkCN
 5JcOTiEtai4+iDAkZYWn5lQM1fzcwqJhqEeGD2anoVLBYzXzhEVwBPRzBUS810be5AD4
 pR5nej3R9zo7eYrxJHQf0CW83MaGrmcN3CLdDrFyviUla/+RYuojTDKQQSRpSkH72lhQ
 RWqP7H0UyBI33grjJjFeO6PAfsx9Ug/FMp0Ip3aDa5HNZOO88V+NdBh9JNZvi/RxHqES
 Uhm95sghNM9zQ+GCBqbRjuWR2WQE1MC3/qNqbaebin96ywifr4Gs0iX2nif5Dem5MuQA
 AyKw==
X-Gm-Message-State: AOAM530B5wQa9rTm/nn1cdN9l6rIbgtUUmtjwXxAucxxrH9IhfPTlIex
 +Zn40NUY+oSssJXa3+KUw+j3LVL7MFQ=
X-Google-Smtp-Source: ABdhPJydaTS+KX3Igjbxc9bK8IoRQxNi+fARF+o7Od0eYSU9SbpR/y8panhJhZSYfLo+Qh23qCMLyg==
X-Received: by 2002:a5d:53c9:: with SMTP id a9mr3605687wrw.188.1610558717338; 
 Wed, 13 Jan 2021 09:25:17 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id l20sm4835123wrh.82.2021.01.13.09.25.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 09:25:16 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Aurelien Jarno <aurelien@aurel32.net>, Cornelia Huck <cohuck@redhat.com>,
 qemu-arm@nongnu.org, Alistair Francis <Alistair.Francis@wdc.com>,
 Miroslav Rezanina <mrezanin@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-riscv@nongnu.org, Huacai Chen <chenhuacai@kernel.org>,
 Stefan Weil <sw@weilnetz.de>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Andrzej Zaborowski <balrogg@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v2 3/6] tcg/ppc: Hoist common argument loads in tcg_out_op()
Date: Wed, 13 Jan 2021 18:24:56 +0100
Message-Id: <20210113172459.2481060-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210113172459.2481060-1-f4bug@amsat.org>
References: <20210113172459.2481060-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
X-List-Received-Date: Wed, 13 Jan 2021 17:25:43 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tcg/ppc/tcg-target.c.inc | 188 ++++++++++++++++++---------------------
 1 file changed, 85 insertions(+), 103 deletions(-)

diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index 19a4a12f155..70b747a8a30 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -2357,15 +2357,22 @@ static void tcg_target_qemu_prologue(TCGContext *s)
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
+    int c, c2;
+
+    /* Hoist the loads of the most common arguments.  */
+    a0 = args[0];
+    a1 = args[1];
+    a2 = args[2];
+    c2 = const_args[2];
 
     switch (opc) {
     case INDEX_op_exit_tb:
-        tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_R3, args[0]);
+        tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_R3, a0);
         tcg_out_b(s, 0, tcg_code_gen_epilogue);
         break;
     case INDEX_op_goto_tb:
@@ -2389,11 +2396,11 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
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
@@ -2403,7 +2410,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
     case INDEX_op_goto_ptr:
         tcg_out32(s, MTSPR | RS(args[0]) | CTR);
         if (USE_REG_TB) {
-            tcg_out_mov(s, TCG_TYPE_PTR, TCG_REG_TB, args[0]);
+            tcg_out_mov(s, TCG_TYPE_PTR, TCG_REG_TB, a0);
         }
         tcg_out32(s, ADDI | TAI(TCG_REG_R3, 0, 0));
         tcg_out32(s, BCCTR | BO_ALWAYS);
@@ -2424,49 +2431,48 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
         break;
     case INDEX_op_ld8u_i32:
     case INDEX_op_ld8u_i64:
-        tcg_out_mem_long(s, LBZ, LBZX, args[0], args[1], args[2]);
+        tcg_out_mem_long(s, LBZ, LBZX, a0, a1, a2);
         break;
     case INDEX_op_ld8s_i32:
     case INDEX_op_ld8s_i64:
-        tcg_out_mem_long(s, LBZ, LBZX, args[0], args[1], args[2]);
+        tcg_out_mem_long(s, LBZ, LBZX, a0, a1, a2);
         tcg_out32(s, EXTSB | RS(args[0]) | RA(args[0]));
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
         if (const_args[2]) {
         do_addi_32:
             tcg_out_mem_long(s, ADDI, ADD, a0, a1, (int32_t)a2);
@@ -2475,7 +2481,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
         }
         break;
     case INDEX_op_sub_i32:
-        a0 = args[0], a1 = args[1], a2 = args[2];
         if (const_args[1]) {
             if (const_args[2]) {
                 tcg_out_movi(s, TCG_TYPE_I32, a0, a1 - a2);
@@ -2491,7 +2496,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
         break;
 
     case INDEX_op_and_i32:
-        a0 = args[0], a1 = args[1], a2 = args[2];
         if (const_args[2]) {
             tcg_out_andi32(s, a0, a1, a2);
         } else {
@@ -2499,7 +2503,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
         }
         break;
     case INDEX_op_and_i64:
-        a0 = args[0], a1 = args[1], a2 = args[2];
         if (const_args[2]) {
             tcg_out_andi64(s, a0, a1, a2);
         } else {
@@ -2508,7 +2511,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
         break;
     case INDEX_op_or_i64:
     case INDEX_op_or_i32:
-        a0 = args[0], a1 = args[1], a2 = args[2];
         if (const_args[2]) {
             tcg_out_ori32(s, a0, a1, a2);
         } else {
@@ -2517,7 +2519,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
         break;
     case INDEX_op_xor_i64:
     case INDEX_op_xor_i32:
-        a0 = args[0], a1 = args[1], a2 = args[2];
         if (const_args[2]) {
             tcg_out_xori32(s, a0, a1, a2);
         } else {
@@ -2525,7 +2526,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
         }
         break;
     case INDEX_op_andc_i32:
-        a0 = args[0], a1 = args[1], a2 = args[2];
         if (const_args[2]) {
             tcg_out_andi32(s, a0, a1, ~a2);
         } else {
@@ -2533,7 +2533,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
         }
         break;
     case INDEX_op_andc_i64:
-        a0 = args[0], a1 = args[1], a2 = args[2];
         if (const_args[2]) {
             tcg_out_andi64(s, a0, a1, ~a2);
         } else {
@@ -2542,57 +2541,52 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
         break;
     case INDEX_op_orc_i32:
         if (const_args[2]) {
-            tcg_out_ori32(s, args[0], args[1], ~args[2]);
+            tcg_out_ori32(s, a0, a1, ~args[2]);
             break;
         }
         /* FALLTHRU */
     case INDEX_op_orc_i64:
-        tcg_out32(s, ORC | SAB(args[1], args[0], args[2]));
+        tcg_out32(s, ORC | SAB(args[1], a0, a2));
         break;
     case INDEX_op_eqv_i32:
         if (const_args[2]) {
-            tcg_out_xori32(s, args[0], args[1], ~args[2]);
+            tcg_out_xori32(s, a0, a1, ~args[2]);
             break;
         }
         /* FALLTHRU */
     case INDEX_op_eqv_i64:
-        tcg_out32(s, EQV | SAB(args[1], args[0], args[2]));
+        tcg_out32(s, EQV | SAB(args[1], a0, a2));
         break;
     case INDEX_op_nand_i32:
     case INDEX_op_nand_i64:
-        tcg_out32(s, NAND | SAB(args[1], args[0], args[2]));
+        tcg_out32(s, NAND | SAB(args[1], a0, a2));
         break;
     case INDEX_op_nor_i32:
     case INDEX_op_nor_i64:
-        tcg_out32(s, NOR | SAB(args[1], args[0], args[2]));
+        tcg_out32(s, NOR | SAB(args[1], a0, a2));
         break;
 
     case INDEX_op_clz_i32:
-        tcg_out_cntxz(s, TCG_TYPE_I32, CNTLZW, args[0], args[1],
-                      args[2], const_args[2]);
+        tcg_out_cntxz(s, TCG_TYPE_I32, CNTLZW, a0, a1, a2, const_args[2]);
         break;
     case INDEX_op_ctz_i32:
-        tcg_out_cntxz(s, TCG_TYPE_I32, CNTTZW, args[0], args[1],
-                      args[2], const_args[2]);
+        tcg_out_cntxz(s, TCG_TYPE_I32, CNTTZW, a0, a1, a2, const_args[2]);
         break;
     case INDEX_op_ctpop_i32:
-        tcg_out32(s, CNTPOPW | SAB(args[1], args[0], 0));
+        tcg_out32(s, CNTPOPW | SAB(args[1], a0, 0));
         break;
 
     case INDEX_op_clz_i64:
-        tcg_out_cntxz(s, TCG_TYPE_I64, CNTLZD, args[0], args[1],
-                      args[2], const_args[2]);
+        tcg_out_cntxz(s, TCG_TYPE_I64, CNTLZD, a0, a1, a2, const_args[2]);
         break;
     case INDEX_op_ctz_i64:
-        tcg_out_cntxz(s, TCG_TYPE_I64, CNTTZD, args[0], args[1],
-                      args[2], const_args[2]);
+        tcg_out_cntxz(s, TCG_TYPE_I64, CNTTZD, a0, a1, a2, const_args[2]);
         break;
     case INDEX_op_ctpop_i64:
-        tcg_out32(s, CNTPOPD | SAB(args[1], args[0], 0));
+        tcg_out32(s, CNTPOPD | SAB(args[1], a0, 0));
         break;
 
     case INDEX_op_mul_i32:
-        a0 = args[0], a1 = args[1], a2 = args[2];
         if (const_args[2]) {
             tcg_out32(s, MULLI | TAI(a0, a1, a2));
         } else {
@@ -2601,27 +2595,27 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
         break;
 
     case INDEX_op_div_i32:
-        tcg_out32(s, DIVW | TAB(args[0], args[1], args[2]));
+        tcg_out32(s, DIVW | TAB(args[0], a1, a2));
         break;
 
     case INDEX_op_divu_i32:
-        tcg_out32(s, DIVWU | TAB(args[0], args[1], args[2]));
+        tcg_out32(s, DIVWU | TAB(args[0], a1, a2));
         break;
 
     case INDEX_op_shl_i32:
         if (const_args[2]) {
             /* Limit immediate shift count lest we create an illegal insn.  */
-            tcg_out_shli32(s, args[0], args[1], args[2] & 31);
+            tcg_out_shli32(s, a0, a1, a2 & 31);
         } else {
-            tcg_out32(s, SLW | SAB(args[1], args[0], args[2]));
+            tcg_out32(s, SLW | SAB(args[1], a0, a2));
         }
         break;
     case INDEX_op_shr_i32:
         if (const_args[2]) {
             /* Limit immediate shift count lest we create an illegal insn.  */
-            tcg_out_shri32(s, args[0], args[1], args[2] & 31);
+            tcg_out_shri32(s, a0, a1, a2 & 31);
         } else {
-            tcg_out32(s, SRW | SAB(args[1], args[0], args[2]));
+            tcg_out32(s, SRW | SAB(args[1], a0, a2));
         }
         break;
     case INDEX_op_sar_i32:
@@ -2629,33 +2623,32 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
             /* Limit immediate shift count lest we create an illegal insn.  */
             tcg_out32(s, SRAWI | RS(args[1]) | RA(args[0]) | SH(args[2] & 31));
         } else {
-            tcg_out32(s, SRAW | SAB(args[1], args[0], args[2]));
+            tcg_out32(s, SRAW | SAB(args[1], a0, a2));
         }
         break;
     case INDEX_op_rotl_i32:
         if (const_args[2]) {
-            tcg_out_rlw(s, RLWINM, args[0], args[1], args[2], 0, 31);
+            tcg_out_rlw(s, RLWINM, a0, a1, a2, 0, 31);
         } else {
-            tcg_out32(s, RLWNM | SAB(args[1], args[0], args[2])
+            tcg_out32(s, RLWNM | SAB(args[1], a0, a2)
                          | MB(0) | ME(31));
         }
         break;
     case INDEX_op_rotr_i32:
         if (const_args[2]) {
-            tcg_out_rlw(s, RLWINM, args[0], args[1], 32 - args[2], 0, 31);
+            tcg_out_rlw(s, RLWINM, a0, a1, 32 - a2, 0, 31);
         } else {
-            tcg_out32(s, SUBFIC | TAI(TCG_REG_R0, args[2], 32));
-            tcg_out32(s, RLWNM | SAB(args[1], args[0], TCG_REG_R0)
-                         | MB(0) | ME(31));
+            tcg_out32(s, SUBFIC | TAI(TCG_REG_R0, a2, 32));
+            tcg_out32(s, RLWNM | SAB(args[1], a0, TCG_REG_R0) | MB(0) | ME(31));
         }
         break;
 
     case INDEX_op_brcond_i32:
-        tcg_out_brcond(s, args[2], args[0], args[1], const_args[1],
+        tcg_out_brcond(s, a2, a0, a1, const_args[1],
                        arg_label(args[3]), TCG_TYPE_I32);
         break;
     case INDEX_op_brcond_i64:
-        tcg_out_brcond(s, args[2], args[0], args[1], const_args[1],
+        tcg_out_brcond(s, a2, a0, a1, const_args[1],
                        arg_label(args[3]), TCG_TYPE_I64);
         break;
     case INDEX_op_brcond2_i32:
@@ -2669,11 +2662,10 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
 
     case INDEX_op_not_i32:
     case INDEX_op_not_i64:
-        tcg_out32(s, NOR | SAB(args[1], args[0], args[1]));
+        tcg_out32(s, NOR | SAB(args[1], a0, a1));
         break;
 
     case INDEX_op_add_i64:
-        a0 = args[0], a1 = args[1], a2 = args[2];
         if (const_args[2]) {
         do_addi_64:
             tcg_out_mem_long(s, ADDI, ADD, a0, a1, a2);
@@ -2682,7 +2674,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
         }
         break;
     case INDEX_op_sub_i64:
-        a0 = args[0], a1 = args[1], a2 = args[2];
         if (const_args[1]) {
             if (const_args[2]) {
                 tcg_out_movi(s, TCG_TYPE_I64, a0, a1 - a2);
@@ -2700,17 +2691,17 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
     case INDEX_op_shl_i64:
         if (const_args[2]) {
             /* Limit immediate shift count lest we create an illegal insn.  */
-            tcg_out_shli64(s, args[0], args[1], args[2] & 63);
+            tcg_out_shli64(s, a0, a1, a2 & 63);
         } else {
-            tcg_out32(s, SLD | SAB(args[1], args[0], args[2]));
+            tcg_out32(s, SLD | SAB(args[1], a0, a2));
         }
         break;
     case INDEX_op_shr_i64:
         if (const_args[2]) {
             /* Limit immediate shift count lest we create an illegal insn.  */
-            tcg_out_shri64(s, args[0], args[1], args[2] & 63);
+            tcg_out_shri64(s, a0, a1, a2 & 63);
         } else {
-            tcg_out32(s, SRD | SAB(args[1], args[0], args[2]));
+            tcg_out32(s, SRD | SAB(args[1], a0, a2));
         }
         break;
     case INDEX_op_sar_i64:
@@ -2718,27 +2709,26 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
             int sh = SH(args[2] & 0x1f) | (((args[2] >> 5) & 1) << 1);
             tcg_out32(s, SRADI | RA(args[0]) | RS(args[1]) | sh);
         } else {
-            tcg_out32(s, SRAD | SAB(args[1], args[0], args[2]));
+            tcg_out32(s, SRAD | SAB(args[1], a0, a2));
         }
         break;
     case INDEX_op_rotl_i64:
         if (const_args[2]) {
-            tcg_out_rld(s, RLDICL, args[0], args[1], args[2], 0);
+            tcg_out_rld(s, RLDICL, a0, a1, a2, 0);
         } else {
-            tcg_out32(s, RLDCL | SAB(args[1], args[0], args[2]) | MB64(0));
+            tcg_out32(s, RLDCL | SAB(args[1], a0, a2) | MB64(0));
         }
         break;
     case INDEX_op_rotr_i64:
         if (const_args[2]) {
-            tcg_out_rld(s, RLDICL, args[0], args[1], 64 - args[2], 0);
+            tcg_out_rld(s, RLDICL, a0, a1, 64 - a2, 0);
         } else {
-            tcg_out32(s, SUBFIC | TAI(TCG_REG_R0, args[2], 64));
-            tcg_out32(s, RLDCL | SAB(args[1], args[0], TCG_REG_R0) | MB64(0));
+            tcg_out32(s, SUBFIC | TAI(TCG_REG_R0, a2, 64));
+            tcg_out32(s, RLDCL | SAB(args[1], a0, TCG_REG_R0) | MB64(0));
         }
         break;
 
     case INDEX_op_mul_i64:
-        a0 = args[0], a1 = args[1], a2 = args[2];
         if (const_args[2]) {
             tcg_out32(s, MULLI | TAI(a0, a1, a2));
         } else {
@@ -2746,10 +2736,10 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
         }
         break;
     case INDEX_op_div_i64:
-        tcg_out32(s, DIVD | TAB(args[0], args[1], args[2]));
+        tcg_out32(s, DIVD | TAB(args[0], a1, a2));
         break;
     case INDEX_op_divu_i64:
-        tcg_out32(s, DIVDU | TAB(args[0], args[1], args[2]));
+        tcg_out32(s, DIVDU | TAB(args[0], a1, a2));
         break;
 
     case INDEX_op_qemu_ld_i32:
@@ -2781,16 +2771,14 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
         tcg_out32(s, c | RS(args[1]) | RA(args[0]));
         break;
     case INDEX_op_extu_i32_i64:
-        tcg_out_ext32u(s, args[0], args[1]);
+        tcg_out_ext32u(s, a0, a1);
         break;
 
     case INDEX_op_setcond_i32:
-        tcg_out_setcond(s, TCG_TYPE_I32, args[3], args[0], args[1], args[2],
-                        const_args[2]);
+        tcg_out_setcond(s, TCG_TYPE_I32, args[3], a0, a1, a2, const_args[2]);
         break;
     case INDEX_op_setcond_i64:
-        tcg_out_setcond(s, TCG_TYPE_I64, args[3], args[0], args[1], args[2],
-                        const_args[2]);
+        tcg_out_setcond(s, TCG_TYPE_I64, args[3], a0, a1, a2, const_args[2]);
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
@@ -2818,7 +2805,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
     case INDEX_op_bswap32_i32:
     case INDEX_op_bswap32_i64:
         /* Stolen from gcc's builtin_bswap32 */
-        a1 = args[1];
         a0 = args[0] == a1 ? TCG_REG_R0 : args[0];
 
         /* a1 = args[1] # abcd */
@@ -2835,7 +2821,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
         break;
 
     case INDEX_op_bswap64_i64:
-        a0 = args[0], a1 = args[1], a2 = TCG_REG_R0;
+        a2 = TCG_REG_R0;
         if (a0 == a1) {
             a0 = TCG_REG_R0;
             a2 = a1;
@@ -2869,36 +2855,34 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
     case INDEX_op_deposit_i32:
         if (const_args[2]) {
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
         if (const_args[2]) {
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
+        tcg_out_movcond(s, TCG_TYPE_I32, args[5], a0, a1, a2,
                         args[3], args[4], const_args[2]);
         break;
     case INDEX_op_movcond_i64:
-        tcg_out_movcond(s, TCG_TYPE_I64, args[5], args[0], args[1], args[2],
+        tcg_out_movcond(s, TCG_TYPE_I64, args[5], a0, a1, a2,
                         args[3], args[4], const_args[2]);
         break;
 
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
@@ -2934,14 +2917,13 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
 #else
     case INDEX_op_sub2_i32:
 #endif
-        a0 = args[0], a1 = args[1];
         if (a0 == args[5] || (!const_args[3] && a0 == args[3])) {
             a0 = TCG_REG_R0;
         }
         if (const_args[2]) {
-            tcg_out32(s, SUBFIC | TAI(a0, args[4], args[2]));
+            tcg_out32(s, SUBFIC | TAI(a0, args[4], a2));
         } else {
-            tcg_out32(s, SUBFC | TAB(a0, args[4], args[2]));
+            tcg_out32(s, SUBFC | TAB(a0, args[4], a2));
         }
         if (const_args[3]) {
             tcg_out32(s, (args[3] ? SUBFME : SUBFZE) | RT(a1) | RA(args[5]));
@@ -2954,20 +2936,20 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
         break;
 
     case INDEX_op_muluh_i32:
-        tcg_out32(s, MULHWU | TAB(args[0], args[1], args[2]));
+        tcg_out32(s, MULHWU | TAB(args[0], a1, a2));
         break;
     case INDEX_op_mulsh_i32:
-        tcg_out32(s, MULHW | TAB(args[0], args[1], args[2]));
+        tcg_out32(s, MULHW | TAB(args[0], a1, a2));
         break;
     case INDEX_op_muluh_i64:
-        tcg_out32(s, MULHDU | TAB(args[0], args[1], args[2]));
+        tcg_out32(s, MULHDU | TAB(args[0], a1, a2));
         break;
     case INDEX_op_mulsh_i64:
-        tcg_out32(s, MULHD | TAB(args[0], args[1], args[2]));
+        tcg_out32(s, MULHD | TAB(args[0], a1, a2));
         break;
 
     case INDEX_op_mb:
-        tcg_out_mb(s, args[0]);
+        tcg_out_mb(s, a0);
         break;
 
     case INDEX_op_mov_i32:   /* Always emitted via tcg_out_mov.  */
-- 
2.26.2


