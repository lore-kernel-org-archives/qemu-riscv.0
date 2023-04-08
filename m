Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pkyYY-0007ev-AB
	for mharc-qemu-riscv@gnu.org; Fri, 07 Apr 2023 22:43:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkyYX-0007dI-Ae
 for qemu-riscv@nongnu.org; Fri, 07 Apr 2023 22:43:57 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkyYA-0005hO-2I
 for qemu-riscv@nongnu.org; Fri, 07 Apr 2023 22:43:57 -0400
Received: by mail-pl1-x636.google.com with SMTP id q2so5250903pll.7
 for <qemu-riscv@nongnu.org>; Fri, 07 Apr 2023 19:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680921812;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hlH9Syu5nBco3hVib/PJ96sBJ5uHmafkdc2luPh0/Cc=;
 b=oyMP87kLU53OJi80NV9nSKfQvn3DkDtLju5WKWBQJrf8WGcM9PrpEArmw/MaQVOZJN
 t5VbhOkWanFrOifO8SmWlo81VxscNmxh/COmCd9UOFv6ogaJZAhiCD/CjnBjyvrc0AMc
 Yq6Rm0G+rnEz/t5uf8ldEFgLkHi9qxljKufGcKwSmx7vqc+t3lteltcv8dLVt6bMQR3S
 +nc+3VpmcyntP6kOdhHH/cI8drPFylTs7pJISWqxrUsDboVPNq7ljEB/Q/xGe61c9qfl
 u2quGFvURkYuHMZbUZizcj+fwS2l8saewHODbYoM/3++XHjETh6yJL+POJt4Vk0vrhqS
 aygg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680921812;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hlH9Syu5nBco3hVib/PJ96sBJ5uHmafkdc2luPh0/Cc=;
 b=J4IWX/anlrBErISCaSDlaNGzozszfMK5Wt/9DNBWTDGHVdiDebErGM+WAhJTK4Nptn
 zoyZvpqR0HKRBBHBmnKVvlJMNA9TOtvOC3qNV/3/ldP7hBnDuxJtDuO2bSgGH6pvHuVD
 /c4hWSgXUVCs1tzd5yMRXFQEvFH3XJYD2KnNF+85S6CkpnBI8WpFn4ggryXhZPz081w3
 NkVLxDOz4LtZ6h4IowyRJwT6BKFceydRhvk0pofqTqZWNAXdYOqnGjbWcXwnaVutwtS0
 uIqfDyQgZO0ki3rZm34CdM/ISg1+dGikVTGKkcAfQlNGZIqSt8Bpm678WtZ5eGFmFjDX
 6gaQ==
X-Gm-Message-State: AAQBX9chz1N7jphqybHqSAWgfNAJfppak7l828fjWV9Zj/4UB9k1WSUf
 WaIWv7KW5NjUGsRzxBZQH+VByw==
X-Google-Smtp-Source: AKy350bA430SzBtT7wrFMelu4U2c7uri8N1uo0MLGz2dkSmghCFxWWnF8o5fENEZ6rn7llbvCKxwzA==
X-Received: by 2002:a17:903:2310:b0:19e:ecaf:c4b4 with SMTP id
 d16-20020a170903231000b0019eecafc4b4mr6382021plh.4.1680921812651; 
 Fri, 07 Apr 2023 19:43:32 -0700 (PDT)
Received: from stoup.. ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
 by smtp.gmail.com with ESMTPSA id
 d9-20020a170902c18900b0019d397b0f18sm3530780pld.214.2023.04.07.19.43.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Apr 2023 19:43:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH 18/42] tcg: Introduce tcg_out_movext2
Date: Fri,  7 Apr 2023 19:42:50 -0700
Message-Id: <20230408024314.3357414-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230408024314.3357414-1-richard.henderson@linaro.org>
References: <20230408024314.3357414-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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
X-List-Received-Date: Sat, 08 Apr 2023 02:43:57 -0000

This is common code in most qemu_{ld,st} slow paths, moving two
registers when there may be overlap between sources and destinations.
At present, this is only used by 32-bit hosts for 64-bit data,
but will shortly be used for more than that.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c                 | 50 +++++++++++++++++++++++++++++++++++----
 tcg/arm/tcg-target.c.inc  | 34 +++++++-------------------
 tcg/i386/tcg-target.c.inc | 16 ++++---------
 3 files changed, 59 insertions(+), 41 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index d82d99e1b0..1c11f15bce 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -115,8 +115,7 @@ static void tcg_out_exts_i32_i64(TCGContext *s, TCGReg ret, TCGReg arg);
 static void tcg_out_extu_i32_i64(TCGContext *s, TCGReg ret, TCGReg arg);
 static void tcg_out_extrl_i64_i32(TCGContext *s, TCGReg ret, TCGReg arg);
 static void tcg_out_addi_ptr(TCGContext *s, TCGReg, TCGReg, tcg_target_long);
