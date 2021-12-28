Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n20kO-000815-Rc
	for mharc-qemu-riscv@gnu.org; Mon, 27 Dec 2021 19:53:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1n20kL-0007xu-65
 for qemu-riscv@nongnu.org; Mon, 27 Dec 2021 19:53:45 -0500
Received: from [2607:f8b0:4864:20::52e] (port=37507
 helo=mail-pg1-x52e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1n20kH-0002qT-W2
 for qemu-riscv@nongnu.org; Mon, 27 Dec 2021 19:53:43 -0500
Received: by mail-pg1-x52e.google.com with SMTP id a23so14676839pgm.4
 for <qemu-riscv@nongnu.org>; Mon, 27 Dec 2021 16:53:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=g5IXxi+MTJvB2rpocscSQO5j/XA/3WUTCgLl05fxK/4=;
 b=jSIC7cSbx0CX0xZ03uAAKAvIqlAM5vZUn8e/bez6RfFrRbW1ReVszy5hE3ib89scYQ
 G/LWM0loNa3dAVPc7WgYqZSAjhyIEXQiiOx2I3GDjv35VF3x+wsq4UvNEZXkbi0ucpdL
 +9EHg86+xoySvvYf0rngJSuO2u7PezotSo8piHmog4yav8THyxFWupGcqK8p0hHpikU8
 f5p+sbo5vWGDufJxRUeQa+pkmVgGTUN8TK4ymQIOPhPQzQ0h9nR7Gpzpyr1YW7Y407ov
 ejKkmg8XkyhglXEC6+dheRWgJMzn01drP9HeB96KRPGoGfklUGu2i9m+8O0buEPfKIhn
 cJcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=g5IXxi+MTJvB2rpocscSQO5j/XA/3WUTCgLl05fxK/4=;
 b=NEcluU+RA3b4TiEj4JZXgljleNDZDc+Rs6VhMp5rfxT7NrXiRU5gHnL0P9WI30Gi6Q
 DVVfIDDPtUsT0U+be70Od0hKeeNyxmjzpdqa8+AjkyES97TeFGZ5kT84wiHAhDAALHBD
 rLEJ7aBHLkzLZ2MgM/kB+NtNJ+ajbkr1fE90gJe51EFWCAbL5r/OGce27nD2cIlXeS6I
 vCqPLw4BLLDBbePz2y3GxvTAuv5KusETe6BOYerv7yeRs1SHl57D8l1CznJKlgr1isVl
 Xx2o6GHBUbHtG240FoNa0ziFv7zb3KIO2aJL57z4Z/OqLbF47bxIVV/dJuROE7NGLfKx
 nCoA==
X-Gm-Message-State: AOAM533m7JTgIxQWhpWBFF5JRDAbTG78vdLz4JS6yU5NJV0ycMOZKaMl
 UP1+ysFzGtcW7xOZ30OloWUDVg==
X-Google-Smtp-Source: ABdhPJzBftlR+OCIleyxfweLHcTGNd9+rjtDgG6qY9Icb6jUl5nt6TU+viZIT80isAwBr+49YLtGTQ==
X-Received: by 2002:a05:6a00:181e:b0:4ba:b71e:2126 with SMTP id
 y30-20020a056a00181e00b004bab71e2126mr19934272pfa.13.1640652820766; 
 Mon, 27 Dec 2021 16:53:40 -0800 (PST)
Received: from localhost.localdomain (1-169-192-165.dynamic-ip.hinet.net.
 [1.169.192.165])
 by smtp.gmail.com with ESMTPSA id t27sm19266587pfg.41.2021.12.27.16.53.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Dec 2021 16:53:40 -0800 (PST)
From: Jim Shu <jim.shu@sifive.com>
To: Alistair.Francis@wdc.com, bin.meng@windriver.com, palmer@dabbelt.com,
 frank.chang@sifive.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: Jim Shu <jim.shu@sifive.com>
Subject: [PATCH 1/2] hw/dma: sifive_pdma: support high 32-bit access of 64-bit
 register
Date: Tue, 28 Dec 2021 08:52:35 +0800
Message-Id: <20211228005236.415583-2-jim.shu@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211228005236.415583-1-jim.shu@sifive.com>
References: <20211228005236.415583-1-jim.shu@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=jim.shu@sifive.com; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Tue, 28 Dec 2021 00:53:45 -0000

Real PDMA support high 32-bit read/write memory access of 64-bit
register.

The following result is PDMA tested in U-Boot on Unmatched board:

1. Real PDMA is allowed high 32-bit read/write to 64-bit register.
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
---
 hw/dma/sifive_pdma.c | 174 +++++++++++++++++++++++++++++++++++++------
 1 file changed, 152 insertions(+), 22 deletions(-)

diff --git a/hw/dma/sifive_pdma.c b/hw/dma/sifive_pdma.c
index 85fe34f5f3..b8b198ab4e 100644
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
@@ -282,13 +374,24 @@ static void sifive_pdma_write(void *opaque, hwaddr offset,
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
@@ -297,12 +400,39 @@ static void sifive_pdma_write(void *opaque, hwaddr offset,
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


