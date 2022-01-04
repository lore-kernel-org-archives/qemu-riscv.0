Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n4dPW-0000gm-Ei
	for mharc-qemu-riscv@gnu.org; Tue, 04 Jan 2022 01:35:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1n4dPS-0000fw-QA
 for qemu-riscv@nongnu.org; Tue, 04 Jan 2022 01:35:03 -0500
Received: from [2607:f8b0:4864:20::1030] (port=40907
 helo=mail-pj1-x1030.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1n4dPQ-0002Vn-R0
 for qemu-riscv@nongnu.org; Tue, 04 Jan 2022 01:35:02 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 o63-20020a17090a0a4500b001b1c2db8145so39816104pjo.5
 for <qemu-riscv@nongnu.org>; Mon, 03 Jan 2022 22:35:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9QkAX41YPjiafULqwcCrPrnUTsqrpgoVb6FMBimVUQo=;
 b=HGgFE4gJ+Ce2PTk5ntpc6WJrMAUnDuVRmYcH2MSXFuyn/z6Qs7gDGLz2QKP8DVwpDc
 7Nuk01IXGImpnTIjs2a8AaLHrbRvStAUiPeXJ6BJYuINEWZKOCGpgjOWBrGvXiYLnMhL
 W424ICqUImS6lsK392WdIuFacg0/dVRUUGUhyAaA+a9EvAtNSKoTtPOUCJ9/YAbZRuTr
 6jmgbM99S8TtHOnDHVoVJvExlMDtIC8HaJ/EsH+9W7juwefRmuoAXpZa0Dxs33RtehfS
 SuFGwME+apbSJv6KmXevawiyqPV9eNpuaioBFVKM+k1rl2R8OK7ZHP85m0CHubeVi2L4
 rTKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9QkAX41YPjiafULqwcCrPrnUTsqrpgoVb6FMBimVUQo=;
 b=oaCjZ7Do2MWrsmXsKUHhe5UFTZySSuiwgRdcKapDx/YH/8ibewC/+ZT5fZeDi8AEnA
 qSoZOdjV/GUwdYZtPiuzP1LPlvdxT8QVDBGSLDKUoGBnIQKChTxb9xBG0HnbVI20/l+0
 TNQ3CF+F5ussbBon2SJlcCHleraMNJgZChwxw094r/EvwXvSJlrSRDoVW7h+m1iXupvt
 b1CBj32TNIYy5iS4/DYsYPVfUEwY8ono5O0gRbT0jrAxUHZIyDvhgXFVufryiPO3lnVR
 jStzPoQvLytV04jY6KQn/1yG+VBtSetDCJMp3vpEWc4gK1+ckd2nYlRmersY7+DBjZ7T
 u4Iw==
X-Gm-Message-State: AOAM5305AaCJB6+Oq03DNEtamQc3Tvyjcd0nB6C39iGvvW2FfgoxPyBp
 gnjB/KFfMz3nVS+Lawl6zfaOcA==
X-Google-Smtp-Source: ABdhPJxZ/HhcOQLolXgFraDLDSYTHlDHKUYUu+Wfu4mpgPcZhTz0eOq1KrTKuBX5dCnMcsHiJ6VU7A==
X-Received: by 2002:a17:903:22c2:b0:148:fcc0:aae8 with SMTP id
 y2-20020a17090322c200b00148fcc0aae8mr48723131plg.148.1641278099495; 
 Mon, 03 Jan 2022 22:34:59 -0800 (PST)
Received: from jimshu-VirtualBox.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id b65sm39371533pfg.209.2022.01.03.22.34.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jan 2022 22:34:59 -0800 (PST)
From: Jim Shu <jim.shu@sifive.com>
To: Alistair.Francis@wdc.com, bin.meng@windriver.com, palmer@dabbelt.com,
 frank.chang@sifive.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: Jim Shu <jim.shu@sifive.com>, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bmeng.cn@gmail.com>
Subject: [PATCH v2 1/2] hw/dma: sifive_pdma: support high 32-bit access of
 64-bit register
Date: Tue,  4 Jan 2022 14:34:07 +0800
Message-Id: <20220104063408.658169-2-jim.shu@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220104063408.658169-1-jim.shu@sifive.com>
References: <20220104063408.658169-1-jim.shu@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1030
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=jim.shu@sifive.com; helo=mail-pj1-x1030.google.com
X-Spam_score_int: 6
X-Spam_score: 0.6
X-Spam_bar: /
X-Spam_report: (0.6 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Tue, 04 Jan 2022 06:35:04 -0000

Real PDMA supports high 32-bit read/write memory access of 64-bit
register.

The following result is PDMA tested in U-Boot on Unmatched board:

1. Real PDMA allows high 32-bit read/write to 64-bit register.
=> mw.l 0x3000000 0x0                      <= Disclaim channel 0
=> mw.l 0x3000000 0x1                      <= Claim channel 0
=> mw.l 0x3000010 0x80000000               <= Write low 32-bit NextDest (NextDest = 0x280000000)
=> mw.l 0x3000014 0x2                      <= Write high 32-bit NextDest
=> md.l 0x3000010 1                        <= Dump low 32-bit NextDest
03000010: 80000000
=> md.l 0x3000014 1                        <= Dump high 32-bit NextDest
03000014: 00000002
=> mw.l 0x3000018 0x80001000               <= Write low 32-bit NextSrc (NextSrc = 0x280001000)
=> mw.l 0x300001c 0x2                      <= Write high 32-bit NextSrc
=> md.l 0x3000018 1                        <= Dump low 32-bit NextSrc
03000010: 80001000
=> md.l 0x300001c 1                        <= Dump high 32-bit NextSrc
03000014: 00000002

2. PDMA transfer from 0x280001000 to 0x280000000 is OK.
=> mw.q 0x3000008 0x4                      <= NextBytes = 4
=> mw.l 0x3000004 0x22000000               <= wsize = rsize = 2 (2^2 = 4 bytes)
=> mw.l 0x280000000 0x87654321             <= Fill test data to dst
=> mw.l 0x280001000 0x12345678             <= Fill test data to src
=> md.l 0x280000000 1; md.l 0x280001000 1  <= Dump src/dst memory contents
280000000: 87654321                              !Ce.
280001000: 12345678                              xV4.
=> md.l 0x3000000 8                        <= Dump PDMA status
03000000: 00000001 22000000 00000004 00000000    ......."........
03000010: 80000000 00000002 80001000 00000002    ................
=> mw.l 0x3000000 0x3                      <= Set channel 0 run and claim bits
=> md.l 0x3000000 8                        <= Dump PDMA status
03000000: 40000001 22000000 00000004 00000000    ...@..."........
03000010: 80000000 00000002 80001000 00000002    ................
=> md.l 0x280000000 1; md.l 0x280001000 1  <= Dump src/dst memory contents
280000000: 12345678                               xV4.
280001000: 12345678                               xV4.

Signed-off-by: Jim Shu <jim.shu@sifive.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Tested-by: Bin Meng <bmeng.cn@gmail.com>
---
 hw/dma/sifive_pdma.c | 177 +++++++++++++++++++++++++++++++++++++------
 1 file changed, 155 insertions(+), 22 deletions(-)

diff --git a/hw/dma/sifive_pdma.c b/hw/dma/sifive_pdma.c
index 85fe34f5f3..f4df16449b 100644
--- a/hw/dma/sifive_pdma.c
+++ b/hw/dma/sifive_pdma.c
@@ -177,18 +177,44 @@ static inline void sifive_pdma_update_irq(SiFivePDMAState *s, int ch)
     s->chan[ch].state = DMA_CHAN_STATE_IDLE;
 }
 
-static uint64_t sifive_pdma_read(void *opaque, hwaddr offset, unsigned size)
+static uint64_t sifive_pdma_readq(SiFivePDMAState *s, int ch, hwaddr offset)
 {
-    SiFivePDMAState *s = opaque;
-    int ch = SIFIVE_PDMA_CHAN_NO(offset);
     uint64_t val = 0;
 
-    if (ch >= SIFIVE_PDMA_CHANS) {
-        qemu_log_mask(LOG_GUEST_ERROR, "%s: Invalid channel no %d\n",
-                      __func__, ch);
-        return 0;
+    offset &= 0xfff;
+    switch (offset) {
+    case DMA_NEXT_BYTES:
+        val = s->chan[ch].next_bytes;
+        break;
+    case DMA_NEXT_DST:
+        val = s->chan[ch].next_dst;
+        break;
+    case DMA_NEXT_SRC:
+        val = s->chan[ch].next_src;
+        break;
+    case DMA_EXEC_BYTES:
+        val = s->chan[ch].exec_bytes;
+        break;
+    case DMA_EXEC_DST:
+        val = s->chan[ch].exec_dst;
+        break;
+    case DMA_EXEC_SRC:
+        val = s->chan[ch].exec_src;
+        break;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Unexpected 64-bit access to 0x%" HWADDR_PRIX "\n",
+                      __func__, offset);
+        break;
     }
 
+    return val;
+}
+
+static uint32_t sifive_pdma_readl(SiFivePDMAState *s, int ch, hwaddr offset)
+{
+    uint32_t val = 0;
+
     offset &= 0xfff;
     switch (offset) {
     case DMA_CONTROL:
@@ -198,28 +224,47 @@ static uint64_t sifive_pdma_read(void *opaque, hwaddr offset, unsigned size)
         val = s->chan[ch].next_config;
         break;
     case DMA_NEXT_BYTES:
-        val = s->chan[ch].next_bytes;
+        val = extract64(s->chan[ch].next_bytes, 0, 32);
+        break;
+    case DMA_NEXT_BYTES + 4:
+        val = extract64(s->chan[ch].next_bytes, 32, 32);
         break;
     case DMA_NEXT_DST:
-        val = s->chan[ch].next_dst;
+        val = extract64(s->chan[ch].next_dst, 0, 32);
+        break;
+    case DMA_NEXT_DST + 4:
+        val = extract64(s->chan[ch].next_dst, 32, 32);
         break;
     case DMA_NEXT_SRC:
-        val = s->chan[ch].next_src;
+        val = extract64(s->chan[ch].next_src, 0, 32);
+        break;
+    case DMA_NEXT_SRC + 4:
+        val = extract64(s->chan[ch].next_src, 32, 32);
         break;
     case DMA_EXEC_CONFIG:
         val = s->chan[ch].exec_config;
         break;
     case DMA_EXEC_BYTES:
-        val = s->chan[ch].exec_bytes;
+        val = extract64(s->chan[ch].exec_bytes, 0, 32);
+        break;
+    case DMA_EXEC_BYTES + 4:
+        val = extract64(s->chan[ch].exec_bytes, 32, 32);
         break;
     case DMA_EXEC_DST:
-        val = s->chan[ch].exec_dst;
+        val = extract64(s->chan[ch].exec_dst, 0, 32);
+        break;
+    case DMA_EXEC_DST + 4:
+        val = extract64(s->chan[ch].exec_dst, 32, 32);
         break;
     case DMA_EXEC_SRC:
-        val = s->chan[ch].exec_src;
+        val = extract64(s->chan[ch].exec_src, 0, 32);
+        break;
+    case DMA_EXEC_SRC + 4:
+        val = extract64(s->chan[ch].exec_src, 32, 32);
         break;
     default:
-        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset 0x%" HWADDR_PRIX "\n",
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Unexpected 32-bit access to 0x%" HWADDR_PRIX "\n",
                       __func__, offset);
         break;
     }
@@ -227,19 +272,66 @@ static uint64_t sifive_pdma_read(void *opaque, hwaddr offset, unsigned size)
     return val;
 }
 
