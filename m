Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1prOYa-00041g-6z
	for mharc-qemu-riscv@gnu.org; Tue, 25 Apr 2023 15:42:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prOYX-0003gC-Bo
 for qemu-riscv@nongnu.org; Tue, 25 Apr 2023 15:42:29 -0400
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prOYU-0007aN-9w
 for qemu-riscv@nongnu.org; Tue, 25 Apr 2023 15:42:29 -0400
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-4edc114c716so6758854e87.1
 for <qemu-riscv@nongnu.org>; Tue, 25 Apr 2023 12:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682451744; x=1685043744;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wyklooo0uraLqVOx9ne4PdT+xcmPv9LAwlA941QlXUc=;
 b=ufC1TUAc3awMK+DX+PammUIF0J0ebg50Fj18utY6msokCsIBPPqTUn8KbmOrd/YueH
 WVTg8Un7RuKUBGQiukMBF+W/HN7n2GbUbH1xWjFypk2eZRTT0IJPIH5Yfq/3JFlhuYUE
 ZZf3jBoEBWSvNp60pFSetyTzkxbk6xm10eoz2MDCKSvtF+sdQR2DHpbionqQQawf1ebe
 drS1nhL8a8Z1xccNL04z1K3B0VhWlz+vLoH/DMLOzQDUDGGyEFpDzUJ6eysxgB3RhktH
 83KXobFNel6yWrMXAj9OyokOj14PaHumKRb8Mc5ckjK4GWtL5XDJU8Jb2S8taN7pjfPr
 FKTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682451744; x=1685043744;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wyklooo0uraLqVOx9ne4PdT+xcmPv9LAwlA941QlXUc=;
 b=ca4rdheSghjfwuoPoMEntpGOgIeLcaIdIa0GdnahDhOCwQ2L7rLQDQrDUJAonanZw7
 zjsnw+bLkp6sZHsn/iUgtWc843Rde0Wy74SOonQLStX9jfeIHBCLZcIXea7mhHcokwaE
 L7/7+3UxAQ1BIBtcKIJWf9wUWt1mZTC97kzQ61eA/NYppl7goeeeBlr960EeYui97mCc
 sv7HZtjg9p5LinH74wMCz/fasvX9GXLe3PFZuhzpRZni7esAqf16FPHAuQyP+JthIILn
 O0zvkWvNyd8y0EFR/6AHmeAz1h4di2m3GFVxNDrppLI/AvdRl7ebcSZm+qpFTf+bGOoF
 PeDA==
X-Gm-Message-State: AAQBX9drhmYSbBfKL51M4Um2Q9MGlzbNf30ADSSTLjETf5jnIVLyMBvA
 Zeufi73ghjDfhp/0aA4TJp/o3w==
X-Google-Smtp-Source: AKy350a0d0sosq/zA0gQKODM+2sNx8JnA584A8WWC9bFq/F42iNLhrRrwiPNQWd1wT5hfrRk6UBJVA==
X-Received: by 2002:ac2:4e49:0:b0:4eb:29b0:1ca4 with SMTP id
 f9-20020ac24e49000000b004eb29b01ca4mr4041999lfr.8.1682451744631; 
 Tue, 25 Apr 2023 12:42:24 -0700 (PDT)
Received: from stoup.. ([91.209.212.61]) by smtp.gmail.com with ESMTPSA id
 d8-20020ac25448000000b004ec55ac6cd1sm2175662lfn.136.2023.04.25.12.42.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 12:42:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com,
 philmd@linaro.org
Subject: [PATCH v3 53/57] tcg/i386: Support 128-bit load/store with
 have_atomic16
Date: Tue, 25 Apr 2023 20:31:42 +0100
Message-Id: <20230425193146.2106111-54-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230425193146.2106111-1-richard.henderson@linaro.org>
References: <20230425193146.2106111-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12f;
 envelope-from=richard.henderson@linaro.org; helo=mail-lf1-x12f.google.com
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
X-List-Received-Date: Tue, 25 Apr 2023 19:42:30 -0000

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.h     |   3 +-
 tcg/i386/tcg-target.c.inc | 184 +++++++++++++++++++++++++++++++++++++-
 2 files changed, 182 insertions(+), 5 deletions(-)

