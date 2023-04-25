Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1prOZ2-0005TH-VD
	for mharc-qemu-riscv@gnu.org; Tue, 25 Apr 2023 15:43:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prOZ1-0005O7-OE
 for qemu-riscv@nongnu.org; Tue, 25 Apr 2023 15:42:59 -0400
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prOYv-0007fL-H9
 for qemu-riscv@nongnu.org; Tue, 25 Apr 2023 15:42:59 -0400
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-4eff50911bfso2633357e87.2
 for <qemu-riscv@nongnu.org>; Tue, 25 Apr 2023 12:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682451772; x=1685043772;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c7cEeUCT+DqTBIQlkyakmBiJxoFYBo2GhPEulivzSlM=;
 b=JDreiGsomXo+9ZRhcCr6flCJv5k8+cu856eLBgvqWjPu5WjaWqHa2yOa5YclBFZDnC
 zeh1txdr/7jwH2M1tDnmjjIf5DbjHoMGG2evWbgfbmp5sy5zoSOSu51Fw6FXZWmLPScm
 jLEc9hM5hGdGuKaU4u5jo2GSS5itO6GFFbr29Vo8ivt4D6SqLnZkw8qKOlY4iG+n5ZBp
 ZmEWUl1Ok1vDY/xK1PQpbbyFWjAQuwTvaet2RkzcTrf+TYKkFuOQbSM/wvUa4Kh5qLc2
 anTGqk8TwSu+IKK2MvlBLUY8fdlM2cq9/hNPRYETJov8PHJrwaiqfYvIgDMPBCfP7lca
 B2GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682451772; x=1685043772;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c7cEeUCT+DqTBIQlkyakmBiJxoFYBo2GhPEulivzSlM=;
 b=DTGfGrMbJTz9Apy0DnW0CYUcfAHnvxBbbeR3/WqkewEIdGCJzbZYmKAzZJITW1nAP+
 udW02LRqsT6xoOSLrkA420wPW33iEZPBvz4/zbcmDQDkBTK9YLqUPdEu9/j2tP3rppO9
 lJoBp32Th/4KZbVtGQfpeCukJeb427c6AZV/yaqvz38LVOSl7bKzeg0jBeqJ+xb0kztG
 4Ex6lqZa2ltJSPb3nSZrMlKj9j41iMJce+Yp3csBjKFo/O3BVnZ/+ha7GGWG3Xt5aLfK
 osTEvhvfwKRU63+sh68dKh5aVi6darcuAHeXzHUAfxKhBVA6oWp1zJvx1pwCdgHiycgY
 savg==
X-Gm-Message-State: AAQBX9d2oD4lU0k9Zo3kFakPdaho75mw+604JCl0Xe2dfUXzCre1Yw6Q
 /VqWW9Opgk6eEXX6XROLivpjpA==
X-Google-Smtp-Source: AKy350Y0fYXQ+P4Xzrin04Em7U5eJkK2MQWLXo5xdbf9TGfsmI8e309LyBkgy7BX0reWLVZj+C8CgQ==
X-Received: by 2002:ac2:43da:0:b0:4ec:9f24:3e5c with SMTP id
 u26-20020ac243da000000b004ec9f243e5cmr4467719lfl.2.1682451771816; 
 Tue, 25 Apr 2023 12:42:51 -0700 (PDT)
Received: from stoup.. ([91.209.212.61]) by smtp.gmail.com with ESMTPSA id
 d8-20020ac25448000000b004ec55ac6cd1sm2175662lfn.136.2023.04.25.12.42.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 12:42:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com,
 philmd@linaro.org
Subject: [PATCH v3 54/57] tcg/aarch64: Rename temporaries
Date: Tue, 25 Apr 2023 20:31:43 +0100
Message-Id: <20230425193146.2106111-55-richard.henderson@linaro.org>
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
X-List-Received-Date: Tue, 25 Apr 2023 19:43:00 -0000

We will need to allocate a second general-purpose temporary.
Rename the existing temps to add a distinguishing number.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/aarch64/tcg-target.c.inc | 50 ++++++++++++++++++------------------
 1 file changed, 25 insertions(+), 25 deletions(-)

diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index 1d6d382edd..76a6bfd202 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -80,8 +80,8 @@ static TCGReg tcg_target_call_oarg_reg(TCGCallReturnKind kind, int slot)
 bool have_lse;
 bool have_lse2;
 
