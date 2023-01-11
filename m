Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pFVuk-0004Jh-DY
	for mharc-qemu-riscv@gnu.org; Wed, 11 Jan 2023 02:52:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1pFVuW-0004FV-81; Wed, 11 Jan 2023 02:52:38 -0500
Received: from wout3-smtp.messagingengine.com ([64.147.123.19])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1pFVuU-0006Aj-B7; Wed, 11 Jan 2023 02:52:35 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 7FA4C3200970;
 Wed, 11 Jan 2023 02:52:31 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Wed, 11 Jan 2023 02:52:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1673423551; x=
 1673509951; bh=yjjzkGl9WploOz3oaavu6EMFqtcnpfOdirkUoRQSSoE=; b=t
 pc8ys+7IV8ieVHxF1Lvwsk04oziNpB0RIUyAtNznuGfvJhVq0/dtOFEZZQBUoJuk
 YRib+Ugbkwk1gBEuUecGBAuoaCYyFlGNzXACLdIeIRvmrg9pXzZQKG0t01t1dJNR
 A1gyLB+b6lr444rBCszLyg7W3yTkbFJjF9jA6sfAfLCM4dgIB6IMECnO6GG6rlDD
 sz25+22s9UXVAS4o7fClSEGU43Q5sZ8DQhivcr+OOWAQqv4j6f2MPhz+Qu2rzv6X
 4osWHbiM5Mi5C7ZcbRveOEzAq/Guc4fUBpU3/E2atczEiG6vJ9NJ3rVj2cvDcOVe
 0ZSfDKgh10ueMqRqV+kjg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1673423551; x=1673509951; bh=yjjzkGl9WploO
 z3oaavu6EMFqtcnpfOdirkUoRQSSoE=; b=eEuNwOUjkR0M0GIo/DiK098BZ7xgq
 0TcWAVv5G6WFzzxIPRP2BRAX6p01idhOmxHCJPpbQ3POvwZhuO9WregKhsjRlAle
 /y+1tmHfOF87yeB+t3PFuRY82ydPrur5w6F8JFccGP/IcS+LMqXyneW5FPEjnZV9
 8J9BOlh2LBe97A6fjuKzVp4d8Cmh09enrMcZXHq6W1Sny9THSw5vO7AALiHx0SHG
 Q/QVKWCWSryOkPgo4gkHwWwWSZT0uKGiB4mrCW56JTCALlLf+Ie0XlBR6FjYVRKW
 2qWfuq8togLQswCFU8/sQaSl7keZiV4Wm11udjvMIdtgXF/iGICh6SXTA==
X-ME-Sender: <xms:v2q-YzV94zfR1PwJnakY9ybKXR2l3kJVngl_h8zMk47EA8n8dc7lMA>
 <xme:v2q-Y7kJLNlYpoKXTtmgyHJRfZFKGb4h0LpVoaDvNZ2F6Usr8EavnDh_u39q2v7K1
 QMYly-sQvnl_ew5JQ0>
X-ME-Received: <xmr:v2q-Y_axaGSzTDK-ELM3vkbKmX73zNon7459wuLq04BypeLtM_KwB-nzysITpAFiHE13foWYPm8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrleefgdduudefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjefgieelgfeiveehkeeuveehheekfeevgeeigfehfefgjeejhefffeegudej
 udegnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:v2q-Y-U1IniJ5lIwqCLyuh1E79kgROlYQL3vAddziwtDCjJIvcdsvg>
 <xmx:v2q-Y9l0XGQnB37EEGJPQLdzDUOh1RyWekbClZh5ZMRtIFKLZ3ydLA>
 <xmx:v2q-Y7dSSzMcXZLOgh4kG1tcJEZ7Q7k4QGlsqrX24fU2cWU9eo1l2g>
 <xmx:v2q-YzV0fzZepe8dZzS32xaMbEIGwZ3E0En_MSxvLh_NrnpvxdRH6g>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 11 Jan 2023 02:52:29 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Cc: Klaus Jensen <its@irrelevant.dk>, qemu-block@nongnu.org,
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <k.jensen@samsung.com>,
 qemu-stable@nongnu.org, qemu-riscv@nongnu.org,
 Guenter Roeck <linux@roeck-us.net>
Subject: [PULL 4/6] hw/nvme: fix missing cq eventidx update
Date: Wed, 11 Jan 2023 08:52:11 +0100
Message-Id: <20230111075213.70404-5-its@irrelevant.dk>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230111075213.70404-1-its@irrelevant.dk>
References: <20230111075213.70404-1-its@irrelevant.dk>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1414; i=k.jensen@samsung.com;
 h=from:subject; bh=ZXD346KYWBQ1ppNzRS48H9du8tV5U4eKh3aFsjFnjSA=;
 b=owJ4nAFtAZL+kA0DAAoBTeGvMW1PDekByyZiAGO+aq2oCgLaoNslR0/8Se/AFY4fl03KSFATsS2D
 lji6oaQEz4kBMwQAAQoAHRYhBFIoM6p14tzmokdmwE3hrzFtTw3pBQJjvmqtAAoJEE3hrzFtTw3pqX
 EIAIKyRJ2R3FFs91sLd4P03smHrDPltF9fp0PJW88rONRogEO70L2nHH/C8JdrPIZ8Ck7hz9bX+d0D
 HsV2oJy/FNvVt6KtjurkhRXuo+0lNhuMMZnPBicnEn+fsN4VbNJEfgIObQguer5GEVzQTA6xSCmUeo
 IEsSvLz5n6h4MpY+Ln3ik8EIa+FInQaaQQAowVTC4vnPQZgSjoEksGtpEmPltJlGX60f46wm1iJ+yH
 /2+elydbcb+Q+UgnukaSlkIs5ILzT97FNHIxMauOKb5yNmjHRBK26V2ybc2FL/p3ZWREKgY8MuPf18
 a+DcYrWNOKoiSYBVe6dYY7DQz4+qHfZ/AXiaf7
X-Developer-Key: i=k.jensen@samsung.com; a=openpgp;
 fpr=DDCA4D9C9EF931CC3468427263D56FC5E55DA838
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.19; envelope-from=its@irrelevant.dk;
 helo=wout3-smtp.messagingengine.com
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
X-List-Received-Date: Wed, 11 Jan 2023 07:52:46 -0000

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


