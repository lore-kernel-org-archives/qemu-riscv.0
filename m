Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1prOZ5-0005k4-HG
	for mharc-qemu-riscv@gnu.org; Tue, 25 Apr 2023 15:43:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prOZ3-0005VY-Km
 for qemu-riscv@nongnu.org; Tue, 25 Apr 2023 15:43:01 -0400
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prOZ0-0007hY-HM
 for qemu-riscv@nongnu.org; Tue, 25 Apr 2023 15:43:01 -0400
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-4ec86aeeb5cso6658045e87.3
 for <qemu-riscv@nongnu.org>; Tue, 25 Apr 2023 12:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682451777; x=1685043777;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kSvmWvewT6DAwHW7Dk3CYO+nDkMqwiVa8dlhAxhzxaQ=;
 b=TQ0ZAeQb3NUmcDSHCoUc1wXg37AnmrSSVvSmXBQznV8HJS/mVuqHzyJvPVH7T4T3cp
 FzZenrKSk1VBVx/f+TMNBtaZcXjDdELNdc0/NsdAPDl7hk8rqWrvMInlmRccBq99vqHU
 TaqgSE7TGCA58aI2n62w1CJNHaa2vTWo67LmD2KLPz2nX+BRR3QoCKjnMPJJt6K7Ea3b
 QIByj/1hBCwRztoj0gCReh97FeA13Uf4U8JkqKKxLbQaz4XcBXoN9+UoPbVnh/X5wfkk
 G9zO9fAJES1onPNpo5Sy7tGXwjB/vk4o0Dg2kVByE/yGTBQ+rSDHTiRBYFc2WCCcles5
 QG3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682451777; x=1685043777;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kSvmWvewT6DAwHW7Dk3CYO+nDkMqwiVa8dlhAxhzxaQ=;
 b=HEbrCEIkkwqtR7CKEdJqZtldaJSQ35gjQiX403sZ6RZq+fu+Wsydk+2BAwId5yGnt1
 LnARySAxYkzULBziqSlBiXoprlMpl4B2XSqDxcgHAJm1L2rCOmhkkQz9/7mUuKWF3yFK
 v6EOSAOg6mRf9dDq5LQzf9KgoVmZz7sajQUW8P2as+rwQ935KCtC+R17H2T6uxv7j7GB
 wlPCUqy8VLL1tFS9VARI6sXdc9X8C6sKH6fVa87hE20druccglTyrA44RyjKUb3lVhrw
 2g+WCViSBDaz6zYkd5EaJhMfThcW1UjDVMNFpYRnHh+BsN2k22u1EJ+zEn7DRE1qkfCW
 23hw==
X-Gm-Message-State: AAQBX9fHdgxRcgKu8khNQM9NNgTFyz+vSI/hYntN+GMU8qJEI9mYz3SH
 wccznWz4muSYaqpc/pLtZFaQRg==
X-Google-Smtp-Source: AKy350ZzLGIX26OTEIhCjtREsMug5RIjE4AUwqc4vT0kAeUtUZzq8LBxO9RK2KB/TYHnk0bJzNXQaQ==
X-Received: by 2002:ac2:4215:0:b0:4ec:a9c1:27d7 with SMTP id
 y21-20020ac24215000000b004eca9c127d7mr5172704lfh.67.1682451776863; 
 Tue, 25 Apr 2023 12:42:56 -0700 (PDT)
Received: from stoup.. ([91.209.212.61]) by smtp.gmail.com with ESMTPSA id
 d8-20020ac25448000000b004ec55ac6cd1sm2175662lfn.136.2023.04.25.12.42.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 12:42:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com,
 philmd@linaro.org
Subject: [PATCH v3 55/57] tcg/aarch64: Support 128-bit load/store
Date: Tue, 25 Apr 2023 20:31:44 +0100
Message-Id: <20230425193146.2106111-56-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230425193146.2106111-1-richard.henderson@linaro.org>
References: <20230425193146.2106111-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::129;
 envelope-from=richard.henderson@linaro.org; helo=mail-lf1-x129.google.com
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
X-List-Received-Date: Tue, 25 Apr 2023 19:43:01 -0000

Use LDXP+STXP when LSE2 is not present and 16-byte atomicity is required,
and LDP/STP otherwise.  This requires allocating a second general-purpose
temporary, as Rs cannot overlap Rn in STXP.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/aarch64/tcg-target-con-set.h |   2 +
 tcg/aarch64/tcg-target.h         |   2 +-
 tcg/aarch64/tcg-target.c.inc     | 181 ++++++++++++++++++++++++++++++-
 3 files changed, 181 insertions(+), 4 deletions(-)

