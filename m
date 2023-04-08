Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pkyZX-00020Q-6L
	for mharc-qemu-riscv@gnu.org; Fri, 07 Apr 2023 22:44:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkyYy-0008B9-Fp
 for qemu-riscv@nongnu.org; Fri, 07 Apr 2023 22:44:24 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkyYK-0005WX-2q
 for qemu-riscv@nongnu.org; Fri, 07 Apr 2023 22:44:23 -0400
Received: by mail-pl1-x632.google.com with SMTP id ik20so250775plb.3
 for <qemu-riscv@nongnu.org>; Fri, 07 Apr 2023 19:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680921823;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Fikhi3gCqQLepVdiebyP4Nz6/eKR4M1XIM/mRlVy6L8=;
 b=rBpKPWh12q7OkfZ/f6EzwLY2eKAnj3ljIlA3CrInsoUnncfeoyP1HPAn903Wy5dZzG
 ZmaNptL02yqjvM9laaTgp4B+mF62TwBKOPGWwZdlWB9ctHnZHt2iZwk7MdASj6w/qwRG
 EWkMEy24UvIDnjL87Nb627aRN5INtk/gEpIADGf+hpKSRQjzVgUtVtvUvfIZv3occAmP
 r2Z33IIal80UNgd352Hs5x5mvGlQS0VM+XpRcJUyYpfRzf2+raLf5MXMWBvUGe5oJtfL
 qLTaIsG+Dhux5aIEbkkRA7Xkpon81x3BPeGKxP52TJJsOTX+2K76EC7KXGPVzFBE1CSl
 K5tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680921823;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Fikhi3gCqQLepVdiebyP4Nz6/eKR4M1XIM/mRlVy6L8=;
 b=vr333gr3dVAoVsSNO8uMxdcI8G9eixffife8BjPx24kQuPLYFf57KkPvHBc+Y7uwS4
 vU/mFpXFoYaG83oeuwTtOA9ZDBy+XdNtnT5T1IkkpP6W1Z9RXvwRKjNScaUSXYz+ayKF
 e1fI0HWIx0o8lkTtRdxZn4g2JaMs15MYEQ0Ow1zOQVoI9TTqfrdwUSUGHY2mpxWA19ds
 ayfoqgNRncycrErMzKK56tfh8cOdl7qDApPo4t9XsTvV2tsnRf8AMYZes3asV6T7++/2
 lpc8gNCljPeZIkRJSSLDE+DOElV2ZtK9uEOqyUjYMKmgVu1bRsxhz1Ur3mrxqOI8Wl1S
 exwA==
X-Gm-Message-State: AAQBX9eAo9WfGiL3k9u4AYRJ1xKqV4jFwXq6LmbvAbZux0HetGzICv4V
 bqnxKIPRvG+yS45Yr3kby/Dasw==
X-Google-Smtp-Source: AKy350a1118tnW4EXtTLNmh0WUK/Rka8gm9KpG1abJn6VpVg6vur8c4DFCxwptIr2x9SbMvcqg5HoQ==
X-Received: by 2002:a17:902:c94e:b0:19e:8267:9590 with SMTP id
 i14-20020a170902c94e00b0019e82679590mr5906808pla.41.1680921823161; 
 Fri, 07 Apr 2023 19:43:43 -0700 (PDT)
Received: from stoup.. ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
 by smtp.gmail.com with ESMTPSA id
 d9-20020a170902c18900b0019d397b0f18sm3530780pld.214.2023.04.07.19.43.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Apr 2023 19:43:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH 30/42] tcg: Introduce tcg_out_ld_helper_args
Date: Fri,  7 Apr 2023 19:43:02 -0700
Message-Id: <20230408024314.3357414-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230408024314.3357414-1-richard.henderson@linaro.org>
References: <20230408024314.3357414-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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
X-List-Received-Date: Sat, 08 Apr 2023 02:44:24 -0000