-static void sifive_pdma_write(void *opaque, hwaddr offset,
-                              uint64_t value, unsigned size)
+static uint64_t sifive_pdma_read(void *opaque, hwaddr offset, unsigned size)
 {
     SiFivePDMAState *s = opaque;
     int ch = SIFIVE_PDMA_CHAN_NO(offset);
-    bool claimed, run;
+    uint64_t val = 0;
 
     if (ch >= SIFIVE_PDMA_CHANS) {
         qemu_log_mask(LOG_GUEST_ERROR, "%s: Invalid channel no %d\n",
                       __func__, ch);
-        return;
+        return 0;
+    }
+
+    switch (size) {
+    case 8:
+        val = sifive_pdma_readq(s, ch, offset);
+        break;
+    case 4:
+        val = sifive_pdma_readl(s, ch, offset);
+        break;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Invalid read size %u to PDMA\n",
+                      __func__, size);
+        return 0;
     }
 
+    return val;
+}
+
+static void sifive_pdma_writeq(SiFivePDMAState *s, int ch,
+                               hwaddr offset, uint64_t value)
+{
+    offset &= 0xfff;
+    switch (offset) {
+    case DMA_NEXT_BYTES:
+        s->chan[ch].next_bytes = value;
+        break;
+    case DMA_NEXT_DST:
+        s->chan[ch].next_dst = value;
+        break;
+    case DMA_NEXT_SRC:
+        s->chan[ch].next_src = value;
+        break;
+    case DMA_EXEC_BYTES:
+    case DMA_EXEC_DST:
+    case DMA_EXEC_SRC:
+        /* these are read-only registers */
+        break;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Unexpected 64-bit access to 0x%" HWADDR_PRIX "\n",
+                      __func__, offset);
+        break;
+    }
+}
+
+static void sifive_pdma_writel(SiFivePDMAState *s, int ch,
+                               hwaddr offset, uint32_t value)
+{
+    bool claimed, run;
+
     offset &= 0xfff;
     switch (offset) {
     case DMA_CONTROL:
@@ -282,27 +374,68 @@ static void sifive_pdma_write(void *opaque, hwaddr offset,
         s->chan[ch].next_config = value;
         break;
     case DMA_NEXT_BYTES:
-        s->chan[ch].next_bytes = value;
+        s->chan[ch].next_bytes =
+            deposit64(s->chan[ch].next_bytes, 0, 32, value);
+        break;
+    case DMA_NEXT_BYTES + 4:
+        s->chan[ch].next_bytes =
+            deposit64(s->chan[ch].next_bytes, 32, 32, value);
         break;
     case DMA_NEXT_DST:
-        s->chan[ch].next_dst = value;
+        s->chan[ch].next_dst = deposit64(s->chan[ch].next_dst, 0, 32, value);
+        break;
+    case DMA_NEXT_DST + 4:
+        s->chan[ch].next_dst = deposit64(s->chan[ch].next_dst, 32, 32, value);
         break;
     case DMA_NEXT_SRC:
-        s->chan[ch].next_src = value;
+        s->chan[ch].next_src = deposit64(s->chan[ch].next_src, 0, 32, value);
+        break;
+    case DMA_NEXT_SRC + 4:
+        s->chan[ch].next_src = deposit64(s->chan[ch].next_src, 32, 32, value);
         break;
     case DMA_EXEC_CONFIG:
     case DMA_EXEC_BYTES:
+    case DMA_EXEC_BYTES + 4:
     case DMA_EXEC_DST:
+    case DMA_EXEC_DST + 4:
     case DMA_EXEC_SRC:
+    case DMA_EXEC_SRC + 4:
         /* these are read-only registers */
         break;
     default:
-        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset 0x%" HWADDR_PRIX "\n",
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Unexpected 32-bit access to 0x%" HWADDR_PRIX "\n",
                       __func__, offset);
         break;
     }
 }
 
+static void sifive_pdma_write(void *opaque, hwaddr offset,
+                              uint64_t value, unsigned size)
+{
+    SiFivePDMAState *s = opaque;
+    int ch = SIFIVE_PDMA_CHAN_NO(offset);
+
+    if (ch >= SIFIVE_PDMA_CHANS) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Invalid channel no %d\n",
+                      __func__, ch);
+        return;
+    }
+
+    switch (size) {
+    case 8:
+        sifive_pdma_writeq(s, ch, offset, value);
+        break;
+    case 4:
+        sifive_pdma_writel(s, ch, offset, (uint32_t) value);
+        break;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Invalid write size %u to PDMA\n",
+                      __func__, size);
+        break;
+    }
+}
+
 static const MemoryRegionOps sifive_pdma_ops = {
     .read = sifive_pdma_read,
     .write = sifive_pdma_write,
-- 
2.25.1


