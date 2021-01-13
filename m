Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kzjtS-0008LV-Oe
	for mharc-qemu-riscv@gnu.org; Wed, 13 Jan 2021 12:25:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kzjtP-0008GR-R1; Wed, 13 Jan 2021 12:25:11 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:40517)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kzjtN-0005zA-HZ; Wed, 13 Jan 2021 12:25:11 -0500
Received: by mail-wr1-x42c.google.com with SMTP id 91so2969599wrj.7;
 Wed, 13 Jan 2021 09:25:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=opIsNYo5TStaMNiMtcqdcufjts3VGM32woib2HwK48c=;
 b=KiDmARLk4//D17rAw/u8KTlZ3Wg5lmouH51QZiga5FBp/S4FUvGwP6Abgth6ml/2/n
 aF2t/JNm62Wj9AdsxcX3fyYwJzY0IzjDlZLdPi1S+vNaTpfyP/HEQm5Zzb6Y/d8w3vnG
 4n71Gyc3UZ8q6arYj6I8eEN4Z6UaCgfs1APkJnZlSbETxgLQuqB/s2jzcC9MnXBwIJ8c
 Cm89Ad5v0VdK+RPPXnzOo32sPTO/zKa3GMJxfhWRB+JGpT9egztRVyu1C2fMXeq3VTwL
 J5CSQxL+9p7pPPNVpM5Xp4ytTweKvFjOdLPNlcIbX/tmGbuzda9BRXxsi9Z6PUP57jS4
 1SZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=opIsNYo5TStaMNiMtcqdcufjts3VGM32woib2HwK48c=;
 b=P1Dl1FZ1bkeNaYGWaVCseJPAX7s+9ClzK2tjqCDUGfwwJMtP9HTPKChMYAE3l59s53
 QNXosCARHlH50cNz2MCFfUL+uFg8jJff6TORQwAhYr8koFZaVQFSMhVcF9ouK0morjWQ
 P3oTWgzXwtU7/WTohgM+yzuSM7EVR9Gi7553hX9ABSkkA6wPuTzcTDvAG9zrJfVwXZne
 X7sLKIVfYSelnXppnwvgphiwa475Om39NKlEFq5uEhvtdZCsLA0EBYvLT2zYY0kEvv0o
 JPvTMKDwZ6TS6SK/DGw/R1KTphHLbjgEekv075CsHzQs5L4/9R7QwUdS+D9SUFKB72jB
 OZHQ==
X-Gm-Message-State: AOAM530ijM+cfPlPwMRVKO73RrCZwSzyV+B2lfHTJbdWSbk09oeIKfXb
 4F6VCBiyjuDJMlTb2aU3v27Nrkt/vys=
X-Google-Smtp-Source: ABdhPJxP++c3isUFMk5BQZzHDaio9aheYmk2z3yoivQtA4757JAhclJ/8cS45E3sgovAJbvUjiSLnw==
X-Received: by 2002:adf:a388:: with SMTP id l8mr3675689wrb.354.1610558706818; 
 Wed, 13 Jan 2021 09:25:06 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id t16sm4002751wmi.3.2021.01.13.09.25.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 09:25:06 -0800 (PST)
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
Subject: [PATCH v2 1/6] tcg/arm: Hoist common argument loads in tcg_out_op()
Date: Wed, 13 Jan 2021 18:24:54 +0100
Message-Id: <20210113172459.2481060-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210113172459.2481060-1-f4bug@amsat.org>
References: <20210113172459.2481060-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
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
X-List-Received-Date: Wed, 13 Jan 2021 17:25:12 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tcg/arm/tcg-target.c.inc | 192 +++++++++++++++++++--------------------
 1 file changed, 92 insertions(+), 100 deletions(-)

diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index 0fd11264544..59bd196994f 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -1747,15 +1747,23 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is64)
 
 static void tcg_out_epilogue(TCGContext *s);
 
-static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
-                const TCGArg *args, const int *const_args)
+static void tcg_out_op(TCGContext *s, TCGOpcode opc,
+                       const TCGArg args[TCG_MAX_OP_ARGS],
+                       const int const_args[TCG_MAX_OP_ARGS])
 {
     TCGArg a0, a1, a2, a3, a4, a5;
-    int c;
+    int c, c2;
+
+    /* Hoist the loads of the most common arguments.  */
+    a0 = args[0];
+    a1 = args[1];
+    a2 = args[2];
+    a3 = args[3];
+    c2 = const_args[2];
 
     switch (opc) {
     case INDEX_op_exit_tb:
-        tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_R0, args[0]);
+        tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_R0, a0);
         tcg_out_epilogue(s);
         break;
     case INDEX_op_goto_tb:
@@ -1765,7 +1773,7 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
             TCGReg base = TCG_REG_PC;
 
             tcg_debug_assert(s->tb_jmp_insn_offset == 0);
