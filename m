Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mPOr0-0004i4-Qy
	for mharc-qemu-riscv@gnu.org; Sun, 12 Sep 2021 08:45:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mPOqu-0004f4-Pe
 for qemu-riscv@nongnu.org; Sun, 12 Sep 2021 08:44:57 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:35561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mPOqt-0005Dq-71
 for qemu-riscv@nongnu.org; Sun, 12 Sep 2021 08:44:56 -0400
Received: by mail-pl1-x62a.google.com with SMTP id bb10so4083597plb.2
 for <qemu-riscv@nongnu.org>; Sun, 12 Sep 2021 05:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5ng6bxLr/CEDfg4qWZ+9iIXZdvuZu2KqsMTpKiIZfBw=;
 b=STdMILTrWC0eLw8UgpcI5fJ6GRNHl+Amlj4S6fHrumKwpRUTlhJlStH1HEZhmcD8JY
 VC2ih5HNKqfQcha6gB7QSsywj8VHtTMNNuE49ewCkInlJtTtuBDNKsu5S05kTWMjISEJ
 VQjtwf6cltVZVdSyC62KbRv/l8eEJUzvfWM/15W7rd8b5WMjSZOogq0HYRliftzYrHEw
 ii2/zVp96Cun+4bfcsF6YnRkrh4pW8pVcJNhllSVJyTib0Q0lnGYc5LD+H68OrTZ2Lod
 0gxKbEkURRw3trOq1HD/BkIaQXXWX5A8tHTsbBelcHXt31oOIDyTvC9FDWjc/GE/hr5u
 xzDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5ng6bxLr/CEDfg4qWZ+9iIXZdvuZu2KqsMTpKiIZfBw=;
 b=qQ21Mbod6bS80u0uG8/4wiYRJ3irBrNDgYVVo4aSHZg5aquka9CYl9XaM1jOa/BIzm
 J1md8PZAcZdl7z8depzBU4JTd/Ory4/loJV7xks2QijUdhLtNfbSp+71707ak8ApeM8p
 u50VIQdITrCqPEs0580XTkU2SJtO5uZq8zPVlrnqt2bvvhGCnywsega4LbjLh5DH7thx
 rgtJEeN6R4OLmmW+g7Mag+pf2shzBj4lTyjJb8+Gx5AAI/AXkBNwCkWEo5o3qIXvn3Ya
 WhjJGcDtZxFc/OuO6gPE1S6EEKpXIBp6EBbalFKSOrP+HvY+uSbyyqh5rQw8PtuOpLNU
 hZlQ==
X-Gm-Message-State: AOAM531CewMq+Ya7RrOkqIZR7GypIC2sLnAqGbEVQASm+mIJo3PnWK+v
 9krVEq6eHPXJfSD8KmiafmhBpLPGd54//Q==
X-Google-Smtp-Source: ABdhPJwA/02UY3XUiTCMjx5oADAmx2S9ziNZWyDATQJ6Y4T5x7GiDtFpToz4tMWChPt37XtHgjqssw==
X-Received: by 2002:a17:90a:130f:: with SMTP id
 h15mr7465500pja.183.1631450694011; 
 Sun, 12 Sep 2021 05:44:54 -0700 (PDT)
Received: from localhost.localdomain (123-193-74-252.dynamic.kbronet.com.tw.
 [123.193.74.252])
 by smtp.gmail.com with ESMTPSA id k3sm3807043pjs.11.2021.09.12.05.44.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Sep 2021 05:44:53 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Max Hsu <max.hsu@sifive.com>,
 Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v2 4/4] hw/dma: sifive_pdma: don't set Control.error if 0
 bytes to transfer
Date: Sun, 12 Sep 2021 20:44:20 +0800
Message-Id: <20210912124425.166071-5-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210912124425.166071-2-frank.chang@sifive.com>
References: <20210912124425.166071-2-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x62a.google.com
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
X-List-Received-Date: Sun, 12 Sep 2021 12:44:57 -0000

From: Frank Chang <frank.chang@sifive.com>

Real PDMA doesn't set Control.error if there are 0 bytes to be
transferred. The DMA transfer is still success.

The following result is PDMA tested in U-Boot on Unmatched board:

=> mw.l 0x3000000 0x0                      <= Disclaim channel 0
=> mw.l 0x3000000 0x1                      <= Claim channel 0
=> mw.l 0x3000004 0x55000000               <= wsize = rsize = 5 (2^5 = 32 bytes)
=> mw.q 0x3000008 0x0                      <= NextBytes = 0
=> mw.q 0x3000010 0x84000000               <= NextDestination = 0x84000000
=> mw.q 0x3000018 0x84001000               <= NextSource = 0x84001000
=> mw.l 0x84000000 0x87654321              <= Fill test data to dst
=> mw.l 0x84001000 0x12345678              <= Fill test data to src
=> md.l 0x84000000 1; md.l 0x84001000 1    <= Dump src/dst memory contents
84000000: 87654321                               !Ce.
84001000: 12345678                               xV4.
=> md.l 0x3000000 8                        <= Dump PDMA status
03000000: 00000001 55000000 00000000 00000000    .......U........
03000010: 84000000 00000000 84001000 00000000    ................
=> mw.l 0x3000000 0x3                      <= Set channel 0 run and claim bits
=> md.l 0x3000000 8                        <= Dump PDMA status
03000000: 40000001 55000000 00000000 00000000    ...@...U........
03000010: 84000000 00000000 84001000 00000000    ................
=> md.l 0x84000000 1; md.l 0x84001000 1    <= Dump src/dst memory contents
84000000: 87654321                               !Ce.
84001000: 12345678                               xV4.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Tested-by: Max Hsu <max.hsu@sifive.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Tested-by: Bin Meng <bmeng.cn@gmail.com>
---
 hw/dma/sifive_pdma.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/dma/sifive_pdma.c b/hw/dma/sifive_pdma.c
index d7d2c53e97e..b4fd40573a5 100644
--- a/hw/dma/sifive_pdma.c
+++ b/hw/dma/sifive_pdma.c
@@ -80,7 +80,7 @@ static void sifive_pdma_run(SiFivePDMAState *s, int ch)
 
     /* do nothing if bytes to transfer is zero */
     if (!bytes) {
-        goto error;
+        goto done;
     }
 
     /*
@@ -135,11 +135,6 @@ static void sifive_pdma_run(SiFivePDMAState *s, int ch)
         s->chan[ch].exec_bytes -= remainder;
     }
 
-    /* indicate a DMA transfer is done */
-    s->chan[ch].state = DMA_CHAN_STATE_DONE;
-    s->chan[ch].control &= ~CONTROL_RUN;
-    s->chan[ch].control |= CONTROL_DONE;
-
     /* reload exec_ registers if repeat is required */
     if (s->chan[ch].next_config & CONFIG_REPEAT) {
         s->chan[ch].exec_bytes = bytes;
@@ -147,6 +142,11 @@ static void sifive_pdma_run(SiFivePDMAState *s, int ch)
         s->chan[ch].exec_src = src;
     }
 
+done:
+    /* indicate a DMA transfer is done */
+    s->chan[ch].state = DMA_CHAN_STATE_DONE;
+    s->chan[ch].control &= ~CONTROL_RUN;
+    s->chan[ch].control |= CONTROL_DONE;
     return;
 
 error:
-- 
2.25.1


