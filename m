Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mkhkr-0000za-MH
	for mharc-qemu-riscv@gnu.org; Wed, 10 Nov 2021 02:10:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mkhkn-0000we-Rp; Wed, 10 Nov 2021 02:10:41 -0500
Received: from out28-217.mail.aliyun.com ([115.124.28.217]:41311)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mkhkk-0004ot-K4; Wed, 10 Nov 2021 02:10:41 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07905654|-1; CH=green;
 DM=|CONTINUE|false|; DS=CONTINUE|ham_alarm|0.45529-0.00118736-0.543523;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047206; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=7; RT=7; SR=0; TI=SMTPD_---.LqVKR1A_1636528233; 
Received: from roman-VirtualBox.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.LqVKR1A_1636528233)
 by smtp.aliyun-inc.com(10.147.44.118);
 Wed, 10 Nov 2021 15:10:33 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 richard.henderson@linaro.org, LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v2 11/14] target/riscv: Adjust scalar reg in vector with XLEN
Date: Wed, 10 Nov 2021 15:04:49 +0800
Message-Id: <20211110070452.48539-12-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211110070452.48539-1-zhiwei_liu@c-sky.com>
References: <20211110070452.48539-1-zhiwei_liu@c-sky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=115.124.28.217; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-217.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 10 Nov 2021 07:10:42 -0000

When sew <= 32bits, not need to extend scalar reg.
When sew > 32bits, if xlen is less that sew, we should sign extend
the scalar register, except explicitly specified by the spec.

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc |  5 +++--
 target/riscv/internals.h                |  1 +
 target/riscv/vector_helper.c            | 11 +++++++++--
 3 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 41c7c88904..0a956cac5b 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -846,7 +846,7 @@ static bool opivx_trans(uint32_t vd, uint32_t rs1, uint32_t vs2, uint32_t vm,
     dest = tcg_temp_new_ptr();
     mask = tcg_temp_new_ptr();
     src2 = tcg_temp_new_ptr();
-    src1 = get_gpr(s, rs1, EXT_NONE);
+    src1 = get_gpr(s, rs1, EXT_SIGN);
 
     data = FIELD_DP32(data, VDATA, MLEN, s->mlen);
     data = FIELD_DP32(data, VDATA, VM, vm);
@@ -2670,6 +2670,7 @@ static bool trans_vmv_s_x(DisasContext *s, arg_vmv_s_x *a)
         /* This instruction ignores LMUL and vector register groups */
         int maxsz = s->vlen >> 3;
         TCGv_i64 t1;
+        TCGv src1 = get_gpr(s, a->rs1, EXT_ZERO);
         TCGLabel *over = gen_new_label();
 
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
@@ -2679,7 +2680,7 @@ static bool trans_vmv_s_x(DisasContext *s, arg_vmv_s_x *a)
         }
 
         t1 = tcg_temp_new_i64();
-        tcg_gen_extu_tl_i64(t1, cpu_gpr[a->rs1]);
+        tcg_gen_extu_tl_i64(t1, src1);
         vec_element_storei(s, a->rd, 0, t1);
         tcg_temp_free_i64(t1);
     done:
diff --git a/target/riscv/internals.h b/target/riscv/internals.h
index b15ad394bb..07e882160d 100644
--- a/target/riscv/internals.h
+++ b/target/riscv/internals.h
@@ -27,6 +27,7 @@ FIELD(VDATA, VM, 8, 1)
 FIELD(VDATA, LMUL, 9, 2)
 FIELD(VDATA, NF, 11, 4)
 FIELD(VDATA, WD, 11, 1)
+FIELD(VDATA, TRUNC, 15, 1)
 
 /* float point classify helpers */
 target_ulong fclass_h(uint64_t frs1);
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 0b297f6bc8..51bcf63d65 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -112,6 +112,11 @@ static uint32_t vext_wd(uint32_t desc)
     return (simd_data(desc) >> 11) & 0x1;
 }
 
+static inline bool vext_trunc(uint32_t desc)
+{
+    return FIELD_EX32(simd_data(desc), VDATA, TRUNC);
+}
+
 /*
  * Get vector group length in bytes. Its range is [64, 2048].
  *
@@ -4748,6 +4753,7 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,         \
     uint32_t mlen = vext_mlen(desc);                                      \
     uint32_t vlmax = env_archcpu(env)->cfg.vlen / mlen;                   \
     uint32_t vm = vext_vm(desc);                                          \
+    bool trunc = vext_trunc(desc);                                        \
     uint32_t vl = env->vl;                                                \
     uint32_t i;                                                           \
                                                                           \
@@ -4756,7 +4762,7 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,         \
             continue;                                                     \
         }                                                                 \
         if (i == 0) {                                                     \
-            *((ETYPE *)vd + H(i)) = s1;                                   \
+            *((ETYPE *)vd + H(i)) = trunc ? (s1 & UINT32_MAX) : s1;       \
         } else {                                                          \
             *((ETYPE *)vd + H(i)) = *((ETYPE *)vs2 + H(i - 1));           \
         }                                                                 \
@@ -4777,6 +4783,7 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,         \
     uint32_t mlen = vext_mlen(desc);                                      \
     uint32_t vlmax = env_archcpu(env)->cfg.vlen / mlen;                   \
     uint32_t vm = vext_vm(desc);                                          \
+    bool trunc = vext_trunc(desc);                                        \
     uint32_t vl = env->vl;                                                \
     uint32_t i;                                                           \
                                                                           \
@@ -4785,7 +4792,7 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,         \
             continue;                                                     \
         }                                                                 \
         if (i == vl - 1) {                                                \
-            *((ETYPE *)vd + H(i)) = s1;                                   \
+            *((ETYPE *)vd + H(i)) = trunc ? (s1 & UINT32_MAX) : s1;       \
         } else {                                                          \
             *((ETYPE *)vd + H(i)) = *((ETYPE *)vs2 + H(i + 1));           \
         }                                                                 \
-- 
2.25.1