diff --git a/tcg/aarch64/tcg-target-con-set.h b/tcg/aarch64/tcg-target-con-set.h
index d6c6866878..74065c7098 100644
--- a/tcg/aarch64/tcg-target-con-set.h
+++ b/tcg/aarch64/tcg-target-con-set.h
@@ -14,6 +14,7 @@ C_O0_I2(lZ, l)
 C_O0_I2(r, rA)
 C_O0_I2(rZ, r)
 C_O0_I2(w, r)
+C_O0_I3(lZ, lZ, l)
 C_O1_I1(r, l)
 C_O1_I1(r, r)
 C_O1_I1(w, r)
@@ -33,4 +34,5 @@ C_O1_I2(w, w, wO)
 C_O1_I2(w, w, wZ)
 C_O1_I3(w, w, w, w)
 C_O1_I4(r, r, rA, rZ, rZ)
+C_O2_I1(r, r, l)
 C_O2_I4(r, r, rZ, rZ, rA, rMZ)
diff --git a/tcg/aarch64/tcg-target.h b/tcg/aarch64/tcg-target.h
index 74ee2ed255..fa6af9746f 100644
--- a/tcg/aarch64/tcg-target.h
+++ b/tcg/aarch64/tcg-target.h
@@ -129,7 +129,7 @@ extern bool have_lse2;
 #define TCG_TARGET_HAS_muluh_i64        1
 #define TCG_TARGET_HAS_mulsh_i64        1
 
-#define TCG_TARGET_HAS_qemu_ldst_i128   0
+#define TCG_TARGET_HAS_qemu_ldst_i128   1
 
 #define TCG_TARGET_HAS_v64              1
 #define TCG_TARGET_HAS_v128             1
diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index 76a6bfd202..f1627cb96d 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -81,6 +81,7 @@ bool have_lse;
 bool have_lse2;
 
 #define TCG_REG_TMP0 TCG_REG_X30
+#define TCG_REG_TMP1 TCG_REG_X17
 #define TCG_VEC_TMP0 TCG_REG_V31
 
 #ifndef CONFIG_SOFTMMU
