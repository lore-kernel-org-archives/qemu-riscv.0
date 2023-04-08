Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pkyZT-0001ct-KN
	for mharc-qemu-riscv@gnu.org; Fri, 07 Apr 2023 22:44:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkyZ1-0008Qx-CF
 for qemu-riscv@nongnu.org; Fri, 07 Apr 2023 22:44:29 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkyYM-0005pq-2l
 for qemu-riscv@nongnu.org; Fri, 07 Apr 2023 22:44:27 -0400
Received: by mail-pl1-x631.google.com with SMTP id h24so511789plr.1
 for <qemu-riscv@nongnu.org>; Fri, 07 Apr 2023 19:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680921824;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0kMYkgC6gxFnjP17fEzYh5Pm8QnRqJDbIA3PjSDC28Y=;
 b=Wkp3elV7ApVyCFwy+o08LeWwUh6tdHs3dPllaIfDWnErqoU6hF0aGxVjT196g+NmNm
 I1pMWjinMMk5d+BP4+l8IenQcon4pk7jzttre3HrVzfFbTFvNBIA8ggXYb1P23Ixe6/h
 Ng5+B699/IRBRNN+M4IK1A5iDQ0/JAokb15IEi8fXJezPyrsnao7KOwirQ8ejz9XUqWQ
 uG/OXTcFhnNBGmud1xGfeLVFNR1q1pvbSiQz8sK7SISiE1SQ+TV4GFiqElZoUcLVxtB0
 6qFJB/pEbNUgP6nqlrjN5jCtOZlUgUTMIx9EYJuH6vXyfUaqk7eCHlsdX8M3i0RX6AqM
 +QAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680921824;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0kMYkgC6gxFnjP17fEzYh5Pm8QnRqJDbIA3PjSDC28Y=;
 b=dqaZyPunkM22doVeMxRpXt8CwzV+0UeyG4Ixlq2N+yLov7UOQ9387q3hicMFOqjG3G
 QOnWuIkYIwiOEiwWcjvIZOnDscpHLkRICnQ18yjb7I+pT7k/76Agiq3X3ftkn65CR7x8
 jkPMLoGtVw2n0rHNKrN17GFpQ3yEXLMkCsCWzxOxsQ5YnVoPKoEs/Uf2Yi89OyVnm1eD
 /2btAq9aHRO1ErfQ9EeyyjSgJgyWEi0B55AjgdGAvti1BsEziKUGabhsgeRpP4XRCzjm
 miOD9LdxWHQWTbk0JAz8x7iVDn7ppONXTAuLy2s0jvvlNuRsv4TxxGrUYDFFjBGQrnOC
 KOoA==
X-Gm-Message-State: AAQBX9cRWZ5sNOai7Sszy24mvb722an8fv/d7ZXnAWjzwn9uxY5gPdgv
 wvVRZjyz/SWjXVacaxvpEz8qoA==
X-Google-Smtp-Source: AKy350a4tII6yiAwF+SThikNpbeIFLMkfG1L5mZBdiWue3vhJcJWiQOSqQj1zJyM2xWnjEjna1SsIQ==
X-Received: by 2002:a17:90a:198:b0:235:9d0c:6e3f with SMTP id
 24-20020a17090a019800b002359d0c6e3fmr4826427pjc.31.1680921824181; 
 Fri, 07 Apr 2023 19:43:44 -0700 (PDT)
Received: from stoup.. ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
 by smtp.gmail.com with ESMTPSA id
 d9-20020a170902c18900b0019d397b0f18sm3530780pld.214.2023.04.07.19.43.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Apr 2023 19:43:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH 31/42] tcg: Introduce tcg_out_st_helper_args
Date: Fri,  7 Apr 2023 19:43:03 -0700
Message-Id: <20230408024314.3357414-33-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230408024314.3357414-1-richard.henderson@linaro.org>
References: <20230408024314.3357414-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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

Centralize the logic to call the helper_stN_mmu functions.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c                        | 189 ++++++++++++++++++++++++++++++-
 tcg/aarch64/tcg-target.c.inc     |  24 ++--
 tcg/arm/tcg-target.c.inc         | 106 ++---------------
 tcg/i386/tcg-target.c.inc        |  51 +--------
 tcg/loongarch64/tcg-target.c.inc |  11 +-
 tcg/mips/tcg-target.c.inc        | 109 ++----------------
 tcg/ppc/tcg-target.c.inc         |  40 ++-----
 tcg/riscv/tcg-target.c.inc       |  18 +--
 tcg/s390x/tcg-target.c.inc       |  15 +--
 9 files changed, 229 insertions(+), 334 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index e67b80aeeb..bd6676be69 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -184,6 +184,11 @@ static int tcg_out_ld_helper_args(TCGContext *s, const TCGLabelQemuLdst *l,
                                   void (*ra_gen)(TCGContext *s, TCGReg r),
                                   int ra_reg, int scratch_reg)
     __attribute__((unused));
+static int tcg_out_st_helper_args(TCGContext *s, const TCGLabelQemuLdst *l,
+                                  void (*ra_gen)(TCGContext *s, TCGReg r),
+                                  int ra_reg, int t1_reg,
+                                  int t2_reg, int t3_reg)
+    __attribute__((unused));
 
 TCGContext tcg_init_ctx;
 __thread TCGContext *tcg_ctx;
