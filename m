Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ml37g-00025z-4Z
	for mharc-qemu-riscv@gnu.org; Thu, 11 Nov 2021 00:59:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1ml37e-00021i-9d; Thu, 11 Nov 2021 00:59:42 -0500
Received: from out28-170.mail.aliyun.com ([115.124.28.170]:52793)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1ml37b-0003G5-NG; Thu, 11 Nov 2021 00:59:42 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.1117904|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_alarm|0.013589-0.000341692-0.986069;
 FP=3134215141809239407|2|2|6|0|-1|-1|-1; HT=ay29a033018047199;
 MF=zhiwei_liu@c-sky.com; NM=1; PH=DS; RN=7; RT=7; SR=0;
 TI=SMTPD_---.Lr0nyfO_1636610374; 
Received: from roman-VirtualBox.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.Lr0nyfO_1636610374)
 by smtp.aliyun-inc.com(10.147.41.231);
 Thu, 11 Nov 2021 13:59:35 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 richard.henderson@linaro.org, LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v3 03/20] target/riscv: Ignore the pc bits above XLEN
Date: Thu, 11 Nov 2021 13:57:43 +0800
Message-Id: <20211111055800.42672-4-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211111055800.42672-1-zhiwei_liu@c-sky.com>
References: <20211111055800.42672-1-zhiwei_liu@c-sky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=115.124.28.170; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-170.mail.aliyun.com
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
X-List-Received-Date: Thu, 11 Nov 2021 05:59:42 -0000

The read from PC for translation is in cpu_get_tb_cpu_state, before translation.

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/cpu_helper.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 9eeed38c7e..4c048cc266 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -70,8 +70,9 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
                           target_ulong *cs_base, uint32_t *pflags)
 {
     uint32_t flags = 0;
+    RISCVMXL xl = cpu_get_xl(env);
 
-    *pc = env->pc;
+    *pc = xl == MXL_RV32 ? env->pc & UINT32_MAX : env->pc;
     *cs_base = 0;
 
     if (riscv_has_ext(env, RVV)) {
@@ -127,7 +128,7 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
     }
 #endif
 
-    flags = FIELD_DP32(flags, TB_FLAGS, XL, cpu_get_xl(env));
+    flags = FIELD_DP32(flags, TB_FLAGS, XL, xl);
 
     *pflags = flags;
 }
-- 
2.25.1


