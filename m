Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kuwAo-00083C-Ja
	for mharc-qemu-riscv@gnu.org; Thu, 31 Dec 2020 06:31:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kuwAe-0007oN-FH; Thu, 31 Dec 2020 06:31:08 -0500
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:35264)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kuwAS-0007Ix-MX; Thu, 31 Dec 2020 06:31:04 -0500
Received: by mail-pg1-x52a.google.com with SMTP id n7so12976049pgg.2;
 Thu, 31 Dec 2020 03:30:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SSpkkpnZBFUJvtzyVxA8dwObjy/GwlHr5JuKuF1o9i8=;
 b=Yi0R8obiBq+xn3EKoiD9xmBdftJwaP8QLZI1uIlMZySdxcJHXo+YaznL5zg6zI4BY3
 Rgd3quFGxjvPSqaR/zX0PFLmZJHgYOnkI/ebDnctN8plGqXahEAZ9H40HKMYmjlBtSIf
 7Xm/pUCbqgl/+ay88glQ54ep4d2iq+x3cX8BSR2tRXdFudqwwwAgaA9fCfT0NsJ+NrFV
 LjMx1fg4LKBvCsYmAUxqgaJEz17j47GZM58UUnG+oipMVtmNfyg9QY9CLft3wq8G3aGU
 RL6G55lp2zSB5SdfMEZy1mgPJ5cNCH7pzjjCjsjOkVV3PAy3JAVea8iPw+VKURBgiysN
 OTMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SSpkkpnZBFUJvtzyVxA8dwObjy/GwlHr5JuKuF1o9i8=;
 b=X9XF9vLzOLNVFuOfjFxUXZm4l5lmjc3pRMYePWuG9lmubJYBX6fkVBdYH2qCXC/Vuk
 DH0vGKbDIWetqfEvzmpfSQvA2hK+cm/gS8Buswphoi+FdldusTKbaSYAbGfJ/E7SBLJg
 dlj++CfCur8TwgwTeXwbVbLJYaZTCv0UWGOqEwLJ35MGRNcICM/qD+y8/hlW5ppCn6Xb
 80HU+pAH54RNGOqiF3zd7C4q4At9wFyxXCfHtxhNfdfq3eUK4czYYgK4XsAzhNkaHUPU
 wVRAXmUfbzEEdY3o9+9/mOCwD6VGkCvdMYLYldk4AMfGkUOjFi+8fYtUFIuv9WDnFh9t
 3X+g==
X-Gm-Message-State: AOAM531xJrMF2v7NNcNCLMJEXCpNqnmIKmwfUpOR4CNpHdrbzH580Dp9
 lK54LCLFiltnsaUhafLcErdNT8pJwDc=
X-Google-Smtp-Source: ABdhPJwLnZOmZ2IeFnMcH9w/FKWgC5PG//W052OtddY/HASqhBrsYW8cyRnk8Taq55pK+NK6QWmPMw==
X-Received: by 2002:a63:d141:: with SMTP id c1mr41370870pgj.75.1609414254432; 
 Thu, 31 Dec 2020 03:30:54 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id t23sm45957591pfc.0.2020.12.31.03.30.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Dec 2020 03:30:54 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>
Subject: [PATCH 09/22] hw/sd: ssi-sd: Use macros for the dummy value and
 tokens in the transfer
Date: Thu, 31 Dec 2020 19:29:57 +0800
Message-Id: <20201231113010.27108-10-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201231113010.27108-1-bmeng.cn@gmail.com>
References: <20201231113010.27108-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pg1-x52a.google.com
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
X-List-Received-Date: Thu, 31 Dec 2020 11:31:10 -0000

From: Bin Meng <bin.meng@windriver.com>

At present the codes use hardcoded numbers (0xff/0xfe) for the dummy
value and block start token. Replace them with macros, and add more
tokens for multiple block write.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 hw/sd/ssi-sd.c | 30 +++++++++++++++++++++---------
 1 file changed, 21 insertions(+), 9 deletions(-)

diff --git a/hw/sd/ssi-sd.c b/hw/sd/ssi-sd.c
index 889260bd8f..8eb48550cf 100644
--- a/hw/sd/ssi-sd.c
+++ b/hw/sd/ssi-sd.c
@@ -78,6 +78,18 @@ OBJECT_DECLARE_SIMPLE_TYPE(ssi_sd_state, SSI_SD)
 #define SSI_SDR_ADDRESS_ERROR   0x2000
 #define SSI_SDR_PARAMETER_ERROR 0x4000
 
+/* reading and writing blocks start with these tokens and end with crc16 */
+
+/* multiple block write */
+#define SSI_TOKEN_MULTI_WRITE   0xfc
+/* terminate multiple block write */
+#define SSI_TOKEN_STOP_TRAN     0xfd
+/* single block read/write, multiple block read */
+#define SSI_TOKEN_SINGLE        0xfe
+
+/* dummy value - don't care */
+#define SSI_DUMMY               0xff
+
 static uint32_t ssi_sd_transfer(SSIPeripheral *dev, uint32_t val)
 {
     ssi_sd_state *s = SSI_SD(dev);
@@ -91,14 +103,14 @@ static uint32_t ssi_sd_transfer(SSIPeripheral *dev, uint32_t val)
 
     switch (s->mode) {
     case SSI_SD_CMD:
-        if (val == 0xff) {
+        if (val == SSI_DUMMY) {
             DPRINTF("NULL command\n");
-            return 0xff;
+            return SSI_DUMMY;
         }
         s->cmd = val & 0x3f;
         s->mode = SSI_SD_CMDARG;
         s->arglen = 0;
-        return 0xff;
+        return SSI_DUMMY;
     case SSI_SD_CMDARG:
         if (s->arglen == 4) {
             SDRequest request;
@@ -173,14 +185,14 @@ static uint32_t ssi_sd_transfer(SSIPeripheral *dev, uint32_t val)
         } else {
             s->cmdarg[s->arglen++] = val;
         }
-        return 0xff;
+        return SSI_DUMMY;
     case SSI_SD_PREP_RESP:
         s->mode = SSI_SD_RESPONSE;
-        return 0xff;
+        return SSI_DUMMY;
     case SSI_SD_RESPONSE:
         if (s->stopping) {
             s->stopping = 0;
-            return 0xff;
+            return SSI_DUMMY;
         }
         if (s->response_pos < s->arglen) {
             DPRINTF("Response 0x%02x\n", s->response[s->response_pos]);
@@ -193,12 +205,12 @@ static uint32_t ssi_sd_transfer(SSIPeripheral *dev, uint32_t val)
             DPRINTF("End of command\n");
             s->mode = SSI_SD_CMD;
         }
-        return 0xff;
+        return SSI_DUMMY;
     case SSI_SD_DATA_START:
         DPRINTF("Start read block\n");
         s->mode = SSI_SD_DATA_READ;
         s->response_pos = 0;
-        return 0xfe;
+        return SSI_TOKEN_SINGLE;
     case SSI_SD_DATA_READ:
         val = sdbus_read_byte(&s->sdbus);
         s->read_bytes++;
@@ -225,7 +237,7 @@ static uint32_t ssi_sd_transfer(SSIPeripheral *dev, uint32_t val)
         return val;
     }
     /* Should never happen.  */
-    return 0xff;
+    return SSI_DUMMY;
 }
 
 static int ssi_sd_post_load(void *opaque, int version_id)
-- 
2.25.1


