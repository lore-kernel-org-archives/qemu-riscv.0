Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mlCWt-0006gF-Ut
	for mharc-qemu-riscv@gnu.org; Thu, 11 Nov 2021 11:02:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mlCWr-0006Yb-Sv; Thu, 11 Nov 2021 11:02:21 -0500
Received: from out29-171.mail.aliyun.com ([115.124.29.171]:48946)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mlCWp-00010o-3I; Thu, 11 Nov 2021 11:02:21 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.1661368|-1; CH=blue; DM=|OVERLOAD|false|;
 DS=CONTINUE|ham_alarm|0.0533051-3.12924e-05-0.946664; FP=0|0|0|0|0|-1|-1|-1;
 HT=ay29a033018047198; MF=zhiwei_liu@c-sky.com; NM=1; PH=DS; RN=7; RT=7; SR=0;
 TI=SMTPD_---.LrJGLQC_1636646531; 
Received: from localhost.localdomain(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.LrJGLQC_1636646531)
 by smtp.aliyun-inc.com(10.147.42.198);
 Fri, 12 Nov 2021 00:02:13 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 richard.henderson@linaro.org, LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v4 20/20] target/riscv: Enable uxl field write
Date: Thu, 11 Nov 2021 23:51:49 +0800
Message-Id: <20211111155149.58172-21-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211111155149.58172-1-zhiwei_liu@c-sky.com>
References: <20211111155149.58172-1-zhiwei_liu@c-sky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=115.124.29.171; envelope-from=zhiwei_liu@c-sky.com;
 helo=out29-171.mail.aliyun.com
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
X-List-Received-Date: Thu, 11 Nov 2021 16:02:22 -0000

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 target/riscv/cpu_bits.h | 2 ++
 target/riscv/csr.c      | 8 +++++---
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 9913fa9f77..5106f0e769 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -413,6 +413,8 @@ typedef enum {
 #define SSTATUS_SUM         0x00040000 /* since: priv-1.10 */
 #define SSTATUS_MXR         0x00080000
 
+#define SSTATUS64_UXL       0x0000000300000000ULL
+
 #define SSTATUS32_SD        0x80000000
 #define SSTATUS64_SD        0x8000000000000000ULL
 
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 8f8f170768..e79532053a 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -553,15 +553,14 @@ static RISCVException write_mstatus(CPURISCVState *env, int csrno,
          * RV32: MPV and GVA are not in mstatus. The current plan is to
          * add them to mstatush. For now, we just don't support it.
          */
-        mask |= MSTATUS_MPV | MSTATUS_GVA;
+        mask |= MSTATUS_MPV | MSTATUS_GVA | MSTATUS64_UXL;
     }
 
     mstatus = (mstatus & ~mask) | (val & mask);
 
     if (riscv_cpu_mxl(env) == MXL_RV64) {
-        /* SXL and UXL fields are for now read only */
+        /* SXL fields are for now read only */
         mstatus = set_field(mstatus, MSTATUS64_SXL, MXL_RV64);
-        mstatus = set_field(mstatus, MSTATUS64_UXL, MXL_RV64);
     }
     env->mstatus = mstatus;
 
@@ -840,6 +839,9 @@ static RISCVException write_sstatus(CPURISCVState *env, int csrno,
                                     target_ulong val)
 {
     target_ulong mask = (sstatus_v1_10_mask);
+    if (cpu_get_xl(env) != MXL_RV32) {
+        mask |= SSTATUS64_UXL;
+    }
     target_ulong newval = (env->mstatus & ~mask) | (val & mask);
     return write_mstatus(env, CSR_MSTATUS, newval);
 }
-- 
2.25.1


