Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mq9Un-0007cI-4k
	for mharc-qemu-riscv@gnu.org; Thu, 25 Nov 2021 02:48:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mq9Ul-0007Xc-G1; Thu, 25 Nov 2021 02:48:39 -0500
Received: from out28-100.mail.aliyun.com ([115.124.28.100]:36500)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mq9Ui-0005fM-Tq; Thu, 25 Nov 2021 02:48:39 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.08302086|-1; CH=green;
 DM=|CONTINUE|false|; DS=CONTINUE|ham_alarm|0.0349596-0.00207493-0.962965;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047213; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=8; RT=7; SR=0; TI=SMTPD_---.LyzHnPN_1637826510; 
Received: from roman-VirtualBox.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.LyzHnPN_1637826510)
 by smtp.aliyun-inc.com(10.147.41.143);
 Thu, 25 Nov 2021 15:48:31 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: richard.henderson@linaro.org, Alistair.Francis@wdc.com, palmer@dabbelt.com,
 bin.meng@windriver.com, LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v5 16/22] target/riscv: Adjust vsetvl according to XLEN
Date: Thu, 25 Nov 2021 15:39:45 +0800
Message-Id: <20211125073951.57678-17-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211125073951.57678-1-zhiwei_liu@c-sky.com>
References: <20211125073951.57678-1-zhiwei_liu@c-sky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=115.124.28.100; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-100.mail.aliyun.com
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
X-List-Received-Date: Thu, 25 Nov 2021 07:48:39 -0000

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h           | 5 +++++
 target/riscv/vector_helper.c | 7 +++++--
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 2cee98f152..ef1d87af38 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -427,6 +427,11 @@ static inline RISCVMXL riscv_cpu_mxl(CPURISCVState *env)
 
 RISCVMXL cpu_get_xl(CPURISCVState *env);
 
+static inline int riscv_cpu_xlen(CPURISCVState *env)
+{
+    return 16 << env->xl;
+}
+
 /*
  * A simplification for VLMAX
  * = (1 << LMUL) * VLEN / (8 * (1 << SEW))
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index b02ccefa4d..e9d49cf105 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -33,8 +33,11 @@ target_ulong HELPER(vsetvl)(CPURISCVState *env, target_ulong s1,
     RISCVCPU *cpu = env_archcpu(env);
     uint16_t sew = 8 << FIELD_EX64(s2, VTYPE, VSEW);
     uint8_t ediv = FIELD_EX64(s2, VTYPE, VEDIV);
-    bool vill = FIELD_EX64(s2, VTYPE, VILL);
-    target_ulong reserved = FIELD_EX64(s2, VTYPE, RESERVED);
+    int xlen = riscv_cpu_xlen(env);
+    bool vill = (s2 >> (xlen - 1)) & 0x1;
+    target_ulong reserved = s2 &
+                            MAKE_64BIT_MASK(R_VTYPE_RESERVED_SHIFT,
+                                            xlen - 1 - R_VTYPE_RESERVED_SHIFT);
 
     if ((sew > cpu->cfg.elen) || vill || (ediv != 0) || (reserved != 0)) {
         /* only set vill bit. */
-- 
2.25.1