diff --git a/tcg/i386/tcg-target.h b/tcg/i386/tcg-target.h
index 943af6775e..7f69997e30 100644
--- a/tcg/i386/tcg-target.h
+++ b/tcg/i386/tcg-target.h
@@ -194,7 +194,8 @@ extern bool have_atomic16;
 #define TCG_TARGET_HAS_qemu_st8_i32     1
 #endif
 
-#define TCG_TARGET_HAS_qemu_ldst_i128   0
+#define TCG_TARGET_HAS_qemu_ldst_i128 \
+    (TCG_TARGET_REG_BITS == 64 && have_atomic16)
 
 /* We do not support older SSE systems, only beginning with AVX1.  */
 #define TCG_TARGET_HAS_v64              have_avx1
diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 671937ff5d..f3904d06f5 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -91,6 +91,8 @@ static const int tcg_target_reg_alloc_order[] = {
 #endif
 };
 
+#define TCG_TMP_VEC  TCG_REG_XMM5
+
 static const int tcg_target_call_iarg_regs[] = {
 #if TCG_TARGET_REG_BITS == 64
 #if defined(_WIN64)
@@ -347,6 +349,8 @@ static bool tcg_target_const_match(int64_t val, TCGType type, int ct)
 #define OPC_PCMPGTW     (0x65 | P_EXT | P_DATA16)
 #define OPC_PCMPGTD     (0x66 | P_EXT | P_DATA16)
 #define OPC_PCMPGTQ     (0x37 | P_EXT38 | P_DATA16)
+#define OPC_PEXTRD      (0x16 | P_EXT3A | P_DATA16)
+#define OPC_PINSRD      (0x22 | P_EXT3A | P_DATA16)
 #define OPC_PMAXSB      (0x3c | P_EXT38 | P_DATA16)
 #define OPC_PMAXSW      (0xee | P_EXT | P_DATA16)
 #define OPC_PMAXSD      (0x3d | P_EXT38 | P_DATA16)
@@ -1786,7 +1790,22 @@ typedef struct {
 
 bool tcg_target_has_memory_bswap(MemOp memop)
 {
-    return have_movbe;
+    MemOp atom_a, atom_u;
+
+    if (!have_movbe) {
+        return false;
+    }
+    if ((memop & MO_SIZE) <= MO_64) {
+        return true;
+    }
+
+    /*
+     * Reject 16-byte memop with 16-byte atomicity, i.e. VMOVDQA,
+     * but do allow a pair of 64-bit operations, i.e. MOVBEQ.
+     */
+    (void)atom_and_align_for_opc(tcg_ctx, &atom_a, &atom_u, memop,
+                                 MO_ATOM_IFALIGN, true);
+    return atom_a <= MO_64;
 }
 
 /*
@@ -1814,6 +1833,30 @@ static const TCGLdstHelperParam ldst_helper_param = {
 static const TCGLdstHelperParam ldst_helper_param = { };
 #endif
 
+static void tcg_out_vec_to_pair(TCGContext *s, TCGType type,
+                                TCGReg l, TCGReg h, TCGReg v)
+{
+    int rexw = type == TCG_TYPE_I32 ? 0 : P_REXW;
+
+    /* vpmov{d,q} %v, %l */
+    tcg_out_vex_modrm(s, OPC_MOVD_EyVy + rexw, v, 0, l);
+    /* vpextr{d,q} $1, %v, %h */
+    tcg_out_vex_modrm(s, OPC_PEXTRD + rexw, v, 0, h);
+    tcg_out8(s, 1);
+}
+
+static void tcg_out_pair_to_vec(TCGContext *s, TCGType type,
+                                TCGReg v, TCGReg l, TCGReg h)
+{
+    int rexw = type == TCG_TYPE_I32 ? 0 : P_REXW;
+
+    /* vmov{d,q} %l, %v */
+    tcg_out_vex_modrm(s, OPC_MOVD_VyEy + rexw, v, 0, l);
+    /* vpinsr{d,q} $1, %h, %v, %v */
+    tcg_out_vex_modrm(s, OPC_PINSRD + rexw, v, v, h);
+    tcg_out8(s, 1);
+}
+
 /*
  * Generate code for the slow path for a load at the end of block
  */
@@ -1903,11 +1946,12 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
 {
     TCGLabelQemuLdst *ldst = NULL;
     MemOp opc = get_memop(oi);
-    MemOp atom_u;
+    MemOp atom_u, s_bits;
     unsigned a_mask;
 
+    s_bits = opc & MO_SIZE;
     h->align = atom_and_align_for_opc(s, &h->atom, &atom_u, opc,
-                                      MO_ATOM_IFALIGN, false);
+                                      MO_ATOM_IFALIGN, s_bits == MO_128);
     a_mask = (1 << h->align) - 1;
 
 #ifdef CONFIG_SOFTMMU
@@ -1917,7 +1961,6 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
     TCGType tlbtype = TCG_TYPE_I32;
     int trexw = 0, hrexw = 0, tlbrexw = 0;
     unsigned mem_index = get_mmuidx(oi);
-    unsigned s_bits = opc & MO_SIZE;
     unsigned s_mask = (1 << s_bits) - 1;
     target_ulong tlb_mask;
 
@@ -2122,6 +2165,69 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, TCGReg datalo, TCGReg datahi,
                                      h.base, h.index, 0, h.ofs + 4);
         }
         break;
