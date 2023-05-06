Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pvCGH-000507-Gf
	for mharc-qemu-riscv@gnu.org; Sat, 06 May 2023 03:23:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pvCGF-0004w1-Dn
 for qemu-riscv@nongnu.org; Sat, 06 May 2023 03:23:19 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pvCFs-0004Uz-FT
 for qemu-riscv@nongnu.org; Sat, 06 May 2023 03:23:19 -0400
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3063afa2372so2378373f8f.0
 for <qemu-riscv@nongnu.org>; Sat, 06 May 2023 00:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683357775; x=1685949775;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eTTppFvpCeQOyLgVasYHuYDrv+swYGMzo0e4SF2rHxM=;
 b=DUzw+UaOPPxYVzNmzhu2Aohkpl2pf/iKeo5HhhI7hvbKBjB9mSupc4DOhN0LaRifDU
 iMJzkbjAvU9SLSnwtLtp9bpNTMcrKJevN9qsgJmfj/etWlKIY22gACJNEozb2KSL6PW2
 yYoKCSbgzYmMSOSu9hbDsGK0tLwuLxmysE4IKR9SZoJeS2mVKrPuBzAxC9xqWwu4O9s2
 aJ3e4UULg7LdxUyosKYI56RjzNxulPZJnQ6ejHqqRH5XVWuLZjE6Eshzm4lMmBC6dMjN
 APCKuZ2u2eiMu8IXUREHo1EPiYPzEZuMT5PlLJXWqswkWnJm2BcmlnE2Rh+aXhcYHSc/
 SacA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683357775; x=1685949775;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eTTppFvpCeQOyLgVasYHuYDrv+swYGMzo0e4SF2rHxM=;
 b=AacITStH8uzrhQzK4t7j/VfxjiUEHCX9AU78QCDDTpyl2OXlIC3gTSq0d0z5t3LrXc
 5TVGuORMH5kjpXgZbwOaW3sseyl081hNXNsidxCPV6R7p17Gt4StgQP4tFItPae0xf0O
 /C4ABtE4bgkkT1IMa8a8YcgQ3FZWqPFPfSQr5AcYc4n1CBwYVLmopXSO0Cfg20eIjULT
 vugMSsjfmrO1++KrnpGpRLuxmJigYvqFKRs3G5wgD6mO8wg4pwRBFsjpnl5oaF6dmnVY
 eORDBDZXcUYdG8VW5u45Q7khxglaMz6cch3NRpSVwL4VJvCLEFPftjtqqFB/ZYEnx9yr
 Ulqw==
X-Gm-Message-State: AC+VfDyZ9Hv1+ErCx+oUqAv+FnZqNmsFnYVWSp3d15wxJganS/sSyuiF
 B93iYyTpl1AwXfqD+4OLfpEZKQ==
X-Google-Smtp-Source: ACHHUZ7JW9Askfgc8QwSK8XEJLsRIBk/6sZcXB6eGdvXMkd5IV6rLNSTo/BnMwMcK17h/fptCI2k5g==
X-Received: by 2002:a5d:53c7:0:b0:306:2db9:a33a with SMTP id
 a7-20020a5d53c7000000b003062db9a33amr3169248wrw.33.1683357775029; 
 Sat, 06 May 2023 00:22:55 -0700 (PDT)
Received: from stoup.. ([212.241.182.8]) by smtp.gmail.com with ESMTPSA id
 x9-20020adfec09000000b002faaa9a1721sm4481223wrn.58.2023.05.06.00.22.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 May 2023 00:22:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, gaosong@loongson.cn, philmd@linaro.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH v5 24/30] tcg/ppc: Reorg tcg_out_tlb_read
Date: Sat,  6 May 2023 08:22:29 +0100
Message-Id: <20230506072235.597467-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230506072235.597467-1-richard.henderson@linaro.org>
References: <20230506072235.597467-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Sat, 06 May 2023 07:23:19 -0000

Allocate TCG_REG_TMP2.  Use R0, TMP1, TMP2 instead of any of
the normally allocated registers for the tlb load.

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/ppc/tcg-target.c.inc | 84 ++++++++++++++++++++++++----------------
 1 file changed, 51 insertions(+), 33 deletions(-)

diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index 042136fee7..6850ecbc80 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -68,6 +68,7 @@
 #else
 # define TCG_REG_TMP1   TCG_REG_R12
 #endif
+#define TCG_REG_TMP2    TCG_REG_R11
 
 #define TCG_VEC_TMP1    TCG_REG_V0
 #define TCG_VEC_TMP2    TCG_REG_V1
@@ -2015,13 +2016,11 @@ static TCGReg ldst_ra_gen(TCGContext *s, const TCGLabelQemuLdst *l, int arg)
 /*
  * For the purposes of ppc32 sorting 4 input registers into 4 argument
  * registers, there is an outside chance we would require 3 temps.
- * Because of constraints, no inputs are in r3, and env will not be
- * placed into r3 until after the sorting is done, and is thus free.
  */
 static const TCGLdstHelperParam ldst_helper_param = {
     .ra_gen = ldst_ra_gen,
     .ntmp = 3,
-    .tmp = { TCG_REG_TMP1, TCG_REG_R0, TCG_REG_R3 }
+    .tmp = { TCG_REG_TMP1, TCG_REG_TMP2, TCG_REG_R0 }
 };
 
 static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
