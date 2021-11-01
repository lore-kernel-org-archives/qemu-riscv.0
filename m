Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mhU8o-000203-AO
	for mharc-qemu-riscv@gnu.org; Mon, 01 Nov 2021 06:02:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mhU8f-0001VC-BP; Mon, 01 Nov 2021 06:02:01 -0400
Received: from out28-3.mail.aliyun.com ([115.124.28.3]:48695)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mhU8a-0001V0-1V; Mon, 01 Nov 2021 06:02:00 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.0815934|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_alarm|0.118387-4.71021e-05-0.881566; FP=0|0|0|0|0|-1|-1|-1;
 HT=ay29a033018047192; MF=zhiwei_liu@c-sky.com; NM=1; PH=DS; RN=7; RT=7; SR=0;
 TI=SMTPD_---.LlcGtUT_1635760905; 
Received: from roman-VirtualBox.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.LlcGtUT_1635760905)
 by smtp.aliyun-inc.com(10.147.43.230);
 Mon, 01 Nov 2021 18:01:50 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 richard.henderson@linaro.org, LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH 10/13] target/riscv: Adjust scalar reg in vector with ol
Date: Mon,  1 Nov 2021 18:01:40 +0800
Message-Id: <20211101100143.44356-11-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211101100143.44356-1-zhiwei_liu@c-sky.com>
References: <20211101100143.44356-1-zhiwei_liu@c-sky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=115.124.28.3; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-3.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 01 Nov 2021 10:02:02 -0000

When sew <= 32bits, not need to extend scalar reg.
When sew > 32bits, if xlen is less that sew, we should sign extend
the scalar register, except explicitly specified by the spec.

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 5 +++--
 target/riscv/vector_helper.c            | 6 ++++--
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 5cd9b802df..947a58d7ca 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -853,7 +853,7 @@ static bool opivx_trans(uint32_t vd, uint32_t rs1, uint32_t vs2, uint32_t vm,
     dest = tcg_temp_new_ptr();
     mask = tcg_temp_new_ptr();
     src2 = tcg_temp_new_ptr();
-    src1 = get_gpr(s, rs1, EXT_NONE);
+    src1 = get_gpr(s, rs1, EXT_SIGN);
 
     data = FIELD_DP32(data, VDATA, MLEN, s->mlen);
     data = FIELD_DP32(data, VDATA, VM, vm);
@@ -2677,6 +2677,7 @@ static bool trans_vmv_s_x(DisasContext *s, arg_vmv_s_x *a)
         /* This instruction ignores LMUL and vector register groups */
         int maxsz = s->vlen >> 3;
         TCGv_i64 t1;
+        TCGv src1 = get_gpr(s, a->rs1, EXT_ZERO);
         TCGLabel *over = gen_new_label();
 
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
@@ -2686,7 +2687,7 @@ static bool trans_vmv_s_x(DisasContext *s, arg_vmv_s_x *a)
         }
 
         t1 = tcg_temp_new_i64();
-        tcg_gen_extu_tl_i64(t1, cpu_gpr[a->rs1]);
+        tcg_gen_extu_tl_i64(t1, src1);
         vec_element_storei(s, a->rd, 0, t1);
         tcg_temp_free_i64(t1);
     done:
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 451688c328..5bdbbf7c71 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -4763,6 +4763,7 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,         \
     uint32_t mlen = vext_mlen(desc);                                      \
     uint32_t vlmax = env_archcpu(env)->cfg.vlen / mlen;                   \
     uint32_t vm = vext_vm(desc);                                          \
+    uint32_t olen = 16 << vext_ol(desc);                                  \
     uint32_t vl = env->vl;                                                \
     uint32_t i;                                                           \
                                                                           \
@@ -4771,7 +4772,7 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,         \
             continue;                                                     \
         }                                                                 \
         if (i == 0) {                                                     \
-            *((ETYPE *)vd + H(i)) = s1;                                   \
+            *((ETYPE *)vd + H(i)) = adjust_addr(s1, olen);                \
         } else {                                                          \
             *((ETYPE *)vd + H(i)) = *((ETYPE *)vs2 + H(i - 1));           \
         }                                                                 \
@@ -4792,6 +4793,7 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,         \
     uint32_t mlen = vext_mlen(desc);                                      \
     uint32_t vlmax = env_archcpu(env)->cfg.vlen / mlen;                   \
     uint32_t vm = vext_vm(desc);                                          \
+    uint32_t olen = 16 << vext_ol(desc);                                  \
     uint32_t vl = env->vl;                                                \
     uint32_t i;                                                           \
                                                                           \
@@ -4800,7 +4802,7 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,         \
             continue;                                                     \
         }                                                                 \
         if (i == vl - 1) {                                                \
-            *((ETYPE *)vd + H(i)) = s1;                                   \
+            *((ETYPE *)vd + H(i)) = adjust_addr(s1, olen);                \
         } else {                                                          \
             *((ETYPE *)vd + H(i)) = *((ETYPE *)vs2 + H(i + 1));           \
         }                                                                 \
-- 
2.25.1


