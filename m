Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mlCTx-0000ma-RG
	for mharc-qemu-riscv@gnu.org; Thu, 11 Nov 2021 10:59:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mlCTv-0000d6-Nw; Thu, 11 Nov 2021 10:59:19 -0500
Received: from mail142-38.mail.alibaba.com ([198.11.142.38]:14084)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mlCTt-0000OA-Mr; Thu, 11 Nov 2021 10:59:19 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07497799|-1; CH=blue; DM=|OVERLOAD|false|;
 DS=CONTINUE|ham_alarm|0.0333596-0.00222042-0.96442;
 FP=11742988869770882939|2|2|6|0|-1|-1|-1; HT=ay29a033018047212;
 MF=zhiwei_liu@c-sky.com; NM=1; PH=DS; RN=7; RT=7; SR=0;
 TI=SMTPD_---.LrIiiUC_1636646346; 
Received: from localhost.localdomain(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.LrIiiUC_1636646346)
 by smtp.aliyun-inc.com(10.147.40.44); Thu, 11 Nov 2021 23:59:07 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 richard.henderson@linaro.org, LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v4 14/20] target/riscv: Adjust vsetvl according to XLEN
Date: Thu, 11 Nov 2021 23:51:43 +0800
Message-Id: <20211111155149.58172-15-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211111155149.58172-1-zhiwei_liu@c-sky.com>
References: <20211111155149.58172-1-zhiwei_liu@c-sky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=198.11.142.38; envelope-from=zhiwei_liu@c-sky.com;
 helo=mail142-38.mail.alibaba.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
X-List-Received-Date: Thu, 11 Nov 2021 15:59:20 -0000

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/helper.h                   | 2 +-
 target/riscv/insn_trans/trans_rvv.c.inc | 4 ++--
 target/riscv/vector_helper.c            | 8 +++++---
 3 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index c5098380dd..f2910f5f30 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -82,7 +82,7 @@ DEF_HELPER_2(hyp_hlvx_wu, tl, env, tl)
 #endif
 
 /* Vector functions */
-DEF_HELPER_3(vsetvl, tl, env, tl, tl)
+DEF_HELPER_4(vsetvl, tl, env, tl, tl, i32)
 DEF_HELPER_5(vlb_v_b, void, ptr, ptr, tl, env, i32)
 DEF_HELPER_5(vlb_v_b_mask, void, ptr, ptr, tl, env, i32)
 DEF_HELPER_5(vlb_v_h, void, ptr, ptr, tl, env, i32)
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 17ee3babef..6fa673f4b2 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -37,7 +37,7 @@ static bool trans_vsetvl(DisasContext *ctx, arg_vsetvl *a)
     } else {
         s1 = get_gpr(ctx, a->rs1, EXT_ZERO);
     }
-    gen_helper_vsetvl(dst, cpu_env, s1, s2);
+    gen_helper_vsetvl(dst, cpu_env, s1, s2, tcg_constant_i32(get_xlen(ctx)));
     gen_set_gpr(ctx, a->rd, dst);
 
     tcg_gen_movi_tl(cpu_pc, ctx->pc_succ_insn);
@@ -64,7 +64,7 @@ static bool trans_vsetvli(DisasContext *ctx, arg_vsetvli *a)
     } else {
         s1 = get_gpr(ctx, a->rs1, EXT_ZERO);
     }
-    gen_helper_vsetvl(dst, cpu_env, s1, s2);
+    gen_helper_vsetvl(dst, cpu_env, s1, s2, tcg_constant_i32(get_xlen(ctx)));
     gen_set_gpr(ctx, a->rd, dst);
 
     gen_goto_tb(ctx, 0, ctx->pc_succ_insn);
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index b02ccefa4d..e49b431610 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -27,14 +27,16 @@
 #include <math.h>
 
 target_ulong HELPER(vsetvl)(CPURISCVState *env, target_ulong s1,
-                            target_ulong s2)
+                            target_ulong s2, uint32_t xlen)
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


