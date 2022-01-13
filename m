Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n7yUZ-0003gy-2j
	for mharc-qemu-riscv@gnu.org; Thu, 13 Jan 2022 06:42:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1n7yUM-0003fo-18; Thu, 13 Jan 2022 06:41:56 -0500
Received: from out28-122.mail.aliyun.com ([115.124.28.122]:43682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1n7yTz-00037N-Hw; Thu, 13 Jan 2022 06:41:53 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07446364|-1; CH=green;
 DM=|CONTINUE|false|; DS=CONTINUE|ham_alarm|0.0111777-0.000397031-0.988425;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047204; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=9; RT=8; SR=0; TI=SMTPD_---.Mb1Km2h_1642074070; 
Received: from roman-VirtualBox.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.Mb1Km2h_1642074070)
 by smtp.aliyun-inc.com(10.147.42.16); Thu, 13 Jan 2022 19:41:10 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 richard.henderson@linaro.org, guoren@linux.alibaba.com,
 LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v6 02/22] target/riscv: Don't save pc when exception return
Date: Thu, 13 Jan 2022 19:39:44 +0800
Message-Id: <20220113114004.286796-3-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220113114004.286796-1-zhiwei_liu@c-sky.com>
References: <20220113114004.286796-1-zhiwei_liu@c-sky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=115.124.28.122; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-122.mail.aliyun.com
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
X-List-Received-Date: Thu, 13 Jan 2022 11:41:59 -0000

As pc will be written by the xepc in exception return, just ignore
pc in translation.

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/helper.h                          | 4 ++--
 target/riscv/insn_trans/trans_privileged.c.inc | 7 ++-----
 target/riscv/op_helper.c                       | 4 ++--
 3 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 6cf6d6ce98..72cc2582f4 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -100,8 +100,8 @@ DEF_HELPER_2(csrr_i128, tl, env, int)
 DEF_HELPER_4(csrw_i128, void, env, int, tl, tl)
 DEF_HELPER_6(csrrw_i128, tl, env, int, tl, tl, tl, tl)
 #ifndef CONFIG_USER_ONLY
-DEF_HELPER_2(sret, tl, env, tl)
-DEF_HELPER_2(mret, tl, env, tl)
+DEF_HELPER_1(sret, tl, env)
+DEF_HELPER_1(mret, tl, env)
 DEF_HELPER_1(wfi, void, env)
 DEF_HELPER_1(tlb_flush, void, env)
 #endif
diff --git a/target/riscv/insn_trans/trans_privileged.c.inc b/target/riscv/insn_trans/trans_privileged.c.inc
index 75c6ef80a6..6077bbbf11 100644
--- a/target/riscv/insn_trans/trans_privileged.c.inc
+++ b/target/riscv/insn_trans/trans_privileged.c.inc
@@ -74,10 +74,8 @@ static bool trans_uret(DisasContext *ctx, arg_uret *a)
 static bool trans_sret(DisasContext *ctx, arg_sret *a)
 {
 #ifndef CONFIG_USER_ONLY
-    tcg_gen_movi_tl(cpu_pc, ctx->base.pc_next);
-
     if (has_ext(ctx, RVS)) {
-        gen_helper_sret(cpu_pc, cpu_env, cpu_pc);
+        gen_helper_sret(cpu_pc, cpu_env);
         tcg_gen_exit_tb(NULL, 0); /* no chaining */
         ctx->base.is_jmp = DISAS_NORETURN;
     } else {
@@ -92,8 +90,7 @@ static bool trans_sret(DisasContext *ctx, arg_sret *a)
 static bool trans_mret(DisasContext *ctx, arg_mret *a)
 {
 #ifndef CONFIG_USER_ONLY
-    tcg_gen_movi_tl(cpu_pc, ctx->base.pc_next);
-    gen_helper_mret(cpu_pc, cpu_env, cpu_pc);
+    gen_helper_mret(cpu_pc, cpu_env);
     tcg_gen_exit_tb(NULL, 0); /* no chaining */
     ctx->base.is_jmp = DISAS_NORETURN;
     return true;
diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
index 6f040f2fb9..67693cb42b 100644
--- a/target/riscv/op_helper.c
+++ b/target/riscv/op_helper.c
@@ -115,7 +115,7 @@ target_ulong helper_csrrw_i128(CPURISCVState *env, int csr,
 
 #ifndef CONFIG_USER_ONLY
 
-target_ulong helper_sret(CPURISCVState *env, target_ulong cpu_pc_deb)
+target_ulong helper_sret(CPURISCVState *env)
 {
     uint64_t mstatus;
     target_ulong prev_priv, prev_virt;
@@ -176,7 +176,7 @@ target_ulong helper_sret(CPURISCVState *env, target_ulong cpu_pc_deb)
     return retpc;
 }
 
-target_ulong helper_mret(CPURISCVState *env, target_ulong cpu_pc_deb)
+target_ulong helper_mret(CPURISCVState *env)
 {
     if (!(env->priv >= PRV_M)) {
         riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, GETPC());
-- 
2.25.1