+
+    case MO_128:
+        {
+            TCGLabel *l1 = NULL, *l2 = NULL;
+            bool use_pair = h.align < MO_128;
+
+            tcg_debug_assert(TCG_TARGET_REG_BITS == 64);
+
+            if (!use_pair) {
+                tcg_debug_assert(!use_movbe);
+                /*
+                 * Atomicity requires that we use use VMOVDQA.
+                 * If we've already checked for 16-byte alignment, that's all
+                 * we need.  If we arrive here with lesser alignment, then we
+                 * have determined that less than 16-byte alignment can be
+                 * satisfied with two 8-byte loads.
+                 */
+                if (h.align < MO_128) {
+                    use_pair = true;
+                    l1 = gen_new_label();
+                    l2 = gen_new_label();
+
+                    tcg_out_testi(s, h.base, 15);
+                    tcg_out_jxx(s, JCC_JNE, l2, true);
+                }
+
+                tcg_out_vex_modrm_sib_offset(s, OPC_MOVDQA_VxWx + h.seg,
+                                             TCG_TMP_VEC, 0,
+                                             h.base, h.index, 0, h.ofs);
+                tcg_out_vec_to_pair(s, TCG_TYPE_I64, datalo,
+                                    datahi, TCG_TMP_VEC);
+
+                if (use_pair) {
+                    tcg_out_jxx(s, JCC_JMP, l1, true);
+                    tcg_out_label(s, l2);
+                }
+            }
+            if (use_pair) {
+                if (use_movbe) {
+                    TCGReg t = datalo;
+                    datalo = datahi;
+                    datahi = t;
+                }
+                if (h.base == datalo || h.index == datalo) {
+                    tcg_out_modrm_sib_offset(s, OPC_LEA, datahi,
+                                             h.base, h.index, 0, h.ofs);
+                    tcg_out_modrm_offset(s, movop + P_REXW + h.seg,
+                                         datalo, datahi, 0);
+                    tcg_out_modrm_offset(s, movop + P_REXW + h.seg,
+                                         datahi, datahi, 8);
+                } else {
+                    tcg_out_modrm_sib_offset(s, movop + P_REXW + h.seg, datalo,
+                                             h.base, h.index, 0, h.ofs);
+                    tcg_out_modrm_sib_offset(s, movop + P_REXW + h.seg, datahi,
+                                             h.base, h.index, 0, h.ofs + 8);
+                }
+            }
+            if (l1) {
+                tcg_out_label(s, l1);
+            }
+        }
+        break;
+
     default:
         g_assert_not_reached();
     }
@@ -2207,6 +2313,60 @@ static void tcg_out_qemu_st_direct(TCGContext *s, TCGReg datalo, TCGReg datahi,
                                      h.base, h.index, 0, h.ofs + 4);
         }
         break;
