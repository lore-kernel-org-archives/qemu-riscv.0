Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1prOZo-0002if-Ss
	for mharc-qemu-riscv@gnu.org; Tue, 25 Apr 2023 15:43:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prOZn-0002WE-4h
 for qemu-riscv@nongnu.org; Tue, 25 Apr 2023 15:43:47 -0400
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prOZk-0007sx-Pz
 for qemu-riscv@nongnu.org; Tue, 25 Apr 2023 15:43:46 -0400
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-4efef769000so3305008e87.3
 for <qemu-riscv@nongnu.org>; Tue, 25 Apr 2023 12:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682451823; x=1685043823;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=255MRdCL5yMgAYzZU5GCo8Mz4wWBTy7IHHcpHB/YBDg=;
 b=sbTDdgmkFLqLlFT5SbZ0bpicuWpYQQ0NjRafDjt5n8LFU0si3ndPwahPXHXd1KNWeP
 fFZDN/0HcJqHkJyLAiXFlt3iJZKtzUyfHAyrMAJtmG17u2bRnwqjDdrQms/Q0JE2jAD1
 Qsnv+8tJWtJRvvJatT8VO4BI4EZVSOIXM22HZNh7iySqBn6GjxujtVkhXLraAVKt/LG3
 0XCXaP9BzEza2ykuYmqIaA2UQQziJSLWCZ765hNahUo0K5T2TQ8iWm5FsDMXkvZSM+zr
 xXzuuwXelkEr0qlYBJpiQ5elK3QPid+lbOwcNlVYquqPhvwPmtIrSotVebitm/VjmJZT
 8uRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682451823; x=1685043823;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=255MRdCL5yMgAYzZU5GCo8Mz4wWBTy7IHHcpHB/YBDg=;
 b=H+jAxHyH+WuGEBU5wGLsCWDY/rDwQX9hA7PxA2bJP2fhwAEtdBVfeBe0UIwJRf2pXo
 UMrchn72/wREnRbLCTqMw280Of5Z7RTP8BNxUROCuPiB2k1ANG315GI+lf3FmMOroLnm
 woEllZgy8VOWg58/22F/gpAL1CHzdRkuo/Fq5OSfefcKUqc+SXkl8FsNRLJL+1jijY9r
 Z3o3ZCfVKOM6FYixNqrb1wjXrEwglh6+6tqK33ws3B4E5w2+2Bk1rkA7TaQl3lF4+yX5
 WrHO3c9ZJJMFOLRgi2Iy6WNRfh6JBlpw2pii6B/3fdZHxHk9/OwVCKYM8UvTgoDW0oOw
 T5ag==
X-Gm-Message-State: AAQBX9cPP83J4t/Nf5EbseOxKU1L5hTl5Bu589IGeozG0C6cCRsOqUXu
 xY5Kj/bvPw371zbTO4tKNu0JdQ==
X-Google-Smtp-Source: AKy350b8s73d5FH6IjPU/gn0okp7vCOXy0hS8w/NA27GuhZ6gkE+RbGbqgQ22fJaHay8kY5sM6mQDg==
X-Received: by 2002:ac2:563c:0:b0:4ec:9faf:9ec9 with SMTP id
 b28-20020ac2563c000000b004ec9faf9ec9mr5404811lff.23.1682451823259; 
 Tue, 25 Apr 2023 12:43:43 -0700 (PDT)
Received: from stoup.. ([91.209.212.61]) by smtp.gmail.com with ESMTPSA id
 d8-20020ac25448000000b004ec55ac6cd1sm2175662lfn.136.2023.04.25.12.43.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 12:43:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com,
 philmd@linaro.org
Subject: [PATCH v3 57/57] tcg/s390x: Support 128-bit load/store
Date: Tue, 25 Apr 2023 20:31:46 +0100
Message-Id: <20230425193146.2106111-58-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230425193146.2106111-1-richard.henderson@linaro.org>
References: <20230425193146.2106111-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::136;
 envelope-from=richard.henderson@linaro.org; helo=mail-lf1-x136.google.com
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
X-List-Received-Date: Tue, 25 Apr 2023 19:43:47 -0000

