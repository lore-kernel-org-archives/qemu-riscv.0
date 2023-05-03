Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pu6df-0003aP-AT
	for mharc-qemu-riscv@gnu.org; Wed, 03 May 2023 03:10:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6dG-0002i3-3V
 for qemu-riscv@nongnu.org; Wed, 03 May 2023 03:10:37 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6dB-00071K-QZ
 for qemu-riscv@nongnu.org; Wed, 03 May 2023 03:10:32 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-3f19ab99540so46284945e9.2
 for <qemu-riscv@nongnu.org>; Wed, 03 May 2023 00:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683097828; x=1685689828;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7tjn+bhFEykcOOu8pztGK+c3m4ZRnhhBjNTo+m7c7SU=;
 b=z3bBjk4FKXtC9lrujsWFIA2f+Qv06gN6s4Pzovyw0tpiHvZVdcUIQKDz2ehpTpdTLS
 F5CWAVCP/3YWgPW2k0CGsHkAPbQh0LnOmiJrKmEj5hwizkK3/xIjFJvMdEJY4oVPS3nP
 +66YoxHw9AAMOILkABUBRpd80xKGeDT/m11XTOTDqPuEV3L1UZsifkc6I85JyaDD3FOv
 28QuLsOJTE8gqbDtBZ2HOXU6uPHvBiFMrZxaNBzB5XWJ/Hoh4csA8r7b/9yvjSSn9iyR
 uj52vMYRbi54gjtKQJA6ini096B11BreFThsQpcy8wq+VXP0+1YH3LcdJv+1EcqF75MO
 VAOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683097828; x=1685689828;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7tjn+bhFEykcOOu8pztGK+c3m4ZRnhhBjNTo+m7c7SU=;
 b=MFYKyVrmsfdY3k5yhFXDAhnKn3yYFip3mTIA7Xhd7kRL9cSy2UUd3pghvTgyINypBt
 okvN0pmlHLoUN7tPF39qTGQL8EbSAKye0sSAZ16Tpo/tVeq9H6fstAghjrK+QkmGFC+9
 VcjZvmoYJf+hTtR5o1nZRvNp5A8/JhaQTcPqK9bL8I3vhEDC1TtIIv0z5MRzNEmstIgx
 zJMymG+f9zpVxq39nlh+5prDj01BpoEmAL8v3AUU/2PNQ5g+vmRW4aIjHD43SuzIZ8Xn
 Hv3t8370NFaeDEwh4b4kLS0n10gwfTQRA4FIU8uHDWaEFoiXSuyTFHEk0PaDSKv1fLW/
 GucQ==
X-Gm-Message-State: AC+VfDx5fdPzJTjKUYCIGuwK+KZT2j4EtZzp81pCcGBj+GtWuLU5Bx5o
 8+LtCssBU1j24DQHZM9p8oGRyw==
X-Google-Smtp-Source: ACHHUZ6Qcvt02JbaMIw+UD/Wk6Rma9EaInQ6hYTkIJ/Qq8sBZ0pZ52tIcb9WGRJdzRhaASFr/zmS3A==
X-Received: by 2002:a05:600c:281:b0:3f0:9fef:1028 with SMTP id
 1-20020a05600c028100b003f09fef1028mr13653182wmk.17.1683097828039; 
 Wed, 03 May 2023 00:10:28 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 v9-20020a05600c444900b003f173be2ccfsm54223673wmn.2.2023.05.03.00.10.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:10:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, gaosong@loongson.cn, philmd@linaro.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v4 40/57] tcg: Add INDEX_op_qemu_{ld,st}_i128
Date: Wed,  3 May 2023 08:06:39 +0100
Message-Id: <20230503070656.1746170-41-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503070656.1746170-1-richard.henderson@linaro.org>
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x331.google.com
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
X-List-Received-Date: Wed, 03 May 2023 07:10:46 -0000