-static bool tcg_out_xchg(TCGContext *s, TCGType type, TCGReg r1, TCGReg r2)
-    __attribute__((unused));
+static bool tcg_out_xchg(TCGContext *s, TCGType type, TCGReg r1, TCGReg r2);
 static void tcg_out_exit_tb(TCGContext *s, uintptr_t arg);
 static void tcg_out_goto_tb(TCGContext *s, int which);
 static void tcg_out_op(TCGContext *s, TCGOpcode opc,
@@ -365,9 +364,8 @@ void tcg_raise_tb_overflow(TCGContext *s)
  *
  * Move or extend @src into @dst, depending on @src_ext and the types.
  */
-static void __attribute__((unused))
-tcg_out_movext(TCGContext *s, TCGType dst_type, TCGReg dst,
-               TCGType src_type, MemOp src_ext, TCGReg src)
+static void tcg_out_movext(TCGContext *s, TCGType dst_type, TCGReg dst,
+                           TCGType src_type, MemOp src_ext, TCGReg src)
 {
     switch (src_ext) {
     case MO_UB:
@@ -413,6 +411,48 @@ tcg_out_movext(TCGContext *s, TCGType dst_type, TCGReg dst,
     }
 }
 
+/**
+ * tcg_out_movext2 -- move and extend two pair
+ * @s: tcg context
+ * @d1_type: integral type for destination
+ * @d1: destination register
+ * @s1_type: integral type for source
+ * @s1_ext: extension to apply to source
+ * @s1: source register
+ * @d2_type: integral type for destination
+ * @d2: destination register
+ * @s2_type: integral type for source
+ * @s2_ext: extension to apply to source
+ * @s2: source register
+ * @scratch: temporary register, or -1 for none
+ *
+ * As tcg_out_movext, for both s1->d1 and s2->d2, caring for overlap
+ * between the sources and destinations.
+ */
+static void __attribute__((unused))
+tcg_out_movext2(TCGContext *s, TCGType d1_type, TCGReg d1, TCGType s1_type,
+                MemOp s1_ext, TCGReg s1, TCGType d2_type, TCGReg d2,
+                TCGType s2_type, MemOp s2_ext, TCGReg s2, int scratch)
+{
+    if (d1 != s2) {
+        tcg_out_movext(s, d1_type, d1, s1_type, s1_ext, s1);
+        tcg_out_movext(s, d2_type, d2, s2_type, s2_ext, s2);
+        return;
+    }
+    if (d2 == s1) {
+        if (tcg_out_xchg(s, MAX(s1_type, s2_type), s1, s2)) {
+            /* The data is now in the correct registers, now extend. */
+            s1 = d1, s2 = d2;
+        } else {
+            tcg_debug_assert(scratch >= 0);
+            tcg_out_mov(s, s1_type, scratch, s1);
+            s1 = scratch;
+        }
+    }
+    tcg_out_movext(s, d2_type, d2, s2_type, s2_ext, s2);
+    tcg_out_movext(s, d1_type, d1, s1_type, s1_ext, s1);
+}
+
 #define C_PFX1(P, A)                    P##A
 #define C_PFX2(P, A, B)                 P##A##_##B
 #define C_PFX3(P, A, B, C)              P##A##_##B##_##C
diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index 4a5d57a41c..bad1e6d399 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -1545,7 +1545,7 @@ static void add_qemu_ldst_label(TCGContext *s, bool is_ld, MemOpIdx oi,
 
 static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
 {
-    TCGReg argreg, datalo, datahi;
+    TCGReg argreg;
     MemOpIdx oi = lb->oi;
     MemOp opc = get_memop(oi);
 
@@ -1565,20 +1565,11 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
     /* Use the canonical unsigned helpers and minimize icache usage. */
     tcg_out_call_int(s, qemu_ld_helpers[opc & MO_SIZE]);
 
-    datalo = lb->datalo_reg;
-    datahi = lb->datahi_reg;
     if ((opc & MO_SIZE) == MO_64) {
-        if (datalo != TCG_REG_R1) {
-            tcg_out_mov_reg(s, COND_AL, datalo, TCG_REG_R0);
-            tcg_out_mov_reg(s, COND_AL, datahi, TCG_REG_R1);
-        } else if (datahi != TCG_REG_R0) {
-            tcg_out_mov_reg(s, COND_AL, datahi, TCG_REG_R1);
-            tcg_out_mov_reg(s, COND_AL, datalo, TCG_REG_R0);
-        } else {
-            tcg_out_mov_reg(s, COND_AL, TCG_REG_TMP, TCG_REG_R0);
-            tcg_out_mov_reg(s, COND_AL, datahi, TCG_REG_R1);
-            tcg_out_mov_reg(s, COND_AL, datalo, TCG_REG_TMP);
-        }
+        tcg_out_movext2(s, TCG_TYPE_I32, lb->datalo_reg,
+                        TCG_TYPE_I32, MO_UL, TCG_REG_R0,
+                        TCG_TYPE_I32, lb->datahi_reg,
+                        TCG_TYPE_I32, MO_UL, TCG_REG_R1, TCG_REG_TMP);
     } else {
         tcg_out_movext(s, TCG_TYPE_I32, lb->datalo_reg,
                        TCG_TYPE_I32, opc & MO_SSIZE, TCG_REG_R0);
@@ -1663,17 +1654,10 @@ static bool tcg_out_fail_alignment(TCGContext *s, TCGLabelQemuLdst *l)
 
     if (TARGET_LONG_BITS == 64) {
         /* 64-bit target address is aligned into R2:R3. */
-        if (l->addrhi_reg != TCG_REG_R2) {
-            tcg_out_mov(s, TCG_TYPE_I32, TCG_REG_R2, l->addrlo_reg);
-            tcg_out_mov(s, TCG_TYPE_I32, TCG_REG_R3, l->addrhi_reg);
-        } else if (l->addrlo_reg != TCG_REG_R3) {
-            tcg_out_mov(s, TCG_TYPE_I32, TCG_REG_R3, l->addrhi_reg);
-            tcg_out_mov(s, TCG_TYPE_I32, TCG_REG_R2, l->addrlo_reg);
-        } else {
-            tcg_out_mov(s, TCG_TYPE_I32, TCG_REG_R1, TCG_REG_R2);
-            tcg_out_mov(s, TCG_TYPE_I32, TCG_REG_R2, TCG_REG_R3);
-            tcg_out_mov(s, TCG_TYPE_I32, TCG_REG_R3, TCG_REG_R1);
-        }
+        tcg_out_movext2(s, TCG_TYPE_I32, TCG_REG_R2,
+                        TCG_TYPE_I32, MO_UL, l->addrlo_reg,
+                        TCG_TYPE_I32, TCG_REG_R3,
+                        TCG_TYPE_I32, MO_UL, l->addrhi_reg, TCG_REG_TMP);
     } else {
         tcg_out_mov(s, TCG_TYPE_I32, TCG_REG_R1, l->addrlo_reg);
     }
diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 7d6bf30747..54465c7f46 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -1916,7 +1916,6 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 {
     MemOpIdx oi = l->oi;
     MemOp opc = get_memop(oi);
-    TCGReg data_reg;
     tcg_insn_unit **label_ptr = &l->label_ptr[0];
 
     /* resolve label address */
@@ -1953,18 +1952,13 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 
     tcg_out_branch(s, 1, qemu_ld_helpers[opc & (MO_BSWAP | MO_SIZE)]);
 
-    data_reg = l->datalo_reg;
     if (TCG_TARGET_REG_BITS == 32 && (opc & MO_SIZE) == MO_64) {
-        if (data_reg == TCG_REG_EDX) {
-            /* xchg %edx, %eax */
-            tcg_out_opc(s, OPC_XCHG_ax_r32 + TCG_REG_EDX, 0, 0, 0);
-            tcg_out_mov(s, TCG_TYPE_I32, l->datahi_reg, TCG_REG_EAX);
-        } else {
-            tcg_out_mov(s, TCG_TYPE_I32, data_reg, TCG_REG_EAX);
-            tcg_out_mov(s, TCG_TYPE_I32, l->datahi_reg, TCG_REG_EDX);
-        }
+        tcg_out_movext2(s, TCG_TYPE_I32, l->datalo_reg,
+                        TCG_TYPE_I32, MO_UL, TCG_REG_EAX,
+                        TCG_TYPE_I32, l->datahi_reg,
+                        TCG_TYPE_I32, MO_UL, TCG_REG_EDX, -1);
     } else {
-        tcg_out_movext(s, l->type, data_reg,
+        tcg_out_movext(s, l->type, l->datalo_reg,
                        TCG_TYPE_REG, opc & MO_SSIZE, TCG_REG_EAX);
     }
 
-- 
2.34.1