@@ -5073,8 +5078,8 @@ static int tcg_out_helper_arg_ra(TCGContext *s, unsigned d_arg,
 }
 
 /*
- * Poor man's topological sort on 2 source+destination register pairs.
- * This is a simplified version of tcg_out_movext2 for 32-bit hosts.
+ * Poor man's topological sort on up to 4 source+destination register pairs.
+ * This first is a simplified version of tcg_out_movext2 for 32-bit hosts.
  */
 static void tcg_out_mov_32x2(TCGContext *s, TCGReg d1, TCGReg s1,
                              TCGReg d2, TCGReg s2, int t1)
@@ -5098,6 +5103,67 @@ static void tcg_out_mov_32x2(TCGContext *s, TCGReg d1, TCGReg s1,
     tcg_out_mov(s, TCG_TYPE_I32, d1, s1);
 }
 
+static void tcg_out_mov_32x3(TCGContext *s, TCGReg d1, TCGReg s1,
+                             TCGReg d2, TCGReg s2,
+                             TCGReg d3, TCGReg s3, int t1, int t2)
+{
+    tcg_debug_assert(TCG_TARGET_REG_BITS == 32);
+    tcg_debug_assert(t2 >= 0);
+
+    if (d1 != s2 && d1 != s3) {
+        tcg_out_mov(s, TCG_TYPE_I32, d1, s1);
+        tcg_out_mov_32x2(s, d3, s3, d2, s2, t1);
+        return;
+    }
+    if (d2 != s1 && d2 != s3) {
+        tcg_out_mov(s, TCG_TYPE_I32, d2, s2);
+        tcg_out_mov_32x2(s, d1, s1, d3, s3, t1);
+        return;
+    }
+    if (d3 != s1 && d3 != s2) {
+        tcg_out_mov(s, TCG_TYPE_I32, d3, s3);
+        tcg_out_mov_32x2(s, d1, s1, d2, s2, t1);
+        return;
+    }
+    tcg_out_mov(s, TCG_TYPE_I32, t2, s3);
+    tcg_out_mov_32x2(s, d1, s1, d2, s2, t1);
+    tcg_out_mov(s, TCG_TYPE_I32, d3, t2);
+}
+
+static void tcg_out_mov_32x4(TCGContext *s, TCGReg d1, TCGReg s1,
+                             TCGReg d2, TCGReg s2,
+                             TCGReg d3, TCGReg s3,
+                             TCGReg d4, TCGReg s4,
+                             int t1, int t2, int t3)
+{
+    tcg_debug_assert(TCG_TARGET_REG_BITS == 32);
+    tcg_debug_assert(t3 >= 0);
+
+    if (d1 != s2 && d1 != s3 && d1 != s4) {
+        tcg_out_mov(s, TCG_TYPE_I32, d1, s1);
+        tcg_out_mov_32x3(s, d4, s4, d2, s2, d3, s3, t1, t2);
+        return;
+    }
+    if (d2 != s1 && d2 != s3 && d2 != s4) {
+        tcg_out_mov(s, TCG_TYPE_I32, d2, s2);
+        tcg_out_mov_32x3(s, d1, s1, d4, s4, d3, s3, t1, t2);
+        return;
+    }
+    if (d3 != s1 && d3 != s2 && d3 != s4) {
+        tcg_out_mov(s, TCG_TYPE_I32, d3, s3);
+        tcg_out_mov_32x3(s, d1, s1, d2, s2, d4, s4, t1, t2);
+        return;
+    }
+    if (d4 != s1 && d4 != s2 && d4 != s3) {
+        tcg_out_mov(s, TCG_TYPE_I32, d4, s4);
+        tcg_out_mov_32x3(s, d1, s1, d2, s2, d3, s3, t1, t2);
+        return;
+    }
+    tcg_out_mov(s, TCG_TYPE_I32, t3, s4);
+    tcg_out_mov_32x3(s, d1, s1, d2, s2, d3, s3, t1, t2);
+    tcg_out_mov(s, TCG_TYPE_I32, d4, t3);
+}
+
 static void tcg_out_helper_arg_32x2(TCGContext *s, unsigned d_arg,
                                     TCGReg lo_reg, TCGReg hi_reg,
                                     int scratch_reg)
@@ -5160,6 +5226,125 @@ static int tcg_out_ld_helper_args(TCGContext *s, const TCGLabelQemuLdst *l,
                                  (uintptr_t)l->raddr, scratch_reg);
 }
 