Add opcodes for backend support for 128-bit memory operations.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg-opc.h        |  8 +++++
 tcg/aarch64/tcg-target.h     |  2 ++
 tcg/arm/tcg-target.h         |  2 ++
 tcg/i386/tcg-target.h        |  2 ++
 tcg/loongarch64/tcg-target.h |  1 +
 tcg/mips/tcg-target.h        |  2 ++
 tcg/ppc/tcg-target.h         |  2 ++
 tcg/riscv/tcg-target.h       |  2 ++
 tcg/s390x/tcg-target.h       |  2 ++
 tcg/sparc64/tcg-target.h     |  2 ++
 tcg/tci/tcg-target.h         |  2 ++
 tcg/tcg-op.c                 | 69 ++++++++++++++++++++++++++++++++----
 tcg/tcg.c                    |  4 +++
 docs/devel/tcg-ops.rst       | 11 +++---
 14 files changed, 101 insertions(+), 10 deletions(-)

diff --git a/include/tcg/tcg-opc.h b/include/tcg/tcg-opc.h
index dd444734d9..94cf7c5d6a 100644
--- a/include/tcg/tcg-opc.h
+++ b/include/tcg/tcg-opc.h
@@ -213,6 +213,14 @@ DEF(qemu_st8_i32, 0, TLADDR_ARGS + 1, 1,
     TCG_OPF_CALL_CLOBBER | TCG_OPF_SIDE_EFFECTS |
     IMPL(TCG_TARGET_HAS_qemu_st8_i32))
 
+/* Only for 64-bit hosts at the moment. */
+DEF(qemu_ld_i128, 2, 1, 1,
+    TCG_OPF_CALL_CLOBBER | TCG_OPF_SIDE_EFFECTS | TCG_OPF_64BIT |
+    IMPL(TCG_TARGET_HAS_qemu_ldst_i128))
+DEF(qemu_st_i128, 0, 3, 1,
+    TCG_OPF_CALL_CLOBBER | TCG_OPF_SIDE_EFFECTS | TCG_OPF_64BIT |
+    IMPL(TCG_TARGET_HAS_qemu_ldst_i128))
+
 /* Host vector support.  */
 
 #define IMPLVEC  TCG_OPF_VECTOR | IMPL(TCG_TARGET_MAYBE_vec)
diff --git a/tcg/aarch64/tcg-target.h b/tcg/aarch64/tcg-target.h
index 378e01d9d8..74ee2ed255 100644
--- a/tcg/aarch64/tcg-target.h
+++ b/tcg/aarch64/tcg-target.h
@@ -129,6 +129,8 @@ extern bool have_lse2;
 #define TCG_TARGET_HAS_muluh_i64        1
 #define TCG_TARGET_HAS_mulsh_i64        1
 
+#define TCG_TARGET_HAS_qemu_ldst_i128   0
+
 #define TCG_TARGET_HAS_v64              1
 #define TCG_TARGET_HAS_v128             1
 #define TCG_TARGET_HAS_v256             0
diff --git a/tcg/arm/tcg-target.h b/tcg/arm/tcg-target.h
index 4c2d3332d5..65efc538f4 100644
--- a/tcg/arm/tcg-target.h
+++ b/tcg/arm/tcg-target.h
@@ -125,6 +125,8 @@ extern bool use_neon_instructions;
 #define TCG_TARGET_HAS_rem_i32          0
 #define TCG_TARGET_HAS_qemu_st8_i32     0
 
+#define TCG_TARGET_HAS_qemu_ldst_i128   0
+
 #define TCG_TARGET_HAS_v64              use_neon_instructions
 #define TCG_TARGET_HAS_v128             use_neon_instructions
 #define TCG_TARGET_HAS_v256             0
diff --git a/tcg/i386/tcg-target.h b/tcg/i386/tcg-target.h
index 8fe6958abd..943af6775e 100644
--- a/tcg/i386/tcg-target.h
+++ b/tcg/i386/tcg-target.h
@@ -194,6 +194,8 @@ extern bool have_atomic16;
 #define TCG_TARGET_HAS_qemu_st8_i32     1
 #endif
 
+#define TCG_TARGET_HAS_qemu_ldst_i128   0
+
 /* We do not support older SSE systems, only beginning with AVX1.  */
 #define TCG_TARGET_HAS_v64              have_avx1
 #define TCG_TARGET_HAS_v128             have_avx1
