Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nXfnr-0000UV-Id
	for mharc-qemu-riscv@gnu.org; Fri, 25 Mar 2022 05:00:15 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nXfnn-0000TS-FH; Fri, 25 Mar 2022 05:00:11 -0400
Received: from smtp21.cstnet.cn ([159.226.251.21]:52436 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nXfnj-0000Ai-Ks; Fri, 25 Mar 2022 05:00:10 -0400
Received: from localhost.localdomain (unknown [180.156.147.178])
 by APP-01 (Coremail) with SMTP id qwCowACHj_uLhD1ih4xtBQ--.17995S3;
 Fri, 25 Mar 2022 16:59:57 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: richard.henderson@linaro.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH 2/2] target/riscv: optimize helper for vmv<nr>r.v
Date: Fri, 25 Mar 2022 16:59:02 +0800
Message-Id: <20220325085902.29500-2-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220325085902.29500-1-liweiwei@iscas.ac.cn>
References: <20220325085902.29500-1-liweiwei@iscas.ac.cn>
X-CM-TRANSID: qwCowACHj_uLhD1ih4xtBQ--.17995S3
X-Coremail-Antispam: 1UD129KBjvJXoWxGr43ur18uF1DWrW8WrWrGrg_yoWrAry5pa
 1DKrWSqrnFyFZ3Xa1SvrsrXr47tr4rKw4Ykws2van5Xay5JrWkA3Wqqws2kr15tFyxXFyY
 v3W8CrnxA3y3GFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9m14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
 x26xkF7I0E14v26r1I6r4UM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
 Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
 8EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS
 0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
 IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
 Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCF04k20xvY0x0EwIxGrwCFx2
 IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v2
 6r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67
 AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IY
 s7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr
 0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUqAp5UUUUU=
X-Originating-IP: [180.156.147.178]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.21; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 25 Mar 2022 09:00:11 -0000

LEN is not used for GEN_VEXT_VMV_WHOLE macro, so vmv<nr>r.v can share
the same helper 

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
---
 target/riscv/helper.h                   |  5 +----
 target/riscv/insn_trans/trans_rvv.c.inc | 17 +++++----------
 target/riscv/vector_helper.c            | 29 ++++++++++---------------
 3 files changed, 18 insertions(+), 33 deletions(-)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 26bbab2fab..a669d0187b 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1086,10 +1086,7 @@ DEF_HELPER_6(vcompress_vm_h, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vcompress_vm_w, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vcompress_vm_d, void, ptr, ptr, ptr, ptr, env, i32)
 
-DEF_HELPER_4(vmv1r_v, void, ptr, ptr, env, i32)
-DEF_HELPER_4(vmv2r_v, void, ptr, ptr, env, i32)
-DEF_HELPER_4(vmv4r_v, void, ptr, ptr, env, i32)
-DEF_HELPER_4(vmv8r_v, void, ptr, ptr, env, i32)
+DEF_HELPER_4(vmvr_v, void, ptr, ptr, env, i32)
 
 DEF_HELPER_5(vzext_vf2_h, void, ptr, ptr, ptr, env, i32)
 DEF_HELPER_5(vzext_vf2_w, void, ptr, ptr, ptr, env, i32)
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 2878ca3132..ec7c0e0d36 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -3695,7 +3695,7 @@ static bool trans_vcompress_vm(DisasContext *s, arg_r *a)
  * Whole Vector Register Move Instructions ignore vtype and vl setting.
  * Thus, we don't need to check vill bit. (Section 16.6)
  */
-#define GEN_VMV_WHOLE_TRANS(NAME, LEN, SEQ)                             \
+#define GEN_VMV_WHOLE_TRANS(NAME, LEN)                             \
 static bool trans_##NAME(DisasContext *s, arg_##NAME * a)               \
 {                                                                       \
     if (require_rvv(s) &&                                               \
@@ -3710,13 +3710,8 @@ static bool trans_##NAME(DisasContext *s, arg_##NAME * a)               \
         } else {                                                        \
             TCGLabel *over = gen_new_label();                           \
             tcg_gen_brcondi_tl(TCG_COND_GEU, cpu_vstart, maxsz, over);  \
-                                                                        \
-            static gen_helper_gvec_2_ptr * const fns[4] = {             \
-                gen_helper_vmv1r_v, gen_helper_vmv2r_v,                 \
-                gen_helper_vmv4r_v, gen_helper_vmv8r_v,                 \
-            };                                                          \
             tcg_gen_gvec_2_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, a->rs2), \
-                               cpu_env, maxsz, maxsz, 0, fns[SEQ]);     \
+                               cpu_env, maxsz, maxsz, 0, gen_helper_vmvr_v); \
             mark_vs_dirty(s);                                           \
             gen_set_label(over);                                        \
         }                                                               \
@@ -3725,10 +3720,10 @@ static bool trans_##NAME(DisasContext *s, arg_##NAME * a)               \
     return false;                                                       \
 }
 
-GEN_VMV_WHOLE_TRANS(vmv1r_v, 1, 0)
-GEN_VMV_WHOLE_TRANS(vmv2r_v, 2, 1)
-GEN_VMV_WHOLE_TRANS(vmv4r_v, 4, 2)
-GEN_VMV_WHOLE_TRANS(vmv8r_v, 8, 3)
+GEN_VMV_WHOLE_TRANS(vmv1r_v, 1)
+GEN_VMV_WHOLE_TRANS(vmv2r_v, 2)
+GEN_VMV_WHOLE_TRANS(vmv4r_v, 4)
+GEN_VMV_WHOLE_TRANS(vmv8r_v, 8)
 
 static bool int_ext_check(DisasContext *s, arg_rmr *a, uint8_t div)
 {
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 3bd4aac9c9..1d4982ef7f 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -4888,25 +4888,18 @@ GEN_VEXT_VCOMPRESS_VM(vcompress_vm_w, uint32_t, H4)
 GEN_VEXT_VCOMPRESS_VM(vcompress_vm_d, uint64_t, H8)
 
 /* Vector Whole Register Move */
-#define GEN_VEXT_VMV_WHOLE(NAME, LEN)                      \
-void HELPER(NAME)(void *vd, void *vs2, CPURISCVState *env, \
-                  uint32_t desc)                           \
-{                                                          \
-    /* EEW = 8 */                                          \
-    uint32_t maxsz = simd_maxsz(desc);                     \
-    uint32_t i = env->vstart;                              \
-                                                           \
-    memcpy((uint8_t *)vd + H1(i),                          \
-           (uint8_t *)vs2 + H1(i),                         \
-           maxsz - env->vstart);                           \
-                                                           \
-    env->vstart = 0;                                       \
-}
+void HELPER(vmvr_v)(void *vd, void *vs2, CPURISCVState *env, uint32_t desc)
+{
+    /* EEW = 8 */
+    uint32_t maxsz = simd_maxsz(desc);
+    uint32_t i = env->vstart;
+
+    memcpy((uint8_t *)vd + H1(i),
+           (uint8_t *)vs2 + H1(i),
+           maxsz - env->vstart);
 
-GEN_VEXT_VMV_WHOLE(vmv1r_v, 1)
-GEN_VEXT_VMV_WHOLE(vmv2r_v, 2)
-GEN_VEXT_VMV_WHOLE(vmv4r_v, 4)
-GEN_VEXT_VMV_WHOLE(vmv8r_v, 8)
+    env->vstart = 0;
+}
 
 /* Vector Integer Extension */
 #define GEN_VEXT_INT_EXT(NAME, ETYPE, DTYPE, HD, HS1)            \
-- 
2.17.1


