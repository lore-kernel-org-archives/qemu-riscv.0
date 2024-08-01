Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67C7AC3DA4A
	for <qemu-riscv@archiver.kernel.org>; Thu,  1 Aug 2024 14:08:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sZWRm-0006Ml-Bv; Thu, 01 Aug 2024 10:06:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1sZWRk-0006Ga-OV
 for qemu-riscv@nongnu.org; Thu, 01 Aug 2024 10:06:25 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1sZWRg-0006rR-QL
 for qemu-riscv@nongnu.org; Thu, 01 Aug 2024 10:06:24 -0400
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-1ff1cd07f56so50019475ad.2
 for <qemu-riscv@nongnu.org>; Thu, 01 Aug 2024 07:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1722521179; x=1723125979; darn=nongnu.org;
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=JXlEGPL9thPPk61Tbq7dliSQC6vKn0rJatKn3l6TSro=;
 b=GVLkH39dSmZXp0p2ayS5Qjjv44B6PHoxJWs0Pf5HA1ND70PPj/ZBrV+opPV8cq2CwP
 3u+oelGtBjUgFdjNGPYZLlgJe90B3RhcWP+ddbgr6AfjLIJbecDdkPPDLmVFF3zb12yO
 F9sbI8G+tisbC76lUj1/IwoM3/FV2Qj+Q8eLzIeJmdOjhg/DXq03AzEQL4Nk1YVSZmOO
 1uMUKl2/xDpnK5C0/NBtuQu7jDHLOMFgWHPijN8Ljh4oAfGsWqKG2FXzBcKmfWJssF1B
 zge9marWe90Ng0CtX18La0Sf68QritsO5hu5joRFNYeRpNL0LwXWYnJ8Peuk6Ctd0Bjt
 Js7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722521179; x=1723125979;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JXlEGPL9thPPk61Tbq7dliSQC6vKn0rJatKn3l6TSro=;
 b=flekVicLZm2eOYOZq7ecoPAgI7gj39biOYoU9stRuSEdFEkCE4kNnVmZZBwE6+eyyU
 rGWKmQYpqIuQS4ZOWG4bSCaxMaA3mUvxw0GbTgYVq4dCExP1+z2i699zYs8lwfhawQLs
 PXMVlt9StkC8zIZEMYE3n5GWEav7/2v92IDv2swiobhQOQxZPnWV7ptCCYknsGGn24BW
 Z9MSpKzQ1fO9loIzB9RaAi63knZmIUykmBsTwmoYMq0zkLuoZtM1xhmtV9bWkDwGr5pT
 zQVKqAp0lUnghDUQT+esyGr4QzG1KeA94tWFOmWKs4BLNly2xCdMkT20l14S5V4Lpnek
 rTFQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVGQhZXPgaCtjQ0zqaOf3g4Wmk8LwRLw0G+42wqoKWsObYHVG8ZoZMmY5JiqeSM8ao70coJiutigh50qfgtO4aBpWLm/1A=
X-Gm-Message-State: AOJu0YwaQRh/pIzgJB7ERRcMMjF5/KQYOZrEU/y1kzskRMM4/QnIZdSn
 hw5+rVOtLKO36rmoC19IXCMUprmYdIjLvMHw1rvfGnp2sQWEkkY9pADCZruAKP0QfD9t6sT4GiD
 gfQs=
X-Google-Smtp-Source: AGHT+IGJm9tSjFlCrbFNJ6AfEEHUJq5BW5CjEtSZD7FzSaiO+W+pXpMsYLcTRs0zGnyhB63AoQ0HLw==
X-Received: by 2002:a17:903:2345:b0:1fd:6d4c:24e9 with SMTP id
 d9443c01a7336-1ff5722df70mr3471695ad.10.1722521179531; 
 Thu, 01 Aug 2024 07:06:19 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fed7cc0213sm142631275ad.72.2024.08.01.07.06.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Aug 2024 07:06:19 -0700 (PDT)