+static int tcg_out_st_helper_args(TCGContext *s, const TCGLabelQemuLdst *l,
+                                  void (*ra_gen)(TCGContext *s, TCGReg r),
+                                  int ra_reg, int t1_reg,
+                                  int t2_reg, int t3_reg)
+{
+    MemOp size = get_memop(l->oi) & MO_SIZE;
+    /* These are the types of the helper_stX_mmu 'addr' and 'val' arguments. */
+    TCGType a_type = TARGET_LONG_BITS == 32 ? TCG_TYPE_I32 : TCG_TYPE_I64;
+    TCGType d_type = size == MO_64 ? TCG_TYPE_I64 : TCG_TYPE_I32;
+    MemOp a_mo = TARGET_LONG_BITS == 32 ? MO_32 : MO_64;
+    MemOp p_mo = sizeof(void *) == 4 ? MO_32 : MO_64;
+    /* Begin by skipping the env argument. */
+    int arg = 1;
+    int a_arg, d_arg;
+
+    if (TCG_TARGET_REG_BITS >= TARGET_LONG_BITS) {
+        a_arg = arg++;
+    } else {
+        if (TCG_TARGET_CALL_ARG_I64 == TCG_CALL_ARG_EVEN) {
+            arg += arg & 1;
+        }
+        a_arg = arg;
+        arg += 2;
+    }
+    if (TCG_TARGET_REG_BITS == 64 || d_type == TCG_TYPE_I32) {
+        d_arg = arg++;
+    } else {
+        if (TCG_TARGET_CALL_ARG_I64 == TCG_CALL_ARG_EVEN) {
+            arg += arg & 1;
+        }
+        d_arg = arg;
+        arg += 2;
+    }
+
+    if (arg == 3) {
+        /* Two simple arguments. */
+        if (in_iarg_reg(d_arg)) {
+            /* Both arguments are in registers. */
+            if (TCG_TARGET_CALL_ARG_I32 == TCG_CALL_ARG_EXTEND) {
+                a_type = TCG_TYPE_REG;
+                d_type = TCG_TYPE_REG;
+            }
+            tcg_out_movext2(s, a_type, tcg_target_call_iarg_regs[a_arg],
+                            a_type, a_mo, l->addrlo_reg,
+                            d_type, tcg_target_call_iarg_regs[d_arg],
+                            l->type, size, l->datalo_reg,
+                            t1_reg);
+        } else {
+            /* At least data argument is on the stack. */
+            tcg_out_helper_arg(s, d_type, d_arg, l->type, size,
+                               l->datalo_reg, t1_reg);
+            tcg_out_helper_arg(s, a_type, arg, a_type, a_mo,
+                               l->addrlo_reg, t1_reg);
+        }
+    } else if (!in_iarg_reg(d_arg)) {
+        /*
+         * The data registers are on the stack. Store them first so that
+         * we are sure they are out of the way of the address registers.
+         */
+        if (size != MO_64) {
+            tcg_out_helper_arg(s, TCG_TYPE_I32, d_arg, TCG_TYPE_I32,
+                               size, l->datalo_reg, t1_reg);
+        } else {
+            tcg_out_helper_arg_32x2(s, d_arg, l->datalo_reg,
+                                    l->datahi_reg, t1_reg);
+        }
+        if (TARGET_LONG_BITS == 32) {
+            tcg_out_helper_arg(s, a_type, a_arg, a_type, a_mo,
+                               l->addrlo_reg, t1_reg);
+        } else {
+            tcg_out_helper_arg_32x2(s, d_arg, l->addrlo_reg,
+                                    l->addrhi_reg, t1_reg);
+        }
+    } else {
+        tcg_debug_assert(arg <= ARRAY_SIZE(tcg_target_call_iarg_regs));
+        if (TARGET_LONG_BITS == 32) {
+            tcg_debug_assert(d_type == TCG_TYPE_I64);
+            TCGReg a = tcg_target_call_iarg_regs[a_arg];
+            TCGReg dl = tcg_target_call_iarg_regs[d_arg + HOST_BIG_ENDIAN];
+            TCGReg dh = tcg_target_call_iarg_regs[d_arg + !HOST_BIG_ENDIAN];
+
+            tcg_out_mov_32x3(s, a, l->addrlo_reg,
+                             dl, l->datalo_reg,
+                             dh, l->datahi_reg, t1_reg, t2_reg);
+        } else if (d_type == TCG_TYPE_I32) {
+            TCGReg al = tcg_target_call_iarg_regs[a_arg + HOST_BIG_ENDIAN];
+            TCGReg ah = tcg_target_call_iarg_regs[a_arg + !HOST_BIG_ENDIAN];
+            TCGReg d = tcg_target_call_iarg_regs[d_arg];
+
+            tcg_out_mov_32x3(s, al, l->addrlo_reg,
+                             ah, l->addrhi_reg,
+                             d, l->datalo_reg, t1_reg, t2_reg);
+        } else {
+            TCGReg al = tcg_target_call_iarg_regs[a_arg + HOST_BIG_ENDIAN];
+            TCGReg ah = tcg_target_call_iarg_regs[a_arg + !HOST_BIG_ENDIAN];
+            TCGReg dl = tcg_target_call_iarg_regs[d_arg + HOST_BIG_ENDIAN];
+            TCGReg dh = tcg_target_call_iarg_regs[d_arg + !HOST_BIG_ENDIAN];
+
+            tcg_out_mov_32x4(s, al, l->addrlo_reg,
+                             ah, l->addrhi_reg,
+                             dl, l->datalo_reg,
+                             dh, l->datahi_reg,
+                             t1_reg, t2_reg, t3_reg);
+        }
+    }
+
+    /* Handle env.  Always the first argument.  */
+    tcg_out_helper_arg(s, TCG_TYPE_PTR, 0,
+                       TCG_TYPE_PTR, p_mo, TCG_AREG0, t1_reg);
+
+    /* Handle oi. */
+    tcg_out_helper_arg_im(s, TCG_TYPE_I32, arg, l->oi, t1_reg);
+    arg++;
+
+    /* Handle ra. Return any register holding it for use by tail call.  */
+    return tcg_out_helper_arg_ra(s, arg, ra_gen, ra_reg,
+                                 (uintptr_t)l->raddr, t1_reg);
+}
+
 #ifdef CONFIG_PROFILER
 
 /* avoid copy/paste errors */
diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index f983900669..e1430f3a55 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -1580,13 +1580,6 @@ static void tcg_out_cltz(TCGContext *s, TCGType ext, TCGReg d,
     }
 }
 
-static void tcg_out_adr(TCGContext *s, TCGReg rd, const void *target)
-{
-    ptrdiff_t offset = tcg_pcrel_diff(s, target);
-    tcg_debug_assert(offset == sextract64(offset, 0, 21));
-    tcg_out_insn(s, 3406, ADR, rd, offset);
-}
-
 #ifdef CONFIG_SOFTMMU
 /* helper signature: helper_ret_ld_mmu(CPUState *env, target_ulong addr,
  *                                     MemOpIdx oi, uintptr_t ra)
@@ -1640,19 +1633,13 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
 
 static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
 {
-    MemOpIdx oi = lb->oi;
-    MemOp opc = get_memop(oi);
-    MemOp size = opc & MO_SIZE;
+    MemOp opc = get_memop(lb->oi);
 
     if (!reloc_pc19(lb->label_ptr[0], tcg_splitwx_to_rx(s->code_ptr))) {
         return false;
     }
 
-    tcg_out_mov(s, TCG_TYPE_PTR, TCG_REG_X0, TCG_AREG0);
-    tcg_out_mov(s, TARGET_LONG_BITS == 64, TCG_REG_X1, lb->addrlo_reg);
-    tcg_out_mov(s, size == MO_64, TCG_REG_X2, lb->datalo_reg);
-    tcg_out_movi(s, TCG_TYPE_I32, TCG_REG_X3, oi);
-    tcg_out_adr(s, TCG_REG_X4, lb->raddr);
+    tcg_out_st_helper_args(s, lb, NULL, -1, TCG_REG_TMP, -1, -1);
     tcg_out_call_int(s, qemu_st_helpers[opc & MO_SIZE]);
     tcg_out_goto(s, lb->raddr);
     return true;
@@ -1764,6 +1751,13 @@ static void tcg_out_test_alignment(TCGContext *s, bool is_ld, TCGReg addr_reg,
     label->raddr = tcg_splitwx_to_rx(s->code_ptr);
 }
 
+static void tcg_out_adr(TCGContext *s, TCGReg rd, const void *target)
+{
+    ptrdiff_t offset = tcg_pcrel_diff(s, target);
+    tcg_debug_assert(offset == sextract64(offset, 0, 21));
+    tcg_out_insn(s, 3406, ADR, rd, offset);
+}
+
 static bool tcg_out_fail_alignment(TCGContext *s, TCGLabelQemuLdst *l)
 {
     if (!reloc_pc19(l->label_ptr[0], tcg_splitwx_to_rx(s->code_ptr))) {
diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index b187d5b28f..64fb5a1c27 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -690,8 +690,8 @@ tcg_out_ldrd_rwb(TCGContext *s, ARMCond cond, TCGReg rt, TCGReg rn, TCGReg rm)
     tcg_out_memop_r(s, cond, INSN_LDRD_REG, rt, rn, rm, 1, 1, 1);
 }
 
-static void tcg_out_strd_8(TCGContext *s, ARMCond cond, TCGReg rt,
-                           TCGReg rn, int imm8)
+static void __attribute__((unused))
+tcg_out_strd_8(TCGContext *s, ARMCond cond, TCGReg rt, TCGReg rn, int imm8)
 {
     tcg_out_memop_8(s, cond, INSN_STRD_IMM, rt, rn, imm8, 1, 0);
 }
@@ -969,28 +969,16 @@ static void tcg_out_ext8u(TCGContext *s, TCGReg rd, TCGReg rn)
     tcg_out_dat_imm(s, COND_AL, ARITH_AND, rd, rn, 0xff);
 }
 
-static void __attribute__((unused))
-tcg_out_ext8u_cond(TCGContext *s, ARMCond cond, TCGReg rd, TCGReg rn)
-{
-    tcg_out_dat_imm(s, cond, ARITH_AND, rd, rn, 0xff);
-}
-
 static void tcg_out_ext16s(TCGContext *s, TCGType t, TCGReg rd, TCGReg rn)
 {
     /* sxth */
     tcg_out32(s, 0x06bf0070 | (COND_AL << 28) | (rd << 12) | rn);
 }
 
-static void tcg_out_ext16u_cond(TCGContext *s, ARMCond cond,
-                                TCGReg rd, TCGReg rn)
-{
-    /* uxth */
-    tcg_out32(s, 0x06ff0070 | (cond << 28) | (rd << 12) | rn);
-}
-
 static void tcg_out_ext16u(TCGContext *s, TCGReg rd, TCGReg rn)
 {
-    tcg_out_ext16u_cond(s, COND_AL, rd, rn);
+    /* uxth */
+    tcg_out32(s, 0x06ff0070 | (COND_AL << 28) | (rd << 12) | rn);
 }
 
 static void tcg_out_ext32s(TCGContext *s, TCGReg rd, TCGReg rn)
@@ -1375,58 +1363,6 @@ static void * const qemu_st_helpers[MO_SIZE + 1] = {
 #endif
 };
 