-#define TCG_REG_TMP TCG_REG_X30
-#define TCG_VEC_TMP TCG_REG_V31
+#define TCG_REG_TMP0 TCG_REG_X30
+#define TCG_VEC_TMP0 TCG_REG_V31
 
 #ifndef CONFIG_SOFTMMU
 /* Note that XZR cannot be encoded in the address base register slot,
@@ -998,7 +998,7 @@ static bool tcg_out_dup_vec(TCGContext *s, TCGType type, unsigned vece,
 static bool tcg_out_dupm_vec(TCGContext *s, TCGType type, unsigned vece,
                              TCGReg r, TCGReg base, intptr_t offset)
 {
-    TCGReg temp = TCG_REG_TMP;
+    TCGReg temp = TCG_REG_TMP0;
 
     if (offset < -0xffffff || offset > 0xffffff) {
         tcg_out_movi(s, TCG_TYPE_PTR, temp, offset);
@@ -1150,8 +1150,8 @@ static void tcg_out_ldst(TCGContext *s, AArch64Insn insn, TCGReg rd,
     }
 
     /* Worst-case scenario, move offset to temp register, use reg offset.  */
-    tcg_out_movi(s, TCG_TYPE_I64, TCG_REG_TMP, offset);
-    tcg_out_ldst_r(s, insn, rd, rn, TCG_TYPE_I64, TCG_REG_TMP);
+    tcg_out_movi(s, TCG_TYPE_I64, TCG_REG_TMP0, offset);
+    tcg_out_ldst_r(s, insn, rd, rn, TCG_TYPE_I64, TCG_REG_TMP0);
 }
 
 static bool tcg_out_mov(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg)
@@ -1367,8 +1367,8 @@ static void tcg_out_call_int(TCGContext *s, const tcg_insn_unit *target)
     if (offset == sextract64(offset, 0, 26)) {
         tcg_out_insn(s, 3206, BL, offset);
     } else {
-        tcg_out_movi(s, TCG_TYPE_I64, TCG_REG_TMP, (intptr_t)target);
-        tcg_out_insn(s, 3207, BLR, TCG_REG_TMP);
+        tcg_out_movi(s, TCG_TYPE_I64, TCG_REG_TMP0, (intptr_t)target);
+        tcg_out_insn(s, 3207, BLR, TCG_REG_TMP0);
     }
 }
 
