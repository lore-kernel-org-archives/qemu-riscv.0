Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mPOqm-0004WK-82
	for mharc-qemu-riscv@gnu.org; Sun, 12 Sep 2021 08:44:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mPOqk-0004Qa-6j
 for qemu-riscv@nongnu.org; Sun, 12 Sep 2021 08:44:46 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:51109)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mPOqi-000592-FX
 for qemu-riscv@nongnu.org; Sun, 12 Sep 2021 08:44:45 -0400
Received: by mail-pj1-x102a.google.com with SMTP id k23so4431417pji.0
 for <qemu-riscv@nongnu.org>; Sun, 12 Sep 2021 05:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FTkGFyg/YtaZMgVSbfKunIm+4d8G4FPBLUSS439AHQY=;
 b=J0he79nuxNx87NOdRyrjb420BSoYYJuJZCglz9z9g4hVaF4SMAe5yS1lBEJGeWVjCE
 RBT1NPOsb/VPiSB+W9xif/fRN44y3poorVrCoH9XSo5Gyfld0AxRXP9zE30UxCrYqof2
 67L2J2nS7ZjAFWa765n74u2sOlSUqUQc3QOhi+JwI6oEf8vY/MGnEL9lARA64mJL7hU0
 UILubMYinml/O0DCFBPk/tjtJJ69AIZGoNk7yQGZpSSLNYdrwJRCUHkVACzLvQAesGiS
 wMYblikJEhH7cZ8Mick/CGNXqtDub5k+IsV2nRf0b84GH+MDKms1EumZw7uLveHbv6YC
 oOBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FTkGFyg/YtaZMgVSbfKunIm+4d8G4FPBLUSS439AHQY=;
 b=uMVK2rmiIZ4jTNpGoHO5GBbkfHfvZ3nInqrZdvTy+tgTIFkJszrAugMi20IHGeCfxm
 uJKNfnn+oeadG7gdLdIjfc6HFJi1iKJk9OqbY9wGRI5bnF9ugS8xna7IGUyrjZlHykFw
 04IF7pPIpot6WZTWMqGk+dyoVUQLiYxGlLXiJYOWSP+upRPVJER2RY4tTI4lV8AvWIDW
 b7DhGCWwFMj+Cmj4PUILgGh2mjeoAW/MYsEENWOejqv77XTKc6LEuVDpUdNquBBX2l5x
 qfyz6+JiILXpCXlWzbvQu6jUuUChrnmqOLq4lQLcZytlGZZEnZE3zOBvWwB2BYEwUSO0
 zEHA==
X-Gm-Message-State: AOAM532FbM1Nb9v4VfRxmjuAtoaTJyyW9k0TH+Vw6PoYl7Ml6Z1aBV5P
 1YThDUJWxSFdOEk6uIIWvrnUQVg91iJHhg==
X-Google-Smtp-Source: ABdhPJwL3tVXDS1xC5g5r175SalhlAYtMj+J5MOiZ4I5dWQr0DeOIAjBZ/ok8REIwiK1JLExUCvHgA==
X-Received: by 2002:a17:902:b7c5:b0:13b:9372:a192 with SMTP id
 v5-20020a170902b7c500b0013b9372a192mr669981plz.79.1631450681531; 
 Sun, 12 Sep 2021 05:44:41 -0700 (PDT)
Received: from localhost.localdomain (123-193-74-252.dynamic.kbronet.com.tw.
 [123.193.74.252])
 by smtp.gmail.com with ESMTPSA id k3sm3807043pjs.11.2021.09.12.05.44.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Sep 2021 05:44:40 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Max Hsu <max.hsu@sifive.com>,
 Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v2 1/4] hw/dma: sifive_pdma: reset Next* registers when
 Control.claim is set
Date: Sun, 12 Sep 2021 20:44:17 +0800
Message-Id: <20210912124425.166071-2-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x102a.google.com
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
X-List-Received-Date: Sun, 12 Sep 2021 12:44:46 -0000

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


