Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nA3Vl-00072i-9e
	for mharc-qemu-riscv@gnu.org; Wed, 19 Jan 2022 00:27:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1nA3Vj-0006wO-G6; Wed, 19 Jan 2022 00:27:55 -0500
Received: from out28-218.mail.aliyun.com ([115.124.28.218]:59324)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1nA3VZ-0002It-TS; Wed, 19 Jan 2022 00:27:54 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.1372641|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.0508573-0.000449781-0.948693;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047199; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=9; RT=8; SR=0; TI=SMTPD_---.MfC9AbH_1642570060; 
Received: from roman-VirtualBox.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.MfC9AbH_1642570060)
 by smtp.aliyun-inc.com(10.147.40.200);
 Wed, 19 Jan 2022 13:27:41 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 richard.henderson@linaro.org, guoren@linux.alibaba.com,
 LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v7 18/22] target/riscv: Fix check range for first fault only
Date: Wed, 19 Jan 2022 13:18:20 +0800
Message-Id: <20220119051824.17494-19-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220119051824.17494-1-zhiwei_liu@c-sky.com>
References: <20220119051824.17494-1-zhiwei_liu@c-sky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=115.124.28.218; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-218.mail.aliyun.com
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
X-List-Received-Date: Wed, 19 Jan 2022 05:27:56 -0000

Only check the range that has passed the address translation.

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/vector_helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 8b7c9ec890..efb3129532 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -500,12 +500,12 @@ vext_ldff(void *vd, void *v0, target_ulong base,
                                          cpu_mmu_index(env, false));
                 if (host) {
 #ifdef CONFIG_USER_ONLY
-                    if (page_check_range(addr, nf << esz, PAGE_READ) < 0) {
+                    if (page_check_range(addr, offset, PAGE_READ) < 0) {
                         vl = i;
                         goto ProbeSuccess;
                     }
 #else
-                    probe_pages(env, addr, nf << esz, ra, MMU_DATA_LOAD);
+                    probe_pages(env, addr, offset, ra, MMU_DATA_LOAD);
 #endif
                 } else {
                     vl = i;
-- 
2.25.1


