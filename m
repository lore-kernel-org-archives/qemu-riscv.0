Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mOZWl-0007VM-ES
	for mharc-qemu-riscv@gnu.org; Fri, 10 Sep 2021 01:56:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mOZWg-0007Ss-Rm
 for qemu-riscv@nongnu.org; Fri, 10 Sep 2021 01:56:38 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:33514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mOZWa-0002EP-BV
 for qemu-riscv@nongnu.org; Fri, 10 Sep 2021 01:56:38 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 mi6-20020a17090b4b4600b00199280a31cbso620388pjb.0
 for <qemu-riscv@nongnu.org>; Thu, 09 Sep 2021 22:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vlSo0PzjSFDdQC+eNe3BvcniCYCo3WbCGNs2dWZA46I=;
 b=ILz3Z3oHWz22T8O93YFbmMzfkZr3GXGU0hsbBreJ+rubc1nKdNU1RwuyfL52ZwMW5a
 KihXBpvh2VGWs493mz8Lno31BKO624kgEpbyrwxSJQXndOPzPZKY/DwTRfAd4rcRIwJ7
 rfftFziXn5uH9mCptyCEeeFW1yPcHDdMqzsLuETcB1sQuHxaqK7kb5HyIocxdyDX5D5C
 r8r0lrzV6oQ+4Ro7i2562D+p3qES27jSWwpYpg2T+BFfodIlPR83YoQlDWJqgCPY/DyM
 Vshd+gPrJ0ipCZzXC6wiix0lbfXBd75MZylFAMfs37qDmUOsRXRXWAQcwje+DbGIm0Zw
 4amA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vlSo0PzjSFDdQC+eNe3BvcniCYCo3WbCGNs2dWZA46I=;
 b=1NAlA+kn/ERC0dSEIIPtAMDjElrHOAwKAK0zGceD/xXI7YA8dQu4hXSzg3tjAlP9Lj
 NyIq4MkmSwnPrf3VXj8lPiBQvGOM1Tl8rH6v5npK2XHpdcIGao1ZD42YKP+4xToqxcHB
 KWW/kT1jcQRLMHDp0Jz0uMxdMImlAynejF47JlDzs5SYTw7YhI9OccK1I8xn2OaX+qFO
 mSAYvVKRyrfvqMTjbxEwpb6kaYN2demtmQIztMC9WKAuNacECOzri8DoR4GdKuCp2Xkl
 Otm9O2Sc+Zp+dibNyYmmGOuRXp+pU+mI8aRCZmDApyfFgvTGQuaGdJoVyhCOrDRXM7b0
 3UrQ==
X-Gm-Message-State: AOAM530dPRjoxZ54ZlB9G5HJdAvr/GdSlXmb+IGRu4zKCXF1jug8AlcG
 gagaCpfBs0VX9hYCft42y5Kplg==
X-Google-Smtp-Source: ABdhPJxZt5i0OufSDSEvo1Dwm8WEgm49Zx9T2oHCGjmOUm9JkKLB+qqehsgt8Kl83wYkuCNjqD3+vw==
X-Received: by 2002:a17:90b:4d85:: with SMTP id
 oj5mr1952511pjb.41.1631253391186; 
 Thu, 09 Sep 2021 22:56:31 -0700 (PDT)
Received: from localhost.localdomain (123-193-74-252.dynamic.kbronet.com.tw.
 [123.193.74.252])
 by smtp.gmail.com with ESMTPSA id v17sm3739101pff.6.2021.09.09.22.56.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Sep 2021 22:56:30 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Max Hsu <max.hsu@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH 1/4] hw/dma: sifive_pdma: reset Next* registers when
 Control.claim is set
Date: Fri, 10 Sep 2021 13:56:13 +0800
Message-Id: <20210910055620.946625-2-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210910055620.946625-1-frank.chang@sifive.com>
References: <20210910055620.946625-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 10 Sep 2021 05:56:39 -0000

From: Frank Chang <frank.chang@sifive.com>

Setting Control.claim clears all of the chanel's Next registers.
This is effective only when Control.claim is set from 0 to 1.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Tested-by: Max Hsu <max.hsu@sifive.com>
---
 hw/dma/sifive_pdma.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/hw/dma/sifive_pdma.c b/hw/dma/sifive_pdma.c
index 9b2ac2017d9..e723db9d700 100644
--- a/hw/dma/sifive_pdma.c
+++ b/hw/dma/sifive_pdma.c
@@ -54,6 +54,9 @@
 #define DMA_EXEC_DST        0x110
 #define DMA_EXEC_SRC        0x118
 
+#define CONFIG_WRSZ_DEFAULT 6
+#define CONFIG_RDSZ_DEFAULT 6
+
 enum dma_chan_state {
     DMA_CHAN_STATE_IDLE,
     DMA_CHAN_STATE_STARTED,
@@ -221,6 +224,7 @@ static void sifive_pdma_write(void *opaque, hwaddr offset,
 {
     SiFivePDMAState *s = opaque;
     int ch = SIFIVE_PDMA_CHAN_NO(offset);
+    bool claimed;
 
     if (ch >= SIFIVE_PDMA_CHANS) {
         qemu_log_mask(LOG_GUEST_ERROR, "%s: Invalid channel no %d\n",
@@ -231,6 +235,17 @@ static void sifive_pdma_write(void *opaque, hwaddr offset,
     offset &= 0xfff;
     switch (offset) {
     case DMA_CONTROL:
+        claimed = !!s->chan[ch].control & CONTROL_CLAIM;
+
+        if (!claimed && (value & CONTROL_CLAIM)) {
+            /* reset Next* registers */
+            s->chan[ch].next_config = (CONFIG_RDSZ_DEFAULT << CONFIG_RDSZ_SHIFT) |
+                                      (CONFIG_WRSZ_DEFAULT << CONFIG_WRSZ_SHIFT);
+            s->chan[ch].next_bytes = 0;
+            s->chan[ch].next_dst = 0;
+            s->chan[ch].next_src = 0;
+        }
+
         s->chan[ch].control = value;
 
         if (value & CONTROL_RUN) {
-- 
2.25.1


