Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jCRA9-0008VL-27
	for mharc-qemu-riscv@gnu.org; Thu, 12 Mar 2020 12:58:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37861)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhiwei_liu@c-sky.com>) id 1jCRA6-0008Oh-Cj
 for qemu-riscv@nongnu.org; Thu, 12 Mar 2020 12:58:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <zhiwei_liu@c-sky.com>) id 1jCRA5-0005mt-4h
 for qemu-riscv@nongnu.org; Thu, 12 Mar 2020 12:58:22 -0400
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:43270)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1jCRA1-0005h2-2Q; Thu, 12 Mar 2020 12:58:17 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07819935|-1; CH=blue; DM=||false|;
 DS=CONTINUE|ham_system_inform|0.264572-6.6529e-05-0.735362;
 FP=0|0|0|0|0|-1|-1|-1; HT=e02c03302; MF=zhiwei_liu@c-sky.com; NM=1; PH=DS;
 RN=10; RT=10; SR=0; TI=SMTPD_---.H-QLEgr_1584032291; 
Received: from L-PF1D6DP4-1208.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.H-QLEgr_1584032291)
 by smtp.aliyun-inc.com(10.147.44.129);
 Fri, 13 Mar 2020 00:58:12 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: richard.henderson@linaro.org, alistair23@gmail.com,
 chihmin.chao@sifive.com, palmer@dabbelt.com
Cc: wenmeng_zhang@c-sky.com, wxy194768@alibaba-inc.com,
 guoren@linux.alibaba.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v5 59/60] target/riscv: vector compress instruction
Date: Thu, 12 Mar 2020 22:58:59 +0800
Message-Id: <20200312145900.2054-60-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200312145900.2054-1-zhiwei_liu@c-sky.com>
References: <20200312145900.2054-1-zhiwei_liu@c-sky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 121.197.200.217
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
X-List-Received-Date: Thu, 12 Mar 2020 16:58:23 -0000

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 target/riscv/helper.h                   |  5 +++++
 target/riscv/insn32.decode              |  1 +
 target/riscv/insn_trans/trans_rvv.inc.c | 28 +++++++++++++++++++++++++
 target/riscv/vector_helper.c            | 28 +++++++++++++++++++++++++
 4 files changed, 62 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index b9ec0a4efc..3e223ed7d7 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1146,3 +1146,8 @@ DEF_HELPER_6(vrgather_vx_b, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vrgather_vx_h, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vrgather_vx_w, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vrgather_vx_d, void, ptr, ptr, tl, ptr, env, i32)
+
+DEF_HELPER_6(vcompress_vm_b, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vcompress_vm_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vcompress_vm_w, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vcompress_vm_d, void, ptr, ptr, ptr, ptr, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index d92861a334..8eab175a74 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -569,6 +569,7 @@ vslide1down_vx  001111 . ..... ..... 110 ..... 1010111 @r_vm
 vrgather_vv     001100 . ..... ..... 000 ..... 1010111 @r_vm
 vrgather_vx     001100 . ..... ..... 100 ..... 1010111 @r_vm
 vrgather_vi     001100 . ..... ..... 011 ..... 1010111 @r_vm
+vcompress_vm    010111 - ..... ..... 010 ..... 1010111 @r
 
 vsetvli         0 ........... ..... 111 ..... 1010111  @r2_zimm
 vsetvl          1000000 ..... ..... 111 ..... 1010111  @r
diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_trans/trans_rvv.inc.c
index f3b08919b9..b7959ad417 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -2356,3 +2356,31 @@ static bool vrgather_vx_check(DisasContext *s, arg_rmrr *a)
 }
 GEN_OPIVX_TRANS(vrgather_vx, vrgather_vx_check)
 GEN_OPIVI_TRANS(vrgather_vi, 1, vrgather_vx, vrgather_vx_check)
+
+/* Vector Compress Instruction */
+static bool vcompress_vm_check(DisasContext *s, arg_r *a)
+{
+    return (vext_check_isa_ill(s, RVV) &&
+            vext_check_reg(s, a->rd, false) &&
+            vext_check_reg(s, a->rs2, false) &&
+            vext_check_overlap_group(a->rd, 1 << s->lmul, a->rs1, 1) &&
+            (a->rd != a->rs2));
+}
+
+static bool trans_vcompress_vm(DisasContext *s, arg_r *a)
+{
+    if (vcompress_vm_check(s, a)) {
+        uint32_t data = 0;
+        static gen_helper_gvec_4_ptr * const fns[4] = {
+            gen_helper_vcompress_vm_b, gen_helper_vcompress_vm_h,
+            gen_helper_vcompress_vm_w, gen_helper_vcompress_vm_d,
+        };
+        data = FIELD_DP32(data, VDATA, MLEN, s->mlen);
+        data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
+        tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
+            vreg_ofs(s, a->rs1), vreg_ofs(s, a->rs2),
+            cpu_env, 0, s->vlen / 8, data, fns[s->sew]);
+        return true;
+    }
+    return false;
+}
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 5788e46dcf..8ab68bcdd1 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -4715,3 +4715,31 @@ GEN_VEXT_VRGATHER_VX(vrgather_vx_b, uint8_t, H1, clearb)
 GEN_VEXT_VRGATHER_VX(vrgather_vx_h, uint16_t, H2, clearh)
 GEN_VEXT_VRGATHER_VX(vrgather_vx_w, uint32_t, H4, clearl)
 GEN_VEXT_VRGATHER_VX(vrgather_vx_d, uint64_t, H8, clearq)
+
+/* Vector Compress Instruction */
+#define GEN_VEXT_VCOMPRESS_VM(NAME, ETYPE, H, CLEAR_FN)                   \
+void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,               \
+        CPURISCVState *env, uint32_t desc)                                \
+{                                                                         \
+    uint32_t mlen = vext_mlen(desc);                                      \
+    uint32_t vlmax = env_archcpu(env)->cfg.vlen / mlen;                   \
+    uint32_t vl = env->vl;                                                \
+    uint32_t num = 0, i;                                                  \
+                                                                          \
+    for (i = 0; i < vl; i++) {                                            \
+        if (!vext_elem_mask(vs1, mlen, i)) {                              \
+            continue;                                                     \
+        }                                                                 \
+        *((ETYPE *)vd + H(num)) = *((ETYPE *)vs2 + H(i));                 \
+        num++;                                                            \
+    }                                                                     \
+    if (i == 0) {                                                         \
+        return;                                                           \
+    }                                                                     \
+    CLEAR_FN(vd, num, num * sizeof(ETYPE), vlmax * sizeof(ETYPE));        \
+}
+/* Compress into vd elements of vs2 where vs1 is enabled */
+GEN_VEXT_VCOMPRESS_VM(vcompress_vm_b, uint8_t, H1, clearb)
+GEN_VEXT_VCOMPRESS_VM(vcompress_vm_h, uint16_t, H2, clearh)
+GEN_VEXT_VCOMPRESS_VM(vcompress_vm_w, uint32_t, H4, clearl)
+GEN_VEXT_VCOMPRESS_VM(vcompress_vm_d, uint64_t, H8, clearq)
-- 
2.23.0