Use LPQ/STPQ when 16-byte atomicity is required.
Note that these instructions require 16-byte alignment.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target-con-set.h |   2 +
 tcg/s390x/tcg-target.h         |   2 +-
 tcg/s390x/tcg-target.c.inc     | 100 ++++++++++++++++++++++++++++++++-
 3 files changed, 102 insertions(+), 2 deletions(-)

diff --git a/tcg/s390x/tcg-target-con-set.h b/tcg/s390x/tcg-target-con-set.h
index ecc079bb6d..cbad91b2b5 100644
--- a/tcg/s390x/tcg-target-con-set.h
+++ b/tcg/s390x/tcg-target-con-set.h
@@ -14,6 +14,7 @@ C_O0_I2(r, r)
 C_O0_I2(r, ri)
 C_O0_I2(r, rA)
 C_O0_I2(v, r)
+C_O0_I3(o, m, r)
 C_O1_I1(r, r)
 C_O1_I1(v, r)
 C_O1_I1(v, v)
@@ -36,6 +37,7 @@ C_O1_I2(v, v, v)
 C_O1_I3(v, v, v, v)
 C_O1_I4(r, r, ri, rI, r)
 C_O1_I4(r, r, rA, rI, r)
+C_O2_I1(o, m, r)
 C_O2_I2(o, m, 0, r)
 C_O2_I2(o, m, r, r)
 C_O2_I3(o, m, 0, 1, r)
diff --git a/tcg/s390x/tcg-target.h b/tcg/s390x/tcg-target.h
index 170007bea5..ec96952172 100644
--- a/tcg/s390x/tcg-target.h
+++ b/tcg/s390x/tcg-target.h
@@ -140,7 +140,7 @@ extern uint64_t s390_facilities[3];
 #define TCG_TARGET_HAS_muluh_i64      0
 #define TCG_TARGET_HAS_mulsh_i64      0
 
-#define TCG_TARGET_HAS_qemu_ldst_i128 0
+#define TCG_TARGET_HAS_qemu_ldst_i128 1
 
 #define TCG_TARGET_HAS_v64            HAVE_FACILITY(VECTOR)
 #define TCG_TARGET_HAS_v128           HAVE_FACILITY(VECTOR)
diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index ddd9860a6a..91fecfc51b 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -243,6 +243,7 @@ typedef enum S390Opcode {
     RXY_LLGF    = 0xe316,
     RXY_LLGH    = 0xe391,
     RXY_LMG     = 0xeb04,
+    RXY_LPQ     = 0xe38f,
     RXY_LRV     = 0xe31e,
     RXY_LRVG    = 0xe30f,
     RXY_LRVH    = 0xe31f,
@@ -253,6 +254,7 @@ typedef enum S390Opcode {
     RXY_STG     = 0xe324,
     RXY_STHY    = 0xe370,
     RXY_STMG    = 0xeb24,
+    RXY_STPQ    = 0xe38e,
     RXY_STRV    = 0xe33e,
     RXY_STRVG   = 0xe32f,
     RXY_STRVH   = 0xe33f,
@@ -1578,7 +1580,19 @@ typedef struct {
 
 bool tcg_target_has_memory_bswap(MemOp memop)
 {
-    return true;
+    MemOp atom_a, atom_u;
+
+    if ((memop & MO_SIZE) <= MO_64) {
+        return true;
+    }
+
+    /*
+     * Reject 16-byte memop with 16-byte atomicity,
+     * but do allow a pair of 64-bit operations.
+     */
+    (void)atom_and_align_for_opc(tcg_ctx, &atom_a, &atom_u, memop,
+                                 MO_ATOM_IFALIGN, true);
+    return atom_a <= MO_64;
 }
 
 static void tcg_out_qemu_ld_direct(TCGContext *s, MemOp opc, TCGReg data,
@@ -1868,6 +1882,80 @@ static void tcg_out_qemu_st(TCGContext* s, TCGReg data_reg, TCGReg addr_reg,
     }
 }
 
+static void tcg_out_qemu_ldst_i128(TCGContext *s, TCGReg datalo, TCGReg datahi,
+                                   TCGReg addr_reg, MemOpIdx oi, bool is_ld)
+{
+    TCGLabel *l1 = NULL, *l2 = NULL;
+    TCGLabelQemuLdst *ldst;
+    HostAddress h;
+    bool need_bswap;
+    bool use_pair;
+    S390Opcode insn;
+
+    ldst = prepare_host_addr(s, &h, addr_reg, oi, is_ld);
+
+    use_pair = h.atom < MO_128;
+    need_bswap = get_memop(oi) & MO_BSWAP;
+
+    if (!use_pair) {
+        /*
+         * Atomicity requires we use LPQ.  If we've already checked for
+         * 16-byte alignment, that's all we need.  If we arrive with
+         * lesser alignment, we have determined that less than 16-byte
+         * alignment can be satisfied with two 8-byte loads.
+         */
+        if (h.align < MO_128) {
+            use_pair = true;
+            l1 = gen_new_label();
+            l2 = gen_new_label();
+
+            tcg_out_insn(s, RI, TMLL, addr_reg, 15);
+            tgen_branch(s, 7, l1); /* CC in {1,2,3} */
+        }
+
+        tcg_debug_assert(!need_bswap);
+        tcg_debug_assert(datalo & 1);
+        tcg_debug_assert(datahi == datalo - 1);
+        insn = is_ld ? RXY_LPQ : RXY_STPQ;
+        tcg_out_insn_RXY(s, insn, datahi, h.base, h.index, h.disp);
+
+        if (use_pair) {
+            tgen_branch(s, S390_CC_ALWAYS, l2);
+            tcg_out_label(s, l1);
+        }
+    }
+    if (use_pair) {
+        TCGReg d1, d2;
+
+        if (need_bswap) {
+            d1 = datalo, d2 = datahi;
+            insn = is_ld ? RXY_LRVG : RXY_STRVG;
+        } else {
+            d1 = datahi, d2 = datalo;
+            insn = is_ld ? RXY_LG : RXY_STG;
+        }
+
+        if (h.base == d1 || h.index == d1) {
+            tcg_out_insn(s, RXY, LAY, TCG_TMP0, h.base, h.index, h.disp);
+            h.base = TCG_TMP0;
+            h.index = TCG_REG_NONE;
+            h.disp = 0;
+        }
+        tcg_out_insn_RXY(s, insn, d1, h.base, h.index, h.disp);
+        tcg_out_insn_RXY(s, insn, d2, h.base, h.index, h.disp + 8);
+    }
+    if (l2) {
+        tcg_out_label(s, l2);
+    }
+
+    if (ldst) {
+        ldst->type = TCG_TYPE_I128;
+        ldst->datalo_reg = datalo;
+        ldst->datahi_reg = datahi;
+        ldst->raddr = tcg_splitwx_to_rx(s->code_ptr);
+    }
+}
+
 static void tcg_out_exit_tb(TCGContext *s, uintptr_t a0)
 {
     /* Reuse the zeroing that exists for goto_ptr.  */
@@ -2225,6 +2313,12 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_qemu_st_i64:
         tcg_out_qemu_st(s, args[0], args[1], args[2], TCG_TYPE_I64);
         break;
+    case INDEX_op_qemu_ld_i128:
+        tcg_out_qemu_ldst_i128(s, args[0], args[1], args[2], args[3], true);
+        break;
+    case INDEX_op_qemu_st_i128:
+        tcg_out_qemu_ldst_i128(s, args[0], args[1], args[2], args[3], false);
+        break;
 
     case INDEX_op_ld16s_i64:
         tcg_out_mem(s, 0, RXY_LGH, args[0], args[1], TCG_REG_NONE, args[2]);
@@ -3102,6 +3196,10 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_qemu_st_i64:
     case INDEX_op_qemu_st_i32:
         return C_O0_I2(r, r);
+    case INDEX_op_qemu_ld_i128:
+        return C_O2_I1(o, m, r);
+    case INDEX_op_qemu_st_i128:
+        return C_O0_I3(o, m, r);
 
     case INDEX_op_deposit_i32:
     case INDEX_op_deposit_i64:
-- 
2.34.1


