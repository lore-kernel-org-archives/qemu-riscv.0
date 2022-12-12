Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p4hEQ-00065C-UH
	for mharc-qemu-riscv@gnu.org; Mon, 12 Dec 2022 06:44:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1p4hEN-0005zl-VD; Mon, 12 Dec 2022 06:44:23 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1p4hEM-0003Ml-D6; Mon, 12 Dec 2022 06:44:23 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 128125C0151;
 Mon, 12 Dec 2022 06:44:21 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Mon, 12 Dec 2022 06:44:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1670845461; x=
 1670931861; bh=vZ+OOsnZYJL8GkKEt4CioC1k5V+A7SG820NOYkn+cXE=; b=U
 14bREhcVi6EtRbfAQW4+7TQ28+TFq/nADAUj6470Fy+aggfWqa5HmeO5Q4K7jO7b
 nG9UURV0IScRg/7MtoP/IQFjpx5CgLgBeLgp/pYosXE2DKZOtFX02SGJsAyjq8Tj
 rKSk1YLdVQwtw1dNBTZfd+ZuD82PP9Imea8ikjf4HMr6iN3KHrORIDPCGq1HHlAC
 CUxp/6dAM9k/kYBrlNejCACFwaQ2T3E/ikQeq1fyuwAVD91laL7TFxd4VDLxrcou
 MZv2+YMf5JaMTExLhxXTwVqi1r6vXLQLcLLgLu+JcVsa7LYnC1XzvrchBCLgrRYC
 VNnoZLApSXhjmTenEcUZw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1670845461; x=1670931861; bh=vZ+OOsnZYJL8G
 kKEt4CioC1k5V+A7SG820NOYkn+cXE=; b=upg01wsIGAzAUSSK+jLA+bykhog5q
 w2mjsmbMHfouQIXin6013T70lrTyo3w4nHxnBd2KR3C24htK4uph60DwD2PYaARd
 Ahk30iGRTQcj9v7kZ3+LoIqSUSNrv36SOrZxILvEHLHZP/WodY8bChHbA2YjdXdY
 XZUGD/90XQXMDgCcIEP819WRwrGLBGYW4Ryy8lIikzX+ZHEA63BHqM+ncJsSzxuj
 cZZ82mNKaXWnkG0RUvUoyqKA0fbQjZHvDhO4Fd892OgUFgFmivtNeJY5CFbuQrtZ
 lOoNKqOAodZzegXCIH1IMlmVqELv1iQO4/xhijNwDmWG8mXejRJ4M/Jhg==
X-ME-Sender: <xms:FBSXY2xreXBSMQzNY7K9jgqtiN3dGuk8VXRDZ8HvmaJ3GqFt5UanvQ>
 <xme:FBSXYyThu_ESiPpUyyxgMhL7bdEoUnWVz9shM-oWMyQ6ct9d8gl6C0AbvSfuv_cCc
 OM5yzXbiKufsCavkjQ>
X-ME-Received: <xmr:FBSXY4WM1XV5XJzUlPuVzoQSI9mlGeOwWs7t_xpQg3KQSc8FfAppTaQLT9Hs8DVcylu5dfRk1CctqUYrv90_hS_--5SGH795LkydtQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdekgddtkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgfeilefgieevheekueevheehkeefveegiefgheefgfejjeehffefgedujedu
 geenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:FBSXY8i-qy0RQMJXKBLyESkhciApFv7HgkVw0w_cl86UeSRurd2Y2g>
 <xmx:FBSXY4CvK0y9rT_sTw1UnFZIcyREMFxmNS4eHYQsMFeqG5TVaD42ww>
 <xmx:FBSXY9JVLflRpS6SA4dnBjWHei5_mQQx6b6bp45FPXu141aH6-I9pg>
 <xmx:FRSXY2D8L08fUqA0_vPM6VCirTnneFOOzvH-eB5_sRezUjAYRYFgLQ>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 12 Dec 2022 06:44:19 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Klaus Jensen <its@irrelevant.dk>,
 Keith Busch <kbusch@kernel.org>, Jinhao Fan <fanjinhao21s@ict.ac.cn>,
 Guenter Roeck <linux@roeck-us.net>, Klaus Jensen <k.jensen@samsung.com>,
 qemu-stable@nongnu.org, qemu-riscv@nongnu.org
Subject: [PATCH v4 4/4] hw/nvme: fix missing cq eventidx update
Date: Mon, 12 Dec 2022 12:44:09 +0100
Message-Id: <20221212114409.34972-5-its@irrelevant.dk>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221212114409.34972-1-its@irrelevant.dk>
References: <20221212114409.34972-1-its@irrelevant.dk>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1368; i=k.jensen@samsung.com;
 h=from:subject; bh=aoxzJKx0O6Lh8Uwyoz0I0J6X3ZQ9AYZS1frBhrJxaH8=;
 b=owJ4nAFtAZL+kA0DAAoBTeGvMW1PDekByyZiAGOXFAn4JT/RXbSN0djv0q7720auhySmj6ZktG2k
 oNtrDeicEYkBMwQAAQoAHRYhBFIoM6p14tzmokdmwE3hrzFtTw3pBQJjlxQJAAoJEE3hrzFtTw3pR2
 gH/3Hip0LUeBk37fBjirn7KRFbkooCOW3s23ATqkwvHonUmHsCdVwtNcixh1xRgmVKFHmn5dweCIU9
 P4VjtQawawuIGvoH0tecvf73b9TvJGqHXI+ef5Ij6w8Y3OpoiHj8EtBBBIlM1q3KNN8XUTH+CYZhS+
 ML+tuvEW8g7A7lNO0iqYmI7rOY86XIcgo7SbFKDOjSkdQhqbsYPZb+wZrKhEtoMP8ycX+okfjrPly3
 8xXgcmJYQPfgtuWTHkxLeADSCz9TxNRsZ09WJ2uXLIOxZZ7QdIfR+W/Pd6WF5+71zqJJ2HVQ2dC1Xq
 /I5u4xlAEZnWVGRVg6Jb4BSRoL78LJRdJlFa3C
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
X-List-Received-Date: Mon, 12 Dec 2022 11:44:25 -0000

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
 hw/nvme/ctrl.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index bb505131f5f9..3df29ea68b2f 100644
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
2.38.1


