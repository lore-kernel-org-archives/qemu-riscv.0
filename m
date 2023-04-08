Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pkyZT-0001aB-7E
	for mharc-qemu-riscv@gnu.org; Fri, 07 Apr 2023 22:44:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkyZ1-0008RV-Vv
 for qemu-riscv@nongnu.org; Fri, 07 Apr 2023 22:44:29 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkyYN-0005qf-CZ
 for qemu-riscv@nongnu.org; Fri, 07 Apr 2023 22:44:27 -0400
Received: by mail-pl1-x62a.google.com with SMTP id la3so202372plb.11
 for <qemu-riscv@nongnu.org>; Fri, 07 Apr 2023 19:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680921826;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KhrCHLGVho5MP5YRsKBSeSmutLAxr0EB2DHCqq7DAR8=;
 b=be1AYLH6IkUkB3G9geWmp/NWW7SGCrcrHX2jzr2MpqaS5939PogY1wnmZdIe/lHTla
 gV1ttB8A7HVxeyNBHYr4MRd+NxdoEmf1YNup04fjpTnYatMeEW7F874JQiFv4EZZMzy6
 Mb1+yyeXGxeGRo6zPbDQ6R6XVAP3uhP3GzaRYGIObfysBwE0YjPtofqaBUlSQKvj8fJ0
 kRKICwiqSh7h8ktHZBrsXvHZSgwHmdSlqmhYi9AQ+X3asuHQYulGAkPMv036tfzje0p4
 aAoxfa2F5VI4hNMyW7I557UxpFFPCfRyEACo2M+GRUnom992eLbwiVh+76TDoRXZZ+D7
 BM/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680921826;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KhrCHLGVho5MP5YRsKBSeSmutLAxr0EB2DHCqq7DAR8=;
 b=Hc+2TGqTmIVu0CDpeTEk5wqTBP3YgZLCyf+iz/1NKYcXBFQdnQeQ+3luJpR447VoO1
 DWrR4WbIGAGCD16AytPnul9flxhYWv3xNXyNh6E/HHG9izkKFJvR80X8kBiceo785s3A
 XxC/EgIaU/VSyOkVt2UOibkK219oeljsVevILUGIFBFu//T5Q2x/pEAIChOarQ25ys80
 sADOZgodHEMTacuHxfmOUYxhEZXTL6qrK0/10TM8QysikeAZm3nJ2IxNQNk6xruPkExj
 90dzpSS/VlnpL634kBQGxUgy4XYn+rDFUJIxLewRcbuzI3b2Tbhd/gKmGy6AzPePrtbx
 e0Tg==
X-Gm-Message-State: AAQBX9cO0sOcijhB4YvgFBEkU8VHBfT0AJIahecfyOgGrbLQIb6EKjtF
 qmy7gi6tmISvCL5AzAyjkrRqkg==
X-Google-Smtp-Source: AKy350b5vpAUO+oLp5euFIaKap9yZSJHtnwM0rrmU+Lkhy0SFGozObBB8EVnaEp+Lu6sPA+Q1R3dzg==
X-Received: by 2002:a17:90b:4f90:b0:240:5397:bd91 with SMTP id
 qe16-20020a17090b4f9000b002405397bd91mr1154649pjb.4.1680921825888; 
 Fri, 07 Apr 2023 19:43:45 -0700 (PDT)
Received: from stoup.. ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
 by smtp.gmail.com with ESMTPSA id
 d9-20020a170902c18900b0019d397b0f18sm3530780pld.214.2023.04.07.19.43.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Apr 2023 19:43:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH 33/42] tcg/mips: Reorg tcg_out_tlb_load
Date: Fri,  7 Apr 2023 19:43:05 -0700
Message-Id: <20230408024314.3357414-35-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230408024314.3357414-1-richard.henderson@linaro.org>
References: <20230408024314.3357414-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
X-List-Received-Date: Sat, 08 Apr 2023 02:44:31 -0000

Compare the address vs the tlb entry with sign-extended values.
This simplifies the page+alignment mask constant, and the
generation of the last byte address for the misaligned test.

Move the tlb addend load up, and the zero-extension down.

This frees up a register, which allows us to drop the 'base'
parameter, with which the caller was giving us a 5th temporary.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/mips/tcg-target.c.inc | 90 ++++++++++++++++++++-------------------
 1 file changed, 46 insertions(+), 44 deletions(-)

diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index 1206bda502..16b9d09959 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -370,6 +370,8 @@ typedef enum {
     ALIAS_PADDI    = sizeof(void *) == 4 ? OPC_ADDIU : OPC_DADDIU,
     ALIAS_TSRL     = TARGET_LONG_BITS == 32 || TCG_TARGET_REG_BITS == 32
                      ? OPC_SRL : OPC_DSRL,
+    ALIAS_TADDI    = TARGET_LONG_BITS == 32 || TCG_TARGET_REG_BITS == 32
+                     ? OPC_ADDIU : OPC_DADDIU,
 } MIPSInsn;
 
 /*
@@ -1121,12 +1123,12 @@ QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) < -32768);
 
 /*
  * Perform the tlb comparison operation.
- * The complete host address is placed in BASE.
  * Clobbers TMP0, TMP1, TMP2, TMP3.
+ * Returns the register containing the complete host address.
  */
