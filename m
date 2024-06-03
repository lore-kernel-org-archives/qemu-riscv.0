Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A3CCC25B76
	for <qemu-riscv@archiver.kernel.org>; Mon,  3 Jun 2024 05:48:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sE0YI-00009l-UG; Mon, 03 Jun 2024 01:48:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fea.wang@sifive.com>)
 id 1sE0YH-00008h-7T
 for qemu-riscv@nongnu.org; Mon, 03 Jun 2024 01:48:13 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <fea.wang@sifive.com>)
 id 1sE0YF-0005Lf-KW
 for qemu-riscv@nongnu.org; Mon, 03 Jun 2024 01:48:12 -0400
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-1f44b4404dfso34436495ad.0
 for <qemu-riscv@nongnu.org>; Sun, 02 Jun 2024 22:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1717393690; x=1717998490; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=McpFXNhXQ6r1MNyJ82Ek29bT+aje/zAXSGKXI9ScW+E=;
 b=d2x3bJtezAPJlffpv73Go8BwCm0pa2ueTI01LKzWRs+cXUuVIXD8JbtMtwV9dFbBVo
 0c0QRVN7nqRQXrhZYwXxQD2pXexPrVJEtUnOhBXd7b5Wc5xnt1vZ7qzQlfgff3tpI+h+
 c35t3Mdo8DnvdvBIFtWwrQnFDbuu50Hwl1aOj4noWBbAYL1FSgMyCGZiJJ6K5UnKUNgx
 fYKFREbUz9ReRHRHI0Px0CmnluBeul2q+Bt6Aniq4DkTTXiyTCjdndBlWtUSDjGx5zU8
 VuyVvTqBxuMuGmZ+D4DVhd4bhQ4V8KfvO/7TgUjha3sgGmmri3HCut7daMd5hyonSnR5
 95FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717393690; x=1717998490;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=McpFXNhXQ6r1MNyJ82Ek29bT+aje/zAXSGKXI9ScW+E=;
 b=AXMliZKLpoKQ2XR5K4c2vQlg1Qx7byJuWP/3fHAV7j7ySMmN9A4kY40XbS2bkq68Ly
 X/Lhcvmn+zsqEsryz5PtTy7+s77khm2dhlWebu3GoIiTNRk9/OFyCiU15hf2qFBY+BJi
 pcdZr8RDJG4mdEKPCnogw9xjkKoWysByu4SwyBfyB+u3cY+M+PPoPCS8TNZqYue2hhzU
 ZyQQh1fNs3cGPcm6UXh9aW1SEpAh2CvDJcG4E0XkprL8bleTgj8SRSd6B/mQfGMI5RyY
 bLA7sF26+UKLMrJnx1+owx/S4AkVvk+2zMnstyYiwwVsSjB/tAnObMNoptNbUZUyunyU
 gZEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUTeCgjbI4v5ZS9jhJZHalzlD6fHNfwvdebq+XGuji1h+s4iRoXQiv749nNbvVMVfuRnhZ+bZ5sLUxU76OOkEoEHpd5Gf8=
X-Gm-Message-State: AOJu0YyMWGBDzO6tAsLh/ZlbBfIx6I8rywm9v2AS86fqMEbnjx9d6L/C
 fiMfmvzTtM8msnK0aG0o6BPFB7aI5rjmagTbWKcO/BfvyvNnhI9JvLUiI3v8UX4=
X-Google-Smtp-Source: AGHT+IFR1U1ZOSOfadGguID18mp4TvEKbUOV/xOfXx08gTjQJyS2skjFsgpd7XSyiLQKEW4NXgp/Kw==
X-Received: by 2002:a17:902:c40f:b0:1f3:121e:e3de with SMTP id
 d9443c01a7336-1f636fdebbfmr92073695ad.14.1717393690275; 
 Sun, 02 Jun 2024 22:48:10 -0700 (PDT)
Received: from hsinchu36-syssw02.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f63241e085sm55824135ad.299.2024.06.02.22.48.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Jun 2024 22:48:10 -0700 (PDT)
From: "Fea.Wang" <fea.wang@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 qemu-arm@nongnu.org (open list:Xilinx Zynq),
 "Fea.Wang" <fea.wang@sifive.com>
Subject: [PATCH 3/4] hw/dma: Add a trace log for a description loading failure
Date: Mon,  3 Jun 2024 13:52:47 +0800
Message-Id: <20240603055248.3928469-4-fea.wang@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240603055248.3928469-1-fea.wang@sifive.com>
References: <20240603055248.3928469-1-fea.wang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=fea.wang@sifive.com; helo=mail-pl1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Due to a description loading failure, adding a trace log makes observing
the DMA behavior easy.

Signed-off-by: Fea.Wang <fea.wang@sifive.com>
---
 hw/dma/trace-events    | 3 +++
 hw/dma/xilinx_axidma.c | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/hw/dma/trace-events b/hw/dma/trace-events
index 3c47df54e4..95db083be4 100644
--- a/hw/dma/trace-events
+++ b/hw/dma/trace-events
@@ -44,3 +44,6 @@ pl330_debug_exec_stall(void) "stall of debug instruction not implemented"
 pl330_iomem_write(uint32_t offset, uint32_t value) "addr: 0x%08"PRIx32" data: 0x%08"PRIx32
 pl330_iomem_write_clr(int i) "event interrupt lowered %d"
 pl330_iomem_read(uint32_t addr, uint32_t data) "addr: 0x%08"PRIx32" data: 0x%08"PRIx32
+
+# xilinx_axidma.c
+xilinx_axidma_loading_desc_fail(uint32_t res) "error:%d"
diff --git a/hw/dma/xilinx_axidma.c b/hw/dma/xilinx_axidma.c
index b8ab5a423d..1bbb9d6c4c 100644
--- a/hw/dma/xilinx_axidma.c
+++ b/hw/dma/xilinx_axidma.c
@@ -36,6 +36,7 @@
 #include "sysemu/dma.h"
 #include "hw/stream.h"
 #include "qom/object.h"
+#include "trace.h"
 
 #define D(x)
 
@@ -200,6 +201,8 @@ static MemTxResult stream_desc_load(struct Stream *s, hwaddr addr)
                                             addr, MEMTXATTRS_UNSPECIFIED,
                                             d, sizeof *d);
     if (result != MEMTX_OK) {
+        trace_xilinx_axidma_loading_desc_fail(result);
+
         s->regs[R_DMACR] &= ~DMACR_RUNSTOP;
         s->regs[R_DMASR] |= DMASR_HALTED;
         s->regs[R_DMASR] |= DMASR_SLVERR;
-- 
2.34.1


