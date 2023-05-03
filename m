Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pu6e0-0005PM-Jz
	for mharc-qemu-riscv@gnu.org; Wed, 03 May 2023 03:11:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6dU-0002yq-JA
 for qemu-riscv@nongnu.org; Wed, 03 May 2023 03:10:50 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6dL-00071L-6z
 for qemu-riscv@nongnu.org; Wed, 03 May 2023 03:10:47 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-3f178da219bso46402245e9.1
 for <qemu-riscv@nongnu.org>; Wed, 03 May 2023 00:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683097838; x=1685689838;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zZ2vX3VIS+s7f165Kf/LrOrnBD196gGqIoBw1FC/3ew=;
 b=ygQhs+nEIuF1f1lsERMBiqQ3kz02wBgKIiacT7oHPDD/D6uYzbcw9iLiocJfR9L+h2
 6Y7/6Nd40JUIIQSPT6fAv2oG2eb1U5sJoTo7NZ1D2Rk/GcTQ0/VAHWnqmBcO0VXeiAmK
 vdE/EIYyce1gSC4Kdsg1Y8YwEB6A6HBYChw26yaI989UUW/PBLdOqMK2n6AtlQJQT/Mu
 oVT6kLmev+a2Wyskg6cE0Ec78Htr4vDBDgp7G+YgFvAZhs7/TD2y+2MlAn121mpYFZBn
 jvKxFZcSZjyo78KjjAsFj0CyKueBCAT3AAPIcFG6qUSROchFnAm6OWKTAOmgwsWQ/6Lw
 HPpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683097838; x=1685689838;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zZ2vX3VIS+s7f165Kf/LrOrnBD196gGqIoBw1FC/3ew=;
 b=WjAS0P2+wbZuPNPPniNlsjEQdTRZ3vrCwOlGaG6kNaQ7B3qDUyxVyoCtruJSlwCaQr
 CBkyaOa2vMeK+MUo7q5nUBIg2j0FZ00M5RQ7Y4BJDS8gErQUiNgohKp66ZuJsHtF0vqG
 27o3huZsbgI66/tbmTocKUGqjmFkbkBtCL8Yg32latCg8mAhyCAKSa3O2Yxrk030MUN6
 DRrYuF1nPVEKCIAKsML7wW1lJUHZDLiyJXS08vcpAAjVUdFDq19cI/kqgBP9nfmCymNC
 OzP0Ay4MMdpdHqEMaNV8CK8OtYCUhYncwmA3dw8ELiHNs/n6D96GiCl0xKik7krqRb50
 0Fbw==
X-Gm-Message-State: AC+VfDwQ9JLdfNZH+LdocQ6h20aZEBa6zQZIVg1QnMqu7F+E/z0WQH/z
 ubDyPNBp2UR4VZnuK6GY69MpPw==
X-Google-Smtp-Source: ACHHUZ5JfLqan30XPaGnP2EBI/Wcmo1dz8AzdJFehbz9rort50+QxCbRrV1mXSkP2yxWRyCUNIAweg==
X-Received: by 2002:a1c:7917:0:b0:3f1:6942:e024 with SMTP id
 l23-20020a1c7917000000b003f16942e024mr14748581wme.27.1683097837828; 
 Wed, 03 May 2023 00:10:37 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 v9-20020a05600c444900b003f173be2ccfsm54223673wmn.2.2023.05.03.00.10.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:10:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, gaosong@loongson.cn, philmd@linaro.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v4 53/57] tcg/i386: Support 128-bit load/store with
 have_atomic16
Date: Wed,  3 May 2023 08:06:52 +0100
Message-Id: <20230503070656.1746170-54-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503070656.1746170-1-richard.henderson@linaro.org>
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x333.google.com
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
X-List-Received-Date: Wed, 03 May 2023 07:10:56 -0000

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
index 5c6c64c48a..a2739977a6 100644
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
@@ -1784,7 +1788,22 @@ typedef struct {
 
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
@@ -1812,6 +1831,30 @@ static const TCGLdstHelperParam ldst_helper_param = {
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
@@ -1901,11 +1944,12 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
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
@@ -1915,7 +1959,6 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
     TCGType tlbtype = TCG_TYPE_I32;
     int trexw = 0, hrexw = 0, tlbrexw = 0;
     unsigned mem_index = get_mmuidx(oi);
-    unsigned s_bits = opc & MO_SIZE;
     unsigned s_mask = (1 << s_bits) - 1;
     target_ulong tlb_mask;
 
@@ -2120,6 +2163,69 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, TCGReg datalo, TCGReg datahi,
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
@@ -2205,6 +2311,60 @@ static void tcg_out_qemu_st_direct(TCGContext *s, TCGReg datalo, TCGReg datahi,
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
@@ -2528,6 +2688,10 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
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
@@ -2545,6 +2709,10 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
             tcg_out_qemu_st(s, a0, a1, a2, args[3], args[4], TCG_TYPE_I64);
         }
         break;
+    case INDEX_op_qemu_st_i128:
+        tcg_debug_assert(TCG_TARGET_REG_BITS == 64);
+        tcg_out_qemu_st(s, a0, a1, a2, -1, args[3], TCG_TYPE_I128);
+        break;
 
     OP_32_64(mulu2):
         tcg_out_modrm(s, OPC_GRP3_Ev + rexw, EXT3_MUL, args[3]);
@@ -3239,6 +3407,13 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
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
 
@@ -4095,6 +4270,7 @@ static void tcg_target_init(TCGContext *s)
 
     s->reserved_regs = 0;
     tcg_regset_set_reg(s->reserved_regs, TCG_REG_CALL_STACK);
+    tcg_regset_set_reg(s->reserved_regs, TCG_TMP_VEC);
 #ifdef _WIN64
     /* These are call saved, and we don't save them, so don't use them. */
     tcg_regset_set_reg(s->reserved_regs, TCG_REG_XMM6);
-- 
2.34.1


