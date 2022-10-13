Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oirlA-0000iC-8Q
	for mharc-qemu-riscv@gnu.org; Thu, 13 Oct 2022 02:32:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1oirkk-0000dr-Aq; Thu, 13 Oct 2022 02:31:36 -0400
Received: from out30-43.freemail.mail.aliyun.com ([115.124.30.43]:51427)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1oirkh-0003dy-7N; Thu, 13 Oct 2022 02:31:34 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R391e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046051;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=11; SR=0;
 TI=SMTPD_---0VS2bBgC_1665642683; 
Received: from
 roman-VirtualBox.hz.ali.com(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VS2bBgC_1665642683) by smtp.aliyun-inc.com;
 Thu, 13 Oct 2022 14:31:24 +0800
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 sergey.matyukevich@syntacore.com, vladimir.isaev@syntacore.com,
 anatoly.parshintsev@syntacore.com, philipp.tomsich@vrull.eu,
 zhiwei_liu@c-sky.com, LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [PATCH v1 3/4] target/riscv: Enable native debug itrigger
Date: Thu, 13 Oct 2022 14:29:45 +0800
Message-Id: <20221013062946.7530-4-zhiwei_liu@linux.alibaba.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221013062946.7530-1-zhiwei_liu@linux.alibaba.com>
References: <20221013062946.7530-1-zhiwei_liu@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.43;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-43.freemail.mail.aliyun.com
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
X-List-Received-Date: Thu, 13 Oct 2022 06:31:37 -0000

When QEMU is not in icount mode, execute instruction one by one. The
tdata1 can be read directly.

When QEMU is in icount mode, use a timer to simulate the itrigger. The
tdata1 may be not right because of lazy update of count in tdata1. Thus,
We should pack the adjusted count into tdata1 before read it back.

Signed-off-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
---
 target/riscv/debug.c | 72 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/target/riscv/debug.c b/target/riscv/debug.c
index 5ff70430a1..db7745d4a3 100644
--- a/target/riscv/debug.c
+++ b/target/riscv/debug.c
@@ -626,10 +626,80 @@ void riscv_itrigger_update_priv(CPURISCVState *env)
     riscv_itrigger_update_count(env);
 }
 
+static target_ulong itrigger_validate(CPURISCVState *env,
+                                      target_ulong ctrl)
+{
+    target_ulong val;
+
+    /* validate the generic part first */
+    val = tdata1_validate(env, ctrl, TRIGGER_TYPE_INST_CNT);
+
+    /* validate unimplemented (always zero) bits */
+    warn_always_zero_bit(ctrl, ITRIGGER_ACTION, "action");
+    warn_always_zero_bit(ctrl, ITRIGGER_HIT, "hit");
+    warn_always_zero_bit(ctrl, ITRIGGER_PENDING, "pending");
+
+    /* keep the mode and attribute bits */
+    val |= ctrl & (ITRIGGER_VU | ITRIGGER_VS | ITRIGGER_U | ITRIGGER_S |
+                   ITRIGGER_M | ITRIGGER_COUNT);
+
+    return val;
+}
+
+static void itrigger_reg_write(CPURISCVState *env, target_ulong index,
+                               int tdata_index, target_ulong val)
+{
+    target_ulong new_val;
+
+    switch (tdata_index) {
+    case TDATA1:
+        /* set timer for icount */
+        new_val = itrigger_validate(env, val);
+        if (new_val != env->tdata1[index]) {
+            env->tdata1[index] = new_val;
+            if (icount_enabled()) {
+                env->last_icount = icount_get_raw();
+                /* set the count to timer */
+                timer_mod(env->itrigger_timer[index],
+                          env->last_icount + itrigger_get_count(env, index));
+            }
+        }
+        break;
+    case TDATA2:
+        qemu_log_mask(LOG_UNIMP,
+                      "tdata2 is not supported for icount trigger\n");
+        break;
+    case TDATA3:
+        qemu_log_mask(LOG_UNIMP,
+                      "tdata3 is not supported for icount trigger\n");
+        break;
+    default:
+        g_assert_not_reached();
+    }
+
+    return;
+}
+
+static int itrigger_get_adjust_count(CPURISCVState *env)
+{
+    int count = itrigger_get_count(env, env->trigger_cur), executed;
+    if ((count != 0) && check_itrigger_priv(env, env->trigger_cur)) {
+        executed = icount_get_raw() - env->last_icount;
+        count += executed;
+    }
+    return count;
+}
+
 target_ulong tdata_csr_read(CPURISCVState *env, int tdata_index)
 {
+    int trigger_type;
     switch (tdata_index) {
     case TDATA1:
+        trigger_type = extract_trigger_type(env, env->tdata1[env->trigger_cur]);
+        if ((trigger_type == TRIGGER_TYPE_INST_CNT) && icount_enabled()) {
+            return deposit64(env->tdata1[env->trigger_cur], 10, 14,
+                             itrigger_get_adjust_count(env));
+        }
         return env->tdata1[env->trigger_cur];
     case TDATA2:
         return env->tdata2[env->trigger_cur];
@@ -658,6 +728,8 @@ void tdata_csr_write(CPURISCVState *env, int tdata_index, target_ulong val)
         type6_reg_write(env, env->trigger_cur, tdata_index, val);
         break;
     case TRIGGER_TYPE_INST_CNT:
+        itrigger_reg_write(env, env->trigger_cur, tdata_index, val);
+        break;
     case TRIGGER_TYPE_INT:
     case TRIGGER_TYPE_EXCP:
     case TRIGGER_TYPE_EXT_SRC:
-- 
2.17.1


