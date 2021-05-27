Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lmBtL-0005os-1V
	for mharc-qemu-riscv@gnu.org; Thu, 27 May 2021 05:01:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lmBtI-0005nO-I5; Thu, 27 May 2021 05:01:20 -0400
Received: from out28-53.mail.aliyun.com ([115.124.28.53]:46155)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lmBtF-0006sX-FO; Thu, 27 May 2021 05:01:20 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07481217|-1; CH=green;
 DM=|CONTINUE|false|; DS=CONTINUE|ham_alarm|0.117662-0.000361685-0.881976;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047203; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=7; RT=7; SR=0; TI=SMTPD_---.KJUGf1T_1622106065; 
Received: from localhost.localdomain(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.KJUGf1T_1622106065)
 by smtp.aliyun-inc.com(10.147.41.178);
 Thu, 27 May 2021 17:01:05 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: richard.henderson@linaro.org, Alistair.Francis@wdc.com, palmer@dabbelt.com,
 bin.meng@windriver.com, LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH 1/1] target/riscv: Fix vsip vsie CSR ops in M and HS mode
Date: Thu, 27 May 2021 17:00:51 +0800
Message-Id: <20210527090051.1837256-1-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=115.124.28.53; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-53.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 27 May 2021 09:01:20 -0000

When V=1, instructions that normally read or modify a supervisor CSR
shall instead access the corresponding VS CSR. And the VS CSRs can be
accessed as themselves from M-mode or HS-mode.

In M and HS mode, VSIP or VSIE should be written normally instead of
shift by 1.

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 target/riscv/csr.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index fe5628fea6..0cce474d3d 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -837,16 +837,16 @@ static RISCVException read_sie(CPURISCVState *env, int csrno,
 static RISCVException write_vsie(CPURISCVState *env, int csrno,
                                  target_ulong val)
 {
-    /* Shift the S bits to their VS bit location in mie */
     target_ulong newval = (env->mie & ~VS_MODE_INTERRUPTS) |
-                          ((val << 1) & env->hideleg & VS_MODE_INTERRUPTS);
+                          (val & env->hideleg & VS_MODE_INTERRUPTS);
     return write_mie(env, CSR_MIE, newval);
 }
 
 static int write_sie(CPURISCVState *env, int csrno, target_ulong val)
 {
     if (riscv_cpu_virt_enabled(env)) {
-        write_vsie(env, CSR_VSIE, val);
+        /* Shift the S bits to their VS bit location in mie */
+        write_vsie(env, CSR_VSIE, val << 1);
     } else {
         target_ulong newval = (env->mie & ~S_MODE_INTERRUPTS) |
                               (val & S_MODE_INTERRUPTS);
@@ -950,12 +950,9 @@ static RISCVException rmw_vsip(CPURISCVState *env, int csrno,
                                target_ulong *ret_value,
                                target_ulong new_value, target_ulong write_mask)
 {
-    /* Shift the S bits to their VS bit location in mip */
-    int ret = rmw_mip(env, 0, ret_value, new_value << 1,
-                      (write_mask << 1) & vsip_writable_mask & env->hideleg);
+    int ret = rmw_mip(env, 0, ret_value, new_value,
+                      write_mask & vsip_writable_mask & env->hideleg);
     *ret_value &= VS_MODE_INTERRUPTS;
-    /* Shift the VS bits to their S bit location in vsip */
-    *ret_value >>= 1;
     return ret;
 }
 
@@ -966,7 +963,11 @@ static RISCVException rmw_sip(CPURISCVState *env, int csrno,
     int ret;
 
     if (riscv_cpu_virt_enabled(env)) {
-        ret = rmw_vsip(env, CSR_VSIP, ret_value, new_value, write_mask);
+        /* Shift the S bits to their VS bit location in mip */
+        ret = rmw_vsip(env, CSR_VSIP, ret_value, new_value << 1,
+                       write_mask << 1);
+        /* Shift the VS bits to their S bit location in vsip */
+        *ret_value >>= 1;
     } else {
         ret = rmw_mip(env, CSR_MSTATUS, ret_value, new_value,
                       write_mask & env->mideleg & sip_writable_mask);
-- 
2.25.1


