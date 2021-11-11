Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ml3G8-0002xj-4F
	for mharc-qemu-riscv@gnu.org; Thu, 11 Nov 2021 01:08:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1ml3G6-0002ti-Kt; Thu, 11 Nov 2021 01:08:26 -0500
Received: from out28-101.mail.aliyun.com ([115.124.28.101]:46462)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1ml3G3-0004NU-P4; Thu, 11 Nov 2021 01:08:26 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.4542212|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.0476513-0.00068219-0.951667;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047192; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=7; RT=7; SR=0; TI=SMTPD_---.Lr211Ee_1636610895; 
Received: from roman-VirtualBox.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.Lr211Ee_1636610895)
 by smtp.aliyun-inc.com(10.147.42.241);
 Thu, 11 Nov 2021 14:08:15 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 richard.henderson@linaro.org, LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v3 20/20] target/riscv: Enable uxl field write
Date: Thu, 11 Nov 2021 13:58:00 +0800
Message-Id: <20211111055800.42672-21-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211111055800.42672-1-zhiwei_liu@c-sky.com>
References: <20211111055800.42672-1-zhiwei_liu@c-sky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=115.124.28.101; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-101.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Thu, 11 Nov 2021 06:08:27 -0000

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 target/riscv/csr.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 8f8f170768..43eaa6c710 100644
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
 
-- 
2.25.1


