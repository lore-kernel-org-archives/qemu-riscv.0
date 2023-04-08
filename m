Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pkyYW-0007bo-KC
	for mharc-qemu-riscv@gnu.org; Fri, 07 Apr 2023 22:43:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkyYS-0007WB-V0
 for qemu-riscv@nongnu.org; Fri, 07 Apr 2023 22:43:52 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkyY7-0005YD-Vu
 for qemu-riscv@nongnu.org; Fri, 07 Apr 2023 22:43:52 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 r7-20020a17090b050700b002404be7920aso42932757pjz.5
 for <qemu-riscv@nongnu.org>; Fri, 07 Apr 2023 19:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680921811;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lcEn0KmryXVUNeUpNBzyKr1At2sRzFB84o+6oRPCDaM=;
 b=kbRoK9rLLh+ntk6ehETGy0QvdpYnL0oC1IVi8WoEqpqj6NMmTw64yRm5bL6/HrKaqa
 vElUJ9PFauWa0WGLqsCOhH+bQMvanpmcUMGfThAMhE0M+z8gvFu/pwf7hp1kjwa1d2OE
 PWZqenJmrcBqPKXk1wa3/OyiVja9BrXZf/IobFvDpMD3HJ8JzVW3WOQ/HivAy+Yh0OFf
 W2b9UkTz7FxTt8efSy7Doa8AcuA5VOnrbhejdYcGSevSZk33RUyehf5qUqBl7IAtUMKn
 r0NgcDOOmBhfipULtYbh96k86/Q7QG4cpxVx9RMIKb2AfRF4UsZA0g8+JcPXQPn5iVCY
 RNeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680921811;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lcEn0KmryXVUNeUpNBzyKr1At2sRzFB84o+6oRPCDaM=;
 b=O1/8kfjtcGAWq4VUssAZPrdQSDpqk2UJcrEI1ShhirY0OJjlU9BDmo97HLTi/xCqVg
 7Ba3PuN1IVnpTJqjPjYbCEKLXLvrX0wtvb3h3zdv236ocHK9gIK6y2ncOyKxT9QEdvuL
 sAjastvs6lzFrOTMOQgwvzZtO8gnlfQZp0717aSSrvTjh9vNzYb+t8Cf7uFNNtCUeLVk
 VNDaSoBcl8twr+j/v2ODKBwgBAQZxxOE/V/oT4GhgH9pNXZoJA020mDNPH5juLs3EOC8
 /rgVkgCN6RojW4Qhp6KdhqXAAH9EDbkhiVVTqT7E/g5egRFuPIUhFGuJEN3Haw2O1Qpf
 z4ZA==
X-Gm-Message-State: AAQBX9c+mJVRZYVE55JUs6az6tMUZL3zltdoXmFuN1/KmIN85ALYVhro
 l5lHOSMw4SBW7CjOoDI7bCvVpg==
X-Google-Smtp-Source: AKy350aIKWRcdeuaD5VOor3+xEbAvtomRWZp68SPoJjkpf1LICJxMmZuqnlZPUDXwpttxITEAu09JQ==
X-Received: by 2002:a17:902:d2c3:b0:1a1:cefd:aa1f with SMTP id
 n3-20020a170902d2c300b001a1cefdaa1fmr6474095plc.52.1680921811016; 
 Fri, 07 Apr 2023 19:43:31 -0700 (PDT)
Received: from stoup.. ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
 by smtp.gmail.com with ESMTPSA id
 d9-20020a170902c18900b0019d397b0f18sm3530780pld.214.2023.04.07.19.43.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Apr 2023 19:43:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH 16/42] tcg: Introduce tcg_out_movext
Date: Fri,  7 Apr 2023 19:42:48 -0700
Message-Id: <20230408024314.3357414-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230408024314.3357414-1-richard.henderson@linaro.org>
References: <20230408024314.3357414-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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
X-List-Received-Date: Sat, 08 Apr 2023 02:43:53 -0000