@@ -2135,41 +2134,44 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
     /* Load tlb_mask[mmu_idx] and tlb_table[mmu_idx].  */
     QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) > 0);
     QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) < -32768);
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
+    /* Load the (low part) TLB comparator into TMP2.  */
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
+                       TCG_REG_TMP1, cmp_off + 4 * HOST_BIG_ENDIAN);
         } else {
-            tcg_out_ld(s, TCG_TYPE_TL, TCG_REG_TMP1, TCG_REG_R3, cmp_off);
+            tcg_out_ld(s, TCG_TYPE_TL, TCG_REG_TMP2, TCG_REG_TMP1, cmp_off);
         }
     }
 
-    /* Load the TLB addend for use on the fast path.  Do this asap
-       to minimize any load use delay.  */
-    h->base = TCG_REG_R3;
-    tcg_out_ld(s, TCG_TYPE_PTR, h->base, TCG_REG_R3,
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
+    /* Clear the non-page, non-alignment bits from the address in R0. */
     if (TCG_TARGET_REG_BITS == 32) {
         /* We don't support unaligned accesses on 32-bits.
          * Preserve the bottom bits and thus trigger a comparison
@@ -2200,9 +2202,6 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
         if (TARGET_LONG_BITS == 32) {
             tcg_out_rlw(s, RLWINM, TCG_REG_R0, t, 0,
                         (32 - a_bits) & 31, 31 - TARGET_PAGE_BITS);
-            /* Zero-extend the address for use in the final address.  */
-            tcg_out_ext32u(s, TCG_REG_R4, addrlo);
-            addrlo = TCG_REG_R4;
         } else if (a_bits == 0) {
             tcg_out_rld(s, RLDICR, TCG_REG_R0, t, 0, 63 - TARGET_PAGE_BITS);
         } else {
@@ -2211,21 +2210,36 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
             tcg_out_rld(s, RLDICL, TCG_REG_R0, TCG_REG_R0, TARGET_PAGE_BITS, 0);
         }
     }
-    h->index = addrlo;
 
     if (TCG_TARGET_REG_BITS < TARGET_LONG_BITS) {
-        tcg_out_cmp(s, TCG_COND_EQ, TCG_REG_R0, TCG_REG_TMP1,
+        /* Low part comparison into cr7. */
+        tcg_out_cmp(s, TCG_COND_EQ, TCG_REG_R0, TCG_REG_TMP2,
                     0, 7, TCG_TYPE_I32);
-        tcg_out_cmp(s, TCG_COND_EQ, addrhi, TCG_REG_R4, 0, 6, TCG_TYPE_I32);
+
+        /* Load the high part TLB comparator into TMP2.  */
+        tcg_out_ld(s, TCG_TYPE_I32, TCG_REG_TMP2, TCG_REG_TMP1,
+                   cmp_off + 4 * !HOST_BIG_ENDIAN);
+
+        /* Load addend, deferred for this case. */
+        tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_TMP1, TCG_REG_TMP1,
+                   offsetof(CPUTLBEntry, addend));
+
+        /* High part comparison into cr6. */
+        tcg_out_cmp(s, TCG_COND_EQ, addrhi, TCG_REG_TMP2, 0, 6, TCG_TYPE_I32);
+
+        /* Combine comparisons into cr7. */
         tcg_out32(s, CRAND | BT(7, CR_EQ) | BA(6, CR_EQ) | BB(7, CR_EQ));
     } else {
-        tcg_out_cmp(s, TCG_COND_EQ, TCG_REG_R0, TCG_REG_TMP1,
+        /* Full comparison into cr7. */
+        tcg_out_cmp(s, TCG_COND_EQ, TCG_REG_R0, TCG_REG_TMP2,
                     0, 7, TCG_TYPE_TL);
     }
 
     /* Load a pointer into the current opcode w/conditional branch-link. */
     ldst->label_ptr[0] = s->code_ptr;
     tcg_out32(s, BC | BI(7, CR_EQ) | BO_COND_FALSE | LK);
+
+    h->base = TCG_REG_TMP1;
 #else
     if (a_bits) {
         ldst = new_ldst_label(s);
@@ -2243,13 +2257,16 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
     }
 
     h->base = guest_base ? TCG_GUEST_BASE_REG : 0;
-    h->index = addrlo;
-    if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS) {
-        tcg_out_ext32u(s, TCG_REG_TMP1, addrlo);
-        h->index = TCG_REG_TMP1;
-    }
 #endif
 
+    if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS) {
+        /* Zero-extend the guest address for use in the host address. */
+        tcg_out_ext32u(s, TCG_REG_R0, addrlo);
+        h->index = TCG_REG_R0;
+    } else {
+        h->index = addrlo;
+    }
+
     return ldst;
 }
 
@@ -3901,7 +3918,8 @@ static void tcg_target_init(TCGContext *s)
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


