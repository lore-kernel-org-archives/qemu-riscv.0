Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mq9P7-0002nR-F8
	for mharc-qemu-riscv@gnu.org; Thu, 25 Nov 2021 02:42:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mq9P6-0002lT-5O; Thu, 25 Nov 2021 02:42:48 -0500
Received: from out28-97.mail.aliyun.com ([115.124.28.97]:53383)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mq9P3-0001LD-MB; Thu, 25 Nov 2021 02:42:47 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.1107497|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_alarm|0.0260121-0.000895844-0.973092; FP=0|0|0|0|0|-1|-1|-1;
 HT=ay29a033018047199; MF=zhiwei_liu@c-sky.com; NM=1; PH=DS; RN=8; RT=7; SR=0;
 TI=SMTPD_---.Lz-2.Pk_1637826156; 
Received: from roman-VirtualBox.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.Lz-2.Pk_1637826156)
 by smtp.aliyun-inc.com(10.147.44.118);
 Thu, 25 Nov 2021 15:42:37 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: richard.henderson@linaro.org, Alistair.Francis@wdc.com, palmer@dabbelt.com,
 bin.meng@windriver.com, LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v5 05/22] target/riscv: Ignore the pc bits above XLEN
Date: Thu, 25 Nov 2021 15:39:34 +0800
Message-Id: <20211125073951.57678-6-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211125073951.57678-1-zhiwei_liu@c-sky.com>
References: <20211125073951.57678-1-zhiwei_liu@c-sky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=115.124.28.97; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-97.mail.aliyun.com
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
X-List-Received-Date: Thu, 25 Nov 2021 07:42:48 -0000

The read from PC for translation is in cpu_get_tb_cpu_state, before translation.

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu_helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index b6cddf8648..9c3838bddf 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -71,7 +71,7 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
 {
     uint32_t flags = 0;
 
-    *pc = env->pc;
+    *pc = env->xl == MXL_RV32 ? env->pc & UINT32_MAX : env->pc;
     *cs_base = 0;
 
     if (riscv_has_ext(env, RVV)) {
@@ -127,7 +127,7 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
     }
 #endif
 
-    flags = FIELD_DP32(flags, TB_FLAGS, XL, cpu_get_xl(env));
+    flags = FIELD_DP32(flags, TB_FLAGS, XL, env->xl);
 
     *pflags = flags;
 }
-- 
2.25.1


