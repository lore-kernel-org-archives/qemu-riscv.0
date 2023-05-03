Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pu6R1-0007he-FX
	for mharc-qemu-riscv@gnu.org; Wed, 03 May 2023 02:57:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6Qz-0007fE-Pv
 for qemu-riscv@nongnu.org; Wed, 03 May 2023 02:57:53 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6Qm-0001j7-GK
 for qemu-riscv@nongnu.org; Wed, 03 May 2023 02:57:53 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-3f19a7f9424so46797785e9.2
 for <qemu-riscv@nongnu.org>; Tue, 02 May 2023 23:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683097058; x=1685689058;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/LNx4AQ8LEDs2bqV5zvn6xWFsTqqlF00MmHmvqgX6b8=;
 b=turhtRP4GC3DZ0F3TWyiWg63yw3JVNoZOD0GOc6ogfvUut1+v+eaa/sxtBfIfHYXbt
 APpenz/xdHMNN21aoSVT0ItwtOGVKMkYpO2QYInwyzUIXngIaE6ioDz3RdlVI9KsJn+M
 rSu1XnqlVeMrIlixmnNTk94z+PmmFxSTzTyJlb9K0DKW9Pe87mdIOpj2g8YbXw09AVel
 WyY00TJoxKmCnLT/gWFHMer5lz3yY+qFgrGizmhWYTiM0N0Az1ziM6mhMzP1eYX3AuMx
 qqKsjFDGuNdAr7Yyv94XIPvIPVqz+DMXaSQGDLvv5Iq44PZBABTMJvLYPKLcHH/xDOAU
 nI1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683097058; x=1685689058;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/LNx4AQ8LEDs2bqV5zvn6xWFsTqqlF00MmHmvqgX6b8=;
 b=h7wZmEuu/D2z6y9afg97LJ6VNuAkYFXOgHV67XElG3gGA2Cx2M4gD+r4CnsBe0Da6R
 CjgWZsAAzyQusOjyOcU2Tj3E6pKUvM/0esW8HQ3FkTCi7YMOisPImHQvSaDwu1GLofH1
 +O7lY5Bf2IBghPXATKD1bBeRoGSBAwMqTwQVO9QuTF2i0nIoID1rGA96V6BqB56HcskL
 XD8sbwca/8NcAJYSYnc8t2A0TIhg+EcEQ/cATmJ0tLaNJdcsU4fofbxw3D6WHeEtoTpi
 hzMTPyN66VhXbYTz2ZAEj+Ax3m3W9v5rF5nN1bHYDNx+rnWKLFfk57EUPlyue6zjKx4G
 XNVw==
X-Gm-Message-State: AC+VfDzREfUzzcwsnLQGGf2MPXeMBNAd2izVG6AfoG9d5PcqxcK1yQQa
 xsPNcxuq0UjjTHlrxdUe0KjC8E77zxNArNo2zlLAZA==
X-Google-Smtp-Source: ACHHUZ7xdpSB0K2zl6CURPbEAEToMKpWgh7zCvHXbCRxEaXM+lrZwAwwVL5dAatfy6K5uazMOUoGZw==
X-Received: by 2002:a1c:7211:0:b0:3f1:728a:1881 with SMTP id
 n17-20020a1c7211000000b003f1728a1881mr14191830wmc.31.1683097058542; 
 Tue, 02 May 2023 23:57:38 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 f6-20020a5d6646000000b002f6dafef040sm32796617wrw.12.2023.05.02.23.57.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 23:57:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, philmd@linaro.org, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v4 11/54] tcg/arm: Rationalize args to tcg_out_qemu_{ld,st}
Date: Wed,  3 May 2023 07:56:46 +0100
Message-Id: <20230503065729.1745843-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503065729.1745843-1-richard.henderson@linaro.org>
References: <20230503065729.1745843-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x335.google.com
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
X-List-Received-Date: Wed, 03 May 2023 06:57:54 -0000

Interpret the variable argument placement in the caller.
Pass data_type instead of is_64.  We need to set this in
TCGLabelQemuLdst, so plumb this all the way through from tcg_out_op.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/arm/tcg-target.c.inc | 113 +++++++++++++++++++--------------------
 1 file changed, 56 insertions(+), 57 deletions(-)

diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index 83c818a58b..6ce52b9612 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -1526,15 +1526,18 @@ static TCGReg tcg_out_tlb_read(TCGContext *s, TCGReg addrlo, TCGReg addrhi,
 /* Record the context of a call to the out of line helper code for the slow
    path for a load or store, so that we can later generate the correct
    helper code.  */
-static void add_qemu_ldst_label(TCGContext *s, bool is_ld, MemOpIdx oi,
-                                TCGReg datalo, TCGReg datahi, TCGReg addrlo,
-                                TCGReg addrhi, tcg_insn_unit *raddr,
+static void add_qemu_ldst_label(TCGContext *s, bool is_ld,
+                                MemOpIdx oi, TCGType type,
+                                TCGReg datalo, TCGReg datahi,
+                                TCGReg addrlo, TCGReg addrhi,
+                                tcg_insn_unit *raddr,
                                 tcg_insn_unit *label_ptr)
 {
     TCGLabelQemuLdst *label = new_ldst_label(s);
 
     label->is_ld = is_ld;
     label->oi = oi;
+    label->type = type;
     label->datalo_reg = datalo;
     label->datahi_reg = datahi;
     label->addrlo_reg = addrlo;
@@ -1796,41 +1799,28 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, MemOp opc, TCGReg datalo,
 }
 #endif
 
-static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is64)
+static void tcg_out_qemu_ld(TCGContext *s, TCGReg datalo, TCGReg datahi,
+                            TCGReg addrlo, TCGReg addrhi,
+                            MemOpIdx oi, TCGType data_type)
 {
-    TCGReg addrlo, datalo, datahi, addrhi __attribute__((unused));
-    MemOpIdx oi;
-    MemOp opc;
-#ifdef CONFIG_SOFTMMU
-    int mem_index;
-    TCGReg addend;
-    tcg_insn_unit *label_ptr;
-#else
-    unsigned a_bits;
-#endif
-
-    datalo = *args++;
-    datahi = (is64 ? *args++ : 0);
-    addrlo = *args++;
-    addrhi = (TARGET_LONG_BITS == 64 ? *args++ : 0);
-    oi = *args++;
-    opc = get_memop(oi);
+    MemOp opc = get_memop(oi);
 
 #ifdef CONFIG_SOFTMMU
-    mem_index = get_mmuidx(oi);
-    addend = tcg_out_tlb_read(s, addrlo, addrhi, opc, mem_index, 1);
+    TCGReg addend= tcg_out_tlb_read(s, addrlo, addrhi, opc, get_mmuidx(oi), 1);
 
-    /* This a conditional BL only to load a pointer within this opcode into LR
-       for the slow path.  We will not be using the value for a tail call.  */
-    label_ptr = s->code_ptr;
+    /*
+     * This a conditional BL only to load a pointer within this opcode into
+     * LR for the slow path.  We will not be using the value for a tail call.
+     */
+    tcg_insn_unit *label_ptr = s->code_ptr;
     tcg_out_bl_imm(s, COND_NE, 0);
 
     tcg_out_qemu_ld_index(s, opc, datalo, datahi, addrlo, addend, true);
 
-    add_qemu_ldst_label(s, true, oi, datalo, datahi, addrlo, addrhi,
-                        s->code_ptr, label_ptr);
+    add_qemu_ldst_label(s, true, oi, data_type, datalo, datahi,
+                        addrlo, addrhi, s->code_ptr, label_ptr);
 #else /* !CONFIG_SOFTMMU */
-    a_bits = get_alignment_bits(opc);
+    unsigned a_bits = get_alignment_bits(opc);
     if (a_bits) {
         tcg_out_test_alignment(s, true, addrlo, addrhi, a_bits);
     }
@@ -1918,41 +1908,26 @@ static void tcg_out_qemu_st_direct(TCGContext *s, MemOp opc, TCGReg datalo,
 }
 #endif
 
-static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is64)
+static void tcg_out_qemu_st(TCGContext *s, TCGReg datalo, TCGReg datahi,
+                            TCGReg addrlo, TCGReg addrhi,
+                            MemOpIdx oi, TCGType data_type)
 {
-    TCGReg addrlo, datalo, datahi, addrhi __attribute__((unused));
-    MemOpIdx oi;
-    MemOp opc;
-#ifdef CONFIG_SOFTMMU
-    int mem_index;
-    TCGReg addend;
-    tcg_insn_unit *label_ptr;
-#else
-    unsigned a_bits;
-#endif
-
-    datalo = *args++;
-    datahi = (is64 ? *args++ : 0);
-    addrlo = *args++;
-    addrhi = (TARGET_LONG_BITS == 64 ? *args++ : 0);
-    oi = *args++;
-    opc = get_memop(oi);
+    MemOp opc = get_memop(oi);
 
 #ifdef CONFIG_SOFTMMU
-    mem_index = get_mmuidx(oi);
-    addend = tcg_out_tlb_read(s, addrlo, addrhi, opc, mem_index, 0);
+    TCGReg addend = tcg_out_tlb_read(s, addrlo, addrhi, opc, get_mmuidx(oi), 0);
 
     tcg_out_qemu_st_index(s, COND_EQ, opc, datalo, datahi,
                           addrlo, addend, true);
 
     /* The conditional call must come last, as we're going to return here.  */
-    label_ptr = s->code_ptr;
+    tcg_insn_unit *label_ptr = s->code_ptr;
     tcg_out_bl_imm(s, COND_NE, 0);
 
-    add_qemu_ldst_label(s, false, oi, datalo, datahi, addrlo, addrhi,
-                        s->code_ptr, label_ptr);
+    add_qemu_ldst_label(s, false, oi, data_type, datalo, datahi,
+                        addrlo, addrhi, s->code_ptr, label_ptr);
 #else /* !CONFIG_SOFTMMU */
-    a_bits = get_alignment_bits(opc);
+    unsigned a_bits = get_alignment_bits(opc);
     if (a_bits) {
         tcg_out_test_alignment(s, false, addrlo, addrhi, a_bits);
     }
@@ -2245,16 +2220,40 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         break;
 
     case INDEX_op_qemu_ld_i32:
-        tcg_out_qemu_ld(s, args, 0);
+        if (TARGET_LONG_BITS == 32) {
+            tcg_out_qemu_ld(s, args[0], -1, args[1], -1,
+                            args[2], TCG_TYPE_I32);
+        } else {
+            tcg_out_qemu_ld(s, args[0], -1, args[1], args[2],
+                            args[3], TCG_TYPE_I32);
+        }
         break;
     case INDEX_op_qemu_ld_i64:
-        tcg_out_qemu_ld(s, args, 1);
+        if (TARGET_LONG_BITS == 32) {
+            tcg_out_qemu_ld(s, args[0], args[1], args[2], -1,
+                            args[3], TCG_TYPE_I64);
+        } else {
+            tcg_out_qemu_ld(s, args[0], args[1], args[2], args[3],
+                            args[4], TCG_TYPE_I64);
+        }
         break;
     case INDEX_op_qemu_st_i32:
-        tcg_out_qemu_st(s, args, 0);
+        if (TARGET_LONG_BITS == 32) {
+            tcg_out_qemu_st(s, args[0], -1, args[1], -1,
+                            args[2], TCG_TYPE_I32);
+        } else {
+            tcg_out_qemu_st(s, args[0], -1, args[1], args[2],
+                            args[3], TCG_TYPE_I32);
+        }
         break;
     case INDEX_op_qemu_st_i64:
-        tcg_out_qemu_st(s, args, 1);
+        if (TARGET_LONG_BITS == 32) {
+            tcg_out_qemu_st(s, args[0], args[1], args[2], -1,
+                            args[3], TCG_TYPE_I64);
+        } else {
+            tcg_out_qemu_st(s, args[0], args[1], args[2], args[3],
+                            args[4], TCG_TYPE_I64);
+        }
         break;
 
     case INDEX_op_bswap16_i32:
-- 
2.34.1


