Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mBTXp-0004bH-Rj
	for mharc-qemu-riscv@gnu.org; Wed, 04 Aug 2021 22:55:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mBTXn-0004X6-Rq; Wed, 04 Aug 2021 22:55:39 -0400
Received: from out28-122.mail.aliyun.com ([115.124.28.122]:38930)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mBTXl-0005Uk-VV; Wed, 04 Aug 2021 22:55:39 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07566033|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.0121746-6.56494e-05-0.98776;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047208; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=7; RT=7; SR=0; TI=SMTPD_---.KvYquy-_1628132130; 
Received: from roman-VirtualBox.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.KvYquy-_1628132130)
 by smtp.aliyun-inc.com(10.147.44.118);
 Thu, 05 Aug 2021 10:55:30 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 richard.henderson@linaro.org, LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [RFC PATCH 01/13] target/riscv: Add UXL to tb flags
Date: Thu,  5 Aug 2021 10:53:00 +0800
Message-Id: <20210805025312.15720-2-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210805025312.15720-1-zhiwei_liu@c-sky.com>
References: <20210805025312.15720-1-zhiwei_liu@c-sky.com>
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
X-List-Received-Date: Thu, 05 Aug 2021 02:55:40 -0000

For 32-bit applications run on 64-bit cpu, it may share some code
with other 64-bit applictions. Thus we should distinguish the translated
cache of the share code with a tb flag.

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 target/riscv/cpu.h       | 15 +++++++++++++++
 target/riscv/translate.c |  3 +++
 2 files changed, 18 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index bf1c899c00..2b3ba21a78 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -394,9 +394,20 @@ FIELD(TB_FLAGS, SEW, 5, 3)
 FIELD(TB_FLAGS, VILL, 8, 1)
 /* Is a Hypervisor instruction load/store allowed? */
 FIELD(TB_FLAGS, HLSX, 9, 1)
+FIELD(TB_FLAGS, UXL, 10, 2)
 
 bool riscv_cpu_is_32bit(CPURISCVState *env);
 
+static inline bool riscv_cpu_is_uxl32(CPURISCVState *env)
+{
+#ifndef CONFIG_USER_ONLY
+    return (get_field(env->mstatus, MSTATUS64_UXL) == 1) &&
+           !riscv_cpu_is_32bit(env) &&
+           (env->priv == PRV_U);
+#endif
+    return false;
+}
+
 /*
  * A simplification for VLMAX
  * = (1 << LMUL) * VLEN / (8 * (1 << SEW))
@@ -451,6 +462,10 @@ static inline void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
             flags = FIELD_DP32(flags, TB_FLAGS, HLSX, 1);
         }
     }
+    if (riscv_cpu_is_uxl32(env)) {
+        flags = FIELD_DP32(flags, TB_FLAGS, UXL,
+                           get_field(env->mstatus, MSTATUS64_UXL));
+    }
 #endif
 
     *pflags = flags;
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 076f28b9c1..ac4a545da8 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -67,6 +67,8 @@ typedef struct DisasContext {
     CPUState *cs;
     TCGv zero;
     TCGv sink;
+    /* UXLEN is 32 bit for 64-bit CPU */
+    bool uxl32;
 } DisasContext;
 
 static inline bool has_ext(DisasContext *ctx, uint32_t ext)
@@ -912,6 +914,7 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->mlen = 1 << (ctx->sew  + 3 - ctx->lmul);
     ctx->vl_eq_vlmax = FIELD_EX32(tb_flags, TB_FLAGS, VL_EQ_VLMAX);
     ctx->cs = cs;
+    ctx->uxl32 = FIELD_EX32(tb_flags, TB_FLAGS, UXL) == 1;
 }
 
 static void riscv_tr_tb_start(DisasContextBase *dcbase, CPUState *cpu)
-- 
2.17.1