This is common code in most qemu_{ld,st} slow paths, extending the
input value for the store helper data argument or extending the
return value from the load helper.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c                        | 59 ++++++++++++++++++++++++++++++++
 tcg/aarch64/tcg-target.c.inc     |  8 ++---
 tcg/arm/tcg-target.c.inc         | 16 +++------
 tcg/i386/tcg-target.c.inc        | 30 +++-------------
 tcg/loongarch64/tcg-target.c.inc | 53 +++++-----------------------
 tcg/ppc/tcg-target.c.inc         | 38 ++++++--------------
 tcg/riscv/tcg-target.c.inc       | 13 ++-----
 tcg/s390x/tcg-target.c.inc       | 19 ++--------
 tcg/sparc64/tcg-target.c.inc     | 32 ++++-------------
 9 files changed, 100 insertions(+), 168 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index 0188152c37..6fe7dd6564 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -352,6 +352,65 @@ void tcg_raise_tb_overflow(TCGContext *s)
     siglongjmp(s->jmp_trans, -2);
 }
 
+/**
+ * tcg_out_movext -- move and extend
+ * @s: tcg context
+ * @dst_type: integral type for destination
+ * @dst: destination register
+ * @src_type: integral type for source
+ * @src_ext: extension to apply to source
+ * @src: source register
+ *
+ * Move or extend @src into @dst, depending on @src_ext and the types.
+ */
+static void __attribute__((unused))
+tcg_out_movext(TCGContext *s, TCGType dst_type, TCGReg dst,
+               TCGType src_type, MemOp src_ext, TCGReg src)
+{
+    switch (src_ext) {
+    case MO_UB:
+        tcg_out_ext8u(s, dst, src);
+        break;
+    case MO_SB:
+        tcg_out_ext8s(s, dst_type, dst, src);
+        break;
+    case MO_UW:
+        tcg_out_ext16u(s, dst, src);
+        break;
+    case MO_SW:
+        tcg_out_ext16s(s, dst_type, dst, src);
+        break;
+    case MO_UL:
+    case MO_SL:
+        if (dst_type == TCG_TYPE_I32) {
+            if (src_type == TCG_TYPE_I32) {
+                tcg_out_mov(s, TCG_TYPE_I32, dst, src);
+            } else {
+                tcg_out_extrl_i64_i32(s, dst, src);
+            }
+        } else if (src_type == TCG_TYPE_I32) {
+            if (src_ext & MO_SIGN) {
+                tcg_out_exts_i32_i64(s, dst, src);
+            } else {
+                tcg_out_extu_i32_i64(s, dst, src);
+            }
+        } else {
+            if (src_ext & MO_SIGN) {
+                tcg_out_ext32s(s, dst, src);
+            } else {
+                tcg_out_ext32u(s, dst, src);
+            }
+        }
+        break;
+    case MO_UQ:
+        tcg_debug_assert(TCG_TARGET_REG_BITS == 64);
+        tcg_out_mov(s, TCG_TYPE_I64, dst, src);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
 #define C_PFX1(P, A)                    P##A
 #define C_PFX2(P, A, B)                 P##A##_##B
 #define C_PFX3(P, A, B, C)              P##A##_##B##_##C
diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index bd1fab193e..29bc97ed1c 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -1620,7 +1620,6 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
 {
     MemOpIdx oi = lb->oi;
     MemOp opc = get_memop(oi);
-    MemOp size = opc & MO_SIZE;
 
     if (!reloc_pc19(lb->label_ptr[0], tcg_splitwx_to_rx(s->code_ptr))) {
         return false;
@@ -1631,12 +1630,9 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
     tcg_out_movi(s, TCG_TYPE_I32, TCG_REG_X2, oi);
     tcg_out_adr(s, TCG_REG_X3, lb->raddr);
     tcg_out_call_int(s, qemu_ld_helpers[opc & MO_SIZE]);
-    if (opc & MO_SIGN) {
-        tcg_out_sxt(s, lb->type, size, lb->datalo_reg, TCG_REG_X0);
-    } else {
-        tcg_out_mov(s, size == MO_64, lb->datalo_reg, TCG_REG_X0);
-    }
 
+    tcg_out_movext(s, lb->type, lb->datalo_reg,
+                   TCG_TYPE_REG, opc & MO_SSIZE, TCG_REG_X0);
     tcg_out_goto(s, lb->raddr);
     return true;
 }
diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index 1820655ee3..f865294861 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -1567,17 +1567,7 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
 
     datalo = lb->datalo_reg;
     datahi = lb->datahi_reg;
-    switch (opc & MO_SSIZE) {
-    case MO_SB:
-        tcg_out_ext8s(s, TCG_TYPE_I32, datalo, TCG_REG_R0);
-        break;
-    case MO_SW:
-        tcg_out_ext16s(s, TCG_TYPE_I32, datalo, TCG_REG_R0);
-        break;
-    default:
-        tcg_out_mov_reg(s, COND_AL, datalo, TCG_REG_R0);
-        break;
-    case MO_UQ:
+    if ((opc & MO_SIZE) == MO_64) {
         if (datalo != TCG_REG_R1) {
             tcg_out_mov_reg(s, COND_AL, datalo, TCG_REG_R0);
             tcg_out_mov_reg(s, COND_AL, datahi, TCG_REG_R1);
@@ -1589,7 +1579,9 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
             tcg_out_mov_reg(s, COND_AL, datahi, TCG_REG_R1);
             tcg_out_mov_reg(s, COND_AL, datalo, TCG_REG_TMP);
         }
-        break;
+    } else {
+        tcg_out_movext(s, TCG_TYPE_I32, lb->datalo_reg,
+                       TCG_TYPE_I32, opc & MO_SSIZE, TCG_REG_R0);
     }
 
     tcg_out_goto(s, COND_AL, lb->raddr);
diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 45b2054856..2d7c173a03 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -1946,28 +1946,8 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
     tcg_out_branch(s, 1, qemu_ld_helpers[opc & (MO_BSWAP | MO_SIZE)]);
 
     data_reg = l->datalo_reg;
-    switch (opc & MO_SSIZE) {
-    case MO_SB:
-        tcg_out_ext8s(s, l->type, data_reg, TCG_REG_EAX);
-        break;
-    case MO_SW:
-        tcg_out_ext16s(s, l->type, data_reg, TCG_REG_EAX);
-        break;
-#if TCG_TARGET_REG_BITS == 64
-    case MO_SL:
-        tcg_out_ext32s(s, data_reg, TCG_REG_EAX);
-        break;
-#endif
-    case MO_UB:
-    case MO_UW:
-        /* Note that the helpers have zero-extended to tcg_target_long.  */
-    case MO_UL:
-        tcg_out_mov(s, TCG_TYPE_I32, data_reg, TCG_REG_EAX);
-        break;
-    case MO_UQ:
-        if (TCG_TARGET_REG_BITS == 64) {
-            tcg_out_mov(s, TCG_TYPE_I64, data_reg, TCG_REG_RAX);
-        } else if (data_reg == TCG_REG_EDX) {
+    if (TCG_TARGET_REG_BITS == 32 && (opc & MO_SIZE) == MO_64) {
+        if (data_reg == TCG_REG_EDX) {
             /* xchg %edx, %eax */
             tcg_out_opc(s, OPC_XCHG_ax_r32 + TCG_REG_EDX, 0, 0, 0);
             tcg_out_mov(s, TCG_TYPE_I32, l->datahi_reg, TCG_REG_EAX);
@@ -1975,9 +1955,9 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
             tcg_out_mov(s, TCG_TYPE_I32, data_reg, TCG_REG_EAX);
             tcg_out_mov(s, TCG_TYPE_I32, l->datahi_reg, TCG_REG_EDX);
         }
-        break;
-    default:
-        g_assert_not_reached();
+    } else {
+        tcg_out_movext(s, l->type, data_reg,
+                       TCG_TYPE_REG, opc & MO_SSIZE, TCG_REG_EAX);
     }
 
     /* Jump to the code corresponding to next IR of qemu_st */
diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index b0e076c462..fc98b9b31b 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -893,7 +893,6 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
     MemOpIdx oi = l->oi;
     MemOp opc = get_memop(oi);
     MemOp size = opc & MO_SIZE;
-    TCGType type = l->type;
 
     /* resolve label address */
     if (!reloc_br_sk16(l->label_ptr[0], tcg_splitwx_to_rx(s->code_ptr))) {
@@ -908,28 +907,8 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 
     tcg_out_call_int(s, qemu_ld_helpers[size], false);
 
-    switch (opc & MO_SSIZE) {
-    case MO_SB:
-        tcg_out_ext8s(s, type, l->datalo_reg, TCG_REG_A0);
-        break;
-    case MO_SW:
-        tcg_out_ext16s(s, type, l->datalo_reg, TCG_REG_A0);
-        break;
-    case MO_SL:
-        tcg_out_ext32s(s, l->datalo_reg, TCG_REG_A0);
-        break;
-    case MO_UL:
-        if (type == TCG_TYPE_I32) {
-            /* MO_UL loads of i32 should be sign-extended too */
-            tcg_out_ext32s(s, l->datalo_reg, TCG_REG_A0);
-            break;
-        }
-        /* fallthrough */
-    default:
-        tcg_out_mov(s, type, l->datalo_reg, TCG_REG_A0);
-        break;
-    }
-
+    tcg_out_movext(s, l->type, l->datalo_reg,
+                   TCG_TYPE_REG, opc & MO_SSIZE, TCG_REG_A0);
     return tcg_out_goto(s, l->raddr);
 }
 
@@ -947,23 +926,8 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
     /* call store helper */
     tcg_out_mov(s, TCG_TYPE_PTR, TCG_REG_A0, TCG_AREG0);
     tcg_out_mov(s, TCG_TYPE_PTR, TCG_REG_A1, l->addrlo_reg);
-    switch (size) {
-    case MO_8:
-        tcg_out_ext8u(s, TCG_REG_A2, l->datalo_reg);
-        break;
-    case MO_16:
-        tcg_out_ext16u(s, TCG_REG_A2, l->datalo_reg);
-        break;
-    case MO_32:
-        tcg_out_ext32u(s, TCG_REG_A2, l->datalo_reg);
-        break;
-    case MO_64:
-        tcg_out_mov(s, TCG_TYPE_I64, TCG_REG_A2, l->datalo_reg);
-        break;
-    default:
-        g_assert_not_reached();
-        break;
-    }
+    tcg_out_movext(s, size == MO_64 ? TCG_TYPE_I32 : TCG_TYPE_I32, TCG_REG_A2,
+                   l->type, size, l->datalo_reg);
     tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_A3, oi);
     tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_A4, (tcg_target_long)l->raddr);
 
@@ -1140,7 +1104,7 @@ static void tcg_out_qemu_st_indexed(TCGContext *s, TCGReg data,
     }
 }
 
-static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args)
+static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, TCGType type)
 {
     TCGReg addr_regl;
     TCGReg data_regl;
@@ -1162,8 +1126,7 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args)
     tcg_out_tlb_load(s, addr_regl, oi, label_ptr, 0);
     base = tcg_out_zext_addr_if_32_bit(s, addr_regl, TCG_REG_TMP0);
     tcg_out_qemu_st_indexed(s, data_regl, base, TCG_REG_TMP2, opc);
-    add_qemu_ldst_label(s, 0, oi,
-                        0, /* type param is unused for stores */
+    add_qemu_ldst_label(s, 0, oi, type,
                         data_regl, addr_regl,
                         s->code_ptr, label_ptr);
 #else
@@ -1602,10 +1565,10 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         tcg_out_qemu_ld(s, args, TCG_TYPE_I64);
         break;
     case INDEX_op_qemu_st_i32:
-        tcg_out_qemu_st(s, args);
+        tcg_out_qemu_st(s, args, TCG_TYPE_I32);
         break;
     case INDEX_op_qemu_st_i64:
-        tcg_out_qemu_st(s, args);
+        tcg_out_qemu_st(s, args, TCG_TYPE_I64);
         break;
 
     case INDEX_op_mov_i32:  /* Always emitted via tcg_out_mov.  */
diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index 6fd309968e..612ad15bda 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -1970,10 +1970,6 @@ static const uint32_t qemu_stx_opc[(MO_SIZE + MO_BSWAP) + 1] = {
     [MO_BSWAP | MO_UQ] = STDBRX,
 };
 
-static const uint32_t qemu_exts_opc[4] = {
-    EXTSB, EXTSH, EXTSW, 0
-};
-
 #if defined (CONFIG_SOFTMMU)
 /* helper signature: helper_ld_mmu(CPUState *env, target_ulong addr,
  *                                 int mmu_idx, uintptr_t ra)
@@ -2167,11 +2163,9 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
     if (TCG_TARGET_REG_BITS == 32 && (opc & MO_SIZE) == MO_64) {
         tcg_out_mov(s, TCG_TYPE_I32, lo, TCG_REG_R4);
         tcg_out_mov(s, TCG_TYPE_I32, hi, TCG_REG_R3);
-    } else if (opc & MO_SIGN) {
-        uint32_t insn = qemu_exts_opc[opc & MO_SIZE];
-        tcg_out32(s, insn | RA(lo) | RS(TCG_REG_R3));
     } else {
-        tcg_out_mov(s, TCG_TYPE_REG, lo, TCG_REG_R3);
+        tcg_out_movext(s, lb->type, lo,
+                       TCG_TYPE_REG, opc & MO_SSIZE, TCG_REG_R3);
     }
 
     tcg_out_b(s, 0, lb->raddr);
@@ -2205,25 +2199,13 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
 
     lo = lb->datalo_reg;
     hi = lb->datahi_reg;
-    if (TCG_TARGET_REG_BITS == 32) {
-        switch (s_bits) {
-        case MO_64:
-            arg |= (TCG_TARGET_CALL_ARG_I64 == TCG_CALL_ARG_EVEN);
-            tcg_out_mov(s, TCG_TYPE_I32, arg++, hi);
-            /* FALLTHRU */
-        case MO_32:
-            tcg_out_mov(s, TCG_TYPE_I32, arg++, lo);
-            break;
-        default:
-            tcg_out_rlw(s, RLWINM, arg++, lo, 0, 32 - (8 << s_bits), 31);
-            break;
-        }
+    if (TCG_TARGET_REG_BITS == 32 && s_bits == MO_64) {
+        arg |= (TCG_TARGET_CALL_ARG_I64 == TCG_CALL_ARG_EVEN);
+        tcg_out_mov(s, TCG_TYPE_I32, arg++, hi);
+        tcg_out_mov(s, TCG_TYPE_I32, arg++, lo);
     } else {
-        if (s_bits == MO_64) {
-            tcg_out_mov(s, TCG_TYPE_I64, arg++, lo);
-        } else {
-            tcg_out_rld(s, RLDICL, arg++, lo, 0, 64 - (8 << s_bits));
-        }
+        tcg_out_movext(s, s_bits == MO_64 ? TCG_TYPE_I64 : TCG_TYPE_I32,
+                       arg++, lb->type, s_bits, lo);
     }
 
     tcg_out_movi(s, TCG_TYPE_I32, arg++, oi);
@@ -2370,8 +2352,8 @@ static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is_64)
         } else {
             insn = qemu_ldx_opc[opc & (MO_SIZE | MO_BSWAP)];
             tcg_out32(s, insn | TAB(datalo, rbase, addrlo));
-            insn = qemu_exts_opc[s_bits];
-            tcg_out32(s, insn | RA(datalo) | RS(datalo));
+            tcg_out_movext(s, TCG_TYPE_REG, datalo,
+                           TCG_TYPE_REG, opc & MO_SSIZE, datalo);
         }
     }
 
diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index 6af5c25f02..081782d8c6 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -1081,17 +1081,8 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
     /* call store helper */
     tcg_out_mov(s, TCG_TYPE_PTR, a0, TCG_AREG0);
     tcg_out_mov(s, TCG_TYPE_PTR, a1, l->addrlo_reg);
-    tcg_out_mov(s, TCG_TYPE_PTR, a2, l->datalo_reg);
-    switch (s_bits) {
-    case MO_8:
-        tcg_out_ext8u(s, a2, a2);
-        break;
-    case MO_16:
-        tcg_out_ext16u(s, a2, a2);
-        break;
-    default:
-        break;
-    }
+    tcg_out_movext(s, s_bits == MO_64 ? TCG_TYPE_I64 : TCG_TYPE_I32, a2,
+                   l->type, s_bits, l->datalo_reg);
     tcg_out_movi(s, TCG_TYPE_PTR, a3, oi);
     tcg_out_movi(s, TCG_TYPE_PTR, a4, (tcg_target_long)l->raddr);
 
diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index 360229cdd3..0578fce4d7 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -1809,6 +1809,7 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
     TCGReg data_reg = lb->datalo_reg;
     MemOpIdx oi = lb->oi;
     MemOp opc = get_memop(oi);
+    MemOp size = opc & MO_SIZE;
 
     if (!patch_reloc(lb->label_ptr[0], R_390_PC16DBL,
                      (intptr_t)tcg_splitwx_to_rx(s->code_ptr), 2)) {
@@ -1819,22 +1820,8 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
     if (TARGET_LONG_BITS == 64) {
         tcg_out_mov(s, TCG_TYPE_I64, TCG_REG_R3, addr_reg);
     }
-    switch (opc & MO_SIZE) {
-    case MO_UB:
-        tcg_out_ext8u(s, TCG_REG_R4, data_reg);
-        break;
-    case MO_UW:
-        tcg_out_ext16u(s, TCG_REG_R4, data_reg);
-        break;
-    case MO_UL:
-        tcg_out_ext32u(s, TCG_REG_R4, data_reg);
-        break;
-    case MO_UQ:
-        tcg_out_mov(s, TCG_TYPE_I64, TCG_REG_R4, data_reg);
-        break;
-    default:
-        g_assert_not_reached();
-    }
+    tcg_out_movext(s, size == MO_64 ? TCG_TYPE_I64 : TCG_TYPE_I32,
+                   TCG_REG_R4, lb->type, size, data_reg);
     tcg_out_movi(s, TCG_TYPE_I32, TCG_REG_R5, oi);
     tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_R6, (uintptr_t)lb->raddr);
     tcg_out_call_int(s, qemu_st_helpers[opc & (MO_BSWAP | MO_SIZE)]);
