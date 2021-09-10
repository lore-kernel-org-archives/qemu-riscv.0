Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mOZWq-0007aw-42
	for mharc-qemu-riscv@gnu.org; Fri, 10 Sep 2021 01:56:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mOZWm-0007Y6-Vi
 for qemu-riscv@nongnu.org; Fri, 10 Sep 2021 01:56:45 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:39824)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mOZWi-0002Qu-VO
 for qemu-riscv@nongnu.org; Fri, 10 Sep 2021 01:56:44 -0400
Received: by mail-pg1-x52f.google.com with SMTP id g184so868076pgc.6
 for <qemu-riscv@nongnu.org>; Thu, 09 Sep 2021 22:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/kfYupI4luyxYQHnvH9qyv36mrOPDMHslZYxILJ0WHM=;
 b=LxdWXNsO6WzkFuL07dWRleCmjv9HLmAFDo9ZnVlNfQRi7LlEA/L7nUhFGbs1FEIqPd
 HhC2DBFzcf2n6KK8Xfo6ObXkV86OO9okA8GYIyJoXsaWc9ZugBer4NaITsrDRqGxexAV
 21pwjvzk4+rN7RtHSdhBZjVp66GwY5M5FwGVbCiRwHHZ8ejg3d+CJokIUIwMqJ3kM19e
 cIZnpk7a26P6KjNcQwOZDJHloDP3iadfs0AFiM1pEnvKfZmorkh1vqdqeO6SpAyxEfFz
 khJfF2sGZL5tmPwxJUFETdxTLtvbdDdr1QAU1PVRmQZTQdi9rCHiIAz2OC30qixn1/fr
 RgXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/kfYupI4luyxYQHnvH9qyv36mrOPDMHslZYxILJ0WHM=;
 b=Nm5hWgR0jbvex3Q4Xe/JzpDIAWPhwJSSGO3iTBI+xBmBipV8rLANNcOA0p96ECa2jF
 ut71Sl0oHhiza/RrQSDPmOT6LMccX0rEw/89IMYv7GubkkWT6ZUV06b2hi5JicvnbOoV
 UsIQEvVEnoaiJi3onw7E5TB5KsZJF67Y8TzHLrGNPzFcjuG8hMTcQgR9KTtjNdsfYDcL
 67fpnKhVgPlKuYFuZ9niSIrtJ8gGF+2qpiUI4SFkuGV1sGWma24vUrWvL7CI5uRQGlCz
 8yPoDiWBFrBhahOYLbfV1A9wDrXRepyaOPUj8HNCnawYRtpD1mNrnDJ+c5nr0uuf/hlM
 H7Gg==
X-Gm-Message-State: AOAM533fFciD97x14XDe9VX1ZLAgKYSB8BgiaN8lybe3m96WSAzdEJ8X
 yPRubjlrj5ohGMhPpcEgHtV9oA==
X-Google-Smtp-Source: ABdhPJy85hbkqqsx+c+2BiJmPxBqqza0qbdKnz/Y6fDOvFO5tnQiSVolUhH07dbRvOgiqzjNNnf5SQ==
X-Received: by 2002:a05:6a00:a10:b0:412:448c:89c7 with SMTP id
 p16-20020a056a000a1000b00412448c89c7mr6556277pfh.83.1631253399685; 
 Thu, 09 Sep 2021 22:56:39 -0700 (PDT)
Received: from localhost.localdomain (123-193-74-252.dynamic.kbronet.com.tw.
 [123.193.74.252])
 by smtp.gmail.com with ESMTPSA id v17sm3739101pff.6.2021.09.09.22.56.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Sep 2021 22:56:39 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Green Wan <green.wan@sifive.com>, Frank Chang <frank.chang@sifive.com>,
 Max Hsu <max.hsu@sifive.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH 3/4] hw/dma: sifive_pdma: allow non-multiple transaction size
 transactions