-static void tcg_out_tlb_load(TCGContext *s, TCGReg base, TCGReg addrl,
-                             TCGReg addrh, MemOpIdx oi,
-                             tcg_insn_unit *label_ptr[2], bool is_load)
+static TCGReg tcg_out_tlb_load(TCGContext *s, TCGReg addrl, TCGReg addrh,
+                               MemOpIdx oi, bool is_load,
+                               tcg_insn_unit *label_ptr[2])
 {
     MemOp opc = get_memop(oi);
     unsigned a_bits = get_alignment_bits(opc);
@@ -1140,7 +1142,6 @@ static void tcg_out_tlb_load(TCGContext *s, TCGReg base, TCGReg addrl,
     int add_off = offsetof(CPUTLBEntry, addend);
     int cmp_off = (is_load ? offsetof(CPUTLBEntry, addr_read)
                    : offsetof(CPUTLBEntry, addr_write));
-    target_ulong tlb_mask;
 
     /* Load tlb_mask[mmu_idx] and tlb_table[mmu_idx].  */
     tcg_out_ld(s, TCG_TYPE_PTR, TCG_TMP0, TCG_AREG0, mask_off);
@@ -1158,15 +1159,12 @@ static void tcg_out_tlb_load(TCGContext *s, TCGReg base, TCGReg addrl,
     if (TCG_TARGET_REG_BITS < TARGET_LONG_BITS) {
         tcg_out_ldst(s, OPC_LW, TCG_TMP0, TCG_TMP3, cmp_off + LO_OFF);
     } else {
-        tcg_out_ldst(s, (TARGET_LONG_BITS == 64 ? OPC_LD
-                         : TCG_TARGET_REG_BITS == 64 ? OPC_LWU : OPC_LW),
-                     TCG_TMP0, TCG_TMP3, cmp_off);
+        tcg_out_ld(s, TCG_TYPE_TL, TCG_TMP0, TCG_TMP3, cmp_off);
     }
 
-    /* Zero extend a 32-bit guest address for a 64-bit host. */
-    if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS) {
-        tcg_out_ext32u(s, base, addrl);
-        addrl = base;
+    if (TCG_TARGET_REG_BITS >= TARGET_LONG_BITS) {
+        /* Load the tlb addend for the fast path.  */
+        tcg_out_ld(s, TCG_TYPE_PTR, TCG_TMP3, TCG_TMP3, add_off);
     }
 
     /*
@@ -1174,18 +1172,18 @@ static void tcg_out_tlb_load(TCGContext *s, TCGReg base, TCGReg addrl,
      * For unaligned accesses, compare against the end of the access to
      * verify that it does not cross a page boundary.
      */
-    tlb_mask = (target_ulong)TARGET_PAGE_MASK | a_mask;
-    tcg_out_movi(s, TCG_TYPE_I32, TCG_TMP1, tlb_mask);
-    if (a_mask >= s_mask) {
-        tcg_out_opc_reg(s, OPC_AND, TCG_TMP1, TCG_TMP1, addrl);
-    } else {
-        tcg_out_opc_imm(s, ALIAS_PADDI, TCG_TMP2, addrl, s_mask - a_mask);
+    tcg_out_movi(s, TCG_TYPE_TL, TCG_TMP1, TARGET_PAGE_MASK | a_mask);
+    if (a_mask < s_mask) {
+        tcg_out_opc_imm(s, ALIAS_TADDI, TCG_TMP2, addrl, s_mask - a_mask);
         tcg_out_opc_reg(s, OPC_AND, TCG_TMP1, TCG_TMP1, TCG_TMP2);
+    } else {
+        tcg_out_opc_reg(s, OPC_AND, TCG_TMP1, TCG_TMP1, addrl);
     }
 
-    if (TCG_TARGET_REG_BITS >= TARGET_LONG_BITS) {
-        /* Load the tlb addend for the fast path.  */
-        tcg_out_ld(s, TCG_TYPE_PTR, TCG_TMP2, TCG_TMP3, add_off);
+    /* Zero extend a 32-bit guest address for a 64-bit host. */
+    if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS) {
+        tcg_out_ext32u(s, TCG_TMP2, addrl);
+        addrl = TCG_TMP2;
     }
 
     label_ptr[0] = s->code_ptr;
@@ -1197,14 +1195,15 @@ static void tcg_out_tlb_load(TCGContext *s, TCGReg base, TCGReg addrl,
         tcg_out_ldst(s, OPC_LW, TCG_TMP0, TCG_TMP3, cmp_off + HI_OFF);
 
         /* Load the tlb addend for the fast path.  */
-        tcg_out_ld(s, TCG_TYPE_PTR, TCG_TMP2, TCG_TMP3, add_off);
+        tcg_out_ld(s, TCG_TYPE_PTR, TCG_TMP3, TCG_TMP3, add_off);
 
         label_ptr[1] = s->code_ptr;
         tcg_out_opc_br(s, OPC_BNE, addrh, TCG_TMP0);
     }
 
     /* delay slot */
-    tcg_out_opc_reg(s, ALIAS_PADD, base, TCG_TMP2, addrl);
+    tcg_out_opc_reg(s, ALIAS_PADD, TCG_TMP3, TCG_TMP3, addrl);
+    return TCG_TMP3;
 }
 
 static void add_qemu_ldst_label(TCGContext *s, int is_ld, MemOpIdx oi,
@@ -1606,10 +1605,9 @@ static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, TCGType d_type)
     MemOp opc;
 #if defined(CONFIG_SOFTMMU)
     tcg_insn_unit *label_ptr[2];
-#else
 #endif
     unsigned a_bits, s_bits;
-    TCGReg base = TCG_REG_A0;
+    TCGReg base;
 
     data_regl = *args++;
     data_regh = (TCG_TARGET_REG_BITS == 64 || d_type == TCG_TYPE_I32
@@ -1626,7 +1624,7 @@ static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, TCGType d_type)
      * system to support misaligned memory accesses.
      */
 #if defined(CONFIG_SOFTMMU)
-    tcg_out_tlb_load(s, base, addr_regl, addr_regh, oi, label_ptr, 1);
+    base = tcg_out_tlb_load(s, addr_regl, addr_regh, oi, true, label_ptr);
     if (use_mips32r6_instructions || a_bits >= s_bits) {
         tcg_out_qemu_ld_direct(s, data_regl, data_regh, base, opc, d_type);
     } else {
@@ -1635,16 +1633,18 @@ static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, TCGType d_type)
     add_qemu_ldst_label(s, true, oi, d_type, data_regl, data_regh,
                         addr_regl, addr_regh, s->code_ptr, label_ptr);
 #else
+    base = addr_regl;
     if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS) {
-        tcg_out_ext32u(s, base, addr_regl);
-        addr_regl = base;
+        tcg_out_ext32u(s, TCG_TMP0, addr_regl);
+        base = TCG_TMP0;
     }
-    if (guest_base == 0 && data_regl != addr_regl) {
-        base = addr_regl;
-    } else if (guest_base == (int16_t)guest_base) {
-        tcg_out_opc_imm(s, ALIAS_PADDI, base, addr_regl, guest_base);
-    } else {
-        tcg_out_opc_reg(s, ALIAS_PADD, base, TCG_GUEST_BASE_REG, addr_regl);
+    if (guest_base) {
+        if (guest_base == (int16_t)guest_base) {
+            tcg_out_opc_imm(s, ALIAS_PADDI, TCG_TMP0, base, guest_base);
+        } else {
+            tcg_out_opc_reg(s, ALIAS_PADD, TCG_TMP0, TCG_GUEST_BASE_REG, base);
+        }
+        base = TCG_TMP0;
     }
     if (use_mips32r6_instructions) {
         if (a_bits) {
@@ -1807,7 +1807,7 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, TCGType d_type)
     tcg_insn_unit *label_ptr[2];
 #endif
     unsigned a_bits, s_bits;
-    TCGReg base = TCG_REG_A0;
+    TCGReg base;
 
     data_regl = *args++;
     data_regh = (TCG_TARGET_REG_BITS == 64 || d_type == TCG_TYPE_I32
@@ -1824,7 +1824,7 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, TCGType d_type)
      * system to support misaligned memory accesses.
      */
 #if defined(CONFIG_SOFTMMU)
-    tcg_out_tlb_load(s, base, addr_regl, addr_regh, oi, label_ptr, 0);
+    base = tcg_out_tlb_load(s, addr_regl, addr_regh, oi, false, label_ptr);
     if (use_mips32r6_instructions || a_bits >= s_bits) {
         tcg_out_qemu_st_direct(s, data_regl, data_regh, base, opc);
     } else {
@@ -1833,16 +1833,18 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, TCGType d_type)
     add_qemu_ldst_label(s, false, oi, d_type, data_regl, data_regh,
                         addr_regl, addr_regh, s->code_ptr, label_ptr);
 #else
+    base = addr_regl;
     if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS) {
-        tcg_out_ext32u(s, base, addr_regl);
-        addr_regl = base;
+        tcg_out_ext32u(s, TCG_TMP0, addr_regl);
+        base = TCG_TMP0;
     }
-    if (guest_base == 0) {
-        base = addr_regl;
-    } else if (guest_base == (int16_t)guest_base) {
-        tcg_out_opc_imm(s, ALIAS_PADDI, base, addr_regl, guest_base);
-    } else {
-        tcg_out_opc_reg(s, ALIAS_PADD, base, TCG_GUEST_BASE_REG, addr_regl);
+    if (guest_base) {
+        if (guest_base == (int16_t)guest_base) {
+            tcg_out_opc_imm(s, ALIAS_PADDI, TCG_TMP0, base, guest_base);
+        } else {
+            tcg_out_opc_reg(s, ALIAS_PADD, TCG_TMP0, TCG_GUEST_BASE_REG, base);
+        }
+        base = TCG_TMP0;
     }
     if (use_mips32r6_instructions) {
         if (a_bits) {
-- 
2.34.1


