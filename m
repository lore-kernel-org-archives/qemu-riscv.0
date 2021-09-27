Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mUgGn-0006WK-W1
	for mharc-qemu-riscv@gnu.org; Sun, 26 Sep 2021 22:21:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mUgGl-0006Sd-V9; Sun, 26 Sep 2021 22:21:27 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:55177)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mUgGk-0007We-2T; Sun, 26 Sep 2021 22:21:27 -0400
Received: by mail-pj1-x102a.google.com with SMTP id me1so11320116pjb.4;
 Sun, 26 Sep 2021 19:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GxYfjd70o4DQjmKnlzXoNLT8KadB3jB5Ygh1KH/IjN4=;
 b=MYQaVnr13hwC+6vRfm/JfK91uBr0Yx4jeHYuAIGO5cEa0qP/47eDgEpftSivy6PDxV
 QEaHD1yH61j5Hi5aVlVTuczdBd61mC9NsLzKNVP51knWHaXDaZGZAz1bhjkPuWBwQQE4
 83QAHNahhSRuJ8/2JoBaKtHkuuDAWTK9L5A60+omkR9TCrV9d19LcF2yAPZ7a+HF3rss
 SNF8Sqx+sBoIAscZdYmrl10nvVnAkpRF0cupXwhoXHP5wFfcmgyekmKgFWqFL7B+4h4Y
 vn9ITv0wePfBjYqiaJL1SUpbwz7qhWzfGCRNqjR4e8ro50MfCEww7k/GYL83hYD4rQCF
 lSeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GxYfjd70o4DQjmKnlzXoNLT8KadB3jB5Ygh1KH/IjN4=;
 b=O9VSyTQCh/5ZmuSdIOsf6HmOGfaOhzQOURn7rorDzewbMSLMJEhSBWmFJJ/PLTNcab
 egUcUxYNAbsfTgX15sqjMJOjjHgKqiTaOJxoHnpUkSPpHg6+rHWHZrVsmkQDfAQevOSx
 D/t26YImSMuEu51toMPoHcSWkHiWbXfskR10lvcEUIzezpudX/szksCb4WNhrnZRKn7M
 tjNWG9hVS0+Mvb9iDXo5q2p4Z+sc2gLtGKoT+88Bsh1t13WiSB2M2dDk6+UC0uy11AhO
 BdcwvxSqHJI3dTEDrQhe0fKPOKd8k8gRlmyrc7AZfwSHXla039CcUAylAV3wc9vDOl3U
 JFpw==
X-Gm-Message-State: AOAM531OhOhdcOu15rRXAQlppc4FwEmiNuMSIl5mw2OBrZ55PqWYAAv5
 gphQzp7T5yhVMkh27FERngE=
X-Google-Smtp-Source: ABdhPJyqXnnnI5lNrW04ZdA3WaSBrMfA0lmMtiQFtNGr6//YOxMqfe2n+L7tcwWvuLSYHhg2gtqiTQ==
X-Received: by 2002:a17:902:8307:b0:13c:ac55:5e1d with SMTP id
 bd7-20020a170902830700b0013cac555e1dmr20238468plb.56.1632709284268; 
 Sun, 26 Sep 2021 19:21:24 -0700 (PDT)
Received: from pek-vx-bsp2.wrs.com (unknown-176-192.windriver.com.
 [147.11.176.192])
 by smtp.gmail.com with ESMTPSA id qe17sm14660222pjb.39.2021.09.26.19.21.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Sep 2021 19:21:23 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>
Subject: [PATCH 2/2] hw/dma: sifive_pdma: Don't run DMA when channel is
 disclaimed
Date: Mon, 27 Sep 2021 10:21:13 +0800
Message-Id: <20210927022113.1518559-2-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210927022113.1518559-1-bmeng.cn@gmail.com>
References: <20210927022113.1518559-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Mon, 27 Sep 2021 02:21:28 -0000

If Control.run bit is set while not preserving the Control.claim
bit, the DMA transfer shall not be started.

The following result is PDMA tested in U-Boot on Unleashed board:

=> mw.l 0x3000000 0x0                      <= Disclaim channel 0
=> mw.l 0x3000000 0x1                      <= Claim channel 0
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
03000000: 00000001 55000000 00000002 00000000    .......U........
03000010: 84000000 00000000 84001000 00000000    ................
=> mw.l 0x3000000 0x2                      <= Set channel 0 run bit only
=> md.l 0x3000000 8                        <= Dump PDMA status
03000000: 00000000 55000000 00000002 00000000    .......U........
03000010: 84000000 00000000 84001000 00000000    ................
=> md.l 0x84000000 1; md.l 0x84001000 1    <= Dump src/dst memory contents
84000000: 87654321                               !Ce.
84001000: 12345678                               xV4.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
---

 hw/dma/sifive_pdma.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/hw/dma/sifive_pdma.c b/hw/dma/sifive_pdma.c
index b8ec7621f3..85fe34f5f3 100644
--- a/hw/dma/sifive_pdma.c
+++ b/hw/dma/sifive_pdma.c
@@ -232,7 +232,7 @@ static void sifive_pdma_write(void *opaque, hwaddr offset,
 {
     SiFivePDMAState *s = opaque;
     int ch = SIFIVE_PDMA_CHAN_NO(offset);
-    bool claimed;
+    bool claimed, run;
 
     if (ch >= SIFIVE_PDMA_CHANS) {
         qemu_log_mask(LOG_GUEST_ERROR, "%s: Invalid channel no %d\n",
@@ -244,6 +244,7 @@ static void sifive_pdma_write(void *opaque, hwaddr offset,
     switch (offset) {
     case DMA_CONTROL:
         claimed = !!(s->chan[ch].control & CONTROL_CLAIM);
+        run = !!(s->chan[ch].control & CONTROL_RUN);
 
         if (!claimed && (value & CONTROL_CLAIM)) {
             /* reset Next* registers */
@@ -254,13 +255,19 @@ static void sifive_pdma_write(void *opaque, hwaddr offset,
             s->chan[ch].next_src = 0;
         }
 
+        /* claim bit can only be cleared when run is low */
+        if (run && !(value & CONTROL_CLAIM)) {
+            value |= CONTROL_CLAIM;
+        }
+
         s->chan[ch].control = value;
 
         /*
          * If channel was not claimed before run bit is set,
+         * or if the channel is disclaimed when run was low,
          * DMA won't run.
          */
-        if (!claimed) {
+        if (!claimed || (!run && !(value & CONTROL_CLAIM))) {
             s->chan[ch].control &= ~CONTROL_RUN;
             return;
         }
-- 
2.25.1


