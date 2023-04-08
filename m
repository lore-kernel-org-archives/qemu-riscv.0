Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pkyZX-00024X-N2
	for mharc-qemu-riscv@gnu.org; Fri, 07 Apr 2023 22:44:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkyZ4-0008So-Jq
 for qemu-riscv@nongnu.org; Fri, 07 Apr 2023 22:44:31 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkyYO-0005cz-Sm
 for qemu-riscv@nongnu.org; Fri, 07 Apr 2023 22:44:30 -0400
Received: by mail-pl1-x634.google.com with SMTP id bg9so508070plb.2
 for <qemu-riscv@nongnu.org>; Fri, 07 Apr 2023 19:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680921827;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mz8kJeRhmTsi9fcghAqDVd5txMxvTf7rUjSQ1DhbH08=;
 b=S+GDurDA0VvnMmpRdUOsGLgiffJkRryZzWtd1MP3foxG6NHE+IbWC2ezV+kptgEWgP
 zkQg93D0eGpWjb6jmUjsMbVw09P5pl+F8yrn+cc60qg6RjDI0USXvD9ysI2a5HQC5QrL
 mdIeYaM6m1mRoCOCx77x218Ag01boE8+XxqOpqWPG1lDEzAHul9tla4YDNUY+uZp4rW/
 7lU9H6b16KPmiS2UG3k2Ha14obSWM+RjCkh9hn+FMyIpzvbKFOvEfTMufNkJgIItygIV
 QyLhkbYbJwB0MimIusH+1ipG5+1Lz48DVCqqPUdXs++KCfV64Y8eC7o3cjpR6+2LhXQb
 ZLWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680921827;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mz8kJeRhmTsi9fcghAqDVd5txMxvTf7rUjSQ1DhbH08=;
 b=TYCMLCdEqxF5JZQKEPdo6tiNiqdLURuoUcIisVUMcuBSj9KaY9Olc2ZwN9SpYKwyNv
 eCcBV3rfF5pj6vqOJJeVU8aUMaBw7UaDp/AQYAEwyGt3cXHp7YJhwXx69NLPYBkoic9S
 xjDVzxa2YWQM0J7klNOe3T5Tym4JEa1vTjg4dWkzSgfzzPYu//A6uCQOi/Ki77MVTHWD
 cpawBBV1DzptujJDm/y1MPKZyIcMqaGknjKlXiYH2l4vwkLqfQT5+XxalLhP4m2a16UP
 +lnrXR9BS2dRavcw5aIwuZS8H2WWQeLCWH3R41+4NBhYYUG/wfP03+inEoz+A2LNbjY7
 1IrA==
X-Gm-Message-State: AAQBX9fVeuYqzsKfpmCl8MkBhU8KaLv7z61qqy9EOhVeRXF739UOiEJI
 1xtTM+hMTBwSiA00rrCBv9rM5g==
X-Google-Smtp-Source: AKy350YOsf3LhOd/mYTrjlSELJ48+yCmHCX1Sd1+3As1ILH0gxLeRdlDdGIFD2Su+z8d4HXfc/Taew==
X-Received: by 2002:a17:90b:1d11:b0:23d:158c:a60c with SMTP id
 on17-20020a17090b1d1100b0023d158ca60cmr4578828pjb.44.1680921827490; 
 Fri, 07 Apr 2023 19:43:47 -0700 (PDT)
Received: from stoup.. ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
 by smtp.gmail.com with ESMTPSA id
 d9-20020a170902c18900b0019d397b0f18sm3530780pld.214.2023.04.07.19.43.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Apr 2023 19:43:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH 35/42] tcg/ppc: Reorg tcg_out_tlb_read
Date: Fri,  7 Apr 2023 19:43:07 -0700
Message-Id: <20230408024314.3357414-37-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230408024314.3357414-1-richard.henderson@linaro.org>
References: <20230408024314.3357414-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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

Allocate TCG_REG_TMP2.  Use R0, TMP1, TMP2 instead of any of
the normally allocated registers for the tlb load.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/ppc/tcg-target.c.inc | 83 +++++++++++++++++++++++-----------------
 1 file changed, 48 insertions(+), 35 deletions(-)

diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index 383464b408..7195c0b817 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -68,6 +68,7 @@
 #else
 # define TCG_REG_TMP1   TCG_REG_R12
 #endif
+#define TCG_REG_TMP2    TCG_REG_R11
 
 #define TCG_VEC_TMP1    TCG_REG_V0
 #define TCG_VEC_TMP2    TCG_REG_V1
@@ -2007,10 +2008,11 @@ static void * const qemu_st_helpers[(MO_SIZE | MO_BSWAP) + 1] = {
 QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) > 0);
 QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) < -32768);
 
