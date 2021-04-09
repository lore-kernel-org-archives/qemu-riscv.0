Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lUqA6-0000ou-0f
	for mharc-qemu-riscv@gnu.org; Fri, 09 Apr 2021 08:22:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=726c96411=alistair.francis@wdc.com>)
 id 1lUq9o-0000jZ-Ns; Fri, 09 Apr 2021 08:22:41 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:60740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=726c96411=alistair.francis@wdc.com>)
 id 1lUq9j-0000sV-ES; Fri, 09 Apr 2021 08:22:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1617970955; x=1649506955;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XMpWji7VLRiH7hFzuP+S4zuKmFdTXmWKPHOjZfDOFMU=;
 b=Ps9OwVHTU1vgxDxv0ktl2ufrcfoD5ayZ3ZQRuUFeQttjqLBS9kvhG8LW
 Ief25KguXUlnsdjSWwz3q1bqH9Bshz5ivOhezxtZjDqB8hy1MzM7RZ+8H
 WIOJQLpQODfkfLMNG2rRyaTkMDrAFdadEqIMNC3P1Mx7sXh63SzdgYB87
 lMZBf6km9a/nBsFLAWZectlnt9xXRFnSE7NhNFxitKeEHqQfXMnx8AWux
 lDUO3JMsaHPM/eotwmVbr4X6qV1w7wzl7UgboHGYkVxq1aWoBELtyUpEh
 ExdjbbzK69dr+/0SKUD1sMxq5VPr9AzpvS09WCD28S5mOwXY2ix123kj9 w==;
IronPort-SDR: sKEMKZYFNqcRmSIGVy+WQXh8+ip7/iPdDvu+uJLgHJNy0uArRx6wYCbXjddtLz2YyTp3oxd9B7
 BSi2HIvNnlVx1wyfgsgugqCwSa0Djuqnntt8kwW2QvjUkzdUTjodgVS231/OgF8ca/ipKW98FX
 2sPFsm+9Yu/ijiamAIyiJr99qcRR2I829TNqZXamxgjq4wj+Cl95BLglLWM4Jt2RrQ6iSAg+wQ
 vNJJKChlcgzQ6uicOnvX6ffuggOQ4HFqBgrF9xC4CJrTwD8klRqbizxSdhhegVC+As51rDIG4S
 lTs=
X-IronPort-AV: E=Sophos;i="5.82,209,1613404800"; d="scan'208";a="168803621"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 09 Apr 2021 20:22:34 +0800
IronPort-SDR: cFrr6/dj3IbJuRolSUe4Oefa4QHdK++JxZkywBZSe3iVR8rObZqtb/10D+5gpfBBOW9OkpIqPh
 ShUyp/p0uVvOOpeaoxFZRvyZVe2/2wA9X4HB94+1bmPCg16s4Ot3oo0las1LNsayqCHtnScVOm
 iIsjPghEOSPqj0+WbRi3OvL8QQk5WB0ywF7IEn85gulXev43zW5pIjUKISHMzTnPF3cDN+nEia
 X17bLynhuTrcY45h6Ymw6bmHU7JcSCkEiBFzQivjgXbsf66Sl/mN+lFcr5YEp5EbEUPQtu6N/b
 98D7BaU23zPQ9w24w5KCL8Al
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2021 05:02:09 -0700
IronPort-SDR: olGKs3GSl6JTs6YNn7ZPUMOz7aHx4pstA9Eye+vHu1Zke+8rC3a2AZwF0sTG4pkSIHtiqLhW1H
 465F9iNMv4cAbz4wITjacwEH3Tcgb5/RcCJpMlnSJ1Ulgq+Oip41J+7iTNr6E2/Ih0TRSpe9YJ
 UrVBibqNXpqlTt60CQQHOY8VX3SZZc0+LiYNbLrm6YwXHfjLcslmJZLTxx3kLfeRizXsgRKXWs
 z3JIY2Bg/xoXFVqNaHWMsIev3CpAXSlKwZ92+rMhkH1DTNKz+ppMIvP0ZTuAc4baDOpHYcfj9H
 BeY=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.167.98])
 by uls-op-cesaip02.wdc.com with ESMTP; 09 Apr 2021 05:22:33 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v2 5/8] target/riscv: Implementation of enhanced PMP (ePMP)
