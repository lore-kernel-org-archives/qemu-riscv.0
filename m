Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mhU8h-0001bn-Tw
	for mharc-qemu-riscv@gnu.org; Mon, 01 Nov 2021 06:02:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mhU8e-0001R4-F5; Mon, 01 Nov 2021 06:02:00 -0400
Received: from out28-193.mail.aliyun.com ([115.124.28.193]:37902)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mhU8Z-0001Uk-Qe; Mon, 01 Nov 2021 06:02:00 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07518584|-1; CH=green;
 DM=|CONTINUE|false|; DS=CONTINUE|ham_alarm|0.0612003-0.000265942-0.938534;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047203; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=7; RT=7; SR=0; TI=SMTPD_---.LlcGtUT_1635760905; 
Received: from roman-VirtualBox.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.LlcGtUT_1635760905)
 by smtp.aliyun-inc.com(10.147.43.230);
 Mon, 01 Nov 2021 18:01:50 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 richard.henderson@linaro.org, LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH 11/13] target/riscv: Switch context in exception return
Date: Mon,  1 Nov 2021 18:01:41 +0800
Message-Id: <20211101100143.44356-12-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211101100143.44356-1-zhiwei_liu@c-sky.com>
References: <20211101100143.44356-1-zhiwei_liu@c-sky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=115.124.28.193; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-193.mail.aliyun.com
X-Spam_score_int: 0
X-Spam_score: -0.0
X-Spam_bar: /
X-Spam_report: (-0.0 / 5.0 requ) RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Mon, 01 Nov 2021 10:02:01 -0000

After excpetion return, we should give a xlen view of context in new
priveledge, including the general registers, pc, and CSRs.

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 target/riscv/helper.h                         |  1 +
 .../riscv/insn_trans/trans_privileged.c.inc   |  2 ++
 target/riscv/op_helper.c                      | 26 +++++++++++++++++++
 3 files changed, 29 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index e198d43981..9b379d7232 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -71,6 +71,7 @@ DEF_HELPER_2(sret, tl, env, tl)
 DEF_HELPER_2(mret, tl, env, tl)
 DEF_HELPER_1(wfi, void, env)
 DEF_HELPER_1(tlb_flush, void, env)
+DEF_HELPER_1(switch_context_xl, void, env)
 #endif
 
 /* Hypervisor functions */
diff --git a/target/riscv/insn_trans/trans_privileged.c.inc b/target/riscv/insn_trans/trans_privileged.c.inc
index 75c6ef80a6..6e39632f83 100644
--- a/target/riscv/insn_trans/trans_privileged.c.inc
+++ b/target/riscv/insn_trans/trans_privileged.c.inc
@@ -78,6 +78,7 @@ static bool trans_sret(DisasContext *ctx, arg_sret *a)
 
     if (has_ext(ctx, RVS)) {
         gen_helper_sret(cpu_pc, cpu_env, cpu_pc);
+        gen_helper_switch_context_xl(cpu_env);
         tcg_gen_exit_tb(NULL, 0); /* no chaining */
         ctx->base.is_jmp = DISAS_NORETURN;
     } else {
@@ -94,6 +95,7 @@ static bool trans_mret(DisasContext *ctx, arg_mret *a)
 #ifndef CONFIG_USER_ONLY
     tcg_gen_movi_tl(cpu_pc, ctx->base.pc_next);
     gen_helper_mret(cpu_pc, cpu_env, cpu_pc);
+    gen_helper_switch_context_xl(cpu_env);
     tcg_gen_exit_tb(NULL, 0); /* no chaining */
     ctx->base.is_jmp = DISAS_NORETURN;
     return true;
diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
index ee7c24efe7..20cf8ad883 100644
--- a/target/riscv/op_helper.c
+++ b/target/riscv/op_helper.c
@@ -70,6 +70,32 @@ target_ulong helper_csrrw(CPURISCVState *env, int csr,
 }
 
 #ifndef CONFIG_USER_ONLY
+void helper_switch_context_xl(CPURISCVState *env)
+{
+    RISCVMXL xl = cpu_get_xl(env);
+    if (xl == env->misa_mxl_max) {
+        return;
+    }
+    assert(xl < env->misa_mxl_max);
+    switch (xl) {
+    case MXL_RV32:
+        for (int i = 1; i < 32; i++) {
+            env->gpr[i] = (int32_t)env->gpr[i];
+        }
+        env->pc = (int32_t)env->pc;
+        /*
+         * For the read-only bits of the previous-width CSR, the bits at the
+         * same positions in the temporary register are set to zeros.
+         */
+        if ((env->priv == PRV_U) && (env->misa_ext & RVV)) {
+            env->vl = 0;
+            env->vtype = 0;
+        }
+        break;
+    default:
+        break;
+    }
+}
 
 target_ulong helper_sret(CPURISCVState *env, target_ulong cpu_pc_deb)
 {
-- 
2.25.1