-/* Helper routines for marshalling helper function arguments into
- * the correct registers and stack.
- * argreg is where we want to put this argument, arg is the argument itself.
- * Return value is the updated argreg ready for the next call.
- * Note that argreg 0..3 is real registers, 4+ on stack.
- *
- * We provide routines for arguments which are: immediate, 32 bit
- * value in register, 16 and 8 bit values in register (which must be zero
- * extended before use) and 64 bit value in a lo:hi register pair.
- */
-#define DEFINE_TCG_OUT_ARG(NAME, ARGTYPE, MOV_ARG, EXT_ARG)                \
-static TCGReg NAME(TCGContext *s, TCGReg argreg, ARGTYPE arg)              \
-{                                                                          \
-    if (argreg < 4) {                                                      \
-        MOV_ARG(s, COND_AL, argreg, arg);                                  \
-    } else {                                                               \
-        int ofs = (argreg - 4) * 4;                                        \
-        EXT_ARG;                                                           \
-        tcg_debug_assert(ofs + 4 <= TCG_STATIC_CALL_ARGS_SIZE);            \
-        tcg_out_st32_12(s, COND_AL, arg, TCG_REG_CALL_STACK, ofs);         \
-    }                                                                      \
-    return argreg + 1;                                                     \
-}
-
-DEFINE_TCG_OUT_ARG(tcg_out_arg_imm32, uint32_t, tcg_out_movi32,
-    (tcg_out_movi32(s, COND_AL, TCG_REG_TMP, arg), arg = TCG_REG_TMP))
-DEFINE_TCG_OUT_ARG(tcg_out_arg_reg8, TCGReg, tcg_out_ext8u_cond,
-    (tcg_out_ext8u_cond(s, COND_AL, TCG_REG_TMP, arg), arg = TCG_REG_TMP))
-DEFINE_TCG_OUT_ARG(tcg_out_arg_reg16, TCGReg, tcg_out_ext16u_cond,
-    (tcg_out_ext16u_cond(s, COND_AL, TCG_REG_TMP, arg), arg = TCG_REG_TMP))
-DEFINE_TCG_OUT_ARG(tcg_out_arg_reg32, TCGReg, tcg_out_mov_reg, )
-
-static TCGReg tcg_out_arg_reg64(TCGContext *s, TCGReg argreg,
-                                TCGReg arglo, TCGReg arghi)
-{
-    /* 64 bit arguments must go in even/odd register pairs
-     * and in 8-aligned stack slots.
-     */
-    if (argreg & 1) {
-        argreg++;
-    }
-    if (argreg >= 4 && (arglo & 1) == 0 && arghi == arglo + 1) {
-        tcg_out_strd_8(s, COND_AL, arglo,
-                       TCG_REG_CALL_STACK, (argreg - 4) * 4);
-        return argreg + 2;
-    } else {
-        argreg = tcg_out_arg_reg32(s, argreg, arglo);
-        argreg = tcg_out_arg_reg32(s, argreg, arghi);
-        return argreg;
-    }
-}
-
 #define TLB_SHIFT	(CPU_TLB_ENTRY_BITS + CPU_TLB_BITS)
 
 /* We expect to use an 9-bit sign-magnitude negative offset from ENV.  */
