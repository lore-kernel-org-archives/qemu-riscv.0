Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mFhVO-0004Ah-Q9
	for mharc-qemu-riscv@gnu.org; Mon, 16 Aug 2021 14:38:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@salt-inc.org>)
 id 1mFhVM-0004AR-QS; Mon, 16 Aug 2021 14:38:36 -0400
Received: from mail.salt-inc.org ([104.244.79.104]:62705 helo=vm0.salt-inc.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@salt-inc.org>)
 id 1mFhVI-0003iv-7j; Mon, 16 Aug 2021 14:38:34 -0400
Received: from pc1 (92.229-132-109.adsl-dyn.isp.belgacom.be [109.132.229.92])
 by vm0.salt-inc.org (Postfix) with ESMTPSA id 1E992FF2AB;
 Sun, 16 Aug 2020 20:38:51 +0200 (CEST)
Received: from david by pc1 with local (Exim 4.92) (envelope-from <david@pc1>)
 id 1mFhVD-0004yN-0K; Mon, 16 Aug 2021 20:38:27 +0200
From: David Hoppenbrouwers <david@salt-inc.org>
To: qemu-devel@nongnu.org
Cc: David Hoppenbrouwers <david@salt-inc.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org (open list:SiFive Machines)
Subject: [PATCH v2] hw/intc/sifive_clint: Fix overflow in
 sifive_clint_write_timecmp()
Date: Mon, 16 Aug 2021 20:36:57 +0200
Message-Id: <20210816183655.18492-1-david@salt-inc.org>
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
X-List-Received-Date: Mon, 16 Aug 2021 18:38:37 -0000

`next` is an `uint64_t` value, but `timer_mod` takes an `int64_t`. This
resulted in high values such as `UINT64_MAX` being converted to `-1`,
which caused an immediate timer interrupt.

By limiting `next` to `INT64_MAX` no overflow will happen while the
timer will still be effectively set to "infinitely" far in the future.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/493
Signed-off-by: David Hoppenbrouwers <david@salt-inc.org>
---
I wrongly used `MAX` instead of `MIN`. I've amended the patch.

 hw/intc/sifive_clint.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/intc/sifive_clint.c b/hw/intc/sifive_clint.c
index 0f41e5ea1c..de47571fca 100644
--- a/hw/intc/sifive_clint.c
+++ b/hw/intc/sifive_clint.c
@@ -61,6 +61,8 @@ static void sifive_clint_write_timecmp(RISCVCPU *cpu, uint64_t value,
     /* back to ns (note args switched in muldiv64) */
     next = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
         muldiv64(diff, NANOSECONDS_PER_SECOND, timebase_freq);
+    /* ensure next does not overflow, as timer_mod takes a signed value */
+    next = MIN(next, INT64_MAX);
     timer_mod(cpu->env.timer, next);
 }
 
-- 
2.20.1


