Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p2rIL-000533-UR
	for mharc-qemu-riscv@gnu.org; Wed, 07 Dec 2022 05:04:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1p2rIC-0004tG-Rx; Wed, 07 Dec 2022 05:04:45 -0500
Received: from bg4.exmail.qq.com ([43.154.221.58])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1p2rI3-0006Us-S4; Wed, 07 Dec 2022 05:04:39 -0500
X-QQ-mid: bizesmtp63t1670407461tbqb1ehp
Received: from ubuntu.. ( [111.196.135.79]) by bizesmtp.qq.com (ESMTP) with 
 id ; Wed, 07 Dec 2022 18:04:20 +0800 (CST)
X-QQ-SSF: 01200000000000B0B000000A0000000
X-QQ-FEAT: znfcQSa1hKbrnh3DHwcdETMeaIfmzR5u5zEaim5mVoYk7/OU/53gM9dzIO3zd
 alxAR9Gd5ZgV2pwALk+huiPucofFs22TQYbVo4DSRDlHjgLy+V609oIjJ5gOM7hpgryacnt
 ZtdGcixSepHTAPpEWIJm8rvUIwKjNPiQk+8k5ZCb0VQB5skoC//ISBniw4lAee+aFdeP7Yi
 iDfVnoSrn7UhBZ9EJqgyyJK4JiqH/mq2o3FAIB4YcamdOSdke9pPg/2oTmieHReVQZbGMu/
 gLCk18WXMGRl4FmLsHjFwEqwBdcqOT0LKeszK0pZ086fxpVfJXTeYbFx5+wQ0IuOCBheBSa
 euIAqs9d/m4OiZ5TnvbhYX0kgN9ZbesaGmQKg548JlxJRmPXNeKv22HdQLjuA==
X-QQ-GoodBg: 0
From: Bin Meng <bmeng@tinylab.org>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Subject: [PATCH v2 16/16] hw/intc: sifive_plic: Fix the pending register range
 check
Date: Wed,  7 Dec 2022 18:03:35 +0800
Message-Id: <20221207100335.290481-16-bmeng@tinylab.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221207100335.290481-1-bmeng@tinylab.org>
References: <20221207100335.290481-1-bmeng@tinylab.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvr:qybglogicsvr3
Received-SPF: pass client-ip=43.154.221.58; envelope-from=bmeng@tinylab.org;
 helo=bg4.exmail.qq.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 07 Dec 2022 10:04:49 -0000

The pending register upper limit is currently set to
plic->num_sources >> 3, which is wrong, e.g.: considering
plic->num_sources is 7, the upper limit becomes 0 which fails
the range check if reading the pending register at pending_base.

Fixes: 1e24429e40df ("SiFive RISC-V PLIC Block")
Signed-off-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

---

(no changes since v1)

 hw/intc/sifive_plic.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
index 1a792cc3f5..5522ede2cf 100644
--- a/hw/intc/sifive_plic.c
+++ b/hw/intc/sifive_plic.c
@@ -143,7 +143,8 @@ static uint64_t sifive_plic_read(void *opaque, hwaddr addr, unsigned size)
         uint32_t irq = (addr - plic->priority_base) >> 2;
 
         return plic->source_priority[irq];
-    } else if (addr_between(addr, plic->pending_base, plic->num_sources >> 3)) {
+    } else if (addr_between(addr, plic->pending_base,
+                            (plic->num_sources + 31) >> 3)) {
         uint32_t word = (addr - plic->pending_base) >> 2;
 
         return plic->pending[word];
@@ -202,7 +203,7 @@ static void sifive_plic_write(void *opaque, hwaddr addr, uint64_t value,
             sifive_plic_update(plic);
         }
     } else if (addr_between(addr, plic->pending_base,
-                            plic->num_sources >> 3)) {
+                            (plic->num_sources + 31) >> 3)) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: invalid pending write: 0x%" HWADDR_PRIx "",
                       __func__, addr);
-- 
2.34.1


