Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pu6du-0004jN-Bw
	for mharc-qemu-riscv@gnu.org; Wed, 03 May 2023 03:11:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6dc-0003CA-TR
 for qemu-riscv@nongnu.org; Wed, 03 May 2023 03:10:57 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6dN-00071N-Mh
 for qemu-riscv@nongnu.org; Wed, 03 May 2023 03:10:56 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3f1950f5628so46205555e9.3
 for <qemu-riscv@nongnu.org>; Wed, 03 May 2023 00:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683097840; x=1685689840;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=255MRdCL5yMgAYzZU5GCo8Mz4wWBTy7IHHcpHB/YBDg=;
 b=voxBZquz2WjiUL9ELh60U6XFTPy1nC/vo1GkLUu9ZYIo4GIwnonM+fznkUTQTmFAVO
 K55wEf4Glv9ibzeJwGIvyMjPaTBnr2Kn5wjBjh6q8ygh7L4fRcIp3ESpZTy+4lI8IexF
 zLGiZjn926asiWzwQ4GOn45P18RblERAfPtBJay/HPIhLSrNLIUxIj+skVVmtwY96inv
 zgnC/ZQpcPpF7+gX1C/zPkwIbncpLk4Q1gR3P/3WMmUZtZxQI3y1bf587+QZCzd8omTt
 Zk2eKwa6WUgl80/Yam9DHlGqZ0N4whPd/o5zRN/joyXbhtg8UbmtexieD7WSqe3REGeD
 mRuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683097840; x=1685689840;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=255MRdCL5yMgAYzZU5GCo8Mz4wWBTy7IHHcpHB/YBDg=;
 b=OQj11IJGZzQxvp3lfvuYPtMAYSLh0L58SYSeMsveTsQ92I/3hbFY2Dy/4v0P2o5O+u
 JZPCMe3WymEpfAPpqlKlTu076KKJ7us2fWchHFD+JyWOHXHUuzBd8Cb4XZ1uox4KqGdw
 KV7TDbVVnuYsuq5nKYVPiVL29kLyWd6gFs6m9VcJE2re+Z6hqbni8ftbMrzHq/Qk+aBn
 9ZtRzknvn+QnqCIsdyf/CTGDwzjfNU237cK4otaRMmazZzxajOlnx0Wq7gnCHCI+VYxI
 r7kVeW27Cilaq3EhjEq0y2J7iF2Ycb9Lvlc0SwLbInYV7/Rir9rcsa1JJh2D/cxxIBCy
 d8UA==
X-Gm-Message-State: AC+VfDwjNGjz4GY38j//psQrF16D0tBwRNl/YXlgYzUgrt2R5/3bg38B
 cWnJ7PcSmrYsCPpI/NnkpjYmDw==
X-Google-Smtp-Source: ACHHUZ54bi8Riw1DJHH8pAeSXM+jgiGpLtYL2WBppHtsNhw//vHa9wWD1bsQVJYcswcQkAon9FNmeg==
X-Received: by 2002:a7b:ca56:0:b0:3f1:6ec5:3105 with SMTP id
 m22-20020a7bca56000000b003f16ec53105mr13735864wml.20.1683097840701; 
 Wed, 03 May 2023 00:10:40 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 v9-20020a05600c444900b003f173be2ccfsm54223673wmn.2.2023.05.03.00.10.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:10:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, gaosong@loongson.cn, philmd@linaro.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v4 57/57] tcg/s390x: Support 128-bit load/store
Date: Wed,  3 May 2023 08:06:56 +0100
Message-Id: <20230503070656.1746170-58-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503070656.1746170-1-richard.henderson@linaro.org>
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32f.google.com
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
X-List-Received-Date: Wed, 03 May 2023 07:10:57 -0000

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


