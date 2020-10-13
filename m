Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kSO0X-0007HS-10
	for mharc-qemu-riscv@gnu.org; Tue, 13 Oct 2020 13:22:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <georg.kotheimer@kernkonzept.com>)
 id 1kSO0V-0007G1-Jr; Tue, 13 Oct 2020 13:22:39 -0400
Received: from serv1.kernkonzept.com ([2a01:4f8:1c1c:b490::2]:42221
 helo=mx.kernkonzept.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <georg.kotheimer@kernkonzept.com>)
 id 1kSO0T-0001LA-T9; Tue, 13 Oct 2020 13:22:39 -0400
Received: from [86.56.119.37] (helo=george-laptop.lan)
 by mx.kernkonzept.com with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) id 1kSO0Q-0000MC-Ek; Tue, 13 Oct 2020 19:22:34 +0200
From: Georg Kotheimer <georg.kotheimer@kernkonzept.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Georg Kotheimer <georg.kotheimer@kernkonzept.com>
Subject: [PATCH] target/riscv: Fix implementation of HLVX.WU instruction
Date: Tue, 13 Oct 2020 19:22:23 +0200
Message-Id: <20201013172223.443645-1-georg.kotheimer@kernkonzept.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: softfail client-ip=2a01:4f8:1c1c:b490::2;
 envelope-from=georg.kotheimer@kernkonzept.com; helo=mx.kernkonzept.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -7
X-Spam_score: -0.8
X-Spam_bar: /
X-Spam_report: (-0.8 / 5.0 requ) BAYES_00=-1.9, KHOP_HELO_FCRDNS=0.4,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
X-List-Received-Date: Tue, 13 Oct 2020 17:22:40 -0000

The HLVX.WU instruction is supposed to read a machine word,
but prior to this change it read a byte instead.

Signed-off-by: Georg Kotheimer <georg.kotheimer@kernkonzept.com>
---
 target/riscv/op_helper.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
index 9b9ada45a9..3b7bd6ee88 100644
--- a/target/riscv/op_helper.c
+++ b/target/riscv/op_helper.c
@@ -334,12 +334,12 @@ target_ulong helper_hyp_x_load(CPURISCVState *env, target_ulong address,
         riscv_cpu_set_two_stage_lookup(env, true);
 
         switch (memop) {
-        case MO_TEUL:
-            pte = cpu_ldub_data_ra(env, address, GETPC());
-            break;
         case MO_TEUW:
             pte = cpu_lduw_data_ra(env, address, GETPC());
             break;
+        case MO_TEUL:
+            pte = cpu_ldl_data_ra(env, address, GETPC());
+            break;
         default:
             g_assert_not_reached();
         }
-- 
2.25.1


