Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jbjK2-0005uz-NE
	for mharc-qemu-riscv@gnu.org; Thu, 21 May 2020 07:25:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1jbjK0-0005sU-Us; Thu, 21 May 2020 07:25:08 -0400
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:49024)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1jbjJy-0005oP-M1; Thu, 21 May 2020 07:25:08 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07854397|-1; CH=blue; DM=|OVERLOAD|false|;
 DS=CONTINUE|ham_system_inform|0.0151127-6.722e-05-0.98482;
 FP=0|0|0|0|0|-1|-1|-1; HT=e02c03299; MF=zhiwei_liu@c-sky.com; NM=1; PH=DS;
 RN=8; RT=8; SR=0; TI=SMTPD_---.HbeClYh_1590060299; 
Received: from L-PF1D6DP4-1208.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.HbeClYh_1590060299)
 by smtp.aliyun-inc.com(10.147.42.16); Thu, 21 May 2020 19:24:59 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: richard.henderson@linaro.org, alistair.francis@wdc.com, palmer@dabbelt.com,
 wenmeng_zhang@c-sky.com, wxy194768@alibaba-inc.com,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v8 50/62] target/riscv: vector mask-register logical
 instructions
Date: Thu, 21 May 2020 17:44:01 +0800
Message-Id: <20200521094413.10425-51-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200521094413.10425-1-zhiwei_liu@c-sky.com>
References: <20200521094413.10425-1-zhiwei_liu@c-sky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=121.197.200.217;
 envelope-from=zhiwei_liu@c-sky.com; helo=smtp2200-217.mail.aliyun.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/21 05:19:14