-/* Perform the TLB load and compare.  Places the result of the comparison
-   in CR7, loads the addend of the TLB into R3, and returns the register
-   containing the guest address (zero-extended into R4).  Clobbers R0 and R2. */
-
+/*
+ * Perform the TLB load and compare.  Places the result of the comparison
+ * in CR7, loads the addend of the TLB into TMP1, and returns the register
+ * containing the guest address (zero-extended into TMP2).  Clobbers R0.
+ */
 static TCGReg tcg_out_tlb_read(TCGContext *s, MemOp opc,
                                TCGReg addrlo, TCGReg addrhi,
                                int mem_index, bool is_read)
@@ -2026,40 +2028,44 @@ static TCGReg tcg_out_tlb_read(TCGContext *s, MemOp opc,
     unsigned a_bits = get_alignment_bits(opc);
 
     /* Load tlb_mask[mmu_idx] and tlb_table[mmu_idx].  */
-    tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_R3, TCG_AREG0, mask_off);
-    tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_R4, TCG_AREG0, table_off);
+    tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_TMP1, TCG_AREG0, mask_off);
+    tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_TMP2, TCG_AREG0, table_off);
 
     /* Extract the page index, shifted into place for tlb index.  */
     if (TCG_TARGET_REG_BITS == 32) {
-        tcg_out_shri32(s, TCG_REG_TMP1, addrlo,
+        tcg_out_shri32(s, TCG_REG_R0, addrlo,
                        TARGET_PAGE_BITS - CPU_TLB_ENTRY_BITS);
     } else {
-        tcg_out_shri64(s, TCG_REG_TMP1, addrlo,
+        tcg_out_shri64(s, TCG_REG_R0, addrlo,
                        TARGET_PAGE_BITS - CPU_TLB_ENTRY_BITS);
     }
-    tcg_out32(s, AND | SAB(TCG_REG_R3, TCG_REG_R3, TCG_REG_TMP1));
+    tcg_out32(s, AND | SAB(TCG_REG_TMP1, TCG_REG_TMP1, TCG_REG_R0));
 
-    /* Load the TLB comparator.  */
+    /* Load the (low part) TLB comparator into TMP2. */
     if (cmp_off == 0 && TCG_TARGET_REG_BITS >= TARGET_LONG_BITS) {
         uint32_t lxu = (TCG_TARGET_REG_BITS == 32 || TARGET_LONG_BITS == 32
                         ? LWZUX : LDUX);
-        tcg_out32(s, lxu | TAB(TCG_REG_TMP1, TCG_REG_R3, TCG_REG_R4));
+        tcg_out32(s, lxu | TAB(TCG_REG_TMP2, TCG_REG_TMP1, TCG_REG_TMP2));
     } else {
-        tcg_out32(s, ADD | TAB(TCG_REG_R3, TCG_REG_R3, TCG_REG_R4));
+        tcg_out32(s, ADD | TAB(TCG_REG_TMP1, TCG_REG_TMP1, TCG_REG_TMP2));
         if (TCG_TARGET_REG_BITS < TARGET_LONG_BITS) {
-            tcg_out_ld(s, TCG_TYPE_I32, TCG_REG_TMP1, TCG_REG_R3, cmp_off + 4);
-            tcg_out_ld(s, TCG_TYPE_I32, TCG_REG_R4, TCG_REG_R3, cmp_off);
+            tcg_out_ld(s, TCG_TYPE_I32, TCG_REG_TMP2,
+                       TCG_REG_TMP1, cmp_off + 4);
         } else {
-            tcg_out_ld(s, TCG_TYPE_TL, TCG_REG_TMP1, TCG_REG_R3, cmp_off);
+            tcg_out_ld(s, TCG_TYPE_TL, TCG_REG_TMP2, TCG_REG_TMP1, cmp_off);
         }
     }
 
-    /* Load the TLB addend for use on the fast path.  Do this asap
-       to minimize any load use delay.  */
-    tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_R3, TCG_REG_R3,
-               offsetof(CPUTLBEntry, addend));
+    /*
+     * Load the TLB addend for use on the fast path.
+     * Do this asap to minimize any load use delay.
+     */
+    if (TCG_TARGET_REG_BITS >= TARGET_LONG_BITS) {
+        tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_TMP1, TCG_REG_TMP1,
+                   offsetof(CPUTLBEntry, addend));
+    }
 