@@ -1505,7 +1505,7 @@ static void tcg_out_addsub2(TCGContext *s, TCGType ext, TCGReg rl,
     AArch64Insn insn;
 
     if (rl == ah || (!const_bh && rl == bh)) {
-        rl = TCG_REG_TMP;
+        rl = TCG_REG_TMP0;
     }
 
     if (const_bl) {
@@ -1522,7 +1522,7 @@ static void tcg_out_addsub2(TCGContext *s, TCGType ext, TCGReg rl,
                possibility of adding 0+const in the low part, and the
                immediate add instructions encode XSP not XZR.  Don't try
                anything more elaborate here than loading another zero.  */
-            al = TCG_REG_TMP;
+            al = TCG_REG_TMP0;
             tcg_out_movi(s, ext, al, 0);
         }
         tcg_out_insn_3401(s, insn, ext, rl, al, bl);
@@ -1563,7 +1563,7 @@ static void tcg_out_cltz(TCGContext *s, TCGType ext, TCGReg d,
 {
     TCGReg a1 = a0;
     if (is_ctz) {
-        a1 = TCG_REG_TMP;
+        a1 = TCG_REG_TMP0;
         tcg_out_insn(s, 3507, RBIT, ext, a1, a0);
     }
     if (const_b && b == (ext ? 64 : 32)) {
@@ -1572,7 +1572,7 @@ static void tcg_out_cltz(TCGContext *s, TCGType ext, TCGReg d,
         AArch64Insn sel = I3506_CSEL;
 
         tcg_out_cmp(s, ext, a0, 0, 1);
-        tcg_out_insn(s, 3507, CLZ, ext, TCG_REG_TMP, a1);
+        tcg_out_insn(s, 3507, CLZ, ext, TCG_REG_TMP0, a1);
 
         if (const_b) {
             if (b == -1) {
@@ -1585,7 +1585,7 @@ static void tcg_out_cltz(TCGContext *s, TCGType ext, TCGReg d,
                 b = d;
             }
         }
-        tcg_out_insn_3506(s, sel, ext, d, TCG_REG_TMP, b, TCG_COND_NE);
+        tcg_out_insn_3506(s, sel, ext, d, TCG_REG_TMP0, b, TCG_COND_NE);
     }
 }
 
@@ -1603,7 +1603,7 @@ bool tcg_target_has_memory_bswap(MemOp memop)
 }
 
 static const TCGLdstHelperParam ldst_helper_param = {
-    .ntmp = 1, .tmp = { TCG_REG_TMP }
+    .ntmp = 1, .tmp = { TCG_REG_TMP0 }
 };
 
 static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
@@ -1864,7 +1864,7 @@ static void tcg_out_goto_tb(TCGContext *s, int which)
 
     set_jmp_insn_offset(s, which);
     tcg_out32(s, I3206_B);
-    tcg_out_insn(s, 3207, BR, TCG_REG_TMP);
+    tcg_out_insn(s, 3207, BR, TCG_REG_TMP0);
     set_jmp_reset_offset(s, which);
 }
 
@@ -1883,7 +1883,7 @@ void tb_target_set_jmp_target(const TranslationBlock *tb, int n,
         ptrdiff_t i_offset = i_addr - jmp_rx;
 
         /* Note that we asserted this in range in tcg_out_goto_tb. */
-        insn = deposit32(I3305_LDR | TCG_REG_TMP, 5, 19, i_offset >> 2);
+        insn = deposit32(I3305_LDR | TCG_REG_TMP0, 5, 19, i_offset >> 2);
     }
     qatomic_set((uint32_t *)jmp_rw, insn);
     flush_idcache_range(jmp_rx, jmp_rw, 4);
@@ -2079,13 +2079,13 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
 
     case INDEX_op_rem_i64:
     case INDEX_op_rem_i32:
-        tcg_out_insn(s, 3508, SDIV, ext, TCG_REG_TMP, a1, a2);
-        tcg_out_insn(s, 3509, MSUB, ext, a0, TCG_REG_TMP, a2, a1);
+        tcg_out_insn(s, 3508, SDIV, ext, TCG_REG_TMP0, a1, a2);
+        tcg_out_insn(s, 3509, MSUB, ext, a0, TCG_REG_TMP0, a2, a1);
         break;
     case INDEX_op_remu_i64:
     case INDEX_op_remu_i32:
-        tcg_out_insn(s, 3508, UDIV, ext, TCG_REG_TMP, a1, a2);
-        tcg_out_insn(s, 3509, MSUB, ext, a0, TCG_REG_TMP, a2, a1);
+        tcg_out_insn(s, 3508, UDIV, ext, TCG_REG_TMP0, a1, a2);
+        tcg_out_insn(s, 3509, MSUB, ext, a0, TCG_REG_TMP0, a2, a1);
         break;
 
     case INDEX_op_shl_i64:
@@ -2129,8 +2129,8 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         if (c2) {
             tcg_out_rotl(s, ext, a0, a1, a2);
         } else {
-            tcg_out_insn(s, 3502, SUB, 0, TCG_REG_TMP, TCG_REG_XZR, a2);
-            tcg_out_insn(s, 3508, RORV, ext, a0, a1, TCG_REG_TMP);
+            tcg_out_insn(s, 3502, SUB, 0, TCG_REG_TMP0, TCG_REG_XZR, a2);
+            tcg_out_insn(s, 3508, RORV, ext, a0, a1, TCG_REG_TMP0);
         }
         break;
 
@@ -2532,8 +2532,8 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
                             break;
                         }
                     }
-                    tcg_out_dupi_vec(s, type, MO_8, TCG_VEC_TMP, 0);
-                    a2 = TCG_VEC_TMP;
+                    tcg_out_dupi_vec(s, type, MO_8, TCG_VEC_TMP0, 0);
+                    a2 = TCG_VEC_TMP0;
                 }
                 if (is_scalar) {
                     insn = cmp_scalar_insn[cond];
@@ -2942,9 +2942,9 @@ static void tcg_target_init(TCGContext *s)
     s->reserved_regs = 0;
     tcg_regset_set_reg(s->reserved_regs, TCG_REG_SP);
     tcg_regset_set_reg(s->reserved_regs, TCG_REG_FP);
-    tcg_regset_set_reg(s->reserved_regs, TCG_REG_TMP);
     tcg_regset_set_reg(s->reserved_regs, TCG_REG_X18); /* platform register */
-    tcg_regset_set_reg(s->reserved_regs, TCG_VEC_TMP);
+    tcg_regset_set_reg(s->reserved_regs, TCG_REG_TMP0);
+    tcg_regset_set_reg(s->reserved_regs, TCG_VEC_TMP0);
 }
 
 /* Saving pairs: (X19, X20) .. (X27, X28), (X29(fp), X30(lr)).  */
-- 
2.34.1