From: Jim Shu <jim.shu@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Jim Shu <jim.shu@sifive.com>
Subject: [PATCH v2 2/3] hw/dma: xilinx_axidma: Send DMA error IRQ if any
 memory access is failed
Date: Thu,  1 Aug 2024 22:06:08 +0800
Message-Id: <20240801140609.26922-3-jim.shu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240801140609.26922-1-jim.shu@sifive.com>
References: <20240801140609.26922-1-jim.shu@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=jim.shu@sifive.com; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

The memory transactions from DMA could have bus-error in some cases. If
it is failed, DMA device should send error IRQs.

Signed-off-by: Jim Shu <jim.shu@sifive.com>
---
 hw/dma/trace-events    |  1 +
 hw/dma/xilinx_axidma.c | 69 ++++++++++++++++++++++++++++++------------
 2 files changed, 50 insertions(+), 20 deletions(-)

diff --git a/hw/dma/trace-events b/hw/dma/trace-events
index 4c09790f9a..7db38e0e93 100644
--- a/hw/dma/trace-events
+++ b/hw/dma/trace-events
@@ -47,3 +47,4 @@ pl330_iomem_read(uint32_t addr, uint32_t data) "addr: 0x%08"PRIx32" data: 0x%08"
 
 # xilinx_axidma.c
 xilinx_axidma_loading_desc_fail(uint32_t res) "error:%u"
+xilinx_axidma_storing_desc_fail(uint32_t res) "error:%u"
diff --git a/hw/dma/xilinx_axidma.c b/hw/dma/xilinx_axidma.c
index 6aa8c9272c..728246f925 100644
--- a/hw/dma/xilinx_axidma.c
+++ b/hw/dma/xilinx_axidma.c
@@ -194,6 +194,20 @@ static inline int streamid_from_addr(hwaddr addr)
     return sid;
 }
 
+/* When DMA is error, fill in the register of this Stream. */
+static void stream_dma_error(struct Stream *s, MemTxResult result)
+{
+    if (result == MEMTX_DECODE_ERROR) {
+        s->regs[R_DMASR] |= DMASR_DECERR;
+    } else {
+        s->regs[R_DMASR] |= DMASR_SLVERR;
+    }
+
+    s->regs[R_DMACR] &= ~DMACR_RUNSTOP;
+    s->regs[R_DMASR] |= DMASR_HALTED;
+    s->regs[R_DMASR] |= DMASR_ERR_IRQ;
+}
+
 static MemTxResult stream_desc_load(struct Stream *s, hwaddr addr)
 {
     struct SDesc *d = &s->desc;
@@ -203,16 +217,7 @@ static MemTxResult stream_desc_load(struct Stream *s, hwaddr addr)
                                             d, sizeof *d);
     if (result != MEMTX_OK) {
         trace_xilinx_axidma_loading_desc_fail(result);
-
-        if (result == MEMTX_DECODE_ERROR) {
-            s->regs[R_DMASR] |= DMASR_DECERR;
-        } else {
-            s->regs[R_DMASR] |= DMASR_SLVERR;
-        }
-
-        s->regs[R_DMACR] &= ~DMACR_RUNSTOP;
-        s->regs[R_DMASR] |= DMASR_HALTED;
-        s->regs[R_DMASR] |= DMASR_ERR_IRQ;
+        stream_dma_error(s, result);
         return result;
     }
 
@@ -224,17 +229,24 @@ static MemTxResult stream_desc_load(struct Stream *s, hwaddr addr)
     return result;
 }
 
