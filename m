Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p4h3A-0000bG-Bp
	for mharc-qemu-riscv@gnu.org; Mon, 12 Dec 2022 06:32:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1p4h2v-0000X6-7c; Mon, 12 Dec 2022 06:32:35 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1p4h2t-0000LA-Mg; Mon, 12 Dec 2022 06:32:32 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 36F375C00CE;
 Mon, 12 Dec 2022 06:32:29 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 12 Dec 2022 06:32:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1670844749; x=
 1670931149; bh=5qSyIRFlQNDojhqxnNy8ca/Qu7HNQXyk6am+DhLFLE4=; b=F
 JZUqDZexPaaYnNUqwXc2JBCcAM5/dTEBuiJZRaNbd3GiVNITHIFYnYDY22Uvmpid
 LFSCfE3NWwNJOm61umMT20vIELenh1POLnF9ICQvnbp43A7t6P2dx/4/ubclfEFF
 QF3W3NFpyy88EYEsxCxYK4NwHujkhxXwVF/AsL68fzSF6ZpE92MPkDMrS6AifQ/v
 +LHmqWR/hzLCIhRK/QPzlBcpnq1tt96vTOu/eFTK70/ux0V3kqCn6nylcEZc5OJf
 hSzMwjJ33l60nfS0CI9oLh0YU/UuzxCCyfLNEbrRv74Z96kMBZ5uygINvoKqzzPh
 /4SOK6wVZ2U+1uLK5MOmQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1670844749; x=1670931149; bh=5qSyIRFlQNDoj
 hqxnNy8ca/Qu7HNQXyk6am+DhLFLE4=; b=gsHZQqtsuQ8/FYhc0wSZhIFNP+mxO
 zonwNHBqoOK/idnueQ07kripGAW4ROP2NmKzVYmSSqe7YCd+uJ0i7McCKJ4vGX6g
 PPTdVuBwlY1yrSNS3jBjhIut0OzFeiif13Y1s9026xypIw0eVJaWRh/sNgMV/uZj
 VIogSaWSjsKLaWCfCdNe/na/XwM0FR6YMdDrjBHpAqY7sA3FmaXEF1A1YGJ8AVcM
 yCuPDRxXmw8fE4mx+VPoRi+A6JkDCqG08AFX3mhkKjr9tgJ+MZlG3QoXIuicfyLV
 RKudRD7YTNqgG2tahllM31B5yst/1A0xF4VVA8DLcunK/N3bGNO1CksSg==
X-ME-Sender: <xms:TRGXY4O7XSNNoYlL8ZczWnJj5opWi6E4r0703gG-3HCC2IlcZMy82g>
 <xme:TRGXY--kGgTTqCg59XvZrDAUdx9ExXE4EhlyGc4CIKmMPvwo_kqUv0W6-gnmS7cRZ
 GtAWNSwXzqLOy1BRyU>
X-ME-Received: <xmr:TRGXY_RLO_UUP0Fp1_gAc_QuY3k5hi2vML-nVqBQLY5tMFpuQmggEctrjuqM4BYEzpWDYpv_-9-yw-17L0Fkn32mAjZ8U3UyUnYlCQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdekgddthecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgfeilefgieevheekueevheehkeefveegiefgheefgfejjeehffefgedujedu
 geenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:TRGXYwv7T5LOlHyqXt_Svo0likmUfFht0yj5W4ltSMv7x6tfkq2eMA>
 <xmx:TRGXYweKAVxogkYP5kL6xU1NPneQRCRrHUTR2jd6Tp4a4K1HlY3jZg>
 <xmx:TRGXY02rBGAOo4gtX6B5dyaJoVC52Ybj88JxY48S3IIgvNSm5xf9yw>
 <xmx:TRGXY-tIw45rpOom1zLBVU70qpRptp6aaQR8bla9ByQfsdiiImwYoA>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 12 Dec 2022 06:32:26 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Keith Busch <kbusch@kernel.org>,
 Jinhao Fan <fanjinhao21s@ict.ac.cn>, Klaus Jensen <its@irrelevant.dk>,
 Guenter Roeck <linux@roeck-us.net>, Klaus Jensen <k.jensen@samsung.com>,
 qemu-stable@nongnu.org, qemu-riscv@nongnu.org
