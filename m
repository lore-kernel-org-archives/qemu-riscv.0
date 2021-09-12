Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mPPBb-0003BO-4T
	for mharc-qemu-riscv@gnu.org; Sun, 12 Sep 2021 09:06:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mPPBZ-000372-NV
 for qemu-riscv@nongnu.org; Sun, 12 Sep 2021 09:06:17 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:40635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mPPBY-0005RB-1X
 for qemu-riscv@nongnu.org; Sun, 12 Sep 2021 09:06:17 -0400
Received: by mail-pf1-x42f.google.com with SMTP id y8so917042pfa.7
 for <qemu-riscv@nongnu.org>; Sun, 12 Sep 2021 06:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JWfizEhB3tOuiDeD+/29bwrR367pDrjjWjMQQj6tggg=;
 b=FkX8g2UR+8OpoJz52jHrD8e0f/3Wk36rdKQjBTrOfqNTR0VMJeBpLrA5hGomrhag6Y
 tsFbkc+cdxeNZXLtrd6UliZBUG5xGldwIykiS6DOn8w/H1zYzGWNYl1FlL2uqISoGFH0
 6QOi9e5O2qHN8kv/w64qNLldJvsVUUJ/txQB87i9M0n6CQmFoepn0C4M3/7bIdyPPtr6
 OSwnMbwIZ9YQJnDUFTvy+osIYQ8c/1UV0SmASspY8ezbp+h1KDlvEPtOBb0kKt4NlTkk
 6jiibeOSXq4ZH5ovl8HJlTpuxVHoAcnxdgXV1L7l0DU2vv6xhyaYCoY5dMK+VraDpvBD
 MkNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JWfizEhB3tOuiDeD+/29bwrR367pDrjjWjMQQj6tggg=;
 b=friWQTvD+VozABRYFruaKKHZ4bOG3Dc9lq05qdC2uWPBEw0UtEvw3Jso71rNTrMCyN
 GuryQxXwXsg00Y85YjU88DGQgQN7vNjkHhFJ2zUafrT5dU3rnAVxgWtC/VYzDDbP5YaW
 emnGSppcb6NIBxbAiagYmpahiN/FWdwOgbZov7xEe6L33bN62RQOmuS9ZRfXxD5xT0Mu
 LH4y1vHTH6+ryUF+KY2FdHEsGxQ8/dfmxQFrWfhd+afUOTv70ZQT9vDGSyPPKdSCDqEX
 LL6GLRhHWfaqe0OgX3lohdzrdnY+FAVco1zBB4HVlQPlds3LzepygBSWR1/S/rIxqEgp
 hb6A==
X-Gm-Message-State: AOAM5328vcgvtrUpITDi49VMkCsKbeez+FP5yQlqC4r8fVRrYv4Y0K1W
 avUGtQxuCGKxLJ94GmRmQSmI4RcT21R+DMS2
X-Google-Smtp-Source: ABdhPJyp1QlUFIPZTYi8eL/TC/1hvmfW9jqIfR0xHW0P1Fj6dequbuDu1TZ6GhzGyRyx4FYa2sk1AQ==
X-Received: by 2002:a63:555c:: with SMTP id f28mr6658519pgm.340.1631451974747; 
 Sun, 12 Sep 2021 06:06:14 -0700 (PDT)
Received: from localhost.localdomain (123-193-74-252.dynamic.kbronet.com.tw.
 [123.193.74.252])
 by smtp.gmail.com with ESMTPSA id qe17sm3849565pjb.39.2021.09.12.06.06.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Sep 2021 06:06:14 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Green Wan <green.wan@sifive.com>, Frank Chang <frank.chang@sifive.com>,
 Max Hsu <max.hsu@sifive.com>, Bin Meng <bmeng.cn@gmail.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH RESEND v2 3/4] hw/dma: sifive_pdma: allow non-multiple
 transaction size transactions
Date: Sun, 12 Sep 2021 21:05:47 +0800
Message-Id: <20210912130553.179501-4-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210912130553.179501-1-frank.chang@sifive.com>
References: <20210912130553.179501-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Sun, 12 Sep 2021 13:06:17 -0000

From: Green Wan <green.wan@sifive.com>

Real PDMA is able to deal with non-multiple transaction size transactions.

The following result is PDMA tested in U-Boot on Unmatched board:

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
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Tested-by: Bin Meng <bmeng.cn@gmail.com>
Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 hw/dma/sifive_pdma.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/hw/dma/sifive_pdma.c b/hw/dma/sifive_pdma.c
index a8ce3e6699a..d7d2c53e97e 100644
--- a/hw/dma/sifive_pdma.c
+++ b/hw/dma/sifive_pdma.c
@@ -74,7 +74,7 @@ static void sifive_pdma_run(SiFivePDMAState *s, int ch)
     uint64_t dst = s->chan[ch].next_dst;
     uint64_t src = s->chan[ch].next_src;
     uint32_t config = s->chan[ch].next_config;
-    int wsize, rsize, size;
+    int wsize, rsize, size, remainder;
     uint8_t buf[64];
     int n;
 
@@ -106,11 +106,7 @@ static void sifive_pdma_run(SiFivePDMAState *s, int ch)
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
@@ -131,6 +127,14 @@ static void sifive_pdma_run(SiFivePDMAState *s, int ch)
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


