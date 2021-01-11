Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kyyhW-0001I5-1y
	for mharc-qemu-riscv@gnu.org; Mon, 11 Jan 2021 10:01:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kyyhG-0001Da-JP; Mon, 11 Jan 2021 10:01:37 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:35853)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kyyhC-0001RU-Vx; Mon, 11 Jan 2021 10:01:29 -0500
Received: by mail-ed1-x531.google.com with SMTP id b2so47014edm.3;
 Mon, 11 Jan 2021 07:01:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7h+ZogQhx4K7jgIahkOF5Dqk41tHkgsSVlTN0LVAfCk=;
 b=dP4/4q4XQWeA6wBuzQkSzM8QWT1yNWctBl4v3qpL9diGRWgKWVySO3+0AwWetA7z7q
 WJb5CWk97B+VcDrbdXBatONWkudewoH040b9og40B1GpKmJStkNLH0uuFVgQcL/qopT7
 dCgpJUbOnmUByhU+kvGzWAntK6PU1Ag2Zr4PTfEAzICRkxSfUmISopPo+xKvfm2BZH+K
 8eE+lZK2EXN3JETu5+5e0j30mWYwVrv+XkuWVZNDqgnMaaoPxFspsOJqtRZl3R4+rtTQ
 MMPhZMK9p+1+zHNmXY5VebVyTnixI2L5a452D3Q7cXXKZUJa6dQL4DWxR8rDwvwM8V4s
 NY3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=7h+ZogQhx4K7jgIahkOF5Dqk41tHkgsSVlTN0LVAfCk=;
 b=a9h458TGwuS51e622vSKLH4wyALMDS9ijbjk45/v+tnQ7//9Pe6fmQmb9VBn4ZTrOj
 I2Wbzo6rC1fqwpdEjs2GiAxNjvUfo1NS8ryG0ojXS3Y0IhEcEPIsZ7VsaxDie3pFotCy
 5YxDqi1ZXqzjVGwhTkez4v91+vP+QM54gQQzmYE7Y6aVz16bjmUvbQ+Maw7o/Pl56Qit
 E5WBzOmYHl2tZp4Vs4xezPA3qXWPcOMo6YJYHEJCZHVkQmwpiAdKqprvCzHpqH3KG55i
 ovjfsEIkcRsusGws3X4S77yDgjG744GjrNesRxWnIMwXuiQdSXX4Xw5BJBfpHjeQmsa7
 JVgw==
X-Gm-Message-State: AOAM530yGw41a/8+36g6QtDlzKfIDIAs6JyaiikdqN375rloG6NzMhCE
 tzOly2Im58xJc6yONIrkyBKTAv2Ajbs=
X-Google-Smtp-Source: ABdhPJw0uOiojo/r1bm05kVgFe0MoLXFzs4Tx0Yl8HbgBEyJFjgJ0jlUULuplszIh99BQk/9az2MjQ==
X-Received: by 2002:aa7:d485:: with SMTP id b5mr13875717edr.214.1610377284077; 
 Mon, 11 Jan 2021 07:01:24 -0800 (PST)
Received: from x1w.redhat.com (129.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.129])
 by smtp.gmail.com with ESMTPSA id cw7sm5317247ejc.13.2021.01.11.07.01.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 07:01:23 -0800 (PST)
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
Subject: [PATCH 1/5] tcg/arm: Hoist common argument loads in tcg_out_op()
Date: Mon, 11 Jan 2021 16:01:10 +0100
Message-Id: <20210111150114.1415930-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210111150114.1415930-1-f4bug@amsat.org>
References: <20210111150114.1415930-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x531.google.com
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
X-List-Received-Date: Mon, 11 Jan 2021 15:01:42 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tcg/arm/tcg-target.c.inc | 173 +++++++++++++++++++--------------------
 1 file changed, 86 insertions(+), 87 deletions(-)

diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index 0fd11264544..94cc12a0fc6 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -1747,15 +1747,24 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is64)
 
 static void tcg_out_epilogue(TCGContext *s);
 
