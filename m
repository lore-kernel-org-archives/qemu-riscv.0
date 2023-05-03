Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pu6R2-0007iO-0S
	for mharc-qemu-riscv@gnu.org; Wed, 03 May 2023 02:57:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6R0-0007gO-Ej
 for qemu-riscv@nongnu.org; Wed, 03 May 2023 02:57:54 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6Qm-0001jQ-N4
 for qemu-riscv@nongnu.org; Wed, 03 May 2023 02:57:54 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3f19323259dso46756035e9.3
 for <qemu-riscv@nongnu.org>; Tue, 02 May 2023 23:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683097059; x=1685689059;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZLKOkrrM6X6Chuoo3/tcJ4CYY7RF9VAHo0E2og71vlU=;
 b=cmO2IOuBrv2tTi/ctCKvnXyXLvxyN4fwyIZZ4ma9HdfL9e+NLUWS9vAQfZJTK2R+rd
 9hipAVUEhey5eFcXIjDj13JZ/c+btjHFlD5R6mBOm6ijAtHfbXMtXrPBQ1vvBWIVA/ST
 6qv4+khscvUuWCTTIJ5vicNWPqeKZvToTzxZFm55J82AChJ75sHKfwmYYRDIWaxXI9Ur
 BbHloSuYkCE6FJk4k3r+Gcs5cZ1NG0X+g3YQi87nRuGOsMTnUQSu74X4IrsFMbhN/CxC
 kBfPZ9GK0vFgrPo7ME460PNATQKPoNndi0A5jH3ls3sM/tEaaNtlNmlnbsbE9P3BP0T+
 kCFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683097059; x=1685689059;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZLKOkrrM6X6Chuoo3/tcJ4CYY7RF9VAHo0E2og71vlU=;
 b=ffd34qoMCvL9JrbagJp2VA/B57PqmoztslpzsYPfXFdtGy0Df+6Oh1gO8wzVVz5j0a
 j5Sv30RoZgvcKPVghoMdbYD2LhQF7uR4uNr8MUMc/e9GyZyJ3ZoemGJtP5hsj1Xibuib
 PqQ25vstsKwnP/cLjn9c/ptPKT0O1IoNvmSQ2tnmu3TvMFLdQF+alkE60Out0Hs0vTmu
 iRni22Twf3jaJTVNyYkt1a/SKEprdM9OXkPtM3XCpOjCIRbyQQk8rWCkNvklP/oWlkIN
 qtXYIFDYRwbd5iBpJiVroH5MXPIneL/AWWk4omM4PI1DKP9Ard0xVuuB/I7FAXRKk3Wi
 ln0g==
X-Gm-Message-State: AC+VfDx2mdImJ7QhmmVsXwMYVKD+I7kDAYZrrQTJTPGZSyKVFw6xD+d6
 bRIKQjc8MEenvPSVx0z/CcCThQ==
X-Google-Smtp-Source: ACHHUZ6fvQPGYUuBdV+FQXkco2IWBnuR7PymNd5MXJIYj5cViSKidF7w0xbOt5j9qKKD1bbdiUvq4A==
X-Received: by 2002:a5d:5401:0:b0:2f8:2d4:74ef with SMTP id
 g1-20020a5d5401000000b002f802d474efmr14227296wrv.43.1683097059143; 
 Tue, 02 May 2023 23:57:39 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 f6-20020a5d6646000000b002f6dafef040sm32796617wrw.12.2023.05.02.23.57.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 23:57:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, philmd@linaro.org, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v4 12/54] tcg/arm: Introduce HostAddress
Date: Wed,  3 May 2023 07:56:47 +0100
Message-Id: <20230503065729.1745843-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503065729.1745843-1-richard.henderson@linaro.org>
References: <20230503065729.1745843-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x329.google.com
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
X-List-Received-Date: Wed, 03 May 2023 06:57:54 -0000

Collect the parts of the host address, and condition, into a struct.
Merge tcg_out_qemu_*_{index,direct} and use it.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/arm/tcg-target.c.inc | 248 ++++++++++++++++++---------------------
 1 file changed, 115 insertions(+), 133 deletions(-)

diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index 6ce52b9612..b6b4ffc546 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -1337,6 +1337,13 @@ static void tcg_out_vldst(TCGContext *s, ARMInsn insn,
     tcg_out32(s, insn | (rn << 16) | encode_vd(rd) | 0xf);
 }
 
