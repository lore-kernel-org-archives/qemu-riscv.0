Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l3GMk-0003ZI-NI
	for mharc-qemu-riscv@gnu.org; Sat, 23 Jan 2021 05:42:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l3GM1-0003QW-Nx; Sat, 23 Jan 2021 05:41:22 -0500
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:39077)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l3GLv-00037b-6v; Sat, 23 Jan 2021 05:41:17 -0500
Received: by mail-pg1-x52e.google.com with SMTP id 30so5596690pgr.6;
 Sat, 23 Jan 2021 02:41:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Y2zcJszCz5lIVVf0OMd5bXgiApimd2gt80gUBOZlMWw=;
 b=EU0FlqEUNiNuAhc/YUBwsa5JH1DjGXIJ/+U6ExlYc2BHS6hyPpeg8cibNfNiqyOYg5
 gjX3kVAlcqprWP0mVAieN4/VfnByfsd4tsj8iTJqH8LUKsVxG8Pde7dC6LQIy+iATyYw
 K1Azg2bP8Yd4QTU9KXQVDA7vjXyeEsbU9Y1L7/PaichgGkpmTbiqJKLlNocsrHd3qzl0
 gdoS3soPuey6vkLEbTVLiNWJNix8dJ5ZKJq00/q0k0DhHJn8B4YjjRmpi6ye1l8IAXe7
 S5CfEEneEWuCaF7YtfAxWOyjwSq8wJuE2BqVYfm3/7/Dh/VHGzApugURJeQMKrW5GX44
 cBkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Y2zcJszCz5lIVVf0OMd5bXgiApimd2gt80gUBOZlMWw=;
 b=MyIfEYLynl2V+cpyRUmp29UOdYUatlFxBqwFVRvV3FDBHQYUbY/0IV9scFGkzmuLf1
 ipwhHQ3RccbEr8u4KsGpY5Gv/PizOJ9d6cB1IHKlkuU3rkNSjYSRc7ZauhmF3AKru1C4
 kKaj/dmq4rz5Y6E+clH/Bf0PV7b6FZqFZYh4b1ThuobobuUYogxJlfjZ5jIsw6MilE/3
 biMBkmtiSnbmmo4CeewU7mPSQRDpgr0PtXU3wsPlp28bNOB5D8g+Ql4VvGhMQv9n9X2f
 iWKVvMkodgqso+SJUDexK1pBrkw1k9SU/YuRS7BoV7ZwiTv0tiZZIFOb2PsBZRFOQF38
 glBA==
X-Gm-Message-State: AOAM530dEMfwvOw5HPBZLldkDJVq5LB47t9dv2j82SZIq4u88Xr5kpCa
 533/rRRm7ezqmyFiewJSIwCaZKKa5Ym+Lw==
X-Google-Smtp-Source: ABdhPJy+125FbsoUN05cwCPyYrWWmxbnmr7O7tOsA2SvAxsk4MRHD/AGUDsdGluR06DwEg6C2aD7MA==
X-Received: by 2002:a63:6b42:: with SMTP id g63mr9091323pgc.107.1611398468967; 
 Sat, 23 Jan 2021 02:41:08 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id a5sm10575463pgl.41.2021.01.23.02.41.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Jan 2021 02:41:08 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v2 17/25] hw/sd: ssi-sd: Support multiple block write
Date: Sat, 23 Jan 2021 18:40:08 +0800
Message-Id: <20210123104016.17485-18-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210123104016.17485-1-bmeng.cn@gmail.com>
References: <20210123104016.17485-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pg1-x52e.google.com
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
X-List-Received-Date: Sat, 23 Jan 2021 10:41:33 -0000

From: Bin Meng <bin.meng@windriver.com>

For a multiple block write operation, each block begins with a multi
write start token. Unlike the SD mode that the multiple block write
ends when receiving a STOP_TRAN command (CMD12), a special stop tran
token is used to signal the card.

Emulating this by manually sending a CMD12 to the SD card core, to
bring it out of the receiving data state.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>

---

Changes in v2:
- Correct the "token" typo in the commit message
- Introduce multiple write token definitions in this patch

 hw/sd/ssi-sd.c | 30 ++++++++++++++++++++++++++++--
 1 file changed, 28 insertions(+), 2 deletions(-)

diff --git a/hw/sd/ssi-sd.c b/hw/sd/ssi-sd.c
index 240cfd919c..ee4fbc3dfe 100644
--- a/hw/sd/ssi-sd.c
+++ b/hw/sd/ssi-sd.c
@@ -82,6 +82,10 @@ OBJECT_DECLARE_SIMPLE_TYPE(ssi_sd_state, SSI_SD)
 #define SSI_SDR_ADDRESS_ERROR   0x2000
 #define SSI_SDR_PARAMETER_ERROR 0x4000
 
+/* multiple block write */
+#define SSI_TOKEN_MULTI_WRITE   0xfc
+/* terminate multiple block write */
+#define SSI_TOKEN_STOP_TRAN     0xfd
 /* single block read/write, multiple block read */
 #define SSI_TOKEN_SINGLE        0xfe
 
@@ -94,6 +98,8 @@ OBJECT_DECLARE_SIMPLE_TYPE(ssi_sd_state, SSI_SD)
 static uint32_t ssi_sd_transfer(SSIPeripheral *dev, uint32_t val)
 {
     ssi_sd_state *s = SSI_SD(dev);
+    SDRequest request;
+    uint8_t longresp[16];
 
     /*
      * Special case: allow CMD12 (STOP TRANSMISSION) while reading data.
@@ -125,9 +131,31 @@ static uint32_t ssi_sd_transfer(SSIPeripheral *dev, uint32_t val)
             return SSI_DUMMY;
             break;
         case SSI_TOKEN_SINGLE:
+        case SSI_TOKEN_MULTI_WRITE:
             DPRINTF("Start write block\n");
             s->mode = SSI_SD_DATA_WRITE;
             return SSI_DUMMY;
+        case SSI_TOKEN_STOP_TRAN:
+            DPRINTF("Stop multiple write\n");
+
+            /* manually issue cmd12 to stop the transfer */
+            request.cmd = 12;
+            request.arg = 0;
+            s->arglen = sdbus_do_command(&s->sdbus, &request, longresp);
+            if (s->arglen <= 0) {
+                s->arglen = 1;
+                /* a zero value indicates the card is busy */
+                s->response[0] = 0;
+                DPRINTF("SD card busy\n");
+            } else {
+                s->arglen = 1;
+                /* a non-zero value indicates the card is ready */
+                s->response[0] = SSI_DUMMY;
+            }
+
+            s->mode = SSI_SD_RESPONSE;
+            s->response_pos = 0;
+            return SSI_DUMMY;
         }
 
         s->cmd = val & 0x3f;
@@ -136,8 +164,6 @@ static uint32_t ssi_sd_transfer(SSIPeripheral *dev, uint32_t val)
         return SSI_DUMMY;
     case SSI_SD_CMDARG:
         if (s->arglen == 4) {
-            SDRequest request;
-            uint8_t longresp[16];
             /* FIXME: Check CRC.  */
             request.cmd = s->cmd;
             request.arg = ldl_be_p(s->cmdarg);
-- 
2.25.1