-static void stream_desc_store(struct Stream *s, hwaddr addr)
+static MemTxResult stream_desc_store(struct Stream *s, hwaddr addr)
 {
     struct SDesc *d = &s->desc;
+    MemTxResult result;
 
     /* Convert from host endianness into LE.  */
     d->buffer_address = cpu_to_le64(d->buffer_address);
     d->nxtdesc = cpu_to_le64(d->nxtdesc);
     d->control = cpu_to_le32(d->control);
     d->status = cpu_to_le32(d->status);
-    address_space_write(&s->dma->as, addr, MEMTXATTRS_UNSPECIFIED,
-                        d, sizeof *d);
+    result = address_space_write(&s->dma->as, addr, MEMTXATTRS_UNSPECIFIED,
+                                 d, sizeof *d);
+
+    if (result != MEMTX_OK) {
+        trace_xilinx_axidma_storing_desc_fail(result);
+        stream_dma_error(s, result);
+    }
+    return result;
 }
 
 static void stream_update_irq(struct Stream *s)
@@ -294,6 +306,7 @@ static void stream_process_mem2s(struct Stream *s, StreamSink *tx_data_dev,
     uint32_t txlen, origin_txlen;
     uint64_t addr;
     bool eop;
+    MemTxResult result;
 
     if (!stream_running(s) || stream_idle(s) || stream_halted(s)) {
         return;
@@ -322,9 +335,14 @@ static void stream_process_mem2s(struct Stream *s, StreamSink *tx_data_dev,
             unsigned int len;
 
             len = txlen > sizeof s->txbuf ? sizeof s->txbuf : txlen;
-            address_space_read(&s->dma->as, addr,
-                               MEMTXATTRS_UNSPECIFIED,
-                               s->txbuf, len);
+            result = address_space_read(&s->dma->as, addr,
+                                        MEMTXATTRS_UNSPECIFIED,
+                                        s->txbuf, len);
+            if (result != MEMTX_OK) {
+                stream_dma_error(s, result);
+                return;
+            }
+
             stream_push(tx_data_dev, s->txbuf, len, eop && len == txlen);
             txlen -= len;
             addr += len;
@@ -336,7 +354,9 @@ static void stream_process_mem2s(struct Stream *s, StreamSink *tx_data_dev,
 
         /* Update the descriptor.  */
         s->desc.status = origin_txlen | SDESC_STATUS_COMPLETE;
-        stream_desc_store(s, s->regs[R_CURDESC]);
+        if (stream_desc_store(s, s->regs[R_CURDESC]) != MEMTX_OK) {
+            break;
+        }
 
         /* Advance.  */
         prev_d = s->regs[R_CURDESC];
@@ -354,6 +374,7 @@ static size_t stream_process_s2mem(struct Stream *s, unsigned char *buf,
     uint32_t prev_d;
     unsigned int rxlen;
     size_t pos = 0;
+    MemTxResult result;
 
     if (!stream_running(s) || stream_idle(s) || stream_halted(s)) {
         return 0;
@@ -375,8 +396,13 @@ static size_t stream_process_s2mem(struct Stream *s, unsigned char *buf,
             rxlen = len;
         }
 
-        address_space_write(&s->dma->as, s->desc.buffer_address,
-                            MEMTXATTRS_UNSPECIFIED, buf + pos, rxlen);
+        result = address_space_write(&s->dma->as, s->desc.buffer_address,
+                                     MEMTXATTRS_UNSPECIFIED, buf + pos, rxlen);
+        if (result != MEMTX_OK) {
+            stream_dma_error(s, result);
+            break;
+        }
+
         len -= rxlen;
         pos += rxlen;
 
@@ -389,7 +415,10 @@ static size_t stream_process_s2mem(struct Stream *s, unsigned char *buf,
 
         s->desc.status |= s->sof << SDESC_STATUS_SOF_BIT;
         s->desc.status |= SDESC_STATUS_COMPLETE;
-        stream_desc_store(s, s->regs[R_CURDESC]);
+        result = stream_desc_store(s, s->regs[R_CURDESC]);
+        if (result != MEMTX_OK) {
+            break;
+        }
         s->sof = eop;
 
         /* Advance.  */
-- 
2.17.1