-    /* Clear the non-page, non-alignment bits from the address */
+    /* Clear the non-page, non-alignment bits from the address into R0. */
     if (TCG_TARGET_REG_BITS == 32) {
         /* We don't support unaligned accesses on 32-bits.
          * Preserve the bottom bits and thus trigger a comparison
@@ -2090,9 +2096,6 @@ static TCGReg tcg_out_tlb_read(TCGContext *s, MemOp opc,
         if (TARGET_LONG_BITS == 32) {
             tcg_out_rlw(s, RLWINM, TCG_REG_R0, t, 0,
                         (32 - a_bits) & 31, 31 - TARGET_PAGE_BITS);
-            /* Zero-extend the address for use in the final address.  */
-            tcg_out_ext32u(s, TCG_REG_R4, addrlo);
-            addrlo = TCG_REG_R4;
         } else if (a_bits == 0) {
             tcg_out_rld(s, RLDICR, TCG_REG_R0, t, 0, 63 - TARGET_PAGE_BITS);
         } else {
@@ -2102,16 +2105,27 @@ static TCGReg tcg_out_tlb_read(TCGContext *s, MemOp opc,
         }
     }
 
+    /* Full or low part comparison into cr7. */
+    tcg_out_cmp(s, TCG_COND_EQ, TCG_REG_R0, TCG_REG_TMP2, 0, 7, TCG_TYPE_I32);
+
     if (TCG_TARGET_REG_BITS < TARGET_LONG_BITS) {
-        tcg_out_cmp(s, TCG_COND_EQ, TCG_REG_R0, TCG_REG_TMP1,
-                    0, 7, TCG_TYPE_I32);
-        tcg_out_cmp(s, TCG_COND_EQ, addrhi, TCG_REG_R4, 0, 6, TCG_TYPE_I32);
+        /* High part comparison into cr6. */
+        tcg_out_ld(s, TCG_TYPE_I32, TCG_REG_R0, TCG_REG_TMP1, cmp_off);
+        tcg_out_cmp(s, TCG_COND_EQ, TCG_REG_R0, addrhi, 0, 6, TCG_TYPE_I32);
+
+        /* Load addend, deferred for this case. */
+        tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_TMP1, TCG_REG_TMP1,
+                   offsetof(CPUTLBEntry, addend));
+
+        /* Combine comparisons into cr7. */
         tcg_out32(s, CRAND | BT(7, CR_EQ) | BA(6, CR_EQ) | BB(7, CR_EQ));
-    } else {
-        tcg_out_cmp(s, TCG_COND_EQ, TCG_REG_R0, TCG_REG_TMP1,
-                    0, 7, TCG_TYPE_TL);
     }
 
+    if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS) {
+        /* Zero-extend the address for use in the final address.  */
+        tcg_out_ext32u(s, TCG_REG_TMP2, addrlo);
+        return TCG_REG_TMP2;
+    }
     return addrlo;
 }
 
@@ -2179,11 +2193,9 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
     /*
      * For the purposes of ppc32 sorting 4 input registers into 4 argument
      * registers, there is an outside chance we would require 3 temps.
-     * Because of constraints, no inputs are in r3, and env will not be
-     * placed into r3 until after the sorting is done, and is thus free.
      */
     tcg_out_st_helper_args(s, lb, tcg_out_mflr, -1, TCG_REG_TMP1,
-                           TCG_REG_R0, TCG_REG_R3);
+                           TCG_REG_TMP2, TCG_REG_R0);
 
     tcg_out_call_int(s, LK, qemu_st_helpers[opc & (MO_BSWAP | MO_SIZE)]);
 
@@ -2285,7 +2297,7 @@ static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, TCGType d_type)
     label_ptr = s->code_ptr;
     tcg_out32(s, BC | BI(7, CR_EQ) | BO_COND_FALSE | LK);
 
-    rbase = TCG_REG_R3;
+    rbase = TCG_REG_TMP1;
 #else  /* !CONFIG_SOFTMMU */
     a_bits = get_alignment_bits(opc);
     if (a_bits) {
@@ -2366,7 +2378,7 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, TCGType d_type)
     label_ptr = s->code_ptr;
     tcg_out32(s, BC | BI(7, CR_EQ) | BO_COND_FALSE | LK);
 
-    rbase = TCG_REG_R3;
+    rbase = TCG_REG_TMP1;
 #else  /* !CONFIG_SOFTMMU */
     a_bits = get_alignment_bits(opc);
     if (a_bits) {
@@ -3934,7 +3946,8 @@ static void tcg_target_init(TCGContext *s)
 #if defined(_CALL_SYSV) || TCG_TARGET_REG_BITS == 64
     tcg_regset_set_reg(s->reserved_regs, TCG_REG_R13); /* thread pointer */
 #endif
-    tcg_regset_set_reg(s->reserved_regs, TCG_REG_TMP1); /* mem temp */
+    tcg_regset_set_reg(s->reserved_regs, TCG_REG_TMP1);
+    tcg_regset_set_reg(s->reserved_regs, TCG_REG_TMP2);
     tcg_regset_set_reg(s->reserved_regs, TCG_VEC_TMP1);
     tcg_regset_set_reg(s->reserved_regs, TCG_VEC_TMP2);
     if (USE_REG_TB) {
-- 
2.34.1


