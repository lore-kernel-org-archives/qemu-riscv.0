Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mOZWt-0007cm-5Z
	for mharc-qemu-riscv@gnu.org; Fri, 10 Sep 2021 01:56:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mOZWn-0007Yy-VD
 for qemu-riscv@nongnu.org; Fri, 10 Sep 2021 01:56:45 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:40546)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mOZWm-0002VV-E8
 for qemu-riscv@nongnu.org; Fri, 10 Sep 2021 01:56:45 -0400
Received: by mail-pf1-x435.google.com with SMTP id n34so936427pfv.7
 for <qemu-riscv@nongnu.org>; Thu, 09 Sep 2021 22:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mgUzr2DG36yd+UgA/DpY4Gf1qGjCBL2FzKoD7fd8uA0=;
 b=iIc9sxUji/Pz0jHXLXLrJo0d5KWVyYJlEm2jDimLvNPmdMANVgztrsxfClWMDlKaNn
 4QS7V+Ca+Z3rh8wYua6VY6o7Tj9als8Ol5qu2R2W/Ms8sfIj2M/HXjJdFcO81dqowxV+
 mQAFIWhm9ek8iymxWt+33jtcxczMk7hIhnZACfL6qgt3x3CbTk25YSiAH26YooJ2nbbv
 KybcPNAnLf7ujO09NFh/tNZbm0yce9pL473DuXv7T3eOYLMziKrElfWkQimJkz42GS8b
 Z3AUJPWQI+iJxYPZSFSdayf5KleQERl3XBkcqw2XjYFlY7fiAt76T8f0N+LG/VzZ8tyQ
 drCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mgUzr2DG36yd+UgA/DpY4Gf1qGjCBL2FzKoD7fd8uA0=;
 b=iq1QjzZNZ1F6LDUGvzxj2VyMRNxu9R7s9qERxxQV0xj7OD6tYgNXCGzk8YCgHw/mP2
 Lo/UHQaJJubaxSqpYn0JJpVuBIzvLY3Y/diPdZd3qRQQIPzzLwV2ZavYab1uA5HIgkg2
 4+kvKye1Tfwk9ZQrWtnsJp5gSwwdBncK0KT4mkFDcr51JAk/qKmS/4RLVCs7fQwagr2H
 PXxeSCEq/02U1srlMherUnn7v+61DQl5FNgOdwkeYQd+DNBpVJzHyaPYYd2c4/HDTimJ
 Vs1Ku63BzO46geSQGPCrcBv3xfyjDM0cdgWCBpQu58LjKS9PMUOlxeqvTPfmfJdFQkur
 7d6g==
X-Gm-Message-State: AOAM533cTXwqPjhpQ+hRRYYsvRPd4ud4lT+jbMVmSPKe9T8yG/ZvkLvE
 QPmWXGjjL8sUI6u967e67+GorA==
X-Google-Smtp-Source: ABdhPJxhPm/TyWXkN9N9EhOfSaqEC26i0vEl/xj1t2GlKTG1VOW6cj/UqiNO11AFCiqxF75tYYJBsQ==
X-Received: by 2002:a65:51c8:: with SMTP id i8mr5781305pgq.451.1631253403160; 
 Thu, 09 Sep 2021 22:56:43 -0700 (PDT)
Received: from localhost.localdomain (123-193-74-252.dynamic.kbronet.com.tw.
 [123.193.74.252])
 by smtp.gmail.com with ESMTPSA id v17sm3739101pff.6.2021.09.09.22.56.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Sep 2021 22:56:42 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Max Hsu <max.hsu@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH 4/4] hw/dma: sifive_pdma: don't set Control.error if 0 bytes
 to transfer
Date: Fri, 10 Sep 2021 13:56:16 +0800
Message-Id: <20210910055620.946625-5-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210910055620.946625-1-frank.chang@sifive.com>
References: <20210910055620.946625-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x435.google.com
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
X-List-Received-Date: Fri, 10 Sep 2021 05:56:46 -0000

From: Frank Chang <frank.chang@sifive.com>

Real PDMA doesn't set Control.error if there are 0 bytes to be
transferred. The DMA transfer is still success.

The following result is PDMA tested in U-boot on Unmatched board:

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
---
 hw/dma/sifive_pdma.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/dma/sifive_pdma.c b/hw/dma/sifive_pdma.c
index d6980fbbd62..133db817dc7 100644
--- a/hw/dma/sifive_pdma.c
+++ b/hw/dma/sifive_pdma.c
@@ -76,7 +76,7 @@ static void sifive_pdma_run(SiFivePDMAState *s, int ch)
 
     /* do nothing if bytes to transfer is zero */
     if (!bytes) {
-        goto error;
+        goto done;
     }
 
     /*
@@ -131,11 +131,6 @@ static void sifive_pdma_run(SiFivePDMAState *s, int ch)
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
@@ -143,6 +138,11 @@ static void sifive_pdma_run(SiFivePDMAState *s, int ch)
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


