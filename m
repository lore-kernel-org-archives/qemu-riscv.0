Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mOZWm-0007Y3-Kt
	for mharc-qemu-riscv@gnu.org; Fri, 10 Sep 2021 01:56:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mOZWg-0007SJ-IL
 for qemu-riscv@nongnu.org; Fri, 10 Sep 2021 01:56:38 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:37839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mOZWe-0002LJ-Vo
 for qemu-riscv@nongnu.org; Fri, 10 Sep 2021 01:56:38 -0400
Received: by mail-pg1-x532.google.com with SMTP id 17so877738pgp.4
 for <qemu-riscv@nongnu.org>; Thu, 09 Sep 2021 22:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FDLzGUOT6C8RfO+UO6QhrMPhIy0i56XefPIavUICbBo=;
 b=ljWj/BM33cT+TsQBFb/KjacYm0VfCaKCKPDzYmZj2VCo9hzjEM7zcr3o3dt6jblgz/
 rtZuZh68KS7h2uWlhMrfdgfbltkilJO0ewieKxnd/UBJ21tzT3jQ3T0vZ/JPn6b9xpOh
 0wXhYhVblBYo+1aeEipHTwO1eSxy/InBw36lfkrHVbz8EizJEx3diE2EEHRWRWQkwSRf
 jeERVMVhFvkFIuaiXB1YCwoFTYaEDj6AcCAfjw5MYWAq7zk8GrM1K+0vm6NTieoU6F/a
 gaBN3geaeQxCYc57yllyHu0pXlUNOIGLKLI2z2TDJ8QUSgEZEqLmitmMzE39+BxbfsGw
 5mdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FDLzGUOT6C8RfO+UO6QhrMPhIy0i56XefPIavUICbBo=;
 b=tGP6UJPUI0VVl6au0UHUxboeuRh/JdgUtzIT4QOlyRGj7IpEnoy+oi8uc4O+hVMCAt
 ncnGIFxbftE3SRVha6ef269ZHyftBe7zJp5yTjn4mGoS9ERoVD2NRwkZ1cX7E6wngHs+
 lQLzDeHchqS8nDpRrtaofNwTh7JqonsGl+I2zoA7lvN38pI9WOix6J9wGpMoR5hl7FgJ
 zPEvUMSnKz2nQfJsh0JwnCzU73bawUdSlwSwoQ9aYvGlk8B6RtNdii7vMbybmv72FOXF
 M5ws27kkOm/MgzNAyhO7BvVTD3G/+7rOYWG7LwMPGYqDaxzWoO424WHIuScSV3YQDKXb
 uURA==
X-Gm-Message-State: AOAM53256Rl9CJKDcTtOlVxq3dPZxfTq70NSkM+fLgn3jNvRrjaJw8ZB
 UbL6atfXRkzlBPjNFCUnwuNdbw==
X-Google-Smtp-Source: ABdhPJzyw/YkbGj0eLNS8lWlRG4uoEazA4n7ik72ETGWuAICvayRN+QTCs8AVJYF2O693jJSHsGVUg==
X-Received: by 2002:a63:4384:: with SMTP id q126mr5931242pga.1.1631253395683; 
 Thu, 09 Sep 2021 22:56:35 -0700 (PDT)
Received: from localhost.localdomain (123-193-74-252.dynamic.kbronet.com.tw.
 [123.193.74.252])
 by smtp.gmail.com with ESMTPSA id v17sm3739101pff.6.2021.09.09.22.56.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Sep 2021 22:56:35 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Max Hsu <max.hsu@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH 2/4] hw/dma: sifive_pdma: claim bit must be set before DMA
 transactions
Date: Fri, 10 Sep 2021 13:56:14 +0800
Message-Id: <20210910055620.946625-3-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210910055620.946625-1-frank.chang@sifive.com>
References: <20210910055620.946625-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x532.google.com
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
X-List-Received-Date: Fri, 10 Sep 2021 05:56:38 -0000

From: Frank Chang <frank.chang@sifive.com>

Real PDMA must have Control.claim bit to be set before
Control.run bit is set to start any DMA transactions.
Otherwise nothing will be transferred.

The following result is PDMA tested in U-boot on Unmatched board:

=> mw.l 0x3000000 0x0                      <= Disclaim channel 0
                                              (Channel 0 is not claimed)
=> mw.l 0x3000004 0x55000000               <= wsize = rsize = 5 (2^5 = 32 bytes)
=> mw.q 0x3000008 0x2                      <= NextBytes = 2
=> mw.q 0x3000010 0x84000000               <= NextDestination = 0x84000000
=> mw.q 0x3000018 0x84001000               <= NextSource = 0x84001000
=> mw.l 0x84000000 0x87654321              <= Fill test data to dst
=> mw.l 0x84001000 0x12345678              <= Fill test data to src
=> md.l 0x84000000 1; md.l 0x84001000 1    <= Dump src/dst memory contents
84000000: 87654321                               !Ce.
84001000: 12345678                               xV4.
=> md.l 0x3000000 8                        <= Dump PDMA status
03000000: 00000000 55000000 00000002 00000000    .......U........
03000010: 84000000 00000000 84001000 00000000    ................
=> mw.l 0x3000000 0x3                      <= Set channel 0 run and claim bits
=> md.l 0x3000000 8                        <= Dump PDMA status
03000000: 00000001 66000000 00000000 00000000    .......f........
03000010: 00000000 00000000 00000000 00000000    ................
=> md.l 0x84000000 1; md.l 0x84001000 1    <= Dump src/dst memory contents
84000000: 87654321                               !Ce.
84001000: 12345678                               xV4.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Tested-by: Max Hsu <max.hsu@sifive.com>
---
 hw/dma/sifive_pdma.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/hw/dma/sifive_pdma.c b/hw/dma/sifive_pdma.c
index e723db9d700..1311b80a5cd 100644
--- a/hw/dma/sifive_pdma.c
+++ b/hw/dma/sifive_pdma.c
@@ -248,6 +248,15 @@ static void sifive_pdma_write(void *opaque, hwaddr offset,
 
         s->chan[ch].control = value;
 
+        /*
+         * If channel was not claimed before run bit is set,
+         * DMA won't run.
+         */
+        if (!claimed) {
+            s->chan[ch].control &= ~CONTROL_RUN;
+            return;
+        }
+
         if (value & CONTROL_RUN) {
             sifive_pdma_run(s, ch);
         }
-- 
2.25.1


