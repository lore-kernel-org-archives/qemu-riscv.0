Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pF8ta-0006sI-7b
	for mharc-qemu-riscv@gnu.org; Tue, 10 Jan 2023 02:18:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1pF8tY-0006q0-0f; Tue, 10 Jan 2023 02:18:04 -0500
Received: from wout5-smtp.messagingengine.com ([64.147.123.21])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1pF8tW-0003MF-ER; Tue, 10 Jan 2023 02:18:03 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id B7B863200943;
 Tue, 10 Jan 2023 02:17:59 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Tue, 10 Jan 2023 02:18:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1673335079; x=
 1673421479; bh=yjjzkGl9WploOz3oaavu6EMFqtcnpfOdirkUoRQSSoE=; b=E
 EAovCkVci4bbHDKfn4QLplDWFLtupo/5oqtI74ziLcbce4/2IuhH3MYsD92ysHNJ
 0Obni7TBpt7xvdc6Xx9I2pAeEtPEDhPmMV/nYJ9vtqpIJbaQLgBYBFze1scJfiTP
 N87fX01vlbWbBVHuRamJxL4zZap2PFtzQoFBEH+/sIJySb7cU+PhsTQWdJNcnTDA
 Hz6RJbe7VXpxPe/Vg43UKF3COOtiNIaOlGCFJ2H9FocYIbNyxmAkE6LjntL9twTm
 8fZmmStLVCOqY7BX/MLmsx+kEVJHUs5ZSB2lDLjBpWhbroiSr6G9/AkwvR3t5LUr
 PiTR3Cau8EZdq5OoB0eww==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1673335079; x=1673421479; bh=yjjzkGl9WploO
 z3oaavu6EMFqtcnpfOdirkUoRQSSoE=; b=avFYoFIU9oc9z1AulstncAXOE+AX+
 j63R8rloEEboIS+gHWuZdaN+HLp+wLf+lC9TCuax1UHY4xIL0EXXN2RV1gJ557Pw
 H/ZaufsnbntINqL2GA2CIuOsuDdLpSkn1GeNnYFmcUfqIqeF8gOBkBtK9H3pUbyw
 CiHBrDOLK5bXCv0POyNh5SMu0J5xYz5w2MRGnF6KCXTTTwL66Y32aKWFE2Ix276W
 1S7Px2Q6CMKj69UxujndkpDdMKll0eKTyX5PHbYF8hLZmNAsSs2rDys0HHFXrDar
 o2JAgJNYypa2Sjhzz5Br37k4gZO33BbxawHvWWNYnfNErkogX/VZhb4uQ==
X-ME-Sender: <xms:JxG9YxpfN1R-Ppsrw2UZH2xS-VHYB59tMmlCqMq1sorzC6eE3FhLCQ>
 <xme:JxG9Yzr28hrLel65kwAemlF6kHctJGxqwQAP-OoJxnYZeSX_LsA5lWYd9pDl0OKkg
 wDKJy09-THE2aG_SlU>
X-ME-Received: <xmr:JxG9Y-NKgwPrqEX4HjGXK6ktNMpwmhE0c84dwNzOC0oyIJxmRLHjZE9Z8j8qOKW8RrKbcpxLz2HPyY-Io-l4PVtMem1eUpgnbl1U-g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrkeejgddutdekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjefgieelgfeiveehkeeuveehheekfeevgeeigfehfefgjeejhefffeegudej
 udegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:JxG9Y85AVpxJHwYLgNdnIyFjyfg2IzLaSblclbBbT28gVF-f2xpZ3w>
 <xmx:JxG9Yw5wHq0EJQSvxmiZcQv8c1Jag2jrli4Ln_AZfvLGGEWMd1mtug>
 <xmx:JxG9Y0jmcADO5DnpcDRegS2FGvUZoLcl3g80d1XXNI-HBqTu1kJHmQ>
 <xmx:JxG9Y_aCTgJUUQr2f7nV_rsNtF3bzF4dqXkTq3Y97cuYDFeRngFQlQ>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 10 Jan 2023 02:17:57 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: Keith Busch <kbusch@kernel.org>, qemu-block@nongnu.org,
 Klaus Jensen <its@irrelevant.dk>, Klaus Jensen <k.jensen@samsung.com>,
 qemu-stable@nongnu.org, qemu-riscv@nongnu.org,
 Guenter Roeck <linux@roeck-us.net>
Subject: [PULL 4/4] hw/nvme: fix missing cq eventidx update
Date: Tue, 10 Jan 2023 08:17:43 +0100
Message-Id: <20230110071743.63507-5-its@irrelevant.dk>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230110071743.63507-1-its@irrelevant.dk>
References: <20230110071743.63507-1-its@irrelevant.dk>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1414; i=k.jensen@samsung.com;
 h=from:subject; bh=ZXD346KYWBQ1ppNzRS48H9du8tV5U4eKh3aFsjFnjSA=;
 b=owJ4nAFtAZL+kA0DAAoBTeGvMW1PDekByyZiAGO9EReoCgLaoNslR0/8Se/AFY4fl03KSFATsS2D
 lji6oaQEz4kBMwQAAQoAHRYhBFIoM6p14tzmokdmwE3hrzFtTw3pBQJjvREXAAoJEE3hrzFtTw3pNS
 0H/jLgaSBTm97lD63+sIoKrXMJAssZ4FI9YP7QkOYjerL5xyn1uyw5izNd5aGHq6F+CoupCf36ScFY
 htWTK03TM6Dw8ZpSMH2vHMxoYcXTJP5PFD2Ku6uLEpjHRoA1ksUxv0o4q9nOh2plBT4CV0MFx8jtao
 cFpSRcUgrueB3S6ZIc9XjhExjVbQoMtaKCiCf7RrUYpY2I4a+jgbrGk6s7Y8okTifAGqQI7cF51D6a
 UH4HrkIojdVk/RhHmV9f7HbxcjKcfD5Ui9n9sNkSbhUQGu45HsOJAmHR2JJzkoB7qbzYE5QMjG2FJq
 rYqeES6glieAlBrwEH46Ra4oNgKum2zM+1wabU
X-Developer-Key: i=k.jensen@samsung.com; a=openpgp;
 fpr=DDCA4D9C9EF931CC3468427263D56FC5E55DA838
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.21; envelope-from=its@irrelevant.dk;
 helo=wout5-smtp.messagingengine.com
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
X-List-Received-Date: Tue, 10 Jan 2023 07:18:04 -0000

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
---
 hw/nvme/ctrl.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 28e02ec7baa6..226480033771 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -1334,6 +1334,15 @@ static inline void nvme_blk_write(BlockBackend *blk, int64_t offset,
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
     uint32_t v;
@@ -1358,6 +1367,7 @@ static void nvme_post_cqes(void *opaque)
         hwaddr addr;
 
         if (n->dbbuf_enabled) {
+            nvme_update_cq_eventidx(cq);
             nvme_update_cq_head(cq);
         }
 
-- 
2.39.0


