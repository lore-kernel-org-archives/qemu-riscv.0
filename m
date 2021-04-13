Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lW90p-0006jL-Jy
	for mharc-qemu-riscv@gnu.org; Mon, 12 Apr 2021 22:42:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=730c0c5bd=alistair.francis@wdc.com>)
 id 1lW90o-0006gy-4e; Mon, 12 Apr 2021 22:42:46 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:43522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=730c0c5bd=alistair.francis@wdc.com>)
 id 1lW90l-0008FY-PO; Mon, 12 Apr 2021 22:42:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1618281763; x=1649817763;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Xl1m/1iKNeJ0A7+JnK6xpXTeZOowjbzrcn2KLoPCgTA=;
 b=eVuLTDOE4pxn6QOskLR9JwZ5tG7lOOC3sUVlqkSmZVM6xZcXE1zOKgPE
 zOGDw3MuEhYvFC58c9nEj81CBNygDeFG6ocWDC9uUCPXpu873YqG+xVQM
 wJDnEXdEM6LkfljyHWxq/9spwu/jhN+Bde6bzZOOIvk6y9T9uCJs/vpTi
 kqBvwtQBd4thZqydLDZekhHMF3i0zdPIclEdnc7c5VbpieA08NTwEy37D
 xMCM2H48Gqzebv1OZHDI/EPbm9ue1rtiQayVMDh71w/vOTOSkZRKxW17o
 NO7i1POzfGL/an+P3+ajeJ6Deqn55mWNTxUdbcROmCdXUHB+I2bNmS09i A==;
IronPort-SDR: ZqXXCfSDyVdv2tJQ/TukklBeyIywjv26MqCVljZeEzOoR9dcpYApyB7o/dBsmTz5eJoGeBUJda
 RePCAg4X56CbLS8MxpB89BvmLBTh4XP4Qwf6AcLWuk3oDf52k0dvJ6DgZducL4yd95uJvzjgcD
 hfkMunxGJHnk/jKE/LG3ecZnzg2fahYPodA+b3YGzcqtLT/jnq88tphO4JjlkQsW9p4/bvZeID
 tlwiivjQC9uw9Pn/nczXS3NK8mCDz2MQv6nsF59hn3k5i+UcEZM0Vlcahi9blQ8kKQULSiYQko
 N/0=
X-IronPort-AV: E=Sophos;i="5.82,216,1613404800"; d="scan'208";a="169070147"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 13 Apr 2021 10:42:41 +0800
IronPort-SDR: pofKK9fHLjW6Ff9cZCse/SvWaZaRGRrqvmIn8iPumDlEnfSvsXN8c928jOCSVsIwgZPxP1E24U
 o4nZEdw3SxzJxw9r13i6xHanmwe4J9IrHnWihi2jLiWx42mrELplLM33TFhzbpIGsHElGf85+C
 haK/jo8WgDd02G0hV5uHwrHAQQWcgWnlrIaMFIxApgMhxLzl5UUZe4r22nIK9beQju0OFWbgbG
 jwShZXzX2+6Ru/gqFxbU4c4IR/9dwzyFJevHKcQMpeHSzdZGmWlP60mztInl73AE2Sn7jrE8HZ
 5WEBSZ3LkN/3G+K4+s/MhtgX
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2021 19:22:09 -0700
IronPort-SDR: UxvY0BrZRNRz4cK1JNGqCePoUhcnpULGeH7MBrc4fXYdlSPaA82eozyyYLhXwmCVw0qspritqv
 BAIhACNgFiixfQxRUjd+rePDoZZYEpU3PS7HpJWQDOa76o3ofpYefITPnITaR7wRLnsK7konPO
 Pf1WTs61uLOQtVdvLkpRdfgiJtlrXm96rKikMnum30wiwy18+M0jLOqE82hK8eyYKgFcxvQrcb
 07ipl6zhU/RIJASqwrS45c1e130fhQ1fTgfINtcJCrZzV/kBedhwvSSB3gAC6JSyMUyOrCwqHF
 txw=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.16])
 by uls-op-cesaip02.wdc.com with ESMTP; 12 Apr 2021 19:42:39 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v3 5/8] target/riscv: Implementation of enhanced PMP (ePMP)
Date: Tue, 13 Apr 2021 12:42:32 +1000
Message-Id: <616cef68b75ec06b77847203efaca16f7efaaf18.1618281655.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1618281655.git.alistair.francis@wdc.com>
References: <cover.1618281655.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=730c0c5bd=alistair.francis@wdc.com;
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
X-List-Received-Date: Tue, 13 Apr 2021 02:42:46 -0000

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
 target/riscv/pmp.c | 164 +++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 152 insertions(+), 12 deletions(-)

diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
index e35988eec2..00f91d074f 100644
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
+                /* shared region and not adding X bit */
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
@@ -217,6 +248,32 @@ static bool pmp_hart_has_privs_default(CPURISCVState *env, target_ulong addr,
 {
     bool ret;
 
+    if (riscv_feature(env, RISCV_FEATURE_EPMP)) {
+        if (MSECCFG_MMWP_ISSET(env)) {
+            /*
+             * The Machine Mode Whitelist Policy (mseccfg.MMWP) is set
+             * so we default to deny all, even for M-mode.
+             */
+            *allowed_privs = 0;
+            return false;
+        } else if (MSECCFG_MML_ISSET(env)) {
+            /*
+             * The Machine Mode Lockdown (mseccfg.MML) bit is set
+             * so we can only execute code in M-mode with an applicable
+             * rule. Other modes are disabled.
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
@@ -294,13 +351,94 @@ bool pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
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
@@ -328,10 +466,12 @@ void pmpcfg_csr_write(CPURISCVState *env, uint32_t reg_index,
 
     trace_pmpcfg_csr_write(env->mhartid, reg_index, val);
 
-    if ((reg_index & 1) && (sizeof(target_ulong) == 8)) {
-        qemu_log_mask(LOG_GUEST_ERROR,
-                      "ignoring pmpcfg write - incorrect address\n");
-        return;
+    if (!riscv_feature(env, RISCV_FEATURE_EPMP) || !MSECCFG_RLB_ISSET(env)) {
+        if ((reg_index & 1) && (sizeof(target_ulong) == 8)) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "ignoring pmpcfg write - PMP config is locked\n");
+            return;
+        }
     }
 
     for (i = 0; i < sizeof(target_ulong); i++) {
-- 
2.31.1


