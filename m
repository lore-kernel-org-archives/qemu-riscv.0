Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pZxiw-0001BN-6r
	for mharc-qemu-riscv@gnu.org; Wed, 08 Mar 2023 12:37:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1pZxDa-0003He-Ja; Wed, 08 Mar 2023 12:04:46 -0500
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1pZxDY-0005ZG-Q6; Wed, 08 Mar 2023 12:04:46 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 7677B400C5;
 Wed,  8 Mar 2023 19:58:19 +0300 (MSK)
Received: from tls.msk.ru (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with SMTP id 335FD92;
 Wed,  8 Mar 2023 19:58:18 +0300 (MSK)
Received: (nullmailer pid 2098272 invoked by uid 1000);
 Wed, 08 Mar 2023 16:58:15 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 qemu-riscv@nongnu.org, Guenter Roeck <linux@roeck-us.net>,
 Keith Busch <kbusch@kernel.org>, Michael Tokarev <mjt@tls.msk.ru>
Subject: [PATCH 10/47] hw/nvme: fix missing cq eventidx update
Date: Wed,  8 Mar 2023 19:57:13 +0300
Message-Id: <20230308165815.2098148-10-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230308165035.2097594-1-mjt@msgid.tls.msk.ru>
References: <20230308165035.2097594-1-mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 08 Mar 2023 12:37:08 -0500
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
X-List-Received-Date: Wed, 08 Mar 2023 17:04:47 -0000

From: Klaus Jensen <k.jensen@samsung.com>

Prior to reading the shadow doorbell cq head, we have to update the
eventidx. Otherwise, we risk that the driver will skip an mmio doorbell
write. This happens on riscv64, as reported by Guenter.

Adding the missing update to the cq eventidx fixes the issue.

Fixes: 3f7fe8de3d49 ("hw/nvme: Implement shadow doorbell buffer support")
Cc: qemu-stable@nongnu.org
Cc: qemu-riscv@nongnu.org
Reported-by: Guenter Roeck <linux@roeck-us.net>
Reviewed-by: Keith Busch <kbusch@kernel.org>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
(cherry picked from commit fa5db2aa168bdc0f15c269b6212ef47632fab8ba)
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/nvme/ctrl.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 83f5e58e8d..366b973a9e 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -1331,6 +1331,15 @@ static inline void nvme_blk_write(BlockBackend *blk, int64_t offset,
     }
 }
 
+static void nvme_update_cq_eventidx(const NvmeCQueue *cq)
+{
+    uint32_t v = cpu_to_le32(cq->head);
+
+    //not in 7.2: trace_pci_nvme_update_cq_eventidx(cq->cqid, cq->head);
+
+    pci_dma_write(PCI_DEVICE(cq->ctrl), cq->ei_addr, &v, sizeof(v));
+}
+
 static void nvme_update_cq_head(NvmeCQueue *cq)
 {
     uint32_t v;
@@ -1355,6 +1364,7 @@ static void nvme_post_cqes(void *opaque)
         hwaddr addr;
 
         if (n->dbbuf_enabled) {
+            nvme_update_cq_eventidx(cq);
             nvme_update_cq_head(cq);
         }
 
-- 
2.30.2


