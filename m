Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p3H2M-0003Wt-Ba
	for mharc-qemu-riscv@gnu.org; Thu, 08 Dec 2022 08:34:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1p3FzL-0008QI-HG; Thu, 08 Dec 2022 07:26:55 -0500
Received: from out2-smtp.messagingengine.com ([66.111.4.26])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1p3FzJ-0005Cc-TU; Thu, 08 Dec 2022 07:26:55 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 684645C00B6;
 Thu,  8 Dec 2022 07:26:52 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 08 Dec 2022 07:26:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1670502412; x=
 1670588812; bh=0ngRan3icheol/dbgdeYLfTA2ILU02aLMIv7y09iFZc=; b=h
 QWNb3fatX+C6i56Fia6pwnEwZQjBx48I9f+S4krtolFjymQkIU7AXS+mMkXNxBHg
 T39ym86T80K7JdMqxTh4iOvoL5CuW0jnVT3GyGapFO+m6k0IwAnQLMVWEhVTghka
 0Ubqg3LRAgD1CSqFV8QdZsFNVbEqN7OVZujXC2pBVy/CIWDRzrIUjnDPkuMhCfrd
 wxtJEPuXo43l+I/5X3+pyk0hNEHnNUtfg5tA5KbQNqCPOCiyqsnSIGzqAq40+yba
 tFjnpyQtTbSilP8H2JjnrnfWY2nGzqhGUghaiXc5SL+vACSh68jUN99P3MJmDSFa
 7xUi2rajjYzdDsWoTCzqQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1670502412; x=1670588812; bh=0ngRan3icheol
 /dbgdeYLfTA2ILU02aLMIv7y09iFZc=; b=B0um3q1Fyem19KWJCoz70IvawCUIB
 luDmQdBgawV+qViiz8jsDbSGKs/pmXEIynU3cpDNiHsHq8O/ddmUYLKLquvw4lIC
 eGfzRFmJ2Wjxd4VqWwH83M4zmOmoTGPhaY/t51r6N/N52VtpB34ruXpWO04HFXEE
 HtfbVACglboPLo9AKIG9fou3+kVnU7JY9lfJZx84GQKO5cg6W65W+OEyNFfbWqGP
 SS8uvypGy/zwdhxrcByKJcpf3vc3cdNT9PZGpzfS1E4sGwT8/y8Y+FK0Fe4k5KWP
 iRi83DQYZUwTdPNxytj4OcreupIEvlHgZXI5RQAOd1QH3MFqUieGzJjlw==
X-ME-Sender: <xms:DNiRY1vl70po6iRVRftKJc29po8I6uJjOs6KLfSOWYVlV7TlLQoAFg>
 <xme:DNiRY-eFDhKUPRN5Riuc7Kxg6jzHJn219TmzNy4GJ33UrJJQQm5Q1YUYT8iexyMmo
 ezOmv-DB-iHmY9ur58>
X-ME-Received: <xmr:DNiRY4zl0HaLJojnms_iCJBCvF83S_tFk7d60ZINJQBSuk3p7cQBF3y25L08a8Z-nfJ_aoSvA27ajanig5EWX7gYzqlTvPLg1B8WpA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvddtgdeflecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgfeilefgieevheekueevheehkeefveegiefgheefgfejjeehffefgedujedu
 geenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:DNiRY8PwII_Zu4YEdvqf7-ji0CAkdQt30Htuf5H_S3pDKPfr90oByA>
 <xmx:DNiRY195XdOQkyFAIbbyhb69Dm1d8S4YkizMDIIqOijnF19FRvRHFw>
 <xmx:DNiRY8WjUsB6uy1yBtKfqrIzBIMsDLY_mK6YZ2jMrFThSZ5p1D7Xgg>
 <xmx:DNiRY-NX0fG8iLU6bwMfYS3FCm8tMG3dyjXx2pO1xicx9ikADkHg5g>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 8 Dec 2022 07:26:50 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Cc: Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 Jinhao Fan <fanjinhao21s@ict.ac.cn>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, qemu-stable@nongnu.org,
 qemu-riscv@nongnu.org, Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH v2 3/3] hw/nvme: fix missing cq eventidx update
Date: Thu,  8 Dec 2022 13:26:42 +0100
Message-Id: <20221208122642.80574-4-its@irrelevant.dk>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221208122642.80574-1-its@irrelevant.dk>
References: <20221208122642.80574-1-its@irrelevant.dk>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1401; i=k.jensen@samsung.com;
 h=from:subject; bh=HpbZnq35xbrUDphMGVz1enWTo7nx3csjTn0hDhTamJA=;
 b=owJ4nAFtAZL+kA0DAAoBTeGvMW1PDekByyZiAGOR2ALDL6JcvDCNqfcAGwYxC/WJi7YP5bM7N7e8
 I6wmKo58YIkBMwQAAQoAHRYhBFIoM6p14tzmokdmwE3hrzFtTw3pBQJjkdgCAAoJEE3hrzFtTw3pB9
 gH/A3SfMXiQLE53U32NvvUL4o6Zv0m22QSdhT/caNRYnhlbIMQ6jlNNf3uPrWMptq0hP8RziRUl9NA
 U9jDXdJN8KVCNQFl6Yi0Sl9CL3LHgUl2/ZjB+GSE4bkLxIhFGCW2CAxoxsD0nmQ1N+0eARzk0S3WOs
 5qNjxRG3LYBDcFFISBYfzu6wjuuWrcL8EYhAvGsRyKQopzPXN5xqq11a+ED5wSn/7xxDWyacFWkdcz
 r4yG2BE5JTfRKB2XdaLofAQQo1wVFJEQHEOZZnE7U957WRLB/Rztom1peWoQagkvEV0hrHNshK2JMp
 W2vkXga6jPRlbbDT1jqBvydCQKVpboKp/SC6Ls
X-Developer-Key: i=k.jensen@samsung.com; a=openpgp;
 fpr=DDCA4D9C9EF931CC3468427263D56FC5E55DA838
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.26; envelope-from=its@irrelevant.dk;
 helo=out2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 08 Dec 2022 08:34:00 -0500
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
X-List-Received-Date: Thu, 08 Dec 2022 12:26:58 -0000

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
 hw/nvme/ctrl.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index cfab21b3436e..f6cc766aba4a 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -1334,6 +1334,14 @@ static inline void nvme_blk_write(BlockBackend *blk, int64_t offset,
     }
 }
 
+static void nvme_update_cq_eventidx(const NvmeCQueue *cq)
+{
+    trace_pci_nvme_update_cq_eventidx(cq->cqid, cq->head);
+
+    pci_dma_write(PCI_DEVICE(cq->ctrl), cq->ei_addr, &cq->head,
+                  sizeof(cq->head));
+}
+
 static void nvme_update_cq_head(NvmeCQueue *cq)
 {
     pci_dma_read(PCI_DEVICE(cq->ctrl), cq->db_addr, &cq->head,
@@ -1355,6 +1363,7 @@ static void nvme_post_cqes(void *opaque)
         hwaddr addr;
 
         if (n->dbbuf_enabled) {
+            nvme_update_cq_eventidx(cq);
             nvme_update_cq_head(cq);
         }
 
-- 
2.38.1


