Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mJdll-0002EM-Nx
	for mharc-qemu-riscv@gnu.org; Fri, 27 Aug 2021 11:27:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@salt-inc.org>)
 id 1mJdlk-0002DR-2G; Fri, 27 Aug 2021 11:27:48 -0400
Received: from mail.salt-inc.org ([104.244.79.104]:59481 helo=vm0.salt-inc.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@salt-inc.org>)
 id 1mJdlh-0000JG-V6; Fri, 27 Aug 2021 11:27:47 -0400
Received: from pc1 (92.229-132-109.adsl-dyn.isp.belgacom.be [109.132.229.92])
 by vm0.salt-inc.org (Postfix) with ESMTPSA id CF928FEE09;
 Fri, 27 Aug 2021 05:26:39 +0200 (CEST)
Received: from david by pc1 with local (Exim 4.92) (envelope-from <david@pc1>)
 id 1mJdke-00024Z-C4; Fri, 27 Aug 2021 17:26:40 +0200
From: David Hoppenbrouwers <david@salt-inc.org>
To: qemu-devel@nongnu.org
Cc: David Hoppenbrouwers <david@salt-inc.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org (open list:SiFive Machines)
Subject: [PATCH v4] hw/intc/sifive_clint: Fix muldiv64 overflow in
 sifive_clint_write_timecmp()
Date: Fri, 27 Aug 2021 17:23:25 +0200
Message-Id: <20210827152324.5201-1-david@salt-inc.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=104.244.79.104; envelope-from=david@salt-inc.org;
 helo=vm0.salt-inc.org
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Fri, 27 Aug 2021 15:27:48 -0000

`muldiv64` would overflow in cases where the final 96-bit value does not
fit in a `uint64_t`. This would result in small values that cause an
interrupt to be triggered much sooner than intended.

The overflow can be detected in most cases by checking if the new value is
smaller than the previous value. If the final result is larger than
`diff` it is either correct or it doesn't matter as it is effectively
infinite anyways.

`next` is an `uint64_t` value, but `timer_mod` takes an `int64_t`. This
resulted in high values such as `UINT64_MAX` being converted to `-1`,
which caused an immediate timer interrupt.

By limiting `next` to `INT64_MAX` no overflow will happen while the
timer will still be effectively set to "infinitely" far in the future.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/493
Signed-off-by: David Hoppenbrouwers <david@salt-inc.org>
---
I addressed the potential signed integer overflow if `ns_diff` is
`INT64_MAX`. An unsigned integer overflow still should not be able to
happen practically.

David

 hw/intc/sifive_clint.c | 25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/hw/intc/sifive_clint.c b/hw/intc/sifive_clint.c
index 0f41e5ea1c..99c870ced2 100644
--- a/hw/intc/sifive_clint.c
+++ b/hw/intc/sifive_clint.c
@@ -59,8 +59,29 @@ static void sifive_clint_write_timecmp(RISCVCPU *cpu, uint64_t value,
     riscv_cpu_update_mip(cpu, MIP_MTIP, BOOL_TO_MASK(0));
     diff = cpu->env.timecmp - rtc_r;
     /* back to ns (note args switched in muldiv64) */
-    next = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
-        muldiv64(diff, NANOSECONDS_PER_SECOND, timebase_freq);
+    uint64_t ns_diff = muldiv64(diff, NANOSECONDS_PER_SECOND, timebase_freq);
+
+    /*
+     * check if ns_diff overflowed and check if the addition would potentially
+     * overflow
+     */
+    if ((NANOSECONDS_PER_SECOND > timebase_freq && ns_diff < diff) ||
+        ns_diff > INT64_MAX) {
+        next = INT64_MAX;
+    } else {
+        /*
+         * as it is very unlikely qemu_clock_get_ns will return a value
+         * greater than INT64_MAX, no additional check is needed for an
+         * unsigned integer overflow.
+         */
+        next = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + ns_diff;
+        /*
+         * if ns_diff is INT64_MAX next may still be outside the range
+         * of a signed integer.
+         */
+        next = MIN(next, INT64_MAX);
+    }
+
     timer_mod(cpu->env.timer, next);
 }
 
-- 
2.20.1


