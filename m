Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pqowz-0005DR-Ky
	for mharc-qemu-riscv@gnu.org; Mon, 24 Apr 2023 01:41:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqowv-000596-3p
 for qemu-riscv@nongnu.org; Mon, 24 Apr 2023 01:41:17 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqowp-0004F2-A0
 for qemu-riscv@nongnu.org; Mon, 24 Apr 2023 01:41:16 -0400
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-2f7c281a015so2296674f8f.1
 for <qemu-riscv@nongnu.org>; Sun, 23 Apr 2023 22:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682314868; x=1684906868;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xmZ3Z0VcDD6PgUhrS/B0joODuceToVQhJs8I2eE8Cd0=;
 b=g9F2c1zl7Xz3FzyQtcctbtY8VFDPVAuBWTquyv1x6+7Y7ENn8sVfWONLHrQrsZgL9D
 JrjShkYdTg3kFxJezUAwomJp9krFdAhzxL8orrz2rYL/6zZGzHxy5asDqhDraCJkgOTD
 sTilAz/WXbfdo5awiwe0nLcSe/tPFJZrQtf4HwvbhsAyQ2yOcnDYi2S1QgOFpO3kBJ67
 NM6G776ZNGs0lc/iHggB9HqyP/Rf4Rh3ISuntP/kHfYj+ObpKUzWZHQVEdhMDp/zYyHn
 ZLxfULZrgzjhp9b6qXM7q1Kg9gltQ81+mBapoik9P2jMMcFchKfPvRRC7s0iwU9gqB5b
 Muig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682314868; x=1684906868;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xmZ3Z0VcDD6PgUhrS/B0joODuceToVQhJs8I2eE8Cd0=;
 b=ay2ShaZblx52uGFHNtnstO+2ZuANOCnPDxcn4Tih4MmJB0hfFAen3r908aMPkmo8Fi
 ms+CvgelI7esCcKFNRSLJolteIrDN17FPQwNHZTIPGRXxdjSE/igkn1lo2nMBLwV+6Y2
 s0NXPAwtmhUMMBeBkExnAa41wYi75n93Hy5l1DKaYvde/aCY7zusgjyNWQZCk1bjCOi8
 CFo38YtVsftFUWEk36f+VmQk+LzesKP8soCRrTDqAGKAvOzTqBkK7+2Bam8FgHAptYuH
 5Vh+YWXtcqUjWjFppWDCHfRc2/W4nbF6Dy/5l8t/Ir5wuAnGDCApITxXGE2DKX0nMBeB
 CN0A==
X-Gm-Message-State: AAQBX9en1zH2YBw+sb39UetafKtRKwKnDy9Rz0JYXVyIlrE6YgD4Qj5V
 SactcIPiPg8IlZ+bSdU7ziwI+g==
X-Google-Smtp-Source: AKy350bPsbdMVlp2vtA+AEDZasfOhed6GK9CF5g7KUppUYBy8v+uWp+8AhlIeyev1+8fKkuSpObqfA==
X-Received: by 2002:a05:6000:1b89:b0:304:6fef:f375 with SMTP id
 r9-20020a0560001b8900b003046feff375mr3526977wru.70.1682314868660; 
 Sun, 23 Apr 2023 22:41:08 -0700 (PDT)
Received: from stoup.c.hoisthospitality.com
 (cust-west-loneq8-46-193-226-34.wb.wifirst.net. [46.193.226.34])
 by smtp.gmail.com with ESMTPSA id
 j22-20020a5d6e56000000b002fbb285b01fsm9997852wrz.25.2023.04.23.22.41.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Apr 2023 22:41:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com
Subject: [PATCH v3 04/57] tcg: Introduce tcg_out_movext2
Date: Mon, 24 Apr 2023 06:40:12 +0100
Message-Id: <20230424054105.1579315-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230424054105.1579315-1-richard.henderson@linaro.org>
References: <20230424054105.1579315-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42a.google.com
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
X-List-Received-Date: Mon, 24 Apr 2023 05:41:17 -0000

This is common code in most qemu_{ld,st} slow paths, moving two
registers when there may be overlap between sources and destinations.
At present, this is only used by 32-bit hosts for 64-bit data,
but will shortly be used for more than that.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c                 | 69 ++++++++++++++++++++++++++++++++++++---
 tcg/arm/tcg-target.c.inc  | 44 ++++++++++---------------
 tcg/i386/tcg-target.c.inc | 19 +++++------
 3 files changed, 90 insertions(+), 42 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index fde5ccc57c..cfd3262a4a 100644
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
@@ -354,6 +353,14 @@ void tcg_raise_tb_overflow(TCGContext *s)
     siglongjmp(s->jmp_trans, -2);
 }
 
