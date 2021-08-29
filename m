Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mKAXz-0006Tp-LU
	for mharc-qemu-riscv@gnu.org; Sat, 28 Aug 2021 22:27:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <s101062801@m101.nthu.edu.tw>)
 id 1mKAXx-0006TL-MG; Sat, 28 Aug 2021 22:27:45 -0400
Received: from smtp63-1.net.nthu.edu.tw ([140.114.63.55]:61217)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <s101062801@m101.nthu.edu.tw>)
 id 1mKAXt-0000yN-5r; Sat, 28 Aug 2021 22:27:44 -0400
Received: from m101-mail.nthu.edu.tw (m101-mail-2.nthu.edu.tw [140.114.62.15])
 by smtp63-1.net.nthu.edu.tw (Postfix) with ESMTP id CE8C91B2B6;
 Sun, 29 Aug 2021 10:27:32 +0800 (CST)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Sun, 29 Aug 2021 10:27:32 +0800
From: s101062801 <s101062801@m101.nthu.edu.tw>
To: Alistair Francis <Alistair.Francis@wdc.com>, Bin Meng
 <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v2] hw/intc/sifive_clint: Fix expiration time logic
In-Reply-To: <e7340f10bfbab7bead0a045aa9ae09f7@m101.nthu.edu.tw>
References: mid:9 <aa466b05545e360b9a96249a659c5d1e@m101.nthu.edu.tw>
 <e7340f10bfbab7bead0a045aa9ae09f7@m101.nthu.edu.tw>
User-Agent: Roundcube Webmail/1.4.2
Message-ID: <113c061817fc2caa934930182da7ab63@m101.nthu.edu.tw>
X-Sender: s101062801@m101.nthu.edu.tw
Received-SPF: pass client-ip=140.114.63.55;
 envelope-from=s101062801@m101.nthu.edu.tw; helo=smtp63-1.net.nthu.edu.tw
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Sun, 29 Aug 2021 02:27:46 -0000

After timecmp is modified, the value is converted into nanosecond,
and pass to timer_mod.  However, timer_mod perceives the value as
a signed integer.  An example that goes wrong is as follows:

OpenSBI v0.9 initializes the cold boot hart's timecmp to
0xffffffff_ffffffff.  timer_mod then interprets the product of the
following calculation as a negative value.  As a result, the clint
timer is pulled out of timerlist because it looks like it has
expired, which cause the MIP.MTIP is set before any real timer
interrupt.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/493
Signed-off-by: Quey-Liang Kao <s101062801@m101.nthu.edu.tw>
---
v2:
  - Fix the calculation for next.
  - Link to issue 493.
  - I saw David's after I made this patch.  Yet I want to correct the 
error
    in v1.
---
  hw/intc/sifive_clint.c | 9 ++++++---
  1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/hw/intc/sifive_clint.c b/hw/intc/sifive_clint.c
index 0f41e5ea1c..78f01d17d3 100644
--- a/hw/intc/sifive_clint.c
+++ b/hw/intc/sifive_clint.c
@@ -44,6 +44,7 @@ static void sifive_clint_write_timecmp(RISCVCPU *cpu, 
uint64_t value,
  {
      uint64_t next;
      uint64_t diff;
+    uint64_t now;

      uint64_t rtc_r = cpu_riscv_read_rtc(timebase_freq);

@@ -59,9 +60,11 @@ static void sifive_clint_write_timecmp(RISCVCPU *cpu, 
uint64_t value,
      riscv_cpu_update_mip(cpu, MIP_MTIP, BOOL_TO_MASK(0));
      diff = cpu->env.timecmp - rtc_r;
      /* back to ns (note args switched in muldiv64) */
-    next = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
-        muldiv64(diff, NANOSECONDS_PER_SECOND, timebase_freq);
-    timer_mod(cpu->env.timer, next);
+    now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+    next = now + muldiv64(diff, NANOSECONDS_PER_SECOND, timebase_freq);
+    timer_mod(cpu->env.timer, (next <= now) ?
+                              (int64_t)((1ULL << 63) - 1) :
+                              next);
  }

  /*
--
2.32.0

