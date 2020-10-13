Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kSLxL-0002ir-Mo
	for mharc-qemu-riscv@gnu.org; Tue, 13 Oct 2020 11:11:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <georg.kotheimer@kernkonzept.com>)
 id 1kSLxJ-0002hU-Hk; Tue, 13 Oct 2020 11:11:13 -0400
Received: from serv1.kernkonzept.com ([2a01:4f8:1c1c:b490::2]:60959
 helo=mx.kernkonzept.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <georg.kotheimer@kernkonzept.com>)
 id 1kSLxH-0007wy-SU; Tue, 13 Oct 2020 11:11:13 -0400
Received: from [86.56.119.37] (helo=george-laptop.lan)
 by mx.kernkonzept.com with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) id 1kSLxD-0007x6-9D; Tue, 13 Oct 2020 17:11:07 +0200
From: Georg Kotheimer <georg.kotheimer@kernkonzept.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Georg Kotheimer <georg.kotheimer@kernkonzept.com>
Subject: [PATCH] target/riscv: Fix update of hstatus.SPVP
Date: Tue, 13 Oct 2020 17:10:54 +0200
Message-Id: <20201013151054.396481-1-georg.kotheimer@kernkonzept.com>
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
X-List-Received-Date: Tue, 13 Oct 2020 15:11:13 -0000

When trapping from virt into HS mode, hstatus.SPVP was set to
the value of sstatus.SPP, as according to the specification both
flags should be set to the same value.
However, the assignment of SPVP takes place before SPP itself is
updated, which results in SPVP having an outdated value.

Signed-off-by: Georg Kotheimer <georg.kotheimer@kernkonzept.com>
---
 target/riscv/cpu_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 904899054d..1d7d10377d 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -932,7 +932,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
                 /* Trap into HS mode, from virt */
                 riscv_cpu_swap_hypervisor_regs(env);
                 env->hstatus = set_field(env->hstatus, HSTATUS_SPVP,
-                                         get_field(env->mstatus, SSTATUS_SPP));
+                                         env->priv);
                 env->hstatus = set_field(env->hstatus, HSTATUS_SPV,
                                          riscv_cpu_virt_enabled(env));
 
-- 
2.25.1


