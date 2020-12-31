Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kuwAm-0007wf-8p
	for mharc-qemu-riscv@gnu.org; Thu, 31 Dec 2020 06:31:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kuwAi-0007rQ-Lk; Thu, 31 Dec 2020 06:31:12 -0500
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:41248)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kuwAg-0007Le-NG; Thu, 31 Dec 2020 06:31:12 -0500
Received: by mail-pf1-x431.google.com with SMTP id t8so11138126pfg.8;
 Thu, 31 Dec 2020 03:31:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tJU0pm0MWe3ZEWtQfAqZHlrsoU5n0ODHyGK3UfYTL3s=;
 b=qhhLaILJduc9642K8lJzijAImqg1OL890xl5YprwEkmIqYQa5QyOY7EXalHgA142tM
 LqGOgxYf4x7JXjxnyKoXuVgxKMOOqHYxgPySgcCgxXorCeMbGWqOmtmYdbNzCAoKmqla
 A1GxG+S5qFcGJ7H5pT+pcwaE4WtHc5WenvZmrnjnL+mPSMoa2h5XySiWBrMoCGIN959/
 EEUiHThbLjSlIGnzO96WdLuNo3mzrhnUDDN+LXV6Z87yzrKuKSNgXrw+KLEbvSE7//u0
 OviKe/1fm1N7eaKdhs7IZqdu/u0kko7Vtz7FoyycKJbTWZI6TpJEpely9ntNjibtyEv3
 L1sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tJU0pm0MWe3ZEWtQfAqZHlrsoU5n0ODHyGK3UfYTL3s=;
 b=Z6LcygghzGXHtvg+yq3yc34VpfO2dteGpimDb8WsRQ5idsof4IVSGOkOZqIBHGcRHp
 EkQz2OnSHzfUhYW54T6ttJ/4as5dvHzkXShM+IuE4plOzctO+7RVrx4gNE+FkT+ola93
 G2JHzEjE0VtFJ24qGXT2bvOMv2CiKJiShkzj/vr9EksM4Mwr/j+wewkaUvQzh27GQ1jV
 kQmlXAHsn6r0Wdq2trxR2Cwq97267ik7Ss0PNNvQu+Oi9+x8vdXy13aaxncsj/vHpQId
 8jb4oHcFvBVPbQoFrswtdTwcY0snZ/6L9gV++YGMGv60B1wfluWjoD5rKdDZcAHA9y4X
 Iu2g==
X-Gm-Message-State: AOAM530DFSr6+ZmfWRS6Gca5eqqn9suvu9vfLnO6XiOcEFv0yQkh+Ru7
 tDSZpqFHuzWPqQPBx2ednCo=
X-Google-Smtp-Source: ABdhPJzNElgZ6kl0N3oLfoXPB0p/dTApnVeq6V8D77KclUqLtWsWBB9OJhvVqfTXe7xWXhoP6KfaXA==
X-Received: by 2002:a05:6a00:1389:b029:18b:2d21:2f1a with SMTP id
 t9-20020a056a001389b029018b2d212f1amr52328314pfg.1.1609414268638; 
 Thu, 31 Dec 2020 03:31:08 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id t23sm45957591pfc.0.2020.12.31.03.31.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Dec 2020 03:31:08 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>
Subject: [PATCH 14/22] hw/sd: ssi-sd: Support single block write
Date: Thu, 31 Dec 2020 19:30:02 +0800
Message-Id: <20201231113010.27108-15-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201231113010.27108-1-bmeng.cn@gmail.com>
References: <20201231113010.27108-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pf1-x431.google.com
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
X-List-Received-Date: Thu, 31 Dec 2020 11:31:13 -0000

From: Bin Meng <bin.meng@windriver.com>

Add 2 more states for the block write operation. The SPI host needs
to send a data start tocken to start the transfer, and the data block
written to the card will be acknowledged by a data response tocken.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 hw/sd/ssi-sd.c | 37 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 36 insertions(+), 1 deletion(-)

diff --git a/hw/sd/ssi-sd.c b/hw/sd/ssi-sd.c
index 8eb48550cf..21a96e91f0 100644
--- a/hw/sd/ssi-sd.c
+++ b/hw/sd/ssi-sd.c
@@ -42,6 +42,8 @@ typedef enum {
     SSI_SD_DATA_START,
     SSI_SD_DATA_READ,
     SSI_SD_DATA_CRC16,
+    SSI_SD_DATA_WRITE,
+    SSI_SD_SKIP_CRC16,
 } ssi_sd_mode;
 
 struct ssi_sd_state {
@@ -52,6 +54,7 @@ struct ssi_sd_state {
     uint8_t response[5];
     uint16_t crc16;
     int32_t read_bytes;
+    int32_t write_bytes;
     int32_t arglen;
     int32_t response_pos;
     int32_t stopping;
@@ -90,6 +93,9 @@ OBJECT_DECLARE_SIMPLE_TYPE(ssi_sd_state, SSI_SD)
 /* dummy value - don't care */
 #define SSI_DUMMY               0xff
 
+/* data accepted */
+#define DATA_RESPONSE_ACCEPTED  0x05
+
 static uint32_t ssi_sd_transfer(SSIPeripheral *dev, uint32_t val)
 {
     ssi_sd_state *s = SSI_SD(dev);
@@ -103,10 +109,17 @@ static uint32_t ssi_sd_transfer(SSIPeripheral *dev, uint32_t val)
 
     switch (s->mode) {
     case SSI_SD_CMD:
-        if (val == SSI_DUMMY) {
+        switch (val) {
+        case SSI_DUMMY:
             DPRINTF("NULL command\n");
             return SSI_DUMMY;
+            break;
+        case SSI_TOKEN_SINGLE:
+            DPRINTF("Start write block\n");
+            s->mode = SSI_SD_DATA_WRITE;
+            return SSI_DUMMY;
         }
+
         s->cmd = val & 0x3f;
         s->mode = SSI_SD_CMDARG;
         s->arglen = 0;
@@ -235,6 +248,27 @@ static uint32_t ssi_sd_transfer(SSIPeripheral *dev, uint32_t val)
             s->response_pos = 0;
         }
         return val;
+    case SSI_SD_DATA_WRITE:
+        sdbus_write_byte(&s->sdbus, val);
+        s->write_bytes++;
+        if (!sdbus_receive_ready(&s->sdbus) || s->write_bytes == 512) {
+            DPRINTF("Data write end\n");
+            s->mode = SSI_SD_SKIP_CRC16;
+            s->response_pos = 0;
+        }
+        return val;
+    case SSI_SD_SKIP_CRC16:
+        /* we don't verify the crc16 */
+        s->response_pos++;
+        if (s->response_pos == 2) {
+            DPRINTF("CRC16 receive end\n");
+            s->mode = SSI_SD_RESPONSE;
+            s->write_bytes = 0;
+            s->arglen = 1;
+            s->response[0] = DATA_RESPONSE_ACCEPTED;
+            s->response_pos = 0;
+        }
+        return SSI_DUMMY;
     }
     /* Should never happen.  */
     return SSI_DUMMY;
@@ -325,6 +359,7 @@ static void ssi_sd_reset(DeviceState *dev)
     memset(s->response, 0, sizeof(s->response));
     s->crc16 = 0;
     s->read_bytes = 0;
+    s->write_bytes = 0;
     s->arglen = 0;
     s->response_pos = 0;
     s->stopping = 0;
-- 
2.25.1


