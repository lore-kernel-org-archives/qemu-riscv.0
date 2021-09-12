Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mPPBX-00030N-Fe
	for mharc-qemu-riscv@gnu.org; Sun, 12 Sep 2021 09:06:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mPPBT-0002wX-R6
 for qemu-riscv@nongnu.org; Sun, 12 Sep 2021 09:06:14 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:37646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mPPBR-0005N8-5z
 for qemu-riscv@nongnu.org; Sun, 12 Sep 2021 09:06:11 -0400
Received: by mail-pg1-x52a.google.com with SMTP id 17so6732753pgp.4
 for <qemu-riscv@nongnu.org>; Sun, 12 Sep 2021 06:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FTkGFyg/YtaZMgVSbfKunIm+4d8G4FPBLUSS439AHQY=;
 b=MRSd9EOmcrNGVpV26K6zTpvz/57Ssg+tvJt/nQrhD0jm++ksg5PLTGGfIn2Mo4hUK0
 yywuRuYJoDeWYSbPeMI+d0pNMuW6Q9PMGsyCcA6uLxqRaqv72gGloWEF3mwBGVc57yMJ
 QlgKfVlD8ryenRoQPIc5pa78XS3GpvsJCcWfHtu3o8+z+ah+p5WF16E3IVrxaWU0yZta
 rH+OOAyBJPJ8xwbfiG/qBUoAngNrMuynPjpknqS5eyJuKorbFfYe5eioCBl7xt2mjm/B
 xgZTHJouBU3DJoCOllgIc64YfjfwkIS9BIcRdMA8ibRplZJ6zGaoOzmkowZKgO7WGvq4
 d78Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FTkGFyg/YtaZMgVSbfKunIm+4d8G4FPBLUSS439AHQY=;
 b=cTo8mhYUjcm0L6YsJsoqDHYN4rMrqvKKZJHzKbYuwuXi5xzly4SRHklGJAoh1NA2m8
 8fS/1IAhtE/qHfkQIsju2q6Y2LGF4tSCbRHZnPSAQR84DxnsfmFFZZ0OwzlNsJmYrORu
 270QW0WVgxOeEBDETrNy3lSYSSZNZ9KGiFoOwFdUUgYq3MVVJYlDY0ybFyPT6Y0BSrd+
 17fjGOjDivoWc6N3mBsFTUIIuk7LD4LBxTW4Imldv9id+M5LZrea0exl1SUElZnFuqle
 HyNaxdlJc9bxvIX1ooUb0K+MXaNmXmKDLKzOaGOVXGIzHzBJ7L/cTH0mAStG7fXygAh1
 rxPQ==
X-Gm-Message-State: AOAM5325fBdQcJaHcGRxOLG04oTZm11QzVaRWqXFcJZpKL6MeHUbbvaA
 Gv+qbV0sL+rqADA8QsXsHkvIhA==
X-Google-Smtp-Source: ABdhPJyhh4lSw+pdpuWXNIWoy6GXmHOdNYzV0CXm4P0rxf3HGFi4D2OubYJMTJoZPbwzpX4W3Q/eiQ==
X-Received: by 2002:a62:e117:0:b0:416:3900:6220 with SMTP id
 q23-20020a62e117000000b0041639006220mr6457920pfh.24.1631451967879; 
 Sun, 12 Sep 2021 06:06:07 -0700 (PDT)
Received: from localhost.localdomain (123-193-74-252.dynamic.kbronet.com.tw.
 [123.193.74.252])
 by smtp.gmail.com with ESMTPSA id qe17sm3849565pjb.39.2021.09.12.06.06.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Sep 2021 06:06:07 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Max Hsu <max.hsu@sifive.com>,
 Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH RESEND v2 1/4] hw/dma: sifive_pdma: reset Next* registers when
 Control.claim is set
Date: Sun, 12 Sep 2021 21:05:45 +0800
Message-Id: <20210912130553.179501-2-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210912130553.179501-1-frank.chang@sifive.com>
References: <20210912130553.179501-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x52a.google.com
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
X-List-Received-Date: Sun, 12 Sep 2021 13:06:14 -0000

From: Frank Chang <frank.chang@sifive.com>

Setting Control.claim clears all of the chanel's Next registers.
This is effective only when Control.claim is set from 0 to 1.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Tested-by: Max Hsu <max.hsu@sifive.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Tested-by: Bin Meng <bmeng.cn@gmail.com>
---
 hw/dma/sifive_pdma.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/hw/dma/sifive_pdma.c b/hw/dma/sifive_pdma.c
index 9b2ac2017d9..d92e27dfdc4 100644
--- a/hw/dma/sifive_pdma.c
+++ b/hw/dma/sifive_pdma.c
@@ -54,6 +54,13 @@
 #define DMA_EXEC_DST        0x110
 #define DMA_EXEC_SRC        0x118
 
+/*
+ * FU540/FU740 docs are incorrect with NextConfig.wsize/rsize reset values.
+ * The reset values tested on Unleashed/Unmatched boards are 6 instead of 0.
+ */
+#define CONFIG_WRSZ_DEFAULT 6
+#define CONFIG_RDSZ_DEFAULT 6
+
 enum dma_chan_state {
     DMA_CHAN_STATE_IDLE,
     DMA_CHAN_STATE_STARTED,
@@ -221,6 +228,7 @@ static void sifive_pdma_write(void *opaque, hwaddr offset,
 {
     SiFivePDMAState *s = opaque;
     int ch = SIFIVE_PDMA_CHAN_NO(offset);
+    bool claimed;
 
     if (ch >= SIFIVE_PDMA_CHANS) {
         qemu_log_mask(LOG_GUEST_ERROR, "%s: Invalid channel no %d\n",
@@ -231,6 +239,17 @@ static void sifive_pdma_write(void *opaque, hwaddr offset,
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