-            ptr = (intptr_t)tcg_splitwx_to_rx(s->tb_jmp_target_addr + args[0]);
+            ptr = (intptr_t)tcg_splitwx_to_rx(s->tb_jmp_target_addr + a0);
             dif = tcg_pcrel_diff(s, (void *)ptr) - 8;
             dil = sextract32(dif, 0, 12);
             if (dif != dil) {
@@ -1778,74 +1786,68 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
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
         /* Constraints mean that v2 is always in the same register as dest,
          * so we only need to do "if condition passed, move v1 to dest".
          */
-        tcg_out_dat_rIN(s, COND_AL, ARITH_CMP, ARITH_CMN, 0,
-                        args[1], args[2], const_args[2]);
+        tcg_out_dat_rIN(s, COND_AL, ARITH_CMP, ARITH_CMN, 0, a1, a2, c2);
         tcg_out_dat_rIK(s, tcg_cond_to_arm_cond[args[5]], ARITH_MOV,
-                        ARITH_MVN, args[0], 0, args[3], const_args[3]);
+                        ARITH_MVN, a0, 0, a3, const_args[3]);
         break;
     case INDEX_op_add_i32:
-        tcg_out_dat_rIN(s, COND_AL, ARITH_ADD, ARITH_SUB,
-                        args[0], args[1], args[2], const_args[2]);
+        tcg_out_dat_rIN(s, COND_AL, ARITH_ADD, ARITH_SUB, a0, a1, a2, c2);
         break;
     case INDEX_op_sub_i32:
         if (const_args[1]) {
-            if (const_args[2]) {
-                tcg_out_movi32(s, COND_AL, args[0], args[1] - args[2]);
+            if (c2) {
+                tcg_out_movi32(s, COND_AL, a0, a1 - a2);
             } else {
-                tcg_out_dat_rI(s, COND_AL, ARITH_RSB,
-                               args[0], args[2], args[1], 1);
+                tcg_out_dat_rI(s, COND_AL, ARITH_RSB, a0, a2, a1, 1);
             }
         } else {
-            tcg_out_dat_rIN(s, COND_AL, ARITH_SUB, ARITH_ADD,
-                            args[0], args[1], args[2], const_args[2]);
+            tcg_out_dat_rIN(s, COND_AL, ARITH_SUB, ARITH_ADD, a0, a1, a2, c2);
         }
         break;
     case INDEX_op_and_i32:
-        tcg_out_dat_rIK(s, COND_AL, ARITH_AND, ARITH_BIC,
-                        args[0], args[1], args[2], const_args[2]);
+        tcg_out_dat_rIK(s, COND_AL, ARITH_AND, ARITH_BIC, a0, a1, a2, c2);
         break;
     case INDEX_op_andc_i32:
-        tcg_out_dat_rIK(s, COND_AL, ARITH_BIC, ARITH_AND,
-                        args[0], args[1], args[2], const_args[2]);
+        tcg_out_dat_rIK(s, COND_AL, ARITH_BIC, ARITH_AND, a0, a1, a2, c2);
         break;
     case INDEX_op_or_i32:
         c = ARITH_ORR;
@@ -1854,11 +1856,10 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         c = ARITH_EOR;
         /* Fall through.  */
     gen_arith:
-        tcg_out_dat_rI(s, COND_AL, c, args[0], args[1], args[2], const_args[2]);
+        tcg_out_dat_rI(s, COND_AL, c, a0, a1, a2, c2);
         break;
     case INDEX_op_add2_i32:
-        a0 = args[0], a1 = args[1], a2 = args[2];
-        a3 = args[3], a4 = args[4], a5 = args[5];
+        a4 = args[4], a5 = args[5];
         if (a0 == a3 || (a0 == a5 && !const_args[5])) {
             a0 = TCG_REG_TMP;
         }
@@ -1866,15 +1867,14 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
                         a0, a2, a4, const_args[4]);
         tcg_out_dat_rIK(s, COND_AL, ARITH_ADC, ARITH_SBC,
                         a1, a3, a5, const_args[5]);
-        tcg_out_mov_reg(s, COND_AL, args[0], a0);
+        tcg_out_mov_reg(s, COND_AL, a0, a0);
         break;
     case INDEX_op_sub2_i32:
-        a0 = args[0], a1 = args[1], a2 = args[2];
-        a3 = args[3], a4 = args[4], a5 = args[5];
+        a4 = args[4], a5 = args[5];
         if ((a0 == a3 && !const_args[3]) || (a0 == a5 && !const_args[5])) {
             a0 = TCG_REG_TMP;
         }