+typedef struct {
+    ARMCond cond;
+    TCGReg base;
+    int index;
+    bool index_scratch;
+} HostAddress;
+
 #ifdef CONFIG_SOFTMMU
 /* helper signature: helper_ret_ld_mmu(CPUState *env, target_ulong addr,
  *                                     int mmu_idx, uintptr_t ra)
@@ -1696,29 +1703,49 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 }
 #endif /* SOFTMMU */
 
-static void tcg_out_qemu_ld_index(TCGContext *s, MemOp opc,
-                                  TCGReg datalo, TCGReg datahi,
-                                  TCGReg addrlo, TCGReg addend,
-                                  bool scratch_addend)
+static void tcg_out_qemu_ld_direct(TCGContext *s, MemOp opc, TCGReg datalo,
+                                   TCGReg datahi, HostAddress h)
 {
+    TCGReg base;
+
     /* Byte swapping is left to middle-end expansion. */
     tcg_debug_assert((opc & MO_BSWAP) == 0);
 
     switch (opc & MO_SSIZE) {
     case MO_UB:
-        tcg_out_ld8_r(s, COND_AL, datalo, addrlo, addend);
+        if (h.index < 0) {
+            tcg_out_ld8_12(s, h.cond, datalo, h.base, 0);
+        } else {
+            tcg_out_ld8_r(s, h.cond, datalo, h.base, h.index);
+        }
         break;
     case MO_SB:
-        tcg_out_ld8s_r(s, COND_AL, datalo, addrlo, addend);
+        if (h.index < 0) {
+            tcg_out_ld8s_8(s, h.cond, datalo, h.base, 0);
+        } else {
+            tcg_out_ld8s_r(s, h.cond, datalo, h.base, h.index);
+        }
         break;
     case MO_UW:
-        tcg_out_ld16u_r(s, COND_AL, datalo, addrlo, addend);
+        if (h.index < 0) {
+            tcg_out_ld16u_8(s, h.cond, datalo, h.base, 0);
+        } else {
+            tcg_out_ld16u_r(s, h.cond, datalo, h.base, h.index);
+        }
         break;
     case MO_SW:
-        tcg_out_ld16s_r(s, COND_AL, datalo, addrlo, addend);
+        if (h.index < 0) {
+            tcg_out_ld16s_8(s, h.cond, datalo, h.base, 0);
+        } else {
+            tcg_out_ld16s_r(s, h.cond, datalo, h.base, h.index);
+        }
         break;
     case MO_UL:
-        tcg_out_ld32_r(s, COND_AL, datalo, addrlo, addend);
+        if (h.index < 0) {
+            tcg_out_ld32_12(s, h.cond, datalo, h.base, 0);
+        } else {
+            tcg_out_ld32_r(s, h.cond, datalo, h.base, h.index);
+        }
         break;
     case MO_UQ:
         /* We used pair allocation for datalo, so already should be aligned. */
@@ -1726,87 +1753,59 @@ static void tcg_out_qemu_ld_index(TCGContext *s, MemOp opc,
         tcg_debug_assert(datahi == datalo + 1);
         /* LDRD requires alignment; double-check that. */
         if (get_alignment_bits(opc) >= MO_64) {
+            if (h.index < 0) {
+                tcg_out_ldrd_8(s, h.cond, datalo, h.base, 0);
+                break;
+            }
             /*
              * Rm (the second address op) must not overlap Rt or Rt + 1.
              * Since datalo is aligned, we can simplify the test via alignment.
              * Flip the two address arguments if that works.
              */
-            if ((addend & ~1) != datalo) {
-                tcg_out_ldrd_r(s, COND_AL, datalo, addrlo, addend);
+            if ((h.index & ~1) != datalo) {
+                tcg_out_ldrd_r(s, h.cond, datalo, h.base, h.index);
                 break;
             }
-            if ((addrlo & ~1) != datalo) {
-                tcg_out_ldrd_r(s, COND_AL, datalo, addend, addrlo);
+            if ((h.base & ~1) != datalo) {
+                tcg_out_ldrd_r(s, h.cond, datalo, h.index, h.base);
                 break;
             }
         }
-        if (scratch_addend) {
-            tcg_out_ld32_rwb(s, COND_AL, datalo, addend, addrlo);
-            tcg_out_ld32_12(s, COND_AL, datahi, addend, 4);
+        if (h.index < 0) {
+            base = h.base;
+            if (datalo == h.base) {
+                tcg_out_mov_reg(s, h.cond, TCG_REG_TMP, base);
+                base = TCG_REG_TMP;
+            }
+        } else if (h.index_scratch) {
+            tcg_out_ld32_rwb(s, h.cond, datalo, h.index, h.base);
+            tcg_out_ld32_12(s, h.cond, datahi, h.index, 4);
+            break;
         } else {
-            tcg_out_dat_reg(s, COND_AL, ARITH_ADD, TCG_REG_TMP,
-                            addend, addrlo, SHIFT_IMM_LSL(0));
-            tcg_out_ld32_12(s, COND_AL, datalo, TCG_REG_TMP, 0);
-            tcg_out_ld32_12(s, COND_AL, datahi, TCG_REG_TMP, 4);
+            tcg_out_dat_reg(s, h.cond, ARITH_ADD, TCG_REG_TMP,
+                            h.base, h.index, SHIFT_IMM_LSL(0));
+            base = TCG_REG_TMP;
         }
+        tcg_out_ld32_12(s, h.cond, datalo, base, 0);
+        tcg_out_ld32_12(s, h.cond, datahi, base, 4);
         break;
     default:
         g_assert_not_reached();
     }
 }
 
-#ifndef CONFIG_SOFTMMU
-static void tcg_out_qemu_ld_direct(TCGContext *s, MemOp opc, TCGReg datalo,
-                                   TCGReg datahi, TCGReg addrlo)
-{
-    /* Byte swapping is left to middle-end expansion. */
-    tcg_debug_assert((opc & MO_BSWAP) == 0);
-
-    switch (opc & MO_SSIZE) {
-    case MO_UB:
-        tcg_out_ld8_12(s, COND_AL, datalo, addrlo, 0);
-        break;
-    case MO_SB:
-        tcg_out_ld8s_8(s, COND_AL, datalo, addrlo, 0);
-        break;
-    case MO_UW:
-        tcg_out_ld16u_8(s, COND_AL, datalo, addrlo, 0);
-        break;
-    case MO_SW:
-        tcg_out_ld16s_8(s, COND_AL, datalo, addrlo, 0);
-        break;
-    case MO_UL:
-        tcg_out_ld32_12(s, COND_AL, datalo, addrlo, 0);
-        break;
-    case MO_UQ:
-        /* We used pair allocation for datalo, so already should be aligned. */
-        tcg_debug_assert((datalo & 1) == 0);
-        tcg_debug_assert(datahi == datalo + 1);
-        /* LDRD requires alignment; double-check that. */
-        if (get_alignment_bits(opc) >= MO_64) {
-            tcg_out_ldrd_8(s, COND_AL, datalo, addrlo, 0);
-        } else if (datalo == addrlo) {
-            tcg_out_ld32_12(s, COND_AL, datahi, addrlo, 4);
-            tcg_out_ld32_12(s, COND_AL, datalo, addrlo, 0);
-        } else {
-            tcg_out_ld32_12(s, COND_AL, datalo, addrlo, 0);
-            tcg_out_ld32_12(s, COND_AL, datahi, addrlo, 4);
-        }
-        break;
-    default:
-        g_assert_not_reached();
-    }
-}
-#endif
-
 static void tcg_out_qemu_ld(TCGContext *s, TCGReg datalo, TCGReg datahi,
                             TCGReg addrlo, TCGReg addrhi,
                             MemOpIdx oi, TCGType data_type)
 {
     MemOp opc = get_memop(oi);
+    HostAddress h;
 
 #ifdef CONFIG_SOFTMMU
-    TCGReg addend= tcg_out_tlb_read(s, addrlo, addrhi, opc, get_mmuidx(oi), 1);
+    h.cond = COND_AL;
+    h.base = addrlo;
+    h.index_scratch = true;
+    h.index = tcg_out_tlb_read(s, addrlo, addrhi, opc, get_mmuidx(oi), 1);
 
     /*
      * This a conditional BL only to load a pointer within this opcode into
@@ -1815,80 +1814,51 @@ static void tcg_out_qemu_ld(TCGContext *s, TCGReg datalo, TCGReg datahi,
     tcg_insn_unit *label_ptr = s->code_ptr;
     tcg_out_bl_imm(s, COND_NE, 0);
 
-    tcg_out_qemu_ld_index(s, opc, datalo, datahi, addrlo, addend, true);
+    tcg_out_qemu_ld_direct(s, opc, datalo, datahi, h);
 
     add_qemu_ldst_label(s, true, oi, data_type, datalo, datahi,
                         addrlo, addrhi, s->code_ptr, label_ptr);
-#else /* !CONFIG_SOFTMMU */
+#else
     unsigned a_bits = get_alignment_bits(opc);
     if (a_bits) {
         tcg_out_test_alignment(s, true, addrlo, addrhi, a_bits);
     }
-    if (guest_base) {
-        tcg_out_qemu_ld_index(s, opc, datalo, datahi,
-                              addrlo, TCG_REG_GUEST_BASE, false);
-    } else {
-        tcg_out_qemu_ld_direct(s, opc, datalo, datahi, addrlo);
-    }
+
+    h.cond = COND_AL;
+    h.base = addrlo;
+    h.index = guest_base ? TCG_REG_GUEST_BASE : -1;
+    h.index_scratch = false;
+    tcg_out_qemu_ld_direct(s, opc, datalo, datahi, h);
 #endif
 }
 
-static void tcg_out_qemu_st_index(TCGContext *s, ARMCond cond, MemOp opc,
-                                  TCGReg datalo, TCGReg datahi,
-                                  TCGReg addrlo, TCGReg addend,
-                                  bool scratch_addend)
-{
-    /* Byte swapping is left to middle-end expansion. */
-    tcg_debug_assert((opc & MO_BSWAP) == 0);
-
-    switch (opc & MO_SIZE) {
-    case MO_8:
-        tcg_out_st8_r(s, cond, datalo, addrlo, addend);
-        break;
-    case MO_16:
-        tcg_out_st16_r(s, cond, datalo, addrlo, addend);
-        break;
-    case MO_32:
-        tcg_out_st32_r(s, cond, datalo, addrlo, addend);
-        break;
-    case MO_64:
-        /* We used pair allocation for datalo, so already should be aligned. */
-        tcg_debug_assert((datalo & 1) == 0);
-        tcg_debug_assert(datahi == datalo + 1);
-        /* STRD requires alignment; double-check that. */
-        if (get_alignment_bits(opc) >= MO_64) {
-            tcg_out_strd_r(s, cond, datalo, addrlo, addend);
-        } else if (scratch_addend) {
-            tcg_out_st32_rwb(s, cond, datalo, addend, addrlo);
-            tcg_out_st32_12(s, cond, datahi, addend, 4);
-        } else {
-            tcg_out_dat_reg(s, cond, ARITH_ADD, TCG_REG_TMP,
-                            addend, addrlo, SHIFT_IMM_LSL(0));
-            tcg_out_st32_12(s, cond, datalo, TCG_REG_TMP, 0);
-            tcg_out_st32_12(s, cond, datahi, TCG_REG_TMP, 4);
-        }
-        break;
-    default:
-        g_assert_not_reached();
-    }
-}
-
-#ifndef CONFIG_SOFTMMU
 static void tcg_out_qemu_st_direct(TCGContext *s, MemOp opc, TCGReg datalo,
-                                   TCGReg datahi, TCGReg addrlo)
+                                   TCGReg datahi, HostAddress h)
 {
     /* Byte swapping is left to middle-end expansion. */
     tcg_debug_assert((opc & MO_BSWAP) == 0);
 
     switch (opc & MO_SIZE) {
     case MO_8:
-        tcg_out_st8_12(s, COND_AL, datalo, addrlo, 0);
+        if (h.index < 0) {
+            tcg_out_st8_12(s, h.cond, datalo, h.base, 0);
+        } else {
+            tcg_out_st8_r(s, h.cond, datalo, h.base, h.index);
+        }
         break;
     case MO_16:
-        tcg_out_st16_8(s, COND_AL, datalo, addrlo, 0);
+        if (h.index < 0) {
+            tcg_out_st16_8(s, h.cond, datalo, h.base, 0);
+        } else {
+            tcg_out_st16_r(s, h.cond, datalo, h.base, h.index);
+        }
         break;
     case MO_32:
-        tcg_out_st32_12(s, COND_AL, datalo, addrlo, 0);
+        if (h.index < 0) {
+            tcg_out_st32_12(s, h.cond, datalo, h.base, 0);
+        } else {
+            tcg_out_st32_r(s, h.cond, datalo, h.base, h.index);
+        }
         break;
     case MO_64:
         /* We used pair allocation for datalo, so already should be aligned. */
@@ -1896,29 +1866,39 @@ static void tcg_out_qemu_st_direct(TCGContext *s, MemOp opc, TCGReg datalo,
         tcg_debug_assert(datahi == datalo + 1);
         /* STRD requires alignment; double-check that. */
         if (get_alignment_bits(opc) >= MO_64) {
-            tcg_out_strd_8(s, COND_AL, datalo, addrlo, 0);
+            if (h.index < 0) {
+                tcg_out_strd_8(s, h.cond, datalo, h.base, 0);
+            } else {
+                tcg_out_strd_r(s, h.cond, datalo, h.base, h.index);
+            }
+        } else if (h.index_scratch) {
+            tcg_out_st32_rwb(s, h.cond, datalo, h.index, h.base);
+            tcg_out_st32_12(s, h.cond, datahi, h.index, 4);
         } else {
-            tcg_out_st32_12(s, COND_AL, datalo, addrlo, 0);
-            tcg_out_st32_12(s, COND_AL, datahi, addrlo, 4);
+            tcg_out_dat_reg(s, h.cond, ARITH_ADD, TCG_REG_TMP,
+                            h.base, h.index, SHIFT_IMM_LSL(0));
+            tcg_out_st32_12(s, h.cond, datalo, TCG_REG_TMP, 0);
+            tcg_out_st32_12(s, h.cond, datahi, TCG_REG_TMP, 4);
         }
         break;
     default:
         g_assert_not_reached();
     }
 }
-#endif
 
 static void tcg_out_qemu_st(TCGContext *s, TCGReg datalo, TCGReg datahi,
                             TCGReg addrlo, TCGReg addrhi,
                             MemOpIdx oi, TCGType data_type)
 {
     MemOp opc = get_memop(oi);
+    HostAddress h;
 
 #ifdef CONFIG_SOFTMMU
-    TCGReg addend = tcg_out_tlb_read(s, addrlo, addrhi, opc, get_mmuidx(oi), 0);
-
-    tcg_out_qemu_st_index(s, COND_EQ, opc, datalo, datahi,
-                          addrlo, addend, true);
+    h.cond = COND_EQ;
+    h.base = addrlo;
+    h.index_scratch = true;
+    h.index = tcg_out_tlb_read(s, addrlo, addrhi, opc, get_mmuidx(oi), 0);
+    tcg_out_qemu_st_direct(s, opc, datalo, datahi, h);
 
     /* The conditional call must come last, as we're going to return here.  */
     tcg_insn_unit *label_ptr = s->code_ptr;
@@ -1926,17 +1906,19 @@ static void tcg_out_qemu_st(TCGContext *s, TCGReg datalo, TCGReg datahi,
 
     add_qemu_ldst_label(s, false, oi, data_type, datalo, datahi,
                         addrlo, addrhi, s->code_ptr, label_ptr);
-#else /* !CONFIG_SOFTMMU */
+#else
     unsigned a_bits = get_alignment_bits(opc);
+
+    h.cond = COND_AL;
     if (a_bits) {
         tcg_out_test_alignment(s, false, addrlo, addrhi, a_bits);
+        h.cond = COND_EQ;
     }
-    if (guest_base) {
-        tcg_out_qemu_st_index(s, COND_AL, opc, datalo, datahi,
-                              addrlo, TCG_REG_GUEST_BASE, false);
-    } else {
-        tcg_out_qemu_st_direct(s, opc, datalo, datahi, addrlo);
-    }
+
+    h.base = addrlo;
+    h.index = guest_base ? TCG_REG_GUEST_BASE : -1;
+    h.index_scratch = false;
+    tcg_out_qemu_st_direct(s, opc, datalo, datahi, h);
 #endif
 }
 
-- 
2.34.1


