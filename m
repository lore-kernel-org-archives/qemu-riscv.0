Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ks9lz-0002Z9-Fg
	for mharc-qemu-riscv@gnu.org; Wed, 23 Dec 2020 14:26:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=61943049f=atish.patra@wdc.com>)
 id 1ks9ls-0002Y5-O6; Wed, 23 Dec 2020 14:26:06 -0500
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:14003)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=61943049f=atish.patra@wdc.com>)
 id 1ks9ln-0003Iy-T2; Wed, 23 Dec 2020 14:26:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1608751559; x=1640287559;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rgf0670fK3UUJx+iJXjY0Y0fZYzckxK+BriKxQnA4fs=;
 b=TCf0ozZlYshZyMonr3uTLezBFu1cf1CDRY1JmAaXAWzElKRpYc76IAGh
 bqLCWNGLYp4oHLkFRgxBH06HrPIzko1dMy6ZY9LGvaBi2VGEmQ1yDd7e2
 lV7Ky9hAiqap4TAiOOzn+37N7ZQONYgBjfTVE0AZMpBwG8d3wE89gDPpw
 GEXPVs87ELusz13dtWCN3midSyI0s5GCU/v9pgNAXccye3/9ZtXKcYPxX
 PHkCCedeysDy2xUdwEzdq/TXxm0rwRiz41CYWKSGSh3YEiwVmuM0uWMG2
 dgptAKg0HdqWYuSPtdQ18B528F+5/RcxolL1r4AjKfhIVSm6EQQREMpGu Q==;
IronPort-SDR: idrPPvMk0E0h0AWv6TTxM4+20pLXRSgwWBkdfWUX1Cxa0qb8GIUC95d0Wxz9B38D7yuyRYwqpz
 O7NLlmQCznoPsoHcZPBZk0HHNjY+T0W+YgaTV6FYvMmMzOn6doawlN9XvIkjDFKYcZHF4c/RVj
 rf7s2iUFF0WWz1zNP7n4ti8nS5t+qe6L08eZvXTJF5t70AmgfedYAaORozcTEYYoNuVosXSsMq
 elkTq3SQBg+jTzKO5sxixy/2KUHjFeRod/4btDFuia4HRc/gDmvqez6wT7ZkxlfrENZO6urSEf
 Tsw=
X-IronPort-AV: E=Sophos;i="5.78,442,1599494400"; d="scan'208";a="266121597"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 24 Dec 2020 03:25:56 +0800
IronPort-SDR: twyhVDOiIv+6d745PspYIKROl8NlQ/i9n+BA/09zCmo0D3YeSQTY1A7gr3IPunLOzLYUeWcEDK
 Zgo4D6CfG6RU/uv9mISeAu6P6MCwi6NJUqCD5OyEG+F+qvzI7BvLptqKm2eG8+cD9RHxrmddi+
 lxXvjR8Nhqnu8P2bhWBhIUwEN9+QGRlSoirczalZbjCJswiAs0HVOU0JKALPlSEaPUOLKgR/ih
 4IMoLkKCTBZe/ZlVKegymD9PpbX2VAQcBN+QLSVa3yHYfbTkJAHzji3gFZ9VtUzaqYah24YJkw
 SdCcaPQO4svK212A5ZiG5ML7
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2020 11:09:22 -0800
IronPort-SDR: H+Y4x6EKpiN4gj9OGxUNCzfEsBqJYQGOlRtj73592LMs9nnDuz+BhOPZSEmtMu4WZShb1KOUyl
 s4WSyTwdbrv06wt8xRq574s7pQUC4vn2NRxnTiTv2v6AdQ58+NhVDbDU3Yup/g8lHjGPWbJtbd
 //KOkANyZV9V7Jg7IE0HNvr2MO/sbIq/iTlxQPkpAgXz+TPyhrTLgddp0ai4VuwG7yarMtWZU9
 YNosG26IIw4Ce+0ojB6s5wMIqCieY0IfU+n+TsP/xodf9Oj+zlmSgBxpfkNfc/OjzwLZcxzgtU
 w14=
WDCIronportException: Internal
Received: from usa003310.ad.shared (HELO jedi-01.hgst.com) ([10.86.62.100])
 by uls-op-cesaip02.wdc.com with ESMTP; 23 Dec 2020 11:25:56 -0800
From: Atish Patra <atish.patra@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Atish Patra <atish.patra@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Anup Patel <anup.patel@wdc.com>
Subject: [PATCH v2] target/riscv/pmp: Raise exception if no PMP entry is
 configured
Date: Wed, 23 Dec 2020 11:25:53 -0800
Message-Id: <20201223192553.332508-1-atish.patra@wdc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=61943049f=atish.patra@wdc.com; helo=esa1.hgst.iphmx.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Wed, 23 Dec 2020 19:26:08 -0000

As per the privilege specification, any access from S/U mode should fail
if no pmp region is configured.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
Changes from v2->v1
1. Removed the static from the function definition
---
 target/riscv/op_helper.c | 5 +++++
 target/riscv/pmp.c       | 4 ++--
 target/riscv/pmp.h       | 1 +
 3 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
index d55def76cffd..1eddcb94de7e 100644
--- a/target/riscv/op_helper.c
+++ b/target/riscv/op_helper.c
@@ -150,6 +150,11 @@ target_ulong helper_mret(CPURISCVState *env, target_ulong cpu_pc_deb)
 
     uint64_t mstatus = env->mstatus;
     target_ulong prev_priv = get_field(mstatus, MSTATUS_MPP);
+
+    if (!pmp_get_num_rules(env) && (prev_priv != PRV_M)) {
+        riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, GETPC());
+    }
+
     target_ulong prev_virt = get_field(env->mstatus, MSTATUS_MPV);
     mstatus = set_field(mstatus, MSTATUS_MIE,
                         get_field(mstatus, MSTATUS_MPIE));
diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
index 2eda8e1e2f07..80d0334e1bfc 100644
--- a/target/riscv/pmp.c
+++ b/target/riscv/pmp.c
@@ -74,7 +74,7 @@ static inline int pmp_is_locked(CPURISCVState *env, uint32_t pmp_index)
 /*
  * Count the number of active rules.
  */
-static inline uint32_t pmp_get_num_rules(CPURISCVState *env)
+uint32_t pmp_get_num_rules(CPURISCVState *env)
 {
      return env->pmp_state.num_rules;
 }
@@ -237,7 +237,7 @@ bool pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
 
     /* Short cut if no rules */
     if (0 == pmp_get_num_rules(env)) {
-        return true;
+        return (env->priv == PRV_M) ? true : false;
     }
 
     if (size == 0) {
diff --git a/target/riscv/pmp.h b/target/riscv/pmp.h
index 6c6b4c9befe8..c8d5ef4a694e 100644
--- a/target/riscv/pmp.h
+++ b/target/riscv/pmp.h
@@ -64,5 +64,6 @@ bool pmp_is_range_in_tlb(CPURISCVState *env, hwaddr tlb_sa,
                          target_ulong *tlb_size);
 void pmp_update_rule_addr(CPURISCVState *env, uint32_t pmp_index);
 void pmp_update_rule_nums(CPURISCVState *env);
+uint32_t pmp_get_num_rules(CPURISCVState *env);
 
 #endif
-- 
2.25.1


