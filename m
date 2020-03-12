Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jCR2U-00041H-OX
	for mharc-qemu-riscv@gnu.org; Thu, 12 Mar 2020 12:50:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36607)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhiwei_liu@c-sky.com>) id 1jCR2P-0003lE-SN
 for qemu-riscv@nongnu.org; Thu, 12 Mar 2020 12:50:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <zhiwei_liu@c-sky.com>) id 1jCR2N-0006uz-FO
 for qemu-riscv@nongnu.org; Thu, 12 Mar 2020 12:50:24 -0400
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:42604)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1jCR2I-0006qH-3g; Thu, 12 Mar 2020 12:50:18 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07881809|-1; CH=blue; DM=||false|;
 DS=CONTINUE|ham_alarm|0.638062-0.000405901-0.361533; FP=0|0|0|0|0|-1|-1|-1;
 HT=e02c03279; MF=zhiwei_liu@c-sky.com; NM=1; PH=DS; RN=10; RT=10; SR=0;
 TI=SMTPD_---.H-QQmfe_1584031807; 
Received: from L-PF1D6DP4-1208.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.H-QQmfe_1584031807)
 by smtp.aliyun-inc.com(10.147.41.158);
 Fri, 13 Mar 2020 00:50:08 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: richard.henderson@linaro.org, alistair23@gmail.com,
 chihmin.chao@sifive.com, palmer@dabbelt.com
Cc: wenmeng_zhang@c-sky.com, wxy194768@alibaba-inc.com,
 guoren@linux.alibaba.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v5 55/60] target/riscv: integer scalar move instruction
Date: Thu, 12 Mar 2020 22:58:55 +0800
Message-Id: <20200312145900.2054-56-zhiwei_liu@c-sky.com>
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
X-List-Received-Date: Thu, 12 Mar 2020 16:50:28 -0000

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 target/riscv/helper.h                   |  5 +++++
 target/riscv/insn32.decode              |  1 +
 target/riscv/insn_trans/trans_rvv.inc.c | 26 +++++++++++++++++++++++++
 target/riscv/vector_helper.c            | 15 ++++++++++++++
 4 files changed, 47 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index d94347a9a5..41cecd266c 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1106,3 +1106,8 @@ DEF_HELPER_3(vext_x_v_b, tl, ptr, tl, env)
 DEF_HELPER_3(vext_x_v_h, tl, ptr, tl, env)
 DEF_HELPER_3(vext_x_v_w, tl, ptr, tl, env)
 DEF_HELPER_3(vext_x_v_d, tl, ptr, tl, env)
+
+DEF_HELPER_3(vmv_s_x_b, void, ptr, tl, env)
+DEF_HELPER_3(vmv_s_x_h, void, ptr, tl, env)
+DEF_HELPER_3(vmv_s_x_w, void, ptr, tl, env)
+DEF_HELPER_3(vmv_s_x_d, void, ptr, tl, env)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index c26a186d6a..7e1efeec05 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -556,6 +556,7 @@ vmsof_m         010110 . ..... 00010 010 ..... 1010111 @r2_vm
 viota_m         010110 . ..... 10000 010 ..... 1010111 @r2_vm
 vid_v           010110 . 00000 10001 010 ..... 1010111 @r1_vm
 vext_x_v        001100 1 ..... ..... 010 ..... 1010111 @r
+vmv_s_x         001101 1 00000 ..... 110 ..... 1010111 @r2
 
 vsetvli         0 ........... ..... 111 ..... 1010111  @r2_zimm
 vsetvl          1000000 ..... ..... 111 ..... 1010111  @r
diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_trans/trans_rvv.inc.c
index 46651dfb10..7720ffecde 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -2243,3 +2243,29 @@ static bool trans_vext_x_v(DisasContext *s, arg_r *a)
     }
     return false;
 }
+
+/* Integer Scalar Move Instruction */
+typedef void (* gen_helper_vmv_s_x)(TCGv_ptr, TCGv, TCGv_env);
+static bool trans_vmv_s_x(DisasContext *s, arg_vmv_s_x *a)
+{
+    if (vext_check_isa_ill(s, RVV)) {
+        TCGv_ptr dest;
+        TCGv src1;
+        gen_helper_vmv_s_x fns[4] = {
+            gen_helper_vmv_s_x_b, gen_helper_vmv_s_x_h,
+            gen_helper_vmv_s_x_w, gen_helper_vmv_s_x_d
+        };
+
+        src1 = tcg_temp_new();
+        dest = tcg_temp_new_ptr();
+        gen_get_gpr(src1, a->rs1);
+        tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, a->rd));
+
+        fns[s->sew](dest, src1, cpu_env);
+
+        tcg_temp_free(src1);
+        tcg_temp_free_ptr(dest);
+        return true;
+    }
+    return false;
+}
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 8704ee120f..66ee69da99 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -4460,3 +4460,18 @@ GEN_VEXT_X_V(vext_x_v_b, uint8_t, H1)
 GEN_VEXT_X_V(vext_x_v_h, uint16_t, H2)
 GEN_VEXT_X_V(vext_x_v_w, uint32_t, H4)
 GEN_VEXT_X_V(vext_x_v_d, uint64_t, H8)
+
+/* Integer Scalar Move Instruction */
+#define GEN_VEXT_VMV_S_X(NAME, ETYPE, H, CLEAR_FN)                       \
+void HELPER(NAME)(void *vd, target_ulong s1, CPURISCVState *env)         \
+{                                                                        \
+    if (env->vl == 0) {                                                  \
+        return;                                                          \
+    }                                                                    \
+    *((ETYPE *)vd + H(0)) = s1;                                          \
+    CLEAR_FN(vd, 1, sizeof(ETYPE), env_archcpu(env)->cfg.vlen / 8);      \
+}
+GEN_VEXT_VMV_S_X(vmv_s_x_b, uint8_t, H1, clearb)
+GEN_VEXT_VMV_S_X(vmv_s_x_h, uint16_t, H2, clearh)
+GEN_VEXT_VMV_S_X(vmv_s_x_w, uint32_t, H4, clearl)
+GEN_VEXT_VMV_S_X(vmv_s_x_d, uint64_t, H8, clearq)
-- 
2.23.0


