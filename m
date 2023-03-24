Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pfb6v-0006Xq-1j
	for mharc-qemu-riscv@gnu.org; Fri, 24 Mar 2023 02:41:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pfb6t-0006XU-FS; Fri, 24 Mar 2023 02:41:11 -0400
Received: from out30-98.freemail.mail.aliyun.com ([115.124.30.98])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pfb6g-0007q5-El; Fri, 24 Mar 2023 02:41:10 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R621e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046059;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=8; SR=0;
 TI=SMTPD_---0VeWiAsy_1679640036; 
Received: from L-PF1D6DP4-1208.hz.ali.com(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VeWiAsy_1679640036) by smtp.aliyun-inc.com;
 Fri, 24 Mar 2023 14:40:37 +0800
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
To: qemu-devel@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 liweiwei@iscas.ac.cn, dbarboza@ventanamicro.com, qemu-riscv@nongnu.org,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [PATCH] target/riscv: Fix itrigger when icount is used
Date: Fri, 24 Mar 2023 14:40:11 +0800
Message-Id: <20230324064011.976-1-zhiwei_liu@linux.alibaba.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.98;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-98.freemail.mail.aliyun.com
X-Spam_score_int: -98
X-Spam_score: -9.9
X-Spam_bar: ---------
X-Spam_report: (-9.9 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 24 Mar 2023 06:41:11 -0000

When I boot a ubuntu image, QEMU output a "Bad icount read" message and exit.
The reason is that when execute helper_mret or helper_sret, it will
cause a call to icount_get_raw_locked (), which needs set can_do_io flag
on cpustate.

Thus we setting this flag when execute these two instructions.

Signed-off-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
---
 target/riscv/insn_trans/trans_privileged.c.inc | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/target/riscv/insn_trans/trans_privileged.c.inc b/target/riscv/insn_trans/trans_privileged.c.inc
index 59501b2780..e3bee971c6 100644
--- a/target/riscv/insn_trans/trans_privileged.c.inc
+++ b/target/riscv/insn_trans/trans_privileged.c.inc
@@ -77,6 +77,9 @@ static bool trans_sret(DisasContext *ctx, arg_sret *a)
 #ifndef CONFIG_USER_ONLY
     if (has_ext(ctx, RVS)) {
         decode_save_opc(ctx);
+        if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
+            gen_io_start();
+        }
         gen_helper_sret(cpu_pc, cpu_env);
         exit_tb(ctx); /* no chaining */
         ctx->base.is_jmp = DISAS_NORETURN;
@@ -93,6 +96,9 @@ static bool trans_mret(DisasContext *ctx, arg_mret *a)
 {
 #ifndef CONFIG_USER_ONLY
     decode_save_opc(ctx);
+    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
+        gen_io_start();
+    }
     gen_helper_mret(cpu_pc, cpu_env);
     exit_tb(ctx); /* no chaining */
     ctx->base.is_jmp = DISAS_NORETURN;
-- 
2.17.1