@@ -1574,42 +1510,14 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
 
 static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
 {
-    TCGReg argreg, datalo, datahi;
-    MemOpIdx oi = lb->oi;
-    MemOp opc = get_memop(oi);
+    MemOp opc = get_memop(lb->oi);
 
     if (!reloc_pc24(lb->label_ptr[0], tcg_splitwx_to_rx(s->code_ptr))) {
         return false;
     }
 
-    argreg = TCG_REG_R0;
-    argreg = tcg_out_arg_reg32(s, argreg, TCG_AREG0);
-    if (TARGET_LONG_BITS == 64) {
-        argreg = tcg_out_arg_reg64(s, argreg, lb->addrlo_reg, lb->addrhi_reg);
-    } else {
-        argreg = tcg_out_arg_reg32(s, argreg, lb->addrlo_reg);
-    }
-
-    datalo = lb->datalo_reg;
-    datahi = lb->datahi_reg;
-    switch (opc & MO_SIZE) {
-    case MO_8:
-        argreg = tcg_out_arg_reg8(s, argreg, datalo);
-        break;
-    case MO_16:
-        argreg = tcg_out_arg_reg16(s, argreg, datalo);
-        break;
-    case MO_32:
-    default:
-        argreg = tcg_out_arg_reg32(s, argreg, datalo);
-        break;
-    case MO_64:
-        argreg = tcg_out_arg_reg64(s, argreg, datalo, datahi);
-        break;
-    }
-
-    argreg = tcg_out_arg_imm32(s, argreg, oi);
-    argreg = tcg_out_arg_reg32(s, argreg, TCG_REG_R14);
+    tcg_out_st_helper_args(s, lb, NULL, TCG_REG_R14,
+                           TCG_REG_TMP, TCG_REG_R0, -1);
 
     /* Tail-call to the helper, which will return to the fast path.  */
     tcg_out_goto(s, COND_AL, qemu_st_helpers[opc & MO_SIZE]);
diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 219dc08690..277d99b79c 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -1946,9 +1946,7 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
  */
 static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 {
-    MemOpIdx oi = l->oi;
-    MemOp opc = get_memop(oi);
-    MemOp s_bits = opc & MO_SIZE;
+    MemOp opc = get_memop(l->oi);
     tcg_insn_unit **label_ptr = &l->label_ptr[0];
     TCGReg retaddr;
 
@@ -1958,51 +1956,8 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
         tcg_patch32(label_ptr[1], s->code_ptr - label_ptr[1] - 4);
     }
 
-    if (TCG_TARGET_REG_BITS == 32) {
-        int ofs = 0;
-
-        tcg_out_st(s, TCG_TYPE_PTR, TCG_AREG0, TCG_REG_ESP, ofs);
-        ofs += 4;
-
-        tcg_out_st(s, TCG_TYPE_I32, l->addrlo_reg, TCG_REG_ESP, ofs);
-        ofs += 4;
-
-        if (TARGET_LONG_BITS == 64) {
-            tcg_out_st(s, TCG_TYPE_I32, l->addrhi_reg, TCG_REG_ESP, ofs);
-            ofs += 4;
-        }
-
-        tcg_out_st(s, TCG_TYPE_I32, l->datalo_reg, TCG_REG_ESP, ofs);
-        ofs += 4;
-
-        if (s_bits == MO_64) {
-            tcg_out_st(s, TCG_TYPE_I32, l->datahi_reg, TCG_REG_ESP, ofs);
-            ofs += 4;
-        }
-
-        tcg_out_sti(s, TCG_TYPE_I32, oi, TCG_REG_ESP, ofs);
-        ofs += 4;
-
-        retaddr = TCG_REG_EAX;
-        tcg_out_movi(s, TCG_TYPE_PTR, retaddr, (uintptr_t)l->raddr);
-        tcg_out_st(s, TCG_TYPE_PTR, retaddr, TCG_REG_ESP, ofs);
-    } else {
-        tcg_out_mov(s, TCG_TYPE_PTR, tcg_target_call_iarg_regs[0], TCG_AREG0);
-        /* The second argument is already loaded with addrlo.  */
-        tcg_out_mov(s, (s_bits == MO_64 ? TCG_TYPE_I64 : TCG_TYPE_I32),
-                    tcg_target_call_iarg_regs[2], l->datalo_reg);
-        tcg_out_movi(s, TCG_TYPE_I32, tcg_target_call_iarg_regs[3], oi);
-
-        if (ARRAY_SIZE(tcg_target_call_iarg_regs) > 4) {
-            retaddr = tcg_target_call_iarg_regs[4];
-            tcg_out_movi(s, TCG_TYPE_PTR, retaddr, (uintptr_t)l->raddr);
-        } else {
-            retaddr = TCG_REG_RAX;
-            tcg_out_movi(s, TCG_TYPE_PTR, retaddr, (uintptr_t)l->raddr);
-            tcg_out_st(s, TCG_TYPE_PTR, retaddr, TCG_REG_ESP,
-                       TCG_TARGET_CALL_STACK_OFFSET);
-        }
-    }
+    retaddr = tcg_out_st_helper_args(s, l, NULL, -1, TCG_REG_EAX, -1, -1);
+    tcg_debug_assert(retaddr >= 0);
 
     /* "Tail call" to the helper, with the return address back inline.  */
     tcg_out_push(s, retaddr);
diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index a0ef830179..fb092330d4 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -913,8 +913,7 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 
 static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 {
-    MemOpIdx oi = l->oi;
-    MemOp opc = get_memop(oi);
+    MemOp opc = get_memop(l->oi);
     MemOp size = opc & MO_SIZE;
 
     /* resolve label address */
@@ -923,13 +922,7 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
     }
 
     /* call store helper */
-    tcg_out_mov(s, TCG_TYPE_PTR, TCG_REG_A0, TCG_AREG0);
-    tcg_out_mov(s, TCG_TYPE_PTR, TCG_REG_A1, l->addrlo_reg);
-    tcg_out_movext(s, size == MO_64 ? TCG_TYPE_I32 : TCG_TYPE_I32, TCG_REG_A2,
-                   l->type, size, l->datalo_reg);
-    tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_A3, oi);
-    tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_A4, (tcg_target_long)l->raddr);
-
+    tcg_out_st_helper_args(s, l, NULL, -1, TCG_REG_TMP0, -1, -1);
     tcg_out_call_int(s, qemu_st_helpers[size], false);
 
     return tcg_out_goto(s, l->raddr);
diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index 9723163b97..1206bda502 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -1115,72 +1115,6 @@ static void * const qemu_st_helpers[(MO_SIZE | MO_BSWAP) + 1] = {
     [MO_BEUQ] = helper_be_stq_mmu,
 };
 