Centralize the logic to call the helper_ldN_mmu functions.
This loses out slightly on mips by not filling the delay slot,
but the result is more maintainable.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c                        | 187 +++++++++++++++++++++++++++++++
 tcg/aarch64/tcg-target.c.inc     |   8 +-
 tcg/arm/tcg-target.c.inc         |  13 +--
 tcg/i386/tcg-target.c.inc        |  30 +----
 tcg/loongarch64/tcg-target.c.inc |  12 +-
 tcg/mips/tcg-target.c.inc        |  15 +--
 tcg/ppc/tcg-target.c.inc         |  41 +++----
 tcg/riscv/tcg-target.c.inc       |  15 +--
 tcg/s390x/tcg-target.c.inc       |  14 +--
 9 files changed, 220 insertions(+), 115 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index 647af6c210..e67b80aeeb 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -180,6 +180,10 @@ static bool tcg_target_const_match(int64_t val, TCGType type, int ct);
 #ifdef TCG_TARGET_NEED_LDST_LABELS
 static int tcg_out_ldst_finalize(TCGContext *s);
 #endif
+static int tcg_out_ld_helper_args(TCGContext *s, const TCGLabelQemuLdst *l,
+                                  void (*ra_gen)(TCGContext *s, TCGReg r),
+                                  int ra_reg, int scratch_reg)
+    __attribute__((unused));
 
 TCGContext tcg_init_ctx;
 __thread TCGContext *tcg_ctx;
@@ -4973,6 +4977,189 @@ static void tcg_reg_alloc_call(TCGContext *s, TCGOp *op)
     }
 }
 