Subject: [PATCH v3 4/4] hw/nvme: fix missing cq eventidx update
Date: Mon, 12 Dec 2022 12:32:15 +0100
Message-Id: <20221212113215.33135-5-its@irrelevant.dk>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221212113215.33135-1-its@irrelevant.dk>
References: <20221212113215.33135-1-its@irrelevant.dk>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1668; i=k.jensen@samsung.com;
 h=from:subject; bh=QySrk9WhTbWu6XNMhQzYbxR/1t4pP58Rjfply+gZbuU=;
 b=owJ4nAFtAZL+kA0DAAoBTeGvMW1PDekByyZiAGOXET9wquV5lGNd7teXduh1iyp3H6Y7hbDugi7T
 av4fZ+p25IkBMwQAAQoAHRYhBFIoM6p14tzmokdmwE3hrzFtTw3pBQJjlxE/AAoJEE3hrzFtTw3pdF
 0IAId2dej3g1abSR1v5g6mflu9UGbI4ZSiLzeqTEj9S8geecRbaVtfwVgfoFU1xkX2wo5t5Ci2ioL2
 ojGWUgFY71J/wGuLfjxxGCOZ6mAG/EiJog7A9/l/zf9Fzj43Q2PWHym9+ci5l2JsdrJpNuxd2anM9y
 AmuV1Zu/7Ytv1n7EXeSGXiVFWIJr6OZK5+CZO4cW6Ik/pZnANUhUJ63/TzAtpcp4lid+8wp899Tmp9
 U0RMh/BRfSBdSVI7EEt1VQwNtZowhPS7XA2/vyKSbsJbALK9jSbVjbHdLxk4uOTr+iYotQGzm4MhSt
 Hrv72GvMRbAk0c4wd/tbuUH4nKqE5jsa2wtKyp
X-Developer-Key: i=k.jensen@samsung.com; a=openpgp;
 fpr=DDCA4D9C9EF931CC3468427263D56FC5E55DA838
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.29; envelope-from=its@irrelevant.dk;
 helo=out5-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 12 Dec 2022 11:32:46 -0000

From: Klaus Jensen <k.jensen@samsung.com>

Prior to reading the shadow doorbell cq head, we have to update the
eventidx. Otherwise, we risk that the driver will skip an mmio doorbell
write. This happens on riscv64, as reported by Guenter.

Adding the missing update to the cq eventidx fixes the issue.

Fixes: 3f7fe8de3d49 ("hw/nvme: Implement shadow doorbell buffer support")
Cc: qemu-stable@nongnu.org
Cc: qemu-riscv@nongnu.org
Reported-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 8af70f0216f0..3df29ea68b2f 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -1334,10 +1334,22 @@ static inline void nvme_blk_write(BlockBackend *blk, int64_t offset,
     }
 }
 
+static void nvme_update_cq_eventidx(const NvmeCQueue *cq)
+{
+    uint32_t v = cpu_to_le32(cq->head);
+
+    trace_pci_nvme_update_cq_eventidx(cq->cqid, cq->head);
+
+    pci_dma_write(PCI_DEVICE(cq->ctrl), cq->ei_addr, &v, sizeof(v));
+}
+
 static void nvme_update_cq_head(NvmeCQueue *cq)
 {
-    pci_dma_read(PCI_DEVICE(cq->ctrl), cq->db_addr, &cq->head,
-                 sizeof(cq->head));
+    uint32_t v;
+
+    pci_dma_read(PCI_DEVICE(cq->ctrl), cq->db_addr, &v, sizeof(v));
+
+    cq->head = le32_to_cpu(v);
 
     trace_pci_nvme_update_cq_head(cq->cqid, cq->head);
 }
@@ -1355,6 +1367,7 @@ static void nvme_post_cqes(void *opaque)
         hwaddr addr;
 
         if (n->dbbuf_enabled) {
+            nvme_update_cq_eventidx(cq);
             nvme_update_cq_head(cq);
         }
 
-- 
2.38.1


