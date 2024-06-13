Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75BBCC27C53
	for <qemu-riscv@archiver.kernel.org>; Thu, 13 Jun 2024 01:30:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sHZHw-0001vN-O6; Wed, 12 Jun 2024 21:30:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fea.wang@sifive.com>)
 id 1sHZHu-0001uX-GR
 for qemu-riscv@nongnu.org; Wed, 12 Jun 2024 21:30:02 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <fea.wang@sifive.com>)
 id 1sHZHs-0008AB-OG
 for qemu-riscv@nongnu.org; Wed, 12 Jun 2024 21:30:02 -0400
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-1f44b441b08so4490815ad.0
 for <qemu-riscv@nongnu.org>; Wed, 12 Jun 2024 18:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1718242199; x=1718846999; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sx46nwLh6y0cuModMm/z+J15eC8XVVvw74Hv/Q7DVvE=;
 b=nvLu/oXRvOge2DO8OB33m9hIICKFPnQWR+EVddR5PP5o4i6IzEDH0gjft0N1rB7qDF
 lPl2jn+3bt6yyTmlR2pjrqVjH01/4remEvOOKsI6ofvmqJXlWuEv+En1ipx/ulPG2mxe
 s1PWJ7kYXwW5sskF1bhSAU8gqfseUK0h6PTujmm5v3C41PTCl85cQfhttTNJfnu4Kch2
 rS9gwt0SlZK56a1EHCE2EK4mAz3DOmORN4K6girzYEHlEi/RXmpi+ItkT1Vhxze2PgBt
 MtPxSKyCPe+wKBkpYRuQ2zZ0YMuWGjS7WHn7oLcwM56BvnwcFW+kHqPKvM6K7yh5PnYc
 urhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718242199; x=1718846999;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sx46nwLh6y0cuModMm/z+J15eC8XVVvw74Hv/Q7DVvE=;
 b=lHVCLTdBSWOb9rQ8nFn9bQiv01fHAtSHCkGqs/+KX0ySQ/dLa/RIbB3F4mSRZVMZn/
 nskqCNDGGORoUYbrVimZLOd53/4KFit+j3cR117V0CrGi3Huvi2VjdV5xVIat4Qybgit
 gJonxFof//cw2D4t/cC/vDgv7/oavidTH8pa0wKgbasKWTtk4JmqINsLaalhWjMicjRm
 SzcfWRXC2sG0IUUpKqW2v1agH8BJg1RO5fKSthLGrVKBmMp8N29BQrkQ8IOnbQNZk2e2
 SHa2qg0iuXwjm3WorGMKWYrvLfy36PCfg3jAX/Y+eMXfAHwz39eFzKQPUkVobtp5dIZ4
 PBuA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVgMuPPmyeCtsf/POwgDau66HgWEi7GSj92N3YOx4pC3GxUIuH96M8jnxtKepUpV5Hnp4mJmOAacUpsgNGWckRFsT1IqJw=
X-Gm-Message-State: AOJu0YyUuzeFYfQIJzes9N+CWJYqSK3Qwt2fQzt3MyF8/izSI1tNTHlP
 K597A8i6HeY6XiULeZHddXquWzLp1ma9+O7y+pFSlH3N30lp5OwfWTuZGUZx6+c=
X-Google-Smtp-Source: AGHT+IEmITS+CQS0QJeigLbS7hQQShRngttRzLJuJxiaUiqRaQghIJE781PjUcsjM6nBVj4TtP9p6A==
X-Received: by 2002:a17:902:ec83:b0:1f8:3639:653e with SMTP id
 d9443c01a7336-1f83b6f31e0mr34795585ad.45.1718242199422; 
 Wed, 12 Jun 2024 18:29:59 -0700 (PDT)
Received: from hsinchu36-syssw02.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f855e723fasm1264155ad.97.2024.06.12.18.29.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jun 2024 18:29:59 -0700 (PDT)
From: "Fea.Wang" <fea.wang@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 qemu-arm@nongnu.org (open list:Xilinx Zynq),
 "Fea.Wang" <fea.wang@sifive.com>,
 "Edgar E . Iglesias" <edgar.iglesias@amd.com>,
 Frank Chang <frank.chang@sifive.com>
Subject: [PATCH v3 2/3] hw/dma: Add a trace log for a description loading
 failure
Date: Thu, 13 Jun 2024 09:35:00 +0800
Message-Id: <20240613013501.426905-3-fea.wang@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240613013501.426905-1-fea.wang@sifive.com>
References: <20240613013501.426905-1-fea.wang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=fea.wang@sifive.com; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
---
 hw/dma/trace-events    | 3 +++
 hw/dma/xilinx_axidma.c | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/hw/dma/trace-events b/hw/dma/trace-events
index 3c47df54e4..4c09790f9a 100644
--- a/hw/dma/trace-events
+++ b/hw/dma/trace-events
@@ -44,3 +44,6 @@ pl330_debug_exec_stall(void) "stall of debug instruction not implemented"
 pl330_iomem_write(uint32_t offset, uint32_t value) "addr: 0x%08"PRIx32" data: 0x%08"PRIx32
 pl330_iomem_write_clr(int i) "event interrupt lowered %d"
 pl330_iomem_read(uint32_t addr, uint32_t data) "addr: 0x%08"PRIx32" data: 0x%08"PRIx32
+
+# xilinx_axidma.c
+xilinx_axidma_loading_desc_fail(uint32_t res) "error:%u"
diff --git a/hw/dma/xilinx_axidma.c b/hw/dma/xilinx_axidma.c
index ad307994c2..c9cfc3169b 100644
--- a/hw/dma/xilinx_axidma.c
+++ b/hw/dma/xilinx_axidma.c
@@ -36,6 +36,7 @@
 #include "sysemu/dma.h"
 #include "hw/stream.h"
 #include "qom/object.h"
+#include "trace.h"
 
 #define D(x)
 
@@ -201,6 +202,8 @@ static MemTxResult stream_desc_load(struct Stream *s, hwaddr addr)
                                             addr, MEMTXATTRS_UNSPECIFIED,
                                             d, sizeof *d);
     if (result != MEMTX_OK) {
+        trace_xilinx_axidma_loading_desc_fail(result);
+
         if (result == MEMTX_DECODE_ERROR) {
             s->regs[R_DMASR] |= DMASR_DECERR;
         } else {
-- 
2.34.1