Date: Fri, 10 Sep 2021 13:56:15 +0800
Message-Id: <20210910055620.946625-4-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210910055620.946625-1-frank.chang@sifive.com>
References: <20210910055620.946625-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 10 Sep 2021 05:56:46 -0000

From: Green Wan <green.wan@sifive.com>

Real PDMA is able to deal with non-multiple transaction size transactions.

The following result is PDMA tested in U-boot on Unmatched board:

=> mw.l 0x3000000 0x0                      <= Disclaim channel 0
=> mw.l 0x3000000 0x1                      <= Claim channel 0
=> mw.l 0x3000004 0x11000000               <= wsize = rsize = 1 (2^1 = 2 bytes)
=> mw.q 0x3000008 0x3                      <= NextBytes = 3
=> mw.q 0x3000010 0x84000000               <= NextDestination = 0x84000000
=> mw.q 0x3000018 0x84001000               <= NextSource = 0x84001000
=> mw.l 0x84000000 0x87654321              <= Fill test data to dst
=> mw.l 0x84001000 0x12345678              <= Fill test data to src
=> md.l 0x84000000 1; md.l 0x84001000 1    <= Dump src/dst memory contents
84000000: 87654321                               !Ce.
84001000: 12345678                               xV4.
=> md.l 0x3000000 8                        <= Dump PDMA status
03000000: 00000001 11000000 00000003 00000000    ................
03000010: 84000000 00000000 84001000 00000000    ................
=> mw.l 0x3000000 0x3                      <= Set channel 0 run and claim bits
=> md.l 0x3000000 8                        <= Dump PDMA status
03000000: 40000001 11000000 00000003 00000000    ...@............
03000010: 84000000 00000000 84001000 00000000    ................
=> md.l 0x84000000 1; md.l 0x84001000 1    <= Dump src/dst memory contents
84000000: 87345678                               xV4.
84001000: 12345678                               xV4.

Signed-off-by: Green Wan <green.wan@sifive.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Tested-by: Max Hsu <max.hsu@sifive.com>
Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 hw/dma/sifive_pdma.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/hw/dma/sifive_pdma.c b/hw/dma/sifive_pdma.c
index 1311b80a5cd..d6980fbbd62 100644
--- a/hw/dma/sifive_pdma.c
+++ b/hw/dma/sifive_pdma.c
@@ -70,7 +70,7 @@ static void sifive_pdma_run(SiFivePDMAState *s, int ch)
     uint64_t dst = s->chan[ch].next_dst;
     uint64_t src = s->chan[ch].next_src;
     uint32_t config = s->chan[ch].next_config;
-    int wsize, rsize, size;
+    int wsize, rsize, size, remainder;
     uint8_t buf[64];
     int n;
 
@@ -102,11 +102,7 @@ static void sifive_pdma_run(SiFivePDMAState *s, int ch)
         size = 6;
     }
     size = 1 << size;
-
-    /* the bytes to transfer should be multiple of transaction size */
-    if (bytes % size) {
-        goto error;
-    }
+    remainder = bytes % size;
 
     /* indicate a DMA transfer is started */
     s->chan[ch].state = DMA_CHAN_STATE_STARTED;
@@ -127,6 +123,14 @@ static void sifive_pdma_run(SiFivePDMAState *s, int ch)
         s->chan[ch].exec_bytes -= size;
     }
 
+    if (remainder) {
+        cpu_physical_memory_read(s->chan[ch].exec_src, buf, remainder);
+        cpu_physical_memory_write(s->chan[ch].exec_dst, buf, remainder);
+        s->chan[ch].exec_src += remainder;
+        s->chan[ch].exec_dst += remainder;
+        s->chan[ch].exec_bytes -= remainder;
+    }
+
     /* indicate a DMA transfer is done */
     s->chan[ch].state = DMA_CHAN_STATE_DONE;
     s->chan[ch].control &= ~CONTROL_RUN;
-- 
2.25.1