-/* Helper routines for marshalling helper function arguments into
- * the correct registers and stack.
- * I is where we want to put this argument, and is updated and returned
- * for the next call. ARG is the argument itself.
- *
- * We provide routines for arguments which are: immediate, 32 bit
- * value in register, 16 and 8 bit values in register (which must be zero
- * extended before use) and 64 bit value in a lo:hi register pair.
- */
-
-static int tcg_out_call_iarg_reg(TCGContext *s, int i, TCGReg arg)
-{
-    if (i < ARRAY_SIZE(tcg_target_call_iarg_regs)) {
-        tcg_out_mov(s, TCG_TYPE_REG, tcg_target_call_iarg_regs[i], arg);
-    } else {
-        /* For N32 and N64, the initial offset is different.  But there
-           we also have 8 argument register so we don't run out here.  */
-        tcg_debug_assert(TCG_TARGET_REG_BITS == 32);
-        tcg_out_st(s, TCG_TYPE_REG, arg, TCG_REG_SP, 4 * i);
-    }
-    return i + 1;
-}
-
-static int tcg_out_call_iarg_reg8(TCGContext *s, int i, TCGReg arg)
-{
-    TCGReg tmp = TCG_TMP0;
-    if (i < ARRAY_SIZE(tcg_target_call_iarg_regs)) {
-        tmp = tcg_target_call_iarg_regs[i];
-    }
-    tcg_out_ext8u(s, tmp, arg);
-    return tcg_out_call_iarg_reg(s, i, tmp);
-}
-
-static int tcg_out_call_iarg_reg16(TCGContext *s, int i, TCGReg arg)
-{
-    TCGReg tmp = TCG_TMP0;
-    if (i < ARRAY_SIZE(tcg_target_call_iarg_regs)) {
-        tmp = tcg_target_call_iarg_regs[i];
-    }
-    tcg_out_opc_imm(s, OPC_ANDI, tmp, arg, 0xffff);
-    return tcg_out_call_iarg_reg(s, i, tmp);
-}
-
-static int tcg_out_call_iarg_imm(TCGContext *s, int i, TCGArg arg)
-{
-    TCGReg tmp = TCG_TMP0;
-    if (arg == 0) {
-        tmp = TCG_REG_ZERO;
-    } else {
-        if (i < ARRAY_SIZE(tcg_target_call_iarg_regs)) {
-            tmp = tcg_target_call_iarg_regs[i];
-        }
-        tcg_out_movi(s, TCG_TYPE_REG, tmp, arg);
-    }
-    return tcg_out_call_iarg_reg(s, i, tmp);
-}
-
-static int tcg_out_call_iarg_reg2(TCGContext *s, int i, TCGReg al, TCGReg ah)
-{
-    tcg_debug_assert(TCG_TARGET_REG_BITS == 32);
-    i = (i + 1) & ~1;
-    i = tcg_out_call_iarg_reg(s, i, (MIPS_BE ? ah : al));
-    i = tcg_out_call_iarg_reg(s, i, (MIPS_BE ? al : ah));
-    return i;
-}
-
 /* We expect to use a 16-bit negative offset from ENV.  */
 QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) > 0);
 QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) < -32768);
@@ -1343,10 +1277,8 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 {
     const tcg_insn_unit *tgt_rx = tcg_splitwx_to_rx(s->code_ptr);
-    MemOpIdx oi = l->oi;
-    MemOp opc = get_memop(oi);
-    MemOp s_bits = opc & MO_SIZE;
-    int i;
+    MemOp opc = get_memop(l->oi);
+    int ra;
 
     /* resolve label address */
     if (!reloc_pc16(l->label_ptr[0], tgt_rx)
@@ -1355,41 +1287,14 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
         return false;
     }
 
-    i = 1;
-    if (TCG_TARGET_REG_BITS < TARGET_LONG_BITS) {
-        i = tcg_out_call_iarg_reg2(s, i, l->addrlo_reg, l->addrhi_reg);
-    } else {
-        i = tcg_out_call_iarg_reg(s, i, l->addrlo_reg);
-    }
-    switch (s_bits) {
-    case MO_8:
-        i = tcg_out_call_iarg_reg8(s, i, l->datalo_reg);
-        break;
-    case MO_16:
-        i = tcg_out_call_iarg_reg16(s, i, l->datalo_reg);
-        break;
-    case MO_32:
-        i = tcg_out_call_iarg_reg(s, i, l->datalo_reg);
-        break;
-    case MO_64:
-        if (TCG_TARGET_REG_BITS == 32) {
-            i = tcg_out_call_iarg_reg2(s, i, l->datalo_reg, l->datahi_reg);
-        } else {
-            i = tcg_out_call_iarg_reg(s, i, l->datalo_reg);
-        }
-        break;
-    default:
-        g_assert_not_reached();
-    }
-    i = tcg_out_call_iarg_imm(s, i, oi);
+    /* Since o32 only has 4 argument registers, we will only need one temp. */
+    ra = tcg_out_st_helper_args(s, l, NULL, -1, TCG_TMP0, -1, -1);
+    tcg_debug_assert(ra >= 0);
 
-    /* Tail call to the store helper.  Thus force the return address
-       computation to take place in the return address register.  */
-    tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_RA, (intptr_t)l->raddr);
-    i = tcg_out_call_iarg_reg(s, i, TCG_REG_RA);
+    /* Tail call to the store helper. */
     tcg_out_call_int(s, qemu_st_helpers[opc & (MO_BSWAP | MO_SIZE)], true);
     /* delay slot */
-    tcg_out_mov(s, TCG_TYPE_PTR, tcg_target_call_iarg_regs[0], TCG_AREG0);
+    tcg_out_mov(s, TCG_TYPE_PTR, TCG_REG_RA, ra);
     return true;
 }
 
diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index e54ebde104..383464b408 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -2170,42 +2170,20 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
 
 static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
 {
-    MemOpIdx oi = lb->oi;
-    MemOp opc = get_memop(oi);
-    MemOp s_bits = opc & MO_SIZE;
-    TCGReg hi, lo, arg = TCG_REG_R3;
+    MemOp opc = get_memop(lb->oi);
 
     if (!reloc_pc14(lb->label_ptr[0], tcg_splitwx_to_rx(s->code_ptr))) {
         return false;
     }
 
-    tcg_out_mov(s, TCG_TYPE_PTR, arg++, TCG_AREG0);
-
-    lo = lb->addrlo_reg;
-    hi = lb->addrhi_reg;
-    if (TCG_TARGET_REG_BITS < TARGET_LONG_BITS) {
-        arg |= (TCG_TARGET_CALL_ARG_I64 == TCG_CALL_ARG_EVEN);
-        tcg_out_mov(s, TCG_TYPE_I32, arg++, hi);
-        tcg_out_mov(s, TCG_TYPE_I32, arg++, lo);
-    } else {
-        /* If the address needed to be zero-extended, we'll have already
-           placed it in R4.  The only remaining case is 64-bit guest.  */
-        tcg_out_mov(s, TCG_TYPE_TL, arg++, lo);
-    }
-
-    lo = lb->datalo_reg;
-    hi = lb->datahi_reg;
-    if (TCG_TARGET_REG_BITS == 32 && s_bits == MO_64) {
-        arg |= (TCG_TARGET_CALL_ARG_I64 == TCG_CALL_ARG_EVEN);
-        tcg_out_mov(s, TCG_TYPE_I32, arg++, hi);
-        tcg_out_mov(s, TCG_TYPE_I32, arg++, lo);
-    } else {
-        tcg_out_movext(s, s_bits == MO_64 ? TCG_TYPE_I64 : TCG_TYPE_I32,
-                       arg++, lb->type, s_bits, lo);
-    }
-
-    tcg_out_movi(s, TCG_TYPE_I32, arg++, oi);
-    tcg_out32(s, MFSPR | RT(arg) | LR);
+    /*
+     * For the purposes of ppc32 sorting 4 input registers into 4 argument
+     * registers, there is an outside chance we would require 3 temps.
+     * Because of constraints, no inputs are in r3, and env will not be
+     * placed into r3 until after the sorting is done, and is thus free.
+     */
+    tcg_out_st_helper_args(s, lb, tcg_out_mflr, -1, TCG_REG_TMP1,
+                           TCG_REG_R0, TCG_REG_R3);
 
     tcg_out_call_int(s, LK, qemu_st_helpers[opc & (MO_BSWAP | MO_SIZE)]);
 
diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index e643a83d0d..ab70aa71a8 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -1014,14 +1014,7 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 
 static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 {
-    MemOpIdx oi = l->oi;
-    MemOp opc = get_memop(oi);
-    MemOp s_bits = opc & MO_SIZE;
-    TCGReg a0 = tcg_target_call_iarg_regs[0];
-    TCGReg a1 = tcg_target_call_iarg_regs[1];
-    TCGReg a2 = tcg_target_call_iarg_regs[2];
-    TCGReg a3 = tcg_target_call_iarg_regs[3];
-    TCGReg a4 = tcg_target_call_iarg_regs[4];
+    MemOp opc = get_memop(l->oi);
 
     /* resolve label address */
     if (!reloc_sbimm12(l->label_ptr[0], tcg_splitwx_to_rx(s->code_ptr))) {
@@ -1029,13 +1022,8 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
     }
 
     /* call store helper */
-    tcg_out_mov(s, TCG_TYPE_PTR, a0, TCG_AREG0);
-    tcg_out_mov(s, TCG_TYPE_PTR, a1, l->addrlo_reg);
-    tcg_out_movext(s, s_bits == MO_64 ? TCG_TYPE_I64 : TCG_TYPE_I32, a2,
-                   l->type, s_bits, l->datalo_reg);
-    tcg_out_movi(s, TCG_TYPE_PTR, a3, oi);
-    tcg_out_movi(s, TCG_TYPE_PTR, a4, (tcg_target_long)l->raddr);
-
+    tcg_out_st_helper_args(s, l, NULL, -1, TCG_REG_TMP0,
+                           TCG_REG_TMP1, TCG_REG_TMP2);
     tcg_out_call_int(s, qemu_st_helpers[opc & MO_SIZE], false);
 
     tcg_out_goto(s, l->raddr);
diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index a81c771196..7d6cb30a06 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -1803,25 +1803,14 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
 
 static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
 {
-    TCGReg addr_reg = lb->addrlo_reg;
-    TCGReg data_reg = lb->datalo_reg;
-    MemOpIdx oi = lb->oi;
-    MemOp opc = get_memop(oi);
-    MemOp size = opc & MO_SIZE;
+    MemOp opc = get_memop(lb->oi);
 
     if (!patch_reloc(lb->label_ptr[0], R_390_PC16DBL,
                      (intptr_t)tcg_splitwx_to_rx(s->code_ptr), 2)) {
         return false;
     }
 
-    tcg_out_mov(s, TCG_TYPE_PTR, TCG_REG_R2, TCG_AREG0);
-    if (TARGET_LONG_BITS == 64) {
-        tcg_out_mov(s, TCG_TYPE_I64, TCG_REG_R3, addr_reg);
-    }
-    tcg_out_movext(s, size == MO_64 ? TCG_TYPE_I64 : TCG_TYPE_I32,
-                   TCG_REG_R4, lb->type, size, data_reg);
-    tcg_out_movi(s, TCG_TYPE_I32, TCG_REG_R5, oi);
-    tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_R6, (uintptr_t)lb->raddr);
+    tcg_out_st_helper_args(s, lb, NULL, -1, TCG_TMP0, -1, -1);
     tcg_out_call_int(s, qemu_st_helpers[opc & (MO_BSWAP | MO_SIZE)]);
 
     tgen_gotoi(s, S390_CC_ALWAYS, lb->raddr);
-- 
2.34.1


