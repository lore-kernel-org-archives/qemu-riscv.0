Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ml3D7-0008EW-IM
	for mharc-qemu-riscv@gnu.org; Thu, 11 Nov 2021 01:05:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1ml3D6-0008Ar-5r; Thu, 11 Nov 2021 01:05:20 -0500
Received: from out28-75.mail.aliyun.com ([115.124.28.75]:52357)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1ml3D3-0003yH-9V; Thu, 11 Nov 2021 01:05:19 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07520969|-1; CH=green;
 DM=|CONTINUE|false|; DS=CONTINUE|ham_alarm|0.0341477-0.00223256-0.96362;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047198; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=7; RT=7; SR=0; TI=SMTPD_---.Lr1vPH6_1636610711; 
Received: from roman-VirtualBox.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.Lr1vPH6_1636610711)
 by smtp.aliyun-inc.com(10.147.44.118);
 Thu, 11 Nov 2021 14:05:11 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 richard.henderson@linaro.org, LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v3 14/20] target/riscv: Adjust vsetvl according to XLEN
Date: Thu, 11 Nov 2021 13:57:54 +0800
Message-Id: <20211111055800.42672-15-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211111055800.42672-1-zhiwei_liu@c-sky.com>
References: <20211111055800.42672-1-zhiwei_liu@c-sky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=115.124.28.75; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-75.mail.aliyun.com
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
X-List-Received-Date: Thu, 11 Nov 2021 06:05:20 -0000

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 target/riscv/helper.h                   | 2 +-
 target/riscv/insn_trans/trans_rvv.c.inc | 4 ++--
 target/riscv/vector_helper.c            | 8 +++++---
 3 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index c5098380dd..a67965efe5 100644
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
index 17ee3babef..f5aabd5263 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -37,7 +37,7 @@ static bool trans_vsetvl(DisasContext *ctx, arg_vsetvl *a)
     } else {
         s1 = get_gpr(ctx, a->rs1, EXT_ZERO);
     }
-    gen_helper_vsetvl(dst, cpu_env, s1, s2);
+    gen_helper_vsetvl(dst, cpu_env, s1, s2, tcg_constant_tl(get_xlen(ctx)));
     gen_set_gpr(ctx, a->rd, dst);
 
     tcg_gen_movi_tl(cpu_pc, ctx->pc_succ_insn);
@@ -64,7 +64,7 @@ static bool trans_vsetvli(DisasContext *ctx, arg_vsetvli *a)
     } else {
         s1 = get_gpr(ctx, a->rs1, EXT_ZERO);
     }
-    gen_helper_vsetvl(dst, cpu_env, s1, s2);
+    gen_helper_vsetvl(dst, cpu_env, s1, s2, tcg_constant_tl(get_xlen(ctx)));
     gen_set_gpr(ctx, a->rd, dst);
 
     gen_goto_tb(ctx, 0, ctx->pc_succ_insn);
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index b02ccefa4d..1a7ee46d46 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -27,14 +27,16 @@
 #include <math.h>
 
 target_ulong HELPER(vsetvl)(CPURISCVState *env, target_ulong s1,
-                            target_ulong s2)
+                            target_ulong s2, target_ulong xlen)
 {
     int vlmax, vl;
     RISCVCPU *cpu = env_archcpu(env);
     uint16_t sew = 8 << FIELD_EX64(s2, VTYPE, VSEW);
     uint8_t ediv = FIELD_EX64(s2, VTYPE, VEDIV);
-    bool vill = FIELD_EX64(s2, VTYPE, VILL);
-    target_ulong reserved = FIELD_EX64(s2, VTYPE, RESERVED);
+    bool vill = (s2 >> (xlen - 1)) & 0x1;
+    target_ulong reserved = s2 &
+                            MAKE_64BIT_MASK(R_VTYPE_RESERVED_SHIFT,
+                                            xlen - 1 - R_VTYPE_RESERVED_SHIFT);
 
     if ((sew > cpu->cfg.elen) || vill || (ediv != 0) || (reserved != 0)) {
         /* only set vill bit. */
-- 
2.25.1