+/* Wrapper to prevent -Wtype-limits errors for i386, where ARRAY_SIZE == 0. */
+static inline bool in_iarg_reg(unsigned arg)
+{
+    unsigned max = ARRAY_SIZE(tcg_target_call_iarg_regs);
+    return max != 0 && arg < max;
+}
+
+static void tcg_out_helper_arg(TCGContext *s, TCGType d_type, unsigned d_arg,
+                               TCGType s_type, MemOp s_mo, TCGReg s_reg,
+                               int scratch_reg)
+{
+    if (TCG_TARGET_CALL_ARG_I32 == TCG_CALL_ARG_EXTEND) {
+        d_type = TCG_TYPE_REG;
+    }
+
+    if (in_iarg_reg(d_arg)) {
+        tcg_out_movext(s, d_type, tcg_target_call_iarg_regs[d_arg],
+                       s_type, s_mo, s_reg);
+        return;
+    }
+
+    /* The argument is going onto the stack; extend into scratch. */
+    if ((s_mo & MO_SIZE) < (d_type == TCG_TYPE_I32 ? MO_32 : MO_64)) {
+        tcg_debug_assert(scratch_reg >= 0);
+        tcg_out_movext(s, d_type, scratch_reg, s_type, s_mo, s_reg);
+        s_reg = scratch_reg;
+    }
+    tcg_out_st(s, TCG_TYPE_REG, s_reg, TCG_REG_CALL_STACK,
+               TCG_TARGET_CALL_STACK_OFFSET +
+               d_arg * sizeof(tcg_target_long));
+}
+
+static void tcg_out_helper_arg_im(TCGContext *s, TCGType d_type,
+                                  unsigned d_arg, tcg_target_long imm,
+                                  int scratch_reg)
+{
+    intptr_t ofs;
+
+    if (TCG_TARGET_CALL_ARG_I32 == TCG_CALL_ARG_EXTEND) {
+        d_type = TCG_TYPE_REG;
+    }
+    if (in_iarg_reg(d_arg)) {
+        tcg_out_movi(s, d_type, tcg_target_call_iarg_regs[d_arg], imm);
+        return;
+    }
+
+    ofs = TCG_TARGET_CALL_STACK_OFFSET + d_arg * sizeof(tcg_target_long);
+    if (tcg_out_sti(s, TCG_TYPE_REG, imm, TCG_REG_CALL_STACK, ofs)) {
+        return;
+    }
+
+    tcg_debug_assert(scratch_reg >= 0);
+    tcg_out_movi(s, d_type, scratch_reg, imm);
+    tcg_out_st(s, TCG_TYPE_REG, scratch_reg, TCG_REG_CALL_STACK, ofs);
+}
+
+static int tcg_out_helper_arg_ra(TCGContext *s, unsigned d_arg,
+                                 void (*ra_gen)(TCGContext *s, TCGReg r),
+                                 int ra_reg, uintptr_t ra_imm,
+                                 int scratch_reg)
+{
+    intptr_t ofs;
+
+    if (in_iarg_reg(d_arg)) {
+        TCGReg d_reg = tcg_target_call_iarg_regs[d_arg];
+
+        if (ra_reg >= 0) {
+            tcg_out_mov(s, TCG_TYPE_PTR, d_reg, ra_reg);
+        } else if (ra_gen) {
+            ra_gen(s, d_reg);
+        } else {
+            tcg_out_movi(s, TCG_TYPE_PTR, d_reg, ra_imm);
+        }
+        return d_reg;
+    }
+
+    ofs = TCG_TARGET_CALL_STACK_OFFSET + d_arg * sizeof(tcg_target_long);
+    if (ra_reg < 0) {
+        if (ra_gen) {
+            tcg_debug_assert(scratch_reg >= 0);
+            ra_gen(s, scratch_reg);
+        } else if (scratch_reg >= 0) {
+            tcg_out_movi(s, TCG_TYPE_PTR, scratch_reg, ra_imm);
+        } else {
+            bool ok = tcg_out_sti(s, TCG_TYPE_REG, ra_imm,
+                                  TCG_REG_CALL_STACK, ofs);
+            tcg_debug_assert(ok);
+            return -1;
+        }
+        ra_reg = scratch_reg;
+    }
+    tcg_out_st(s, TCG_TYPE_REG, ra_reg, TCG_REG_CALL_STACK, ofs);
+    return ra_reg;
+}
+
+/*
+ * Poor man's topological sort on 2 source+destination register pairs.
+ * This is a simplified version of tcg_out_movext2 for 32-bit hosts.
+ */
+static void tcg_out_mov_32x2(TCGContext *s, TCGReg d1, TCGReg s1,
+                             TCGReg d2, TCGReg s2, int t1)
+{
+    tcg_debug_assert(TCG_TARGET_REG_BITS == 32);
+
+    if (d1 != s2) {
+        tcg_out_mov(s, TCG_TYPE_I32, d1, s1);
+        tcg_out_mov(s, TCG_TYPE_I32, d2, s2);
+        return;
+    }
+    if (d2 == s1) {
+        if (tcg_out_xchg(s, TCG_TYPE_I32, d1, d2)) {
+            return;
+        }
+        tcg_debug_assert(t1 >= 0);
+        tcg_out_mov(s, TCG_TYPE_I32, t1, s1);
+        s1 = t1;
+    }
+    tcg_out_mov(s, TCG_TYPE_I32, d2, s2);
+    tcg_out_mov(s, TCG_TYPE_I32, d1, s1);
+}
+
+static void tcg_out_helper_arg_32x2(TCGContext *s, unsigned d_arg,
+                                    TCGReg lo_reg, TCGReg hi_reg,
+                                    int scratch_reg)
+{
+    tcg_debug_assert(TCG_TARGET_REG_BITS == 32);
+
+    if (in_iarg_reg(d_arg + 1)) {
+        TCGReg lo_arg = tcg_target_call_iarg_regs[d_arg + HOST_BIG_ENDIAN];
+        TCGReg hi_arg = tcg_target_call_iarg_regs[d_arg + !HOST_BIG_ENDIAN];
+
+        tcg_out_mov_32x2(s, lo_arg, lo_reg, hi_arg, hi_reg, scratch_reg);
+        return;
+    }
+
+    /* At present, all 32-bit hosts will not split 64-bit args. */
+    tcg_debug_assert(!in_iarg_reg(d_arg));
+
+    tcg_out_st(s, TCG_TYPE_I32, HOST_BIG_ENDIAN ? hi_reg : lo_reg,
+               TCG_REG_CALL_STACK,
+               TCG_TARGET_CALL_STACK_OFFSET + d_arg * 4);
+    tcg_out_st(s, TCG_TYPE_I32, HOST_BIG_ENDIAN ? lo_reg : hi_reg,
+               TCG_REG_CALL_STACK,
+               TCG_TARGET_CALL_STACK_OFFSET + (d_arg + 1) * 4);
+}
+
+static int tcg_out_ld_helper_args(TCGContext *s, const TCGLabelQemuLdst *l,
+                                  void (*ra_gen)(TCGContext *s, TCGReg r),
+                                  int ra_reg, int scratch_reg)
+{
+    /* This is the type of the helper_ldX_mmu 'addr' argument. */
+    TCGType a_type = TARGET_LONG_BITS == 32 ? TCG_TYPE_I32 : TCG_TYPE_I64;
+    MemOp a_mo = TARGET_LONG_BITS == 32 ? MO_32 : MO_64;
+    MemOp p_mo = sizeof(void *) == 4 ? MO_32 : MO_64;
+    /* Begin by skipping the env argument. */
+    int arg = 1;
+
+    if (TCG_TARGET_REG_BITS >= TARGET_LONG_BITS) {
+        tcg_out_helper_arg(s, a_type, arg, a_type, a_mo,
+                           l->addrlo_reg, scratch_reg);
+        arg++;
+    } else {
+        if (TCG_TARGET_CALL_ARG_I64 == TCG_CALL_ARG_EVEN) {
+            arg += arg & 1;
+        }
+        tcg_out_helper_arg_32x2(s, arg, l->addrlo_reg, l->addrhi_reg,
+                                scratch_reg);
+        arg += 2;
+    }
+
+    /* Handle env. */
+    tcg_out_helper_arg(s, TCG_TYPE_PTR, 0,
+                       TCG_TYPE_PTR, p_mo, TCG_AREG0, scratch_reg);
+
+    /* Handle oi. */
+    tcg_out_helper_arg_im(s, TCG_TYPE_I32, arg, l->oi, scratch_reg);
+    arg++;
+
+    /* Handle ra. Return any register holding it for use by tail call.  */
+    return tcg_out_helper_arg_ra(s, arg, ra_gen, ra_reg,
+                                 (uintptr_t)l->raddr, scratch_reg);
+}
+
 #ifdef CONFIG_PROFILER
 
 /* avoid copy/paste errors */
diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index f8d3ef4714..f983900669 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -1623,17 +1623,13 @@ static void * const qemu_st_helpers[MO_SIZE + 1] = {
 
 static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
 {
-    MemOpIdx oi = lb->oi;
-    MemOp opc = get_memop(oi);
+    MemOp opc = get_memop(lb->oi);
 
     if (!reloc_pc19(lb->label_ptr[0], tcg_splitwx_to_rx(s->code_ptr))) {
         return false;
     }
 
-    tcg_out_mov(s, TCG_TYPE_PTR, TCG_REG_X0, TCG_AREG0);
-    tcg_out_mov(s, TARGET_LONG_BITS == 64, TCG_REG_X1, lb->addrlo_reg);
-    tcg_out_movi(s, TCG_TYPE_I32, TCG_REG_X2, oi);
-    tcg_out_adr(s, TCG_REG_X3, lb->raddr);
+    tcg_out_ld_helper_args(s, lb, NULL, -1, -1);
     tcg_out_call_int(s, qemu_ld_helpers[opc & MO_SIZE]);
 
     tcg_out_movext(s, lb->type, lb->datalo_reg,
diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index 9bf831223a..b187d5b28f 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -1547,22 +1547,13 @@ static void add_qemu_ldst_label(TCGContext *s, bool is_ld, TCGType type,
 
 static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
 {
-    TCGReg argreg;
-    MemOpIdx oi = lb->oi;
-    MemOp opc = get_memop(oi);
+    MemOp opc = get_memop(lb->oi);
 
     if (!reloc_pc24(lb->label_ptr[0], tcg_splitwx_to_rx(s->code_ptr))) {
         return false;
     }
 
-    argreg = tcg_out_arg_reg32(s, TCG_REG_R0, TCG_AREG0);
-    if (TARGET_LONG_BITS == 64) {
-        argreg = tcg_out_arg_reg64(s, argreg, lb->addrlo_reg, lb->addrhi_reg);
-    } else {
-        argreg = tcg_out_arg_reg32(s, argreg, lb->addrlo_reg);
-    }
-    argreg = tcg_out_arg_imm32(s, argreg, oi);
-    argreg = tcg_out_arg_reg32(s, argreg, TCG_REG_R14);
+    tcg_out_ld_helper_args(s, lb, NULL, TCG_REG_R14, TCG_REG_TMP);
 
     /* Use the canonical unsigned helpers and minimize icache usage. */
     tcg_out_call_int(s, qemu_ld_helpers[opc & MO_SIZE]);
diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index ff4062ef54..219dc08690 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -1914,8 +1914,7 @@ static void add_qemu_ldst_label(TCGContext *s, bool is_ld,
  */
 static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 {
-    MemOpIdx oi = l->oi;
-    MemOp opc = get_memop(oi);
+    MemOp opc = get_memop(l->oi);
     tcg_insn_unit **label_ptr = &l->label_ptr[0];
 
     /* resolve label address */
@@ -1924,32 +1923,7 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
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
-        tcg_out_sti(s, TCG_TYPE_I32, oi, TCG_REG_ESP, ofs);
-        ofs += 4;
-
-        tcg_out_sti(s, TCG_TYPE_PTR, (uintptr_t)l->raddr, TCG_REG_ESP, ofs);
-    } else {
-        tcg_out_mov(s, TCG_TYPE_PTR, tcg_target_call_iarg_regs[0], TCG_AREG0);
-        /* The second argument is already loaded with addrlo.  */
-        tcg_out_movi(s, TCG_TYPE_I32, tcg_target_call_iarg_regs[2], oi);
-        tcg_out_movi(s, TCG_TYPE_PTR, tcg_target_call_iarg_regs[3],
-                     (uintptr_t)l->raddr);
-    }
-
+    tcg_out_ld_helper_args(s, l, NULL, -1, -1);
     tcg_out_branch(s, 1, qemu_ld_helpers[opc & (MO_BSWAP | MO_SIZE)]);
 
     if (TCG_TARGET_REG_BITS == 32 && (opc & MO_SIZE) == MO_64) {
diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index 0940788c6f..a0ef830179 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -895,9 +895,7 @@ static void add_qemu_ldst_label(TCGContext *s, int is_ld, MemOpIdx oi,
 
 static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 {
-    MemOpIdx oi = l->oi;
-    MemOp opc = get_memop(oi);
-    MemOp size = opc & MO_SIZE;
+    MemOp opc = get_memop(l->oi);
 
     /* resolve label address */
     if (!reloc_br_sk16(l->label_ptr[0], tcg_splitwx_to_rx(s->code_ptr))) {
@@ -905,12 +903,8 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
     }
 
     /* call load helper */
-    tcg_out_mov(s, TCG_TYPE_PTR, TCG_REG_A0, TCG_AREG0);
-    tcg_out_mov(s, TCG_TYPE_PTR, TCG_REG_A1, l->addrlo_reg);
-    tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_A2, oi);
-    tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_A3, (tcg_target_long)l->raddr);
-
-    tcg_out_call_int(s, qemu_ld_helpers[size], false);
+    tcg_out_ld_helper_args(s, l, NULL, -1, -1);
+    tcg_out_call_int(s, qemu_ld_helpers[opc & MO_SIZE], false);
 
     tcg_out_movext(s, l->type, l->datalo_reg,
                    TCG_TYPE_REG, opc & MO_SSIZE, TCG_REG_A0);
diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index 568cfe7728..9723163b97 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -1298,10 +1298,8 @@ static void add_qemu_ldst_label(TCGContext *s, int is_ld, MemOpIdx oi,
 static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 {
     const tcg_insn_unit *tgt_rx = tcg_splitwx_to_rx(s->code_ptr);
-    MemOpIdx oi = l->oi;
-    MemOp opc = get_memop(oi);
+    MemOp opc = get_memop(l->oi);
     TCGReg v0;
-    int i;
 
     /* resolve label address */
     if (!reloc_pc16(l->label_ptr[0], tgt_rx)
@@ -1310,17 +1308,10 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
         return false;
     }
 
-    i = 1;
-    if (TCG_TARGET_REG_BITS < TARGET_LONG_BITS) {
-        i = tcg_out_call_iarg_reg2(s, i, l->addrlo_reg, l->addrhi_reg);
-    } else {
-        i = tcg_out_call_iarg_reg(s, i, l->addrlo_reg);
-    }
-    i = tcg_out_call_iarg_imm(s, i, oi);
-    i = tcg_out_call_iarg_imm(s, i, (intptr_t)l->raddr);
+    tcg_out_ld_helper_args(s, l, NULL, -1, TCG_TMP0);
     tcg_out_call_int(s, qemu_ld_helpers[opc & (MO_BSWAP | MO_SSIZE)], false);
     /* delay slot */
-    tcg_out_mov(s, TCG_TYPE_PTR, tcg_target_call_iarg_regs[0], TCG_AREG0);
+    tcg_out_nop(s);
 
     v0 = l->datalo_reg;
     if (TCG_TARGET_REG_BITS == 32 && (opc & MO_SIZE) == MO_64) {
diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index 7c33404bd6..e54ebde104 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -23,8 +23,6 @@
  */
 
 #include "elf.h"
-#include "../tcg-pool.c.inc"
-#include "../tcg-ldst.c.inc"
 
 /*
  * Standardize on the _CALL_FOO symbols used by GCC:
@@ -58,6 +56,9 @@
 #define TCG_TARGET_CALL_ARG_I128   TCG_CALL_ARG_NORMAL
 #define TCG_TARGET_CALL_RET_I128   TCG_CALL_RET_NORMAL
 
+#include "../tcg-pool.c.inc"
+#include "../tcg-ldst.c.inc"
+
 /* For some memory operations, we need a scratch that isn't R0.  For the AIX
    calling convention, we can re-use the TOC register since we'll be reloading
    it at every call.  Otherwise R12 will do nicely as neither a call-saved
@@ -2136,42 +2137,30 @@ static void add_qemu_ldst_label(TCGContext *s, bool is_ld,
     label->label_ptr[0] = lptr;
 }
 
+static void tcg_out_mflr(TCGContext *s, TCGReg dst)
+{
+    tcg_out32(s, MFSPR | RT(dst) | LR);
+}
+
 static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
 {
-    MemOpIdx oi = lb->oi;
-    MemOp opc = get_memop(oi);
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
-    tcg_out_movi(s, TCG_TYPE_I32, arg++, oi);
-    tcg_out32(s, MFSPR | RT(arg) | LR);
+    tcg_out_ld_helper_args(s, lb, tcg_out_mflr, -1, TCG_REG_TMP1);
 
     tcg_out_call_int(s, LK, qemu_ld_helpers[opc & (MO_BSWAP | MO_SIZE)]);
 
-    lo = lb->datalo_reg;
-    hi = lb->datahi_reg;
     if (TCG_TARGET_REG_BITS == 32 && (opc & MO_SIZE) == MO_64) {
-        tcg_out_mov(s, TCG_TYPE_I32, lo, TCG_REG_R4);
-        tcg_out_mov(s, TCG_TYPE_I32, hi, TCG_REG_R3);
+        tcg_out_movext2(s, TCG_TYPE_I32, lb->datahi_reg,
+                        TCG_TYPE_I32, MO_UL, TCG_REG_R3,
+                        TCG_TYPE_I32, lb->datalo_reg,
+                        TCG_TYPE_I32, MO_UL, TCG_REG_R4, TCG_REG_TMP1);
     } else {
-        tcg_out_movext(s, lb->type, lo,
+        tcg_out_movext(s, lb->type, lb->datalo_reg,
                        TCG_TYPE_REG, opc & MO_SSIZE, TCG_REG_R3);
     }
 
diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index 6059802d9a..e643a83d0d 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -996,12 +996,7 @@ static void add_qemu_ldst_label(TCGContext *s, int is_ld, MemOpIdx oi,
 
 static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 {
-    MemOpIdx oi = l->oi;
-    MemOp opc = get_memop(oi);
-    TCGReg a0 = tcg_target_call_iarg_regs[0];
-    TCGReg a1 = tcg_target_call_iarg_regs[1];
-    TCGReg a2 = tcg_target_call_iarg_regs[2];
-    TCGReg a3 = tcg_target_call_iarg_regs[3];
+    MemOp opc = get_memop(l->oi);
 
     /* resolve label address */
     if (!reloc_sbimm12(l->label_ptr[0], tcg_splitwx_to_rx(s->code_ptr))) {
@@ -1009,13 +1004,9 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
     }
 
     /* call load helper */
-    tcg_out_mov(s, TCG_TYPE_PTR, a0, TCG_AREG0);
-    tcg_out_mov(s, TCG_TYPE_PTR, a1, l->addrlo_reg);
-    tcg_out_movi(s, TCG_TYPE_PTR, a2, oi);
-    tcg_out_movi(s, TCG_TYPE_PTR, a3, (tcg_target_long)l->raddr);
-
+    tcg_out_ld_helper_args(s, l, NULL, -1, TCG_REG_TMP0);
     tcg_out_call_int(s, qemu_ld_helpers[opc & MO_SSIZE], false);
-    tcg_out_mov(s, (opc & MO_SIZE) == MO_64, l->datalo_reg, a0);
+    tcg_out_mov(s, (opc & MO_SIZE) == MO_64, l->datalo_reg, TCG_REG_A0);
 
     tcg_out_goto(s, l->raddr);
     return true;
diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index 77dcdd7c0f..a81c771196 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -1786,24 +1786,16 @@ static void add_qemu_ldst_label(TCGContext *s, bool is_ld, MemOpIdx oi,
 
 static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
 {
-    TCGReg addr_reg = lb->addrlo_reg;
-    TCGReg data_reg = lb->datalo_reg;
-    MemOpIdx oi = lb->oi;
-    MemOp opc = get_memop(oi);
+    MemOp opc = get_memop(lb->oi);
 
     if (!patch_reloc(lb->label_ptr[0], R_390_PC16DBL,
                      (intptr_t)tcg_splitwx_to_rx(s->code_ptr), 2)) {
         return false;
     }
 
-    tcg_out_mov(s, TCG_TYPE_PTR, TCG_REG_R2, TCG_AREG0);
-    if (TARGET_LONG_BITS == 64) {
-        tcg_out_mov(s, TCG_TYPE_I64, TCG_REG_R3, addr_reg);
-    }
-    tcg_out_movi(s, TCG_TYPE_I32, TCG_REG_R4, oi);
-    tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_R5, (uintptr_t)lb->raddr);
+    tcg_out_ld_helper_args(s, lb, NULL, -1, -1);
     tcg_out_call_int(s, qemu_ld_helpers[opc & (MO_BSWAP | MO_SSIZE)]);
-    tcg_out_mov(s, TCG_TYPE_I64, data_reg, TCG_REG_R2);
+    tcg_out_mov(s, TCG_TYPE_I64, lb->datalo_reg, TCG_REG_R2);
 
     tgen_gotoi(s, S390_CC_ALWAYS, lb->raddr);
     return true;
-- 
2.34.1


