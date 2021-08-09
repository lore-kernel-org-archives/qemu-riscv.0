Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mD2er-0005Ye-QO
	for mharc-qemu-riscv@gnu.org; Mon, 09 Aug 2021 06:37:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mD2eq-0005YL-3t; Mon, 09 Aug 2021 06:37:24 -0400
Received: from out28-123.mail.aliyun.com ([115.124.28.123]:36707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mD2en-0003CK-9L; Mon, 09 Aug 2021 06:37:23 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.08955584|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.0379594-0.000292738-0.961748;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047212; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=6; RT=6; SR=0; TI=SMTPD_---.KxSUt0e_1628505431; 
Received: from roman-VirtualBox.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.KxSUt0e_1628505431) by smtp.aliyun-inc.com(10.147.40.7);
 Mon, 09 Aug 2021 18:37:12 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH] target/riscv: Add User CSRs read-only check
Date: Mon,  9 Aug 2021 18:32:33 +0800
Message-Id: <20210809103233.405-1-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: none client-ip=115.124.28.123; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-123.mail.aliyun.com
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
X-List-Received-Date: Mon, 09 Aug 2021 10:37:24 -0000

For U-mode CSRs, read-only check is also needed.

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 target/riscv/csr.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 9a4ed18ac5..360e4bfa33 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1422,11 +1422,11 @@ RISCVException riscv_csrrw(CPURISCVState *env, int csrno,
     RISCVException ret;
     target_ulong old_value;
     RISCVCPU *cpu = env_archcpu(env);
+    int read_only = get_field(csrno, 0xC00) == 3;
 
     /* check privileges and return -1 if check fails */
 #if !defined(CONFIG_USER_ONLY)
     int effective_priv = env->priv;
-    int read_only = get_field(csrno, 0xC00) == 3;
 
     if (riscv_has_ext(env, RVH) &&
         env->priv == PRV_S &&
@@ -1439,11 +1439,13 @@ RISCVException riscv_csrrw(CPURISCVState *env, int csrno,
         effective_priv++;
     }
 
-    if ((write_mask && read_only) ||
-        (!env->debugger && (effective_priv < get_field(csrno, 0x300)))) {
+    if (!env->debugger && (effective_priv < get_field(csrno, 0x300))) {
         return RISCV_EXCP_ILLEGAL_INST;
     }
 #endif
+    if (write_mask && read_only) {
+        return -RISCV_EXCP_ILLEGAL_INST;
+    }
 
     /* ensure the CSR extension is enabled. */
     if (!cpu->cfg.ext_icsr) {
-- 
2.17.1