Date: Fri,  9 Apr 2021 08:20:32 -0400
Message-Id: <3f4a8b1fa0cd5deed00beb585010d6b1cc59efb6.1617970729.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <cover.1617970729.git.alistair.francis@wdc.com>
References: <cover.1617970729.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=726c96411=alistair.francis@wdc.com;
 helo=esa3.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 09 Apr 2021 12:22:43 -0000

From: Hou Weiying <weiying_hou@outlook.com>

This commit adds support for ePMP v0.9.1.

The ePMP spec can be found in:
https://docs.google.com/document/d/1Mh_aiHYxemL0umN3GTTw8vsbmzHZ_nxZXgjgOUzbvc8

Signed-off-by: Hongzheng-Li <Ethan.Lee.QNL@gmail.com>
Signed-off-by: Hou Weiying <weiying_hou@outlook.com>
Signed-off-by: Myriad-Dreamin <camiyoru@gmail.com>
Message-Id: <SG2PR02MB263462CCDBCBBAD36983C2CD93450@SG2PR02MB2634.apcprd02.prod.outlook.com>
[ Changes by AF:
 - Rebase on master
 - Update to latest spec
 - Use a switch case to handle ePMP MML permissions
 - Fix a few bugs
]
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/pmp.c | 165 +++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 153 insertions(+), 12 deletions(-)

diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
index e35988eec2..cd44d81eba 100644
--- a/target/riscv/pmp.c
+++ b/target/riscv/pmp.c
@@ -90,11 +90,42 @@ static inline uint8_t pmp_read_cfg(CPURISCVState *env, uint32_t pmp_index)
 static void pmp_write_cfg(CPURISCVState *env, uint32_t pmp_index, uint8_t val)
 {
     if (pmp_index < MAX_RISCV_PMPS) {
-        if (!pmp_is_locked(env, pmp_index)) {
-            env->pmp_state.pmp[pmp_index].cfg_reg = val;
-            pmp_update_rule(env, pmp_index);
+        bool locked = true;
+
+        if (riscv_feature(env, RISCV_FEATURE_EPMP)) {
+            /* mseccfg.RLB is set */
+            if (MSECCFG_RLB_ISSET(env)) {
+                locked = false;
+            }
+
+            /* mseccfg.MML is not set */
+            if (!MSECCFG_MML_ISSET(env) && !pmp_is_locked(env, pmp_index)) {
+                locked = false;
+            }
+
+            /* mseccfg.MML is set */
+            if (MSECCFG_MML_ISSET(env)) {
+                /* not adding execute bit */
+                if ((val & PMP_LOCK) != 0 && (val & PMP_EXEC) != PMP_EXEC) {
+                    locked = false;
+                }
+                 /* shared region and not adding X bit*/
+                if ((val & PMP_LOCK) != PMP_LOCK &&
+                    (val & 0x7) != (PMP_WRITE | PMP_EXEC)) {
+                    locked = false;
+                }
+            }
         } else {
+            if (!pmp_is_locked(env, pmp_index)) {
+                locked = false;
+            }
+        }
+
+        if (locked) {
             qemu_log_mask(LOG_GUEST_ERROR, "ignoring pmpcfg write - locked\n");
+        } else {
+            env->pmp_state.pmp[pmp_index].cfg_reg = val;
+            pmp_update_rule(env, pmp_index);
         }
     } else {
         qemu_log_mask(LOG_GUEST_ERROR,
@@ -217,6 +248,33 @@ static bool pmp_hart_has_privs_default(CPURISCVState *env, target_ulong addr,
 {
     bool ret;
 
+    if (riscv_feature(env, RISCV_FEATURE_EPMP)) {
+        if (MSECCFG_MMWP_ISSET(env)) {
+            /*
+             * The Machine Mode Whitelist Policy (mseccfg.MMWP) is set
+             * so we default to deny all, even for M mode.
+             */
+            *allowed_privs = 0;
+            return false;
+        } else if (MSECCFG_MML_ISSET(env)) {
+            /*
+             * The Machine Mode Lockdown (mseccfg.MML) bit is set
+             * so we can only execute code in M mode with an applicable
+             * rule.
+             * Other modes are disabled.
+             */
+            if (mode == PRV_M && !(privs & PMP_EXEC)) {
+                ret = true;
+                *allowed_privs = PMP_READ | PMP_WRITE;
+            } else {
+                ret = false;
+                *allowed_privs = 0;
+            }
+
+            return ret;
+        }
+    }
+
     if ((!riscv_feature(env, RISCV_FEATURE_PMP)) || (mode == PRV_M)) {
         /*
          * Privileged spec v1.10 states if HW doesn't implement any PMP entry
@@ -294,13 +352,94 @@ bool pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
             pmp_get_a_field(env->pmp_state.pmp[i].cfg_reg);
 
         /*
-         * If the PMP entry is not off and the address is in range, do the priv
-         * check
+         * Convert the PMP permissions to match the truth table in the
+         * ePMP spec.
          */
+        const uint8_t epmp_operation =
+            ((env->pmp_state.pmp[i].cfg_reg & PMP_LOCK) >> 4) |
+            ((env->pmp_state.pmp[i].cfg_reg & PMP_READ) << 2) |
+            (env->pmp_state.pmp[i].cfg_reg & PMP_WRITE) |
+            ((env->pmp_state.pmp[i].cfg_reg & PMP_EXEC) >> 2);
+
         if (((s + e) == 2) && (PMP_AMATCH_OFF != a_field)) {
-            *allowed_privs = PMP_READ | PMP_WRITE | PMP_EXEC;
-            if ((mode != PRV_M) || pmp_is_locked(env, i)) {
-                *allowed_privs &= env->pmp_state.pmp[i].cfg_reg;
+            /*
+             * If the PMP entry is not off and the address is in range,
+             * do the priv check
+             */
+            if (!MSECCFG_MML_ISSET(env)) {
+                /*
+                 * If mseccfg.MML Bit is not set, do pmp priv check
+                 * This will always apply to regular PMP.
+                 */
+                *allowed_privs = PMP_READ | PMP_WRITE | PMP_EXEC;
+                if ((mode != PRV_M) || pmp_is_locked(env, i)) {
+                    *allowed_privs &= env->pmp_state.pmp[i].cfg_reg;
+                }
+            } else {
+                /*
+                 * If mseccfg.MML Bit set, do the enhanced pmp priv check
+                 */
+                if (mode == PRV_M) {
+                    switch (epmp_operation) {
+                    case 0:
+                    case 1:
+                    case 4:
+                    case 5:
+                    case 6:
+                    case 7:
+                    case 8:
+                        *allowed_privs = 0;
+                        break;
+                    case 2:
+                    case 3:
+                    case 14:
+                        *allowed_privs = PMP_READ | PMP_WRITE;
+                        break;
+                    case 9:
+                    case 10:
+                        *allowed_privs = PMP_EXEC;
+                        break;
+                    case 11:
+                    case 13:
+                        *allowed_privs = PMP_READ | PMP_EXEC;
+                        break;
+                    case 12:
+                    case 15:
+                        *allowed_privs = PMP_READ;
+                        break;
+                    }
+                } else {
+                    switch (epmp_operation) {
+                    case 0:
+                    case 8:
+                    case 9:
+                    case 12:
+                    case 13:
+                    case 14:
+                        *allowed_privs = 0;
+                        break;
+                    case 1:
+                    case 10:
+                    case 11:
+                        *allowed_privs = PMP_EXEC;
+                        break;
+                    case 2:
+                    case 4:
+                    case 15:
+                        *allowed_privs = PMP_READ;
+                        break;
+                    case 3:
+                    case 6:
+                        *allowed_privs = PMP_READ | PMP_WRITE;
+                        break;
+                    case 5:
+                        *allowed_privs = PMP_READ | PMP_EXEC;
+                        break;
+                    case 7:
+                        *allowed_privs = PMP_READ | PMP_WRITE | PMP_EXEC;
+                        break;
+                    }
+                }
             }
 
             ret = ((privs & *allowed_privs) == privs);
@@ -328,10 +467,12 @@ void pmpcfg_csr_write(CPURISCVState *env, uint32_t reg_index,
 
     trace_pmpcfg_csr_write(env->mhartid, reg_index, val);
 
-    if ((reg_index & 1) && (sizeof(target_ulong) == 8)) {
-        qemu_log_mask(LOG_GUEST_ERROR,
-                      "ignoring pmpcfg write - incorrect address\n");
-        return;
+    if (!riscv_feature(env, RISCV_FEATURE_EPMP) || !MSECCFG_RLB_ISSET(env)) {
+        if ((reg_index & 1) && (sizeof(target_ulong) == 8)) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "ignoring pmpcfg write - incorrect address\n");
+            return;
+        }
     }
 
     for (i = 0; i < sizeof(target_ulong); i++) {
-- 
2.31.0