diff --git a/tcg/loongarch64/tcg-target.h b/tcg/loongarch64/tcg-target.h
index 75c3d80ed2..482901ac15 100644
--- a/tcg/loongarch64/tcg-target.h
+++ b/tcg/loongarch64/tcg-target.h
@@ -168,6 +168,7 @@ typedef enum {
 #define TCG_TARGET_HAS_muls2_i64        0
 #define TCG_TARGET_HAS_muluh_i64        1
 #define TCG_TARGET_HAS_mulsh_i64        1
+#define TCG_TARGET_HAS_qemu_ldst_i128   0
 
 #define TCG_TARGET_DEFAULT_MO (0)
 
diff --git a/tcg/mips/tcg-target.h b/tcg/mips/tcg-target.h
index 47088af9cb..7277a117ef 100644
--- a/tcg/mips/tcg-target.h
+++ b/tcg/mips/tcg-target.h
@@ -204,6 +204,8 @@ extern bool use_mips32r2_instructions;
 #define TCG_TARGET_HAS_ext16u_i64       0 /* andi rt, rs, 0xffff */
 #endif
 
+#define TCG_TARGET_HAS_qemu_ldst_i128   0
+
 #define TCG_TARGET_DEFAULT_MO           0
 #define TCG_TARGET_NEED_LDST_LABELS
 
diff --git a/tcg/ppc/tcg-target.h b/tcg/ppc/tcg-target.h
index d55f0266bb..0914380bd7 100644
--- a/tcg/ppc/tcg-target.h
+++ b/tcg/ppc/tcg-target.h
@@ -149,6 +149,8 @@ extern bool have_vsx;
 #define TCG_TARGET_HAS_mulsh_i64        1
 #endif
 
+#define TCG_TARGET_HAS_qemu_ldst_i128   0
+
 /*
  * While technically Altivec could support V64, it has no 64-bit store
  * instruction and substituting two 32-bit stores makes the generated
diff --git a/tcg/riscv/tcg-target.h b/tcg/riscv/tcg-target.h
index dece3b3c27..494c986b49 100644
--- a/tcg/riscv/tcg-target.h
+++ b/tcg/riscv/tcg-target.h
@@ -163,6 +163,8 @@ typedef enum {
 #define TCG_TARGET_HAS_muluh_i64        1
 #define TCG_TARGET_HAS_mulsh_i64        1
 
+#define TCG_TARGET_HAS_qemu_ldst_i128   0
+
 #define TCG_TARGET_DEFAULT_MO (0)
 
 #define TCG_TARGET_NEED_LDST_LABELS
diff --git a/tcg/s390x/tcg-target.h b/tcg/s390x/tcg-target.h
index fe05680124..170007bea5 100644
--- a/tcg/s390x/tcg-target.h
+++ b/tcg/s390x/tcg-target.h
@@ -140,6 +140,8 @@ extern uint64_t s390_facilities[3];
 #define TCG_TARGET_HAS_muluh_i64      0
 #define TCG_TARGET_HAS_mulsh_i64      0
 
+#define TCG_TARGET_HAS_qemu_ldst_i128 0
+
 #define TCG_TARGET_HAS_v64            HAVE_FACILITY(VECTOR)
 #define TCG_TARGET_HAS_v128           HAVE_FACILITY(VECTOR)
 #define TCG_TARGET_HAS_v256           0
diff --git a/tcg/sparc64/tcg-target.h b/tcg/sparc64/tcg-target.h
index f6cd86975a..31c5537379 100644
--- a/tcg/sparc64/tcg-target.h
+++ b/tcg/sparc64/tcg-target.h
@@ -151,6 +151,8 @@ extern bool use_vis3_instructions;
 #define TCG_TARGET_HAS_muluh_i64        use_vis3_instructions
 #define TCG_TARGET_HAS_mulsh_i64        0
 
+#define TCG_TARGET_HAS_qemu_ldst_i128   0
+
 #define TCG_AREG0 TCG_REG_I0
 
 #define TCG_TARGET_DEFAULT_MO (0)
diff --git a/tcg/tci/tcg-target.h b/tcg/tci/tcg-target.h
index 364012e4d2..28dc6d5cfc 100644
--- a/tcg/tci/tcg-target.h
+++ b/tcg/tci/tcg-target.h
@@ -127,6 +127,8 @@
 #define TCG_TARGET_HAS_mulu2_i32        1
 #endif /* TCG_TARGET_REG_BITS == 64 */
 
+#define TCG_TARGET_HAS_qemu_ldst_i128   0
+
 /* Number of registers available. */
 #define TCG_TARGET_NB_REGS 16
 
diff --git a/tcg/tcg-op.c b/tcg/tcg-op.c
index 85f22458c9..06d3181fd0 100644
--- a/tcg/tcg-op.c
+++ b/tcg/tcg-op.c
@@ -3216,7 +3216,7 @@ static void canonicalize_memop_i128_as_i64(MemOp ret[2], MemOp orig)
 
 void tcg_gen_qemu_ld_i128(TCGv_i128 val, TCGv addr, TCGArg idx, MemOp memop)
 {
-    MemOpIdx oi = make_memop_idx(memop, idx);
+    const MemOpIdx oi = make_memop_idx(memop, idx);
 
     tcg_debug_assert((memop & MO_SIZE) == MO_128);
     tcg_debug_assert((memop & MO_SIGN) == 0);
@@ -3224,9 +3224,36 @@ void tcg_gen_qemu_ld_i128(TCGv_i128 val, TCGv addr, TCGArg idx, MemOp memop)
     tcg_gen_req_mo(TCG_MO_LD_LD | TCG_MO_ST_LD);
     addr = plugin_prep_mem_callbacks(addr);
 
-    /* TODO: allow the tcg backend to see the whole operation. */
+    /* TODO: For now, force 32-bit hosts to use the helper. */
+    if (TCG_TARGET_HAS_qemu_ldst_i128 && TCG_TARGET_REG_BITS == 64) {
+        TCGv_i64 lo, hi;
+        TCGArg addr_arg;
+        MemOpIdx adj_oi;
+        bool need_bswap = false;
 
-    if (use_two_i64_for_i128(memop)) {
+        if ((memop & MO_BSWAP) && !tcg_target_has_memory_bswap(memop)) {
+            lo = TCGV128_HIGH(val);
+            hi = TCGV128_LOW(val);
+            adj_oi = make_memop_idx(memop & ~MO_BSWAP, idx);
+            need_bswap = true;
+        } else {
+            lo = TCGV128_LOW(val);
+            hi = TCGV128_HIGH(val);
+            adj_oi = oi;
+        }
+
+#if TARGET_LONG_BITS == 32
+        addr_arg = tcgv_i32_arg(addr);
+#else
+        addr_arg = tcgv_i64_arg(addr);
+#endif
+        tcg_gen_op4ii_i64(INDEX_op_qemu_ld_i128, lo, hi, addr_arg, adj_oi);
+
+        if (need_bswap) {
+            tcg_gen_bswap64_i64(lo, lo);
+            tcg_gen_bswap64_i64(hi, hi);
+        }
+    } else if (use_two_i64_for_i128(memop)) {
         MemOp mop[2];
         TCGv addr_p8;
         TCGv_i64 x, y;
@@ -3269,7 +3296,7 @@ void tcg_gen_qemu_ld_i128(TCGv_i128 val, TCGv addr, TCGArg idx, MemOp memop)
 
 void tcg_gen_qemu_st_i128(TCGv_i128 val, TCGv addr, TCGArg idx, MemOp memop)
 {
-    MemOpIdx oi = make_memop_idx(memop, idx);
+    const MemOpIdx oi = make_memop_idx(memop, idx);
 
     tcg_debug_assert((memop & MO_SIZE) == MO_128);
     tcg_debug_assert((memop & MO_SIGN) == 0);
@@ -3277,9 +3304,39 @@ void tcg_gen_qemu_st_i128(TCGv_i128 val, TCGv addr, TCGArg idx, MemOp memop)
     tcg_gen_req_mo(TCG_MO_ST_LD | TCG_MO_ST_ST);
     addr = plugin_prep_mem_callbacks(addr);
 
-    /* TODO: allow the tcg backend to see the whole operation. */
+    /* TODO: For now, force 32-bit hosts to use the helper. */
 
-    if (use_two_i64_for_i128(memop)) {
+    if (TCG_TARGET_HAS_qemu_ldst_i128 && TCG_TARGET_REG_BITS == 64) {
+        TCGv_i64 lo, hi;
+        TCGArg addr_arg;
+        MemOpIdx adj_oi;
+        bool need_bswap = false;
+
+        if ((memop & MO_BSWAP) && !tcg_target_has_memory_bswap(memop)) {
+            lo = tcg_temp_new_i64();
+            hi = tcg_temp_new_i64();
+            tcg_gen_bswap64_i64(lo, TCGV128_HIGH(val));
+            tcg_gen_bswap64_i64(hi, TCGV128_LOW(val));
+            adj_oi = make_memop_idx(memop & ~MO_BSWAP, idx);
+            need_bswap = true;
+        } else {
+            lo = TCGV128_LOW(val);
+            hi = TCGV128_HIGH(val);
+            adj_oi = oi;
+        }
+
+#if TARGET_LONG_BITS == 32
+        addr_arg = tcgv_i32_arg(addr);
+#else
+        addr_arg = tcgv_i64_arg(addr);
+#endif
+        tcg_gen_op4ii_i64(INDEX_op_qemu_st_i128, lo, hi, addr_arg, adj_oi);
+
+        if (need_bswap) {
+            tcg_temp_free_i64(lo);
+            tcg_temp_free_i64(hi);
+        }
+    } else if (use_two_i64_for_i128(memop)) {
         MemOp mop[2];
         TCGv addr_p8;
         TCGv_i64 x, y;
diff --git a/tcg/tcg.c b/tcg/tcg.c
index cb5ca9b612..b0e30a55ca 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -1718,6 +1718,10 @@ bool tcg_op_supported(TCGOpcode op)
     case INDEX_op_qemu_st8_i32:
         return TCG_TARGET_HAS_qemu_st8_i32;
 
+    case INDEX_op_qemu_ld_i128:
+    case INDEX_op_qemu_st_i128:
+        return TCG_TARGET_HAS_qemu_ldst_i128;
+
     case INDEX_op_mov_i32:
     case INDEX_op_setcond_i32:
     case INDEX_op_brcond_i32:
diff --git a/docs/devel/tcg-ops.rst b/docs/devel/tcg-ops.rst
index f3f451b77f..6a166c5665 100644
--- a/docs/devel/tcg-ops.rst
+++ b/docs/devel/tcg-ops.rst
@@ -672,19 +672,20 @@ QEMU specific operations
        | This operation is optional. If the TCG backend does not implement the
          goto_ptr opcode, emitting this op is equivalent to emitting exit_tb(0).
 
-   * - qemu_ld_i32/i64 *t0*, *t1*, *flags*, *memidx*
+   * - qemu_ld_i32/i64/i128 *t0*, *t1*, *flags*, *memidx*
 
-       qemu_st_i32/i64 *t0*, *t1*, *flags*, *memidx*
+       qemu_st_i32/i64/i128 *t0*, *t1*, *flags*, *memidx*
 
        qemu_st8_i32 *t0*, *t1*, *flags*, *memidx*
 
      - | Load data at the guest address *t1* into *t0*, or store data in *t0* at guest
-         address *t1*.  The _i32/_i64 size applies to the size of the input/output
+         address *t1*.  The _i32/_i64/_i128 size applies to the size of the input/output
          register *t0* only.  The address *t1* is always sized according to the guest,
          and the width of the memory operation is controlled by *flags*.
        |
        | Both *t0* and *t1* may be split into little-endian ordered pairs of registers
-         if dealing with 64-bit quantities on a 32-bit host.
+         if dealing with 64-bit quantities on a 32-bit host, or 128-bit quantities on
+         a 64-bit host.
        |
        | The *memidx* selects the qemu tlb index to use (e.g. user or kernel access).
          The flags are the MemOp bits, selecting the sign, width, and endianness
@@ -693,6 +694,8 @@ QEMU specific operations
        | For a 32-bit host, qemu_ld/st_i64 is guaranteed to only be used with a
          64-bit memory access specified in *flags*.
        |
+       | For qemu_ld/st_i128, these are only supported for a 64-bit host.
+       |
        | For i386, qemu_st8_i32 is exactly like qemu_st_i32, except the size of
          the memory operation is known to be 8-bit.  This allows the backend to
          provide a different set of register constraints.
-- 
2.34.1