-        if (const_args[2]) {
+        if (c2) {
             if (const_args[4]) {
                 tcg_out_movi32(s, COND_AL, a0, a4);
                 a4 = a0;
@@ -1884,7 +1884,7 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
             tcg_out_dat_rIN(s, COND_AL, ARITH_SUB | TO_CPSR,
                             ARITH_ADD | TO_CPSR, a0, a2, a4, const_args[4]);
         }
-        if (const_args[3]) {
+        if (const_a3) {
             if (const_args[5]) {
                 tcg_out_movi32(s, COND_AL, a1, a5);
                 a5 = a1;
@@ -1894,69 +1894,64 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
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
-        c = const_args[2] ?
-                SHIFT_IMM_LSL(args[2] & 0x1f) : SHIFT_REG_LSL(args[2]);
+        c = c2 ? SHIFT_IMM_LSL(a2 & 0x1f) : SHIFT_REG_LSL(a2);
         goto gen_shift32;
     case INDEX_op_shr_i32:
-        c = const_args[2] ? (args[2] & 0x1f) ? SHIFT_IMM_LSR(args[2] & 0x1f) :
-                SHIFT_IMM_LSL(0) : SHIFT_REG_LSR(args[2]);
+        c = c2 ? (a2 & 0x1f) ? SHIFT_IMM_LSR(a2 & 0x1f) :
+                SHIFT_IMM_LSL(0) : SHIFT_REG_LSR(a2);
         goto gen_shift32;
     case INDEX_op_sar_i32:
-        c = const_args[2] ? (args[2] & 0x1f) ? SHIFT_IMM_ASR(args[2] & 0x1f) :
-                SHIFT_IMM_LSL(0) : SHIFT_REG_ASR(args[2]);
+        c = c2 ? (a2 & 0x1f) ? SHIFT_IMM_ASR(a2 & 0x1f) :
+                SHIFT_IMM_LSL(0) : SHIFT_REG_ASR(a2);
         goto gen_shift32;
     case INDEX_op_rotr_i32:
-        c = const_args[2] ? (args[2] & 0x1f) ? SHIFT_IMM_ROR(args[2] & 0x1f) :
-                SHIFT_IMM_LSL(0) : SHIFT_REG_ROR(args[2]);
+        c = c2 ? (a2 & 0x1f) ? SHIFT_IMM_ROR(a2 & 0x1f) :
+                SHIFT_IMM_LSL(0) : SHIFT_REG_ROR(a2);
         /* Fall through.  */
     gen_shift32:
-        tcg_out_dat_reg(s, COND_AL, ARITH_MOV, args[0], 0, args[1], c);
+        tcg_out_dat_reg(s, COND_AL, ARITH_MOV, a0, 0, a1, c);
         break;
 
     case INDEX_op_rotl_i32:
-        if (const_args[2]) {
-            tcg_out_dat_reg(s, COND_AL, ARITH_MOV, args[0], 0, args[1],
-                            ((0x20 - args[2]) & 0x1f) ?
-                            SHIFT_IMM_ROR((0x20 - args[2]) & 0x1f) :
+        if (c2) {
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
-        c = const_args[2];
+        c = c2;
         if (c && a2 == 32) {
             tcg_out_dat_reg(s, COND_AL, INSN_CLZ, a0, 0, a1, 0);
             break;
@@ -1970,17 +1965,15 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
 
     case INDEX_op_brcond_i32:
         tcg_out_dat_rIN(s, COND_AL, ARITH_CMP, ARITH_CMN, 0,
-                       args[0], args[1], const_args[1]);
-        tcg_out_goto_label(s, tcg_cond_to_arm_cond[args[2]],
-                           arg_label(args[3]));
+                       a0, a1, const_args[1]);
+        tcg_out_goto_label(s, tcg_cond_to_arm_cond[a2], arg_label(a3));
         break;
     case INDEX_op_setcond_i32:
-        tcg_out_dat_rIN(s, COND_AL, ARITH_CMP, ARITH_CMN, 0,
-                        args[1], args[2], const_args[2]);
-        tcg_out_dat_imm(s, tcg_cond_to_arm_cond[args[3]],
-                        ARITH_MOV, args[0], 0, 1);
-        tcg_out_dat_imm(s, tcg_cond_to_arm_cond[tcg_invert_cond(args[3])],
-                        ARITH_MOV, args[0], 0, 0);
+        tcg_out_dat_rIN(s, COND_AL, ARITH_CMP, ARITH_CMN, 0, a1, a2, c2);
+        tcg_out_dat_imm(s, tcg_cond_to_arm_cond[a3],
+                        ARITH_MOV, a0, 0, 1);
+        tcg_out_dat_imm(s, tcg_cond_to_arm_cond[tcg_invert_cond(a3)],
+                        ARITH_MOV, a0, 0, 0);
         break;
 
     case INDEX_op_brcond2_i32:
@@ -1989,9 +1982,9 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
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
@@ -2008,63 +2001,62 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
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
+        tcg_out_deposit(s, COND_AL, a0, a2, a3, args[4], c2);
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
-            if (const_args[2]) {
-                tcg_out_movi(s, TCG_TYPE_REG, args[0], 0);
+            if (c2) {
+                tcg_out_movi(s, TCG_TYPE_REG, a0, 0);
             } else {
-                tcg_out_dat_reg(s, COND_AL, ARITH_MOV, args[0], 0,
-                                args[2], SHIFT_IMM_LSL(32 - args[3]));
+                tcg_out_dat_reg(s, COND_AL, ARITH_MOV, a0, 0,
+                                a2, SHIFT_IMM_LSL(32 - a3));
             }
-        } else if (const_args[2]) {
-            tcg_out_dat_reg(s, COND_AL, ARITH_MOV, args[0], 0,
-                            args[1], SHIFT_IMM_LSR(args[3]));
+        } else if (c2) {
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