+
+    case MO_128:
+        {
+            TCGLabel *l1 = NULL, *l2 = NULL;
+            bool use_pair = h.align < MO_128;
+
+            tcg_debug_assert(TCG_TARGET_REG_BITS == 64);
+
+            if (!use_pair) {
+                tcg_debug_assert(!use_movbe);
+                /*
+                 * Atomicity requires that we use use VMOVDQA.
+                 * If we've already checked for 16-byte alignment, that's all
+                 * we need.  If we arrive here with lesser alignment, then we
+                 * have determined that less that 16-byte alignment can be
+                 * satisfied with two 8-byte loads.
+                 */
+                if (h.align < MO_128) {
+                    use_pair = true;
+                    l1 = gen_new_label();
+                    l2 = gen_new_label();
+
+                    tcg_out_testi(s, h.base, 15);
+                    tcg_out_jxx(s, JCC_JNE, l2, true);
+                }
+
+                tcg_out_pair_to_vec(s, TCG_TYPE_I64, TCG_TMP_VEC,
+                                    datalo, datahi);
+                tcg_out_vex_modrm_sib_offset(s, OPC_MOVDQA_WxVx + h.seg,
+                                             TCG_TMP_VEC, 0,
+                                             h.base, h.index, 0, h.ofs);
+
+                if (use_pair) {
+                    tcg_out_jxx(s, JCC_JMP, l1, true);
+                    tcg_out_label(s, l2);
+                }
+            }
+            if (use_pair) {
+                if (use_movbe) {
+                    TCGReg t = datalo;
+                    datalo = datahi;
+                    datahi = t;
+                }
+                tcg_out_modrm_sib_offset(s, movop + P_REXW + h.seg, datalo,
+                                         h.base, h.index, 0, h.ofs);
+                tcg_out_modrm_sib_offset(s, movop + P_REXW + h.seg, datahi,
+                                         h.base, h.index, 0, h.ofs + 8);
+            }
+            if (l1) {
+                tcg_out_label(s, l1);
+            }
+        }
+        break;
+
     default:
         g_assert_not_reached();
     }
@@ -2530,6 +2690,10 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
             tcg_out_qemu_ld(s, a0, a1, a2, args[3], args[4], TCG_TYPE_I64);
         }
         break;
+    case INDEX_op_qemu_ld_i128:
+        tcg_debug_assert(TCG_TARGET_REG_BITS == 64);
+        tcg_out_qemu_ld(s, a0, a1, a2, -1, args[3], TCG_TYPE_I128);
+        break;
     case INDEX_op_qemu_st_i32:
     case INDEX_op_qemu_st8_i32:
         if (TCG_TARGET_REG_BITS >= TARGET_LONG_BITS) {
@@ -2547,6 +2711,10 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
             tcg_out_qemu_st(s, a0, a1, a2, args[3], args[4], TCG_TYPE_I64);
         }
         break;
+    case INDEX_op_qemu_st_i128:
+        tcg_debug_assert(TCG_TARGET_REG_BITS == 64);
+        tcg_out_qemu_st(s, a0, a1, a2, -1, args[3], TCG_TYPE_I128);
+        break;
 
     OP_32_64(mulu2):
         tcg_out_modrm(s, OPC_GRP3_Ev + rexw, EXT3_MUL, args[3]);
@@ -3241,6 +3409,13 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
                 : TARGET_LONG_BITS <= TCG_TARGET_REG_BITS ? C_O0_I3(L, L, L)
                 : C_O0_I4(L, L, L, L));
 
+    case INDEX_op_qemu_ld_i128:
+        tcg_debug_assert(TCG_TARGET_REG_BITS == 64);
+        return C_O2_I1(r, r, L);
+    case INDEX_op_qemu_st_i128:
+        tcg_debug_assert(TCG_TARGET_REG_BITS == 64);
+        return C_O0_I3(L, L, L);
+
     case INDEX_op_brcond2_i32:
         return C_O0_I4(r, r, ri, ri);
 
@@ -4097,6 +4272,7 @@ static void tcg_target_init(TCGContext *s)
 
     s->reserved_regs = 0;
     tcg_regset_set_reg(s->reserved_regs, TCG_REG_CALL_STACK);
+    tcg_regset_set_reg(s->reserved_regs, TCG_TMP_VEC);
 #ifdef _WIN64
     /* These are call saved, and we don't save them, so don't use them. */
     tcg_regset_set_reg(s->reserved_regs, TCG_REG_XMM6);
-- 
2.34.1