diff --git a/tcg/sparc64/tcg-target.c.inc b/tcg/sparc64/tcg-target.c.inc
index 18ddd6bb9f..99ba0fdc2b 100644
--- a/tcg/sparc64/tcg-target.c.inc
+++ b/tcg/sparc64/tcg-target.c.inc
@@ -917,26 +917,6 @@ static void tcg_out_mb(TCGContext *s, TCGArg a0)
 static const tcg_insn_unit *qemu_ld_trampoline[(MO_SSIZE | MO_BSWAP) + 1];
 static const tcg_insn_unit *qemu_st_trampoline[(MO_SIZE | MO_BSWAP) + 1];
 
-static void emit_extend(TCGContext *s, TCGReg r, int op)
-{
-    /* Emit zero extend of 8, 16 or 32 bit data as
-     * required by the MO_* value op; do nothing for 64 bit.
-     */
-    switch (op & MO_SIZE) {
-    case MO_8:
-        tcg_out_ext8u(s, r, r);
-        break;
-    case MO_16:
-        tcg_out_ext16u(s, r, r);
-        break;
-    case MO_32:
-        tcg_out_ext32u(s, r, r);
-        break;
-    case MO_64:
-        break;
-    }
-}
-
 static void build_trampolines(TCGContext *s)
 {
     static void * const qemu_ld_helpers[] = {
@@ -993,8 +973,6 @@ static void build_trampolines(TCGContext *s)
         }
         qemu_st_trampoline[i] = tcg_splitwx_to_rx(s->code_ptr);
 
-        emit_extend(s, TCG_REG_O2, i);
-
         /* Set the retaddr operand.  */
         tcg_out_mov(s, TCG_TYPE_PTR, TCG_REG_O4, TCG_REG_O7);
 
@@ -1341,7 +1319,7 @@ static void tcg_out_qemu_ld(TCGContext *s, TCGReg data, TCGReg addr,
 }
 
 static void tcg_out_qemu_st(TCGContext *s, TCGReg data, TCGReg addr,
-                            MemOpIdx oi)
+                            MemOpIdx oi, bool is64)
 {
     MemOp memop = get_memop(oi);
     tcg_insn_unit *label_ptr;
@@ -1367,7 +1345,9 @@ static void tcg_out_qemu_st(TCGContext *s, TCGReg data, TCGReg addr,
     /* TLB Miss.  */
 
     tcg_out_mov(s, TCG_TYPE_REG, TCG_REG_O1, addrz);
-    tcg_out_mov(s, TCG_TYPE_REG, TCG_REG_O2, data);
+    tcg_out_movext(s, (memop & MO_SIZE) == MO_64 ? TCG_TYPE_I64 : TCG_TYPE_I32,
+                   TCG_REG_O2, is64 ? TCG_TYPE_I64 : TCG_TYPE_I32,
+                   memop & MO_SIZE, data);
 
     func = qemu_st_trampoline[memop & (MO_BSWAP | MO_SIZE)];
     tcg_debug_assert(func != NULL);
@@ -1658,8 +1638,10 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         tcg_out_qemu_ld(s, a0, a1, a2, true);
         break;
     case INDEX_op_qemu_st_i32:
+        tcg_out_qemu_st(s, a0, a1, a2, false);
+        break;
     case INDEX_op_qemu_st_i64:
-        tcg_out_qemu_st(s, a0, a1, a2);
+        tcg_out_qemu_st(s, a0, a1, a2, true);
         break;
 
     case INDEX_op_ld32s_i64:
-- 
2.34.1


