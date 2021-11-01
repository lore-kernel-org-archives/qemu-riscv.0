Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mhU8l-0001q7-Rs
	for mharc-qemu-riscv@gnu.org; Mon, 01 Nov 2021 06:02:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mhU8j-0001eC-MA; Mon, 01 Nov 2021 06:02:05 -0400
Received: from out28-147.mail.aliyun.com ([115.124.28.147]:51849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mhU8a-0001Tw-Jh; Mon, 01 Nov 2021 06:02:04 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07437038|-1; CH=green;
 DM=|CONTINUE|false|; DS=CONTINUE|ham_alarm|0.27308-0.000193277-0.726727;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047198; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=7; RT=7; SR=0; TI=SMTPD_---.LlcGtUT_1635760905; 
Received: from roman-VirtualBox.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.LlcGtUT_1635760905)
 by smtp.aliyun-inc.com(10.147.43.230);
 Mon, 01 Nov 2021 18:01:48 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 richard.henderson@linaro.org, LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH 06/13] target/riscv: Adjust vsetvl according to ol
Date: Mon,  1 Nov 2021 18:01:36 +0800
Message-Id: <20211101100143.44356-7-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211101100143.44356-1-zhiwei_liu@c-sky.com>
References: <20211101100143.44356-1-zhiwei_liu@c-sky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=115.124.28.147; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-147.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Mon, 01 Nov 2021 10:02:06 -0000

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 target/riscv/cpu.h                      |  2 ++
 target/riscv/helper.h                   |  2 +-
 target/riscv/insn_trans/trans_rvv.c.inc |  4 ++--
 target/riscv/vector_helper.c            | 19 +++++++++++++++----
 4 files changed, 20 insertions(+), 7 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 8befff0166..7163ac1f4c 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -107,6 +107,8 @@ FIELD(VTYPE, VSEW, 2, 3)
 FIELD(VTYPE, VEDIV, 5, 2)
 FIELD(VTYPE, RESERVED, 7, sizeof(target_ulong) * 8 - 9)
 FIELD(VTYPE, VILL, sizeof(target_ulong) * 8 - 1, 1)
+FIELD(VTYPE, RESERVED_OLEN32, 7, 23)
+FIELD(VTYPE, VILL_OLEN32, 31, 1)
 
 struct CPURISCVState {
     target_ulong gpr[32];
diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index c7a5376227..e198d43981 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -82,7 +82,7 @@ DEF_HELPER_2(hyp_hlvx_wu, tl, env, tl)
 #endif
 
 /* Vector functions */
-DEF_HELPER_3(vsetvl, tl, env, tl, tl)
+DEF_HELPER_4(vsetvl, tl, env, tl, tl, tl)
 DEF_HELPER_5(vlb_v_b, void, ptr, ptr, tl, env, i32)
 DEF_HELPER_5(vlb_v_b_mask, void, ptr, ptr, tl, env, i32)
 DEF_HELPER_5(vlb_v_h, void, ptr, ptr, tl, env, i32)
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 17ee3babef..01da065710 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -37,7 +37,7 @@ static bool trans_vsetvl(DisasContext *ctx, arg_vsetvl *a)
     } else {
         s1 = get_gpr(ctx, a->rs1, EXT_ZERO);
     }
-    gen_helper_vsetvl(dst, cpu_env, s1, s2);
+    gen_helper_vsetvl(dst, cpu_env, s1, s2, tcg_constant_tl(get_olen(ctx)));
     gen_set_gpr(ctx, a->rd, dst);
 
     tcg_gen_movi_tl(cpu_pc, ctx->pc_succ_insn);
@@ -64,7 +64,7 @@ static bool trans_vsetvli(DisasContext *ctx, arg_vsetvli *a)
     } else {
         s1 = get_gpr(ctx, a->rs1, EXT_ZERO);
     }
-    gen_helper_vsetvl(dst, cpu_env, s1, s2);
+    gen_helper_vsetvl(dst, cpu_env, s1, s2, tcg_constant_tl(get_olen(ctx)));
     gen_set_gpr(ctx, a->rd, dst);
 
     gen_goto_tb(ctx, 0, ctx->pc_succ_insn);
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 12c31aa4b4..09e76229bc 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -27,18 +27,29 @@
 #include <math.h>
 
 target_ulong HELPER(vsetvl)(CPURISCVState *env, target_ulong s1,
-                            target_ulong s2)
+                            target_ulong s2, target_ulong olen)
 {
     int vlmax, vl;
     RISCVCPU *cpu = env_archcpu(env);
     uint16_t sew = 8 << FIELD_EX64(s2, VTYPE, VSEW);
     uint8_t ediv = FIELD_EX64(s2, VTYPE, VEDIV);
-    bool vill = FIELD_EX64(s2, VTYPE, VILL);
-    target_ulong reserved = FIELD_EX64(s2, VTYPE, RESERVED);
+    bool vill;
+    target_ulong reserved;
 
+    if (olen < TARGET_LONG_BITS) {
+        vill = FIELD_EX64(s2, VTYPE, VILL_OLEN32);
+        reserved = FIELD_EX64(s2, VTYPE, RESERVED_OLEN32);
+    } else {
+        vill = FIELD_EX64(s2, VTYPE, VILL);
+        reserved = FIELD_EX64(s2, VTYPE, RESERVED);
+    }
     if ((sew > cpu->cfg.elen) || vill || (ediv != 0) || (reserved != 0)) {
         /* only set vill bit. */
-        env->vtype = FIELD_DP64(0, VTYPE, VILL, 1);
+        if (olen < TARGET_LONG_BITS) {
+            env->vtype = FIELD_DP64(0, VTYPE, VILL_OLEN32, 1);
+        } else {
+            env->vtype = FIELD_DP64(0, VTYPE, VILL, 1);
+        }
         env->vl = 0;
         env->vstart = 0;
         return 0;
-- 
2.25.1