+typedef struct TCGMovExtend {
+    TCGReg dst;
+    TCGReg src;
+    TCGType dst_type;
+    TCGType src_type;
+    MemOp src_ext;
+} TCGMovExtend;
+
 /**
  * tcg_out_movext -- move and extend
  * @s: tcg context
@@ -365,9 +372,8 @@ void tcg_raise_tb_overflow(TCGContext *s)
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
@@ -417,6 +423,59 @@ tcg_out_movext(TCGContext *s, TCGType dst_type, TCGReg dst,
     }
 }
 
+/* Minor variations on a theme, using a structure. */
+static void tcg_out_movext1_new_src(TCGContext *s, const TCGMovExtend *i,
+                                    TCGReg src)
+{
+    tcg_out_movext(s, i->dst_type, i->dst, i->src_type, i->src_ext, src);
+}
+
+static void tcg_out_movext1(TCGContext *s, const TCGMovExtend *i)
+{
+    tcg_out_movext1_new_src(s, i, i->src);
+}
+
+/**
+ * tcg_out_movext2 -- move and extend two pair
+ * @s: tcg context
+ * @i1: first move description
+ * @i2: second move description
+ * @scratch: temporary register, or -1 for none
+ *
+ * As tcg_out_movext, for both @i1 and @i2, caring for overlap
+ * between the sources and destinations.
+ */
+
+static void __attribute__((unused))
+tcg_out_movext2(TCGContext *s, const TCGMovExtend *i1,
+                const TCGMovExtend *i2, int scratch)
+{
+    TCGReg src1 = i1->src;
+    TCGReg src2 = i2->src;
+
+    if (i1->dst != src2) {
+        tcg_out_movext1(s, i1);
+        tcg_out_movext1(s, i2);
+        return;
+    }
+    if (i2->dst == src1) {
+        TCGType src1_type = i1->src_type;
+        TCGType src2_type = i2->src_type;
+
+        if (tcg_out_xchg(s, MAX(src1_type, src2_type), src1, src2)) {
+            /* The data is now in the correct registers, now extend. */
+            src1 = i2->src;
+            src2 = i1->src;
+        } else {
+            tcg_debug_assert(scratch >= 0);
+            tcg_out_mov(s, src1_type, scratch, src1);
+            src1 = scratch;
+        }
+    }
+    tcg_out_movext1_new_src(s, i2, src2);
+    tcg_out_movext1_new_src(s, i1, src1);
+}
+
 #define C_PFX1(P, A)                    P##A
 #define C_PFX2(P, A, B)                 P##A##_##B
 #define C_PFX3(P, A, B, C)              P##A##_##B##_##C
diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index 8d769ca0a2..83c818a58b 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -1545,7 +1545,7 @@ static void add_qemu_ldst_label(TCGContext *s, bool is_ld, MemOpIdx oi,
 
 static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
 {
-    TCGReg argreg, datalo, datahi;
+    TCGReg argreg;
     MemOpIdx oi = lb->oi;
     MemOp opc = get_memop(oi);
 
@@ -1565,22 +1565,16 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
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
+        TCGMovExtend ext[2] = {
+            { .dst = lb->datalo_reg, .dst_type = TCG_TYPE_I32,
+              .src = TCG_REG_R0, .src_type = TCG_TYPE_I32, .src_ext = MO_UL },
+            { .dst = lb->datahi_reg, .dst_type = TCG_TYPE_I32,
+              .src = TCG_REG_R1, .src_type = TCG_TYPE_I32, .src_ext = MO_UL },
+        };
+        tcg_out_movext2(s, &ext[0], &ext[1], TCG_REG_TMP);
     } else {
-        tcg_out_movext(s, TCG_TYPE_I32, datalo,
+        tcg_out_movext(s, TCG_TYPE_I32, lb->datalo_reg,
                        TCG_TYPE_I32, opc & MO_SSIZE, TCG_REG_R0);
     }
 
@@ -1663,17 +1657,15 @@ static bool tcg_out_fail_alignment(TCGContext *s, TCGLabelQemuLdst *l)
 
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
+        TCGMovExtend ext[2] = {
+            { .dst = TCG_REG_R2, .dst_type = TCG_TYPE_I32,
+              .src = l->addrlo_reg,
+              .src_type = TCG_TYPE_I32, .src_ext = MO_UL },
+            { .dst = TCG_REG_R3, .dst_type = TCG_TYPE_I32,
+              .src = l->addrhi_reg,
+              .src_type = TCG_TYPE_I32, .src_ext = MO_UL },
+        };
+        tcg_out_movext2(s, &ext[0], &ext[1], TCG_REG_TMP);
     } else {
         tcg_out_mov(s, TCG_TYPE_I32, TCG_REG_R1, l->addrlo_reg);
     }
diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index ce87f8fbc9..238a75b17e 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -1916,7 +1916,6 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 {
     MemOpIdx oi = l->oi;
     MemOp opc = get_memop(oi);
-    TCGReg data_reg;
     tcg_insn_unit **label_ptr = &l->label_ptr[0];
 
     /* resolve label address */
@@ -1953,18 +1952,16 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 
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
+        TCGMovExtend ext[2] = {
+            { .dst = l->datalo_reg, .dst_type = TCG_TYPE_I32,
+              .src = TCG_REG_EAX, .src_type = TCG_TYPE_I32, .src_ext = MO_UL },
+            { .dst = l->datahi_reg, .dst_type = TCG_TYPE_I32,
+              .src = TCG_REG_EDX, .src_type = TCG_TYPE_I32, .src_ext = MO_UL },
+        };
+        tcg_out_movext2(s, &ext[0], &ext[1], -1);
     } else {
-        tcg_out_movext(s, l->type, data_reg,
+        tcg_out_movext(s, l->type, l->datalo_reg,
                        TCG_TYPE_REG, opc & MO_SSIZE, TCG_REG_EAX);
     }
 
-- 
2.34.1