@@ -404,6 +405,10 @@ typedef enum {
     I3305_LDR_v64   = 0x5c000000,
     I3305_LDR_v128  = 0x9c000000,
 
+    /* Load/store exclusive. */
+    I3306_LDXP      = 0xc8600000,
+    I3306_STXP      = 0xc8200000,
+
     /* Load/store register.  Described here as 3.3.12, but the helper
        that emits them can transform to 3.3.10 or 3.3.13.  */
     I3312_STRB      = 0x38000000 | LDST_ST << 22 | MO_8 << 30,
@@ -468,6 +473,9 @@ typedef enum {
     I3406_ADR       = 0x10000000,
     I3406_ADRP      = 0x90000000,
 
+    /* Add/subtract extended register instructions. */
+    I3501_ADD       = 0x0b200000,
+
     /* Add/subtract shifted register instructions (without a shift).  */
     I3502_ADD       = 0x0b000000,
     I3502_ADDS      = 0x2b000000,
@@ -638,6 +646,12 @@ static void tcg_out_insn_3305(TCGContext *s, AArch64Insn insn,
     tcg_out32(s, insn | (imm19 & 0x7ffff) << 5 | rt);
 }
 
+static void tcg_out_insn_3306(TCGContext *s, AArch64Insn insn, TCGReg rs,
+                              TCGReg rt, TCGReg rt2, TCGReg rn)
+{
+    tcg_out32(s, insn | rs << 16 | rt2 << 10 | rn << 5 | rt);
+}
+
 static void tcg_out_insn_3201(TCGContext *s, AArch64Insn insn, TCGType ext,
                               TCGReg rt, int imm19)
 {
@@ -720,6 +734,14 @@ static void tcg_out_insn_3406(TCGContext *s, AArch64Insn insn,
     tcg_out32(s, insn | (disp & 3) << 29 | (disp & 0x1ffffc) << (5 - 2) | rd);
 }
 
+static inline void tcg_out_insn_3501(TCGContext *s, AArch64Insn insn,
+                                     TCGType sf, TCGReg rd, TCGReg rn,
+                                     TCGReg rm, int opt, int imm3)
+{
+    tcg_out32(s, insn | sf << 31 | rm << 16 | opt << 13 |
+              imm3 << 10 | rn << 5 | rd);
+}
+
 /* This function is for both 3.5.2 (Add/Subtract shifted register), for
    the rare occasion when we actually want to supply a shift amount.  */
 static inline void tcg_out_insn_3502S(TCGContext *s, AArch64Insn insn,
@@ -1648,17 +1670,17 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
     TCGType addr_type = TARGET_LONG_BITS == 64 ? TCG_TYPE_I64 : TCG_TYPE_I32;
     TCGLabelQemuLdst *ldst = NULL;
     MemOp opc = get_memop(oi);
-    MemOp atom_u;
+    MemOp atom_u, s_bits;
     unsigned a_mask;
 
+    s_bits = opc & MO_SIZE;
     h->align = atom_and_align_for_opc(s, &h->atom, &atom_u, opc,
                                       have_lse2 ? MO_ATOM_WITHIN16
                                                 : MO_ATOM_IFALIGN,
-                                      false);
+                                      s_bits == MO_128);
     a_mask = (1 << h->align) - 1;
 
 #ifdef CONFIG_SOFTMMU
-    unsigned s_bits = opc & MO_SIZE;
     unsigned s_mask = (1u << s_bits) - 1;
     unsigned mem_index = get_mmuidx(oi);
     TCGReg x3;
@@ -1839,6 +1861,148 @@ static void tcg_out_qemu_st(TCGContext *s, TCGReg data_reg, TCGReg addr_reg,
     }
 }
 
+static TCGLabelQemuLdst *
+prepare_host_addr_base_only(TCGContext *s, HostAddress *h, TCGReg addr_reg,
+                            MemOpIdx oi, bool is_ld)
+{
+    TCGLabelQemuLdst *ldst;
+
+    ldst = prepare_host_addr(s, h, addr_reg, oi, true);
+
+    /* Compose the final address, as LDP/STP have no indexing. */
+    if (h->index != TCG_REG_XZR) {
+        tcg_out_insn(s, 3501, ADD, TCG_TYPE_I64, TCG_REG_TMP0,
+                     h->base, h->index,
+                     h->index_ext == TCG_TYPE_I32 ? MO_32 : MO_64, 0);
+        h->base = TCG_REG_TMP0;
+        h->index = TCG_REG_XZR;
+        h->index_ext = TCG_TYPE_I64;
+    }
+
+    return ldst;
+}
+
+static void tcg_out_qemu_ld128(TCGContext *s, TCGReg datalo, TCGReg datahi,
+                               TCGReg addr_reg, MemOpIdx oi)
+{
+    TCGLabelQemuLdst *ldst;
+    HostAddress h;
+
+    ldst = prepare_host_addr_base_only(s, &h, addr_reg, oi, true);
+
+    if (h.atom < MO_128 || have_lse2) {
+        tcg_out_insn(s, 3314, LDP, datalo, datahi, h.base, 0, 0, 0);
+    } else {
+        TCGLabel *l0, *l1 = NULL;
+
+        /*
+         * 16-byte atomicity without LSE2 requires LDXP+STXP loop:
+         * 1: ldxp lo,hi,[addr]
+         *    stxp tmp1,lo,hi,[addr]
+         *    cbnz tmp1, 1b
+         *
+         * If we have already checked for 16-byte alignment, that's all
+         * we need. Otherwise we have determined that misaligned atomicity
+         * may be handled with two 8-byte loads.
+         */
+        if (h.align < MO_128) {
+            /*
+             * TODO: align should be MO_64, so we only need test bit 3,
+             * which means we could use TBNZ instead of AND+CBNE.
+             */
+            l1 = gen_new_label();
+            tcg_out_logicali(s, I3404_ANDI, 0, TCG_REG_TMP1, addr_reg, 15);
+            tcg_out_brcond(s, TCG_TYPE_I32, TCG_COND_NE,
+                           TCG_REG_TMP1, 0, 1, l1);
+        }
+
+        l0 = gen_new_label();
+        tcg_out_label(s, l0);
+
+        tcg_out_insn(s, 3306, LDXP, TCG_REG_XZR, datalo, datahi, h.base);
+        tcg_out_insn(s, 3306, STXP, TCG_REG_TMP1, datalo, datahi, h.base);
+        tcg_out_brcond(s, TCG_TYPE_I32, TCG_COND_NE, TCG_REG_TMP1, 0, 1, l0);
+
+        if (l1) {
+            TCGLabel *l2 = gen_new_label();
+            tcg_out_goto_label(s, l2);
+
+            tcg_out_label(s, l1);
+            tcg_out_insn(s, 3314, LDP, datalo, datahi, h.base, 0, 0, 0);
+
+            tcg_out_label(s, l2);
+        }
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
+static void tcg_out_qemu_st128(TCGContext *s, TCGReg datalo, TCGReg datahi,
+                               TCGReg addr_reg, MemOpIdx oi)
+{
+    TCGLabelQemuLdst *ldst;
+    HostAddress h;
+
+    ldst = prepare_host_addr_base_only(s, &h, addr_reg, oi, false);
+
+    if (h.atom < MO_128 || have_lse2) {
+        tcg_out_insn(s, 3314, STP, datalo, datahi, h.base, 0, 0, 0);
+    } else {
+        TCGLabel *l0, *l1 = NULL;
+
+        /*
+         * 16-byte atomicity without LSE2 requires LDXP+STXP loop:
+         * 1: ldxp xzr,tmp1,[addr]
+         *    stxp tmp1,lo,hi,[addr]
+         *    cbnz tmp1, 1b
+         *
+         * If we have already checked for 16-byte alignment, that's all
+         * we need. Otherwise we have determined that misaligned atomicity
+         * may be handled with two 8-byte stores.
+         */
+        if (h.align < MO_128) {
+            /*
+             * TODO: align should be MO_64, so we only need test bit 3,
+             * which means we could use TBNZ instead of AND+CBNE.
+             */
+            l1 = gen_new_label();
+            tcg_out_logicali(s, I3404_ANDI, 0, TCG_REG_TMP1, addr_reg, 15);
+            tcg_out_brcond(s, TCG_TYPE_I32, TCG_COND_NE,
+                           TCG_REG_TMP1, 0, 1, l1);
+        }
+
+        l0 = gen_new_label();
+        tcg_out_label(s, l0);
+
+        tcg_out_insn(s, 3306, LDXP, TCG_REG_XZR,
+                     TCG_REG_XZR, TCG_REG_TMP1, h.base);
+        tcg_out_insn(s, 3306, STXP, TCG_REG_TMP1, datalo, datahi, h.base);
+        tcg_out_brcond(s, TCG_TYPE_I32, TCG_COND_NE, TCG_REG_TMP1, 0, 1, l0);
+
+        if (l1) {
+            TCGLabel *l2 = gen_new_label();
+            tcg_out_goto_label(s, l2);
+
+            tcg_out_label(s, l1);
+            tcg_out_insn(s, 3314, STP, datalo, datahi, h.base, 0, 0, 0);
+
+            tcg_out_label(s, l2);
+        }
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
 static const tcg_insn_unit *tb_ret_addr;
 
 static void tcg_out_exit_tb(TCGContext *s, uintptr_t a0)
@@ -2176,6 +2340,12 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_qemu_st_i64:
         tcg_out_qemu_st(s, REG0(0), a1, a2, ext);
         break;
+    case INDEX_op_qemu_ld_i128:
+        tcg_out_qemu_ld128(s, a0, a1, a2, args[3]);
+        break;
+    case INDEX_op_qemu_st_i128:
+        tcg_out_qemu_st128(s, REG0(0), REG0(1), a2, args[3]);
+        break;
 
     case INDEX_op_bswap64_i64:
         tcg_out_rev(s, TCG_TYPE_I64, MO_64, a0, a1);
@@ -2813,9 +2983,13 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_qemu_ld_i32:
     case INDEX_op_qemu_ld_i64:
         return C_O1_I1(r, l);
+    case INDEX_op_qemu_ld_i128:
+        return C_O2_I1(r, r, l);
     case INDEX_op_qemu_st_i32:
     case INDEX_op_qemu_st_i64:
         return C_O0_I2(lZ, l);
+    case INDEX_op_qemu_st_i128:
+        return C_O0_I3(lZ, lZ, l);
 
     case INDEX_op_deposit_i32:
     case INDEX_op_deposit_i64:
@@ -2944,6 +3118,7 @@ static void tcg_target_init(TCGContext *s)
     tcg_regset_set_reg(s->reserved_regs, TCG_REG_FP);
     tcg_regset_set_reg(s->reserved_regs, TCG_REG_X18); /* platform register */
     tcg_regset_set_reg(s->reserved_regs, TCG_REG_TMP0);
+    tcg_regset_set_reg(s->reserved_regs, TCG_REG_TMP1);
     tcg_regset_set_reg(s->reserved_regs, TCG_VEC_TMP0);
 }
 
-- 
2.34.1