-static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
-                const TCGArg *args, const int *const_args)
+static void tcg_out_op(TCGContext *s, TCGOpcode opc,
+                       const TCGArg args[TCG_MAX_OP_ARGS],
+                       const int const_args[TCG_MAX_OP_ARGS])
 {
     TCGArg a0, a1, a2, a3, a4, a5;
     int c;
 
+    /* Hoist the loads of the most common arguments.  */
+    a0 = args[0];
+    a1 = args[1];
+    a2 = args[2];
+    a3 = args[3];
+    a4 = args[4];
+    a5 = args[5];
+
     switch (opc) {
     case INDEX_op_exit_tb:
-        tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_R0, args[0]);
+        tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_R0, a0);
         tcg_out_epilogue(s);
         break;
     case INDEX_op_goto_tb:
@@ -1765,7 +1774,7 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
             TCGReg base = TCG_REG_PC;
 
             tcg_debug_assert(s->tb_jmp_insn_offset == 0);
-            ptr = (intptr_t)tcg_splitwx_to_rx(s->tb_jmp_target_addr + args[0]);
+            ptr = (intptr_t)tcg_splitwx_to_rx(s->tb_jmp_target_addr + a0);
             dif = tcg_pcrel_diff(s, (void *)ptr) - 8;
             dil = sextract32(dif, 0, 12);
             if (dif != dil) {
@@ -1778,39 +1787,39 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
                 tcg_out_movi32(s, COND_AL, base, ptr - dil);
             }
             tcg_out_ld32_12(s, COND_AL, TCG_REG_PC, base, dil);
-            set_jmp_reset_offset(s, args[0]);
+            set_jmp_reset_offset(s, a0);
         }
         break;
     case INDEX_op_goto_ptr:
-        tcg_out_bx(s, COND_AL, args[0]);
+        tcg_out_bx(s, COND_AL, a0);
         break;
     case INDEX_op_br:
-        tcg_out_goto_label(s, COND_AL, arg_label(args[0]));
+        tcg_out_goto_label(s, COND_AL, arg_label(a0));
         break;
 
     case INDEX_op_ld8u_i32:
-        tcg_out_ld8u(s, COND_AL, args[0], args[1], args[2]);
+        tcg_out_ld8u(s, COND_AL, a0, a1, a2);
         break;
     case INDEX_op_ld8s_i32:
-        tcg_out_ld8s(s, COND_AL, args[0], args[1], args[2]);
+        tcg_out_ld8s(s, COND_AL, a0, a1, a2);
         break;
     case INDEX_op_ld16u_i32:
-        tcg_out_ld16u(s, COND_AL, args[0], args[1], args[2]);
+        tcg_out_ld16u(s, COND_AL, a0, a1, a2);
         break;
     case INDEX_op_ld16s_i32:
-        tcg_out_ld16s(s, COND_AL, args[0], args[1], args[2]);
+        tcg_out_ld16s(s, COND_AL, a0, a1, a2);
         break;
     case INDEX_op_ld_i32:
-        tcg_out_ld32u(s, COND_AL, args[0], args[1], args[2]);
+        tcg_out_ld32u(s, COND_AL, a0, a1, a2);
         break;
     case INDEX_op_st8_i32:
-        tcg_out_st8(s, COND_AL, args[0], args[1], args[2]);
+        tcg_out_st8(s, COND_AL, a0, a1, a2);
         break;
     case INDEX_op_st16_i32:
-        tcg_out_st16(s, COND_AL, args[0], args[1], args[2]);
+        tcg_out_st16(s, COND_AL, a0, a1, a2);
         break;
     case INDEX_op_st_i32:
-        tcg_out_st32(s, COND_AL, args[0], args[1], args[2]);
+        tcg_out_st32(s, COND_AL, a0, a1, a2);
         break;
 
     case INDEX_op_movcond_i32:
@@ -1818,34 +1827,33 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
          * so we only need to do "if condition passed, move v1 to dest".
          */
         tcg_out_dat_rIN(s, COND_AL, ARITH_CMP, ARITH_CMN, 0,
-                        args[1], args[2], const_args[2]);
-        tcg_out_dat_rIK(s, tcg_cond_to_arm_cond[args[5]], ARITH_MOV,
-                        ARITH_MVN, args[0], 0, args[3], const_args[3]);
+                        a1, a2, const_args[2]);
+        tcg_out_dat_rIK(s, tcg_cond_to_arm_cond[a5], ARITH_MOV,
+                        ARITH_MVN, a0, 0, a3, const_args[3]);
         break;
     case INDEX_op_add_i32:
         tcg_out_dat_rIN(s, COND_AL, ARITH_ADD, ARITH_SUB,
-                        args[0], args[1], args[2], const_args[2]);
+                        a0, a1, a2, const_args[2]);
         break;
     case INDEX_op_sub_i32:
         if (const_args[1]) {
             if (const_args[2]) {
-                tcg_out_movi32(s, COND_AL, args[0], args[1] - args[2]);
+                tcg_out_movi32(s, COND_AL, a0, a1 - a2);
             } else {
-                tcg_out_dat_rI(s, COND_AL, ARITH_RSB,
-                               args[0], args[2], args[1], 1);
+                tcg_out_dat_rI(s, COND_AL, ARITH_RSB, a0, a2, a1, 1);
             }
         } else {
             tcg_out_dat_rIN(s, COND_AL, ARITH_SUB, ARITH_ADD,
-                            args[0], args[1], args[2], const_args[2]);
+                            a0, a1, a2, const_args[2]);
         }
         break;
     case INDEX_op_and_i32:
         tcg_out_dat_rIK(s, COND_AL, ARITH_AND, ARITH_BIC,
-                        args[0], args[1], args[2], const_args[2]);
+                        a0, a1, a2, const_args[2]);
         break;
     case INDEX_op_andc_i32:
         tcg_out_dat_rIK(s, COND_AL, ARITH_BIC, ARITH_AND,
-                        args[0], args[1], args[2], const_args[2]);
+                        a0, a1, a2, const_args[2]);
         break;
     case INDEX_op_or_i32:
         c = ARITH_ORR;
@@ -1854,11 +1862,9 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         c = ARITH_EOR;
         /* Fall through.  */
     gen_arith:
-        tcg_out_dat_rI(s, COND_AL, c, args[0], args[1], args[2], const_args[2]);
+        tcg_out_dat_rI(s, COND_AL, c, a0, a1, a2, const_args[2]);
         break;
     case INDEX_op_add2_i32:
-        a0 = args[0], a1 = args[1], a2 = args[2];
-        a3 = args[3], a4 = args[4], a5 = args[5];
         if (a0 == a3 || (a0 == a5 && !const_args[5])) {
             a0 = TCG_REG_TMP;
         }
@@ -1866,11 +1872,9 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
                         a0, a2, a4, const_args[4]);
         tcg_out_dat_rIK(s, COND_AL, ARITH_ADC, ARITH_SBC,
                         a1, a3, a5, const_args[5]);
-        tcg_out_mov_reg(s, COND_AL, args[0], a0);
+        tcg_out_mov_reg(s, COND_AL, a0, a0);
         break;
     case INDEX_op_sub2_i32:
-        a0 = args[0], a1 = args[1], a2 = args[2];
-        a3 = args[3], a4 = args[4], a5 = args[5];
         if ((a0 == a3 && !const_args[3]) || (a0 == a5 && !const_args[5])) {
             a0 = TCG_REG_TMP;
         }
@@ -1894,68 +1898,64 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
             tcg_out_dat_rIK(s, COND_AL, ARITH_SBC, ARITH_ADC,
                             a1, a3, a5, const_args[5]);
         }
-        tcg_out_mov_reg(s, COND_AL, args[0], a0);
+        tcg_out_mov_reg(s, COND_AL, a0, a0);
         break;
     case INDEX_op_neg_i32:
-        tcg_out_dat_imm(s, COND_AL, ARITH_RSB, args[0], args[1], 0);
+        tcg_out_dat_imm(s, COND_AL, ARITH_RSB, a0, a1, 0);
         break;
     case INDEX_op_not_i32:
-        tcg_out_dat_reg(s, COND_AL,
-                        ARITH_MVN, args[0], 0, args[1], SHIFT_IMM_LSL(0));
+        tcg_out_dat_reg(s, COND_AL, ARITH_MVN, a0, 0, a1, SHIFT_IMM_LSL(0));
         break;
     case INDEX_op_mul_i32:
-        tcg_out_mul32(s, COND_AL, args[0], args[1], args[2]);
+        tcg_out_mul32(s, COND_AL, a0, a1, a2);
         break;
     case INDEX_op_mulu2_i32:
-        tcg_out_umull32(s, COND_AL, args[0], args[1], args[2], args[3]);
+        tcg_out_umull32(s, COND_AL, a0, a1, a2, a3);
         break;
     case INDEX_op_muls2_i32:
-        tcg_out_smull32(s, COND_AL, args[0], args[1], args[2], args[3]);
+        tcg_out_smull32(s, COND_AL, a0, a1, a2, a3);
         break;
-    /* XXX: Perhaps args[2] & 0x1f is wrong */
+    /* XXX: Perhaps a2 & 0x1f is wrong */
     case INDEX_op_shl_i32:
         c = const_args[2] ?
-                SHIFT_IMM_LSL(args[2] & 0x1f) : SHIFT_REG_LSL(args[2]);
+                SHIFT_IMM_LSL(a2 & 0x1f) : SHIFT_REG_LSL(a2);
         goto gen_shift32;
     case INDEX_op_shr_i32:
-        c = const_args[2] ? (args[2] & 0x1f) ? SHIFT_IMM_LSR(args[2] & 0x1f) :
-                SHIFT_IMM_LSL(0) : SHIFT_REG_LSR(args[2]);
+        c = const_args[2] ? (a2 & 0x1f) ? SHIFT_IMM_LSR(a2 & 0x1f) :
+                SHIFT_IMM_LSL(0) : SHIFT_REG_LSR(a2);
         goto gen_shift32;
     case INDEX_op_sar_i32:
-        c = const_args[2] ? (args[2] & 0x1f) ? SHIFT_IMM_ASR(args[2] & 0x1f) :
-                SHIFT_IMM_LSL(0) : SHIFT_REG_ASR(args[2]);
+        c = const_args[2] ? (a2 & 0x1f) ? SHIFT_IMM_ASR(a2 & 0x1f) :
+                SHIFT_IMM_LSL(0) : SHIFT_REG_ASR(a2);
         goto gen_shift32;
     case INDEX_op_rotr_i32:
-        c = const_args[2] ? (args[2] & 0x1f) ? SHIFT_IMM_ROR(args[2] & 0x1f) :
-                SHIFT_IMM_LSL(0) : SHIFT_REG_ROR(args[2]);
+        c = const_args[2] ? (a2 & 0x1f) ? SHIFT_IMM_ROR(a2 & 0x1f) :
+                SHIFT_IMM_LSL(0) : SHIFT_REG_ROR(a2);
         /* Fall through.  */
     gen_shift32:
-        tcg_out_dat_reg(s, COND_AL, ARITH_MOV, args[0], 0, args[1], c);
+        tcg_out_dat_reg(s, COND_AL, ARITH_MOV, a0, 0, a1, c);
         break;
 
     case INDEX_op_rotl_i32:
         if (const_args[2]) {
-            tcg_out_dat_reg(s, COND_AL, ARITH_MOV, args[0], 0, args[1],
-                            ((0x20 - args[2]) & 0x1f) ?
-                            SHIFT_IMM_ROR((0x20 - args[2]) & 0x1f) :
+            tcg_out_dat_reg(s, COND_AL, ARITH_MOV, a0, 0, a1,
+                            ((0x20 - a2) & 0x1f) ?
+                            SHIFT_IMM_ROR((0x20 - a2) & 0x1f) :
                             SHIFT_IMM_LSL(0));
         } else {
-            tcg_out_dat_imm(s, COND_AL, ARITH_RSB, TCG_REG_TMP, args[2], 0x20);
-            tcg_out_dat_reg(s, COND_AL, ARITH_MOV, args[0], 0, args[1],
+            tcg_out_dat_imm(s, COND_AL, ARITH_RSB, TCG_REG_TMP, a2, 0x20);
+            tcg_out_dat_reg(s, COND_AL, ARITH_MOV, a0, 0, a1,
                             SHIFT_REG_ROR(TCG_REG_TMP));
         }
         break;
 
     case INDEX_op_ctz_i32:
-        tcg_out_dat_reg(s, COND_AL, INSN_RBIT, TCG_REG_TMP, 0, args[1], 0);
+        tcg_out_dat_reg(s, COND_AL, INSN_RBIT, TCG_REG_TMP, 0, a1, 0);
         a1 = TCG_REG_TMP;
         goto do_clz;
 
     case INDEX_op_clz_i32:
-        a1 = args[1];
     do_clz:
-        a0 = args[0];
-        a2 = args[2];
         c = const_args[2];
         if (c && a2 == 32) {
             tcg_out_dat_reg(s, COND_AL, INSN_CLZ, a0, 0, a1, 0);
@@ -1970,28 +1970,28 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
 
     case INDEX_op_brcond_i32:
         tcg_out_dat_rIN(s, COND_AL, ARITH_CMP, ARITH_CMN, 0,
-                       args[0], args[1], const_args[1]);
-        tcg_out_goto_label(s, tcg_cond_to_arm_cond[args[2]],
-                           arg_label(args[3]));
+                        a0, a1, const_args[1]);
+        tcg_out_goto_label(s, tcg_cond_to_arm_cond[a2],
+                           arg_label(a3));
         break;
     case INDEX_op_setcond_i32:
         tcg_out_dat_rIN(s, COND_AL, ARITH_CMP, ARITH_CMN, 0,
-                        args[1], args[2], const_args[2]);
-        tcg_out_dat_imm(s, tcg_cond_to_arm_cond[args[3]],
-                        ARITH_MOV, args[0], 0, 1);
-        tcg_out_dat_imm(s, tcg_cond_to_arm_cond[tcg_invert_cond(args[3])],
-                        ARITH_MOV, args[0], 0, 0);
+                        a1, a2, const_args[2]);
+        tcg_out_dat_imm(s, tcg_cond_to_arm_cond[a3],
+                        ARITH_MOV, a0, 0, 1);
+        tcg_out_dat_imm(s, tcg_cond_to_arm_cond[tcg_invert_cond(a3)],
+                        ARITH_MOV, a0, 0, 0);
         break;
 
     case INDEX_op_brcond2_i32:
         c = tcg_out_cmp2(s, args, const_args);
-        tcg_out_goto_label(s, tcg_cond_to_arm_cond[c], arg_label(args[5]));
+        tcg_out_goto_label(s, tcg_cond_to_arm_cond[c], arg_label(a5));
         break;
     case INDEX_op_setcond2_i32:
         c = tcg_out_cmp2(s, args + 1, const_args + 1);
-        tcg_out_dat_imm(s, tcg_cond_to_arm_cond[c], ARITH_MOV, args[0], 0, 1);
+        tcg_out_dat_imm(s, tcg_cond_to_arm_cond[c], ARITH_MOV, a0, 0, 1);
         tcg_out_dat_imm(s, tcg_cond_to_arm_cond[tcg_invert_cond(c)],
-                        ARITH_MOV, args[0], 0, 0);
+                        ARITH_MOV, a0, 0, 0);
         break;
 
     case INDEX_op_qemu_ld_i32:
@@ -2008,63 +2008,62 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         break;
 
     case INDEX_op_bswap16_i32:
-        tcg_out_bswap16(s, COND_AL, args[0], args[1]);
+        tcg_out_bswap16(s, COND_AL, a0, a1);
         break;
     case INDEX_op_bswap32_i32:
-        tcg_out_bswap32(s, COND_AL, args[0], args[1]);
+        tcg_out_bswap32(s, COND_AL, a0, a1);
         break;
 
     case INDEX_op_ext8s_i32:
-        tcg_out_ext8s(s, COND_AL, args[0], args[1]);
+        tcg_out_ext8s(s, COND_AL, a0, a1);
         break;
     case INDEX_op_ext16s_i32:
-        tcg_out_ext16s(s, COND_AL, args[0], args[1]);
+        tcg_out_ext16s(s, COND_AL, a0, a1);
         break;
     case INDEX_op_ext16u_i32:
-        tcg_out_ext16u(s, COND_AL, args[0], args[1]);
+        tcg_out_ext16u(s, COND_AL, a0, a1);
         break;
 
     case INDEX_op_deposit_i32:
-        tcg_out_deposit(s, COND_AL, args[0], args[2],
-                        args[3], args[4], const_args[2]);
+        tcg_out_deposit(s, COND_AL, a0, a2, a3, a4, const_args[2]);
         break;
     case INDEX_op_extract_i32:
-        tcg_out_extract(s, COND_AL, args[0], args[1], args[2], args[3]);
+        tcg_out_extract(s, COND_AL, a0, a1, a2, a3);
         break;
     case INDEX_op_sextract_i32:
-        tcg_out_sextract(s, COND_AL, args[0], args[1], args[2], args[3]);
+        tcg_out_sextract(s, COND_AL, a0, a1, a2, a3);
         break;
     case INDEX_op_extract2_i32:
         /* ??? These optimization vs zero should be generic.  */
         /* ??? But we can't substitute 2 for 1 in the opcode stream yet.  */
         if (const_args[1]) {
             if (const_args[2]) {
-                tcg_out_movi(s, TCG_TYPE_REG, args[0], 0);
+                tcg_out_movi(s, TCG_TYPE_REG, a0, 0);
             } else {
-                tcg_out_dat_reg(s, COND_AL, ARITH_MOV, args[0], 0,
-                                args[2], SHIFT_IMM_LSL(32 - args[3]));
+                tcg_out_dat_reg(s, COND_AL, ARITH_MOV, a0, 0,
+                                a2, SHIFT_IMM_LSL(32 - a3));
             }
         } else if (const_args[2]) {
-            tcg_out_dat_reg(s, COND_AL, ARITH_MOV, args[0], 0,
-                            args[1], SHIFT_IMM_LSR(args[3]));
+            tcg_out_dat_reg(s, COND_AL, ARITH_MOV, a0, 0,
+                            a1, SHIFT_IMM_LSR(a3));
         } else {
             /* We can do extract2 in 2 insns, vs the 3 required otherwise.  */
             tcg_out_dat_reg(s, COND_AL, ARITH_MOV, TCG_REG_TMP, 0,
-                            args[2], SHIFT_IMM_LSL(32 - args[3]));
-            tcg_out_dat_reg(s, COND_AL, ARITH_ORR, args[0], TCG_REG_TMP,
-                            args[1], SHIFT_IMM_LSR(args[3]));
+                            a2, SHIFT_IMM_LSL(32 - a3));
+            tcg_out_dat_reg(s, COND_AL, ARITH_ORR, a0, TCG_REG_TMP,
+                            a1, SHIFT_IMM_LSR(a3));
         }
         break;
 
     case INDEX_op_div_i32:
-        tcg_out_sdiv(s, COND_AL, args[0], args[1], args[2]);
+        tcg_out_sdiv(s, COND_AL, a0, a1, a2);
         break;
     case INDEX_op_divu_i32:
-        tcg_out_udiv(s, COND_AL, args[0], args[1], args[2]);
+        tcg_out_udiv(s, COND_AL, a0, a1, a2);
         break;
 
     case INDEX_op_mb:
-        tcg_out_mb(s, args[0]);
+        tcg_out_mb(s, a0);
         break;
 
     case INDEX_op_mov_i32:  /* Always emitted via tcg_out_mov.  */
-- 
2.26.2