X-ACL-Warn: Detected OS   = Linux 3.x [generic] [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, UNPARSEABLE_RELAY=0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 21 May 2020 11:25:09 -0000

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/helper.h                   |  9 ++++++
 target/riscv/insn32.decode              |  8 +++++
 target/riscv/insn_trans/trans_rvv.inc.c | 35 ++++++++++++++++++++++
 target/riscv/vector_helper.c            | 40 +++++++++++++++++++++++++
 4 files changed, 92 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 6b932b444d..9bb4d8efd5 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1086,3 +1086,12 @@ DEF_HELPER_6(vfredmin_vs_d, void, ptr, ptr, ptr, ptr, env, i32)
 
 DEF_HELPER_6(vfwredsum_vs_h, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vfwredsum_vs_w, void, ptr, ptr, ptr, ptr, env, i32)
+
+DEF_HELPER_6(vmand_mm, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vmnand_mm, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vmandnot_mm, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vmxor_mm, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vmor_mm, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vmnor_mm, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vmornot_mm, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vmxnor_mm, void, ptr, ptr, ptr, ptr, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 526a964d28..a4128c26a0 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -545,6 +545,14 @@ vfredmin_vs     000101 . ..... ..... 001 ..... 1010111 @r_vm
 vfredmax_vs     000111 . ..... ..... 001 ..... 1010111 @r_vm
 # Vector widening ordered and unordered float reduction sum
 vfwredsum_vs    1100-1 . ..... ..... 001 ..... 1010111 @r_vm
+vmand_mm        011001 - ..... ..... 010 ..... 1010111 @r
+vmnand_mm       011101 - ..... ..... 010 ..... 1010111 @r
+vmandnot_mm     011000 - ..... ..... 010 ..... 1010111 @r
+vmxor_mm        011011 - ..... ..... 010 ..... 1010111 @r
+vmor_mm         011010 - ..... ..... 010 ..... 1010111 @r
+vmnor_mm        011110 - ..... ..... 010 ..... 1010111 @r
+vmornot_mm      011100 - ..... ..... 010 ..... 1010111 @r
+vmxnor_mm       011111 - ..... ..... 010 ..... 1010111 @r
 
 vsetvli         0 ........... ..... 111 ..... 1010111  @r2_zimm
 vsetvl          1000000 ..... ..... 111 ..... 1010111  @r
diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_trans/trans_rvv.inc.c
index 31848a1f88..8c18b4d3e7 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -2345,3 +2345,38 @@ GEN_OPFVV_TRANS(vfredmin_vs, reduction_check)
 
 /* Vector Widening Floating-Point Reduction Instructions */
 GEN_OPFVV_WIDEN_TRANS(vfwredsum_vs, reduction_check)
+
+/*
+ *** Vector Mask Operations
+ */
+
+/* Vector Mask-Register Logical Instructions */
+#define GEN_MM_TRANS(NAME)                                         \
+static bool trans_##NAME(DisasContext *s, arg_r *a)                \
+{                                                                  \
+    if (vext_check_isa_ill(s)) {                                   \
+        uint32_t data = 0;                                         \
+        gen_helper_gvec_4_ptr *fn = gen_helper_##NAME;             \
+        TCGLabel *over = gen_new_label();                          \
+        tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
+                                                                   \
+        data = FIELD_DP32(data, VDATA, MLEN, s->mlen);             \
+        data = FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
+        tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
+                           vreg_ofs(s, a->rs1),                    \
+                           vreg_ofs(s, a->rs2), cpu_env, 0,        \
+                           s->vlen / 8, data, fn);                 \
+        gen_set_label(over);                                       \
+        return true;                                               \
+    }                                                              \
+    return false;                                                  \
+}
+
+GEN_MM_TRANS(vmand_mm)
+GEN_MM_TRANS(vmnand_mm)
+GEN_MM_TRANS(vmandnot_mm)
+GEN_MM_TRANS(vmxor_mm)
+GEN_MM_TRANS(vmor_mm)
+GEN_MM_TRANS(vmnor_mm)
+GEN_MM_TRANS(vmornot_mm)
+GEN_MM_TRANS(vmxnor_mm)
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 0074d12538..f36b8f8913 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -4501,3 +4501,43 @@ void HELPER(vfwredsum_vs_w)(void *vd, void *v0, void *vs1,
     *((uint64_t *)vd) = s1;
     clearq(vd, 1, sizeof(uint64_t), tot);
 }
+
+/*
+ *** Vector Mask Operations
+ */
+/* Vector Mask-Register Logical Instructions */
+#define GEN_VEXT_MASK_VV(NAME, OP)                        \
+void HELPER(NAME)(void *vd, void *v0, void *vs1,          \
+                  void *vs2, CPURISCVState *env,          \
+                  uint32_t desc)                          \
+{                                                         \
+    uint32_t mlen = vext_mlen(desc);                      \
+    uint32_t vlmax = env_archcpu(env)->cfg.vlen / mlen;   \
+    uint32_t vl = env->vl;                                \
+    uint32_t i;                                           \
+    int a, b;                                             \
+                                                          \
+    for (i = 0; i < vl; i++) {                            \
+        a = vext_elem_mask(vs1, mlen, i);                 \
+        b = vext_elem_mask(vs2, mlen, i);                 \
+        vext_set_elem_mask(vd, mlen, i, OP(b, a));        \
+    }                                                     \
+    for (; i < vlmax; i++) {                              \
+        vext_set_elem_mask(vd, mlen, i, 0);               \
+    }                                                     \
+}
+
+#define DO_NAND(N, M)  (!(N & M))
+#define DO_ANDNOT(N, M)  (N & !M)
+#define DO_NOR(N, M)  (!(N | M))
+#define DO_ORNOT(N, M)  (N | !M)
+#define DO_XNOR(N, M)  (!(N ^ M))
+
+GEN_VEXT_MASK_VV(vmand_mm, DO_AND)
+GEN_VEXT_MASK_VV(vmnand_mm, DO_NAND)
+GEN_VEXT_MASK_VV(vmandnot_mm, DO_ANDNOT)
+GEN_VEXT_MASK_VV(vmxor_mm, DO_XOR)
+GEN_VEXT_MASK_VV(vmor_mm, DO_OR)
+GEN_VEXT_MASK_VV(vmnor_mm, DO_NOR)
+GEN_VEXT_MASK_VV(vmornot_mm, DO_ORNOT)
+GEN_VEXT_MASK_VV(vmxnor_mm, DO_XNOR)
-- 
2.23.0


