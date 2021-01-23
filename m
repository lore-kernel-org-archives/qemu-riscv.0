Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l3GMm-0003be-Og
	for mharc-qemu-riscv@gnu.org; Sat, 23 Jan 2021 05:42:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l3GLl-0003EC-MV; Sat, 23 Jan 2021 05:41:01 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:36942)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l3GLg-00032z-Ij; Sat, 23 Jan 2021 05:41:01 -0500
Received: by mail-pl1-x631.google.com with SMTP id q2so1958868plk.4;
 Sat, 23 Jan 2021 02:40:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=B58xplxCooU/F15C0BemwLKQ+JY8xrgit1LkcRDbVyo=;
 b=uvu9tZz3bny3rIfJV3MH4SYrF56Q8vDO7r+9qPEA2tobJsP7l+/cLG5muX0X5K5l70
 UAeVHPgXzJeD1xKV3e6DFHyL93iRRP/Dz4qyj061wKi0nG0orqgi76M5mD2hq0TPgt+w
 cQKHcZhEknwklnFdHXarfrdPRvGJndcOaoYwmVbvv1n6MFhcFSYphFy8biufnQR+/iiB
 bbYKQ33jQmIGWUaExvz+cNdws4D/sMqs9ACetYaiCxDXXdPs/GMTktbjGRnqe+FzFYG9
 Ne6nmuWJvQ9nY+NludUctGJ88Aqa/cHG9rx5hdQLWQ60OoFbCXAyKvZ7JRbaZumoa2o8
 xvcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=B58xplxCooU/F15C0BemwLKQ+JY8xrgit1LkcRDbVyo=;
 b=YO62NRKudmKlz47EGswZPNaTUrAAoW6K7J1Spa25kV+JvGEbqUWJNs8kHCS7syJe1j
 Hg2EeDn5GqDtvNpj9cn233ITm6hyAJjNdWXpIWVMigDR/QU/Q7P/oldqW7mzgS/AdOY/
 DnpIKPUltb+QbuReGT96fyOP8lA9ZaS67Eb8DLhmdnKgl9F4yZlUDMxSH4kT00ypBHPr
 B6LRulRyNyMZabZQ72yAl5dvA1aijNhb/pzQz82CeUoR80KA8lFa+ZXo5hZl/a/H8tHx
 u50A5MjB88hF4yxFdU55y5GTKq5NY+FbYpPWMoO9cPvdrKLgGYLBqk8ZGvvkj5/d8+U/
 ZRNw==
X-Gm-Message-State: AOAM532zXSfvAfqzpNHOrdh4ImHaiHKAEiXdjwuOs0OBQ13uRSjSYZZL
 3Mj+/qHamB9ijMQjxoEo2t0=
X-Google-Smtp-Source: ABdhPJxCM/i2LBRaGZlqrHPRdlnMCt39qiH4FWLFueXc4MiszGAtmH8muhP5xe7LoI8SCHZaY+fVdQ==
X-Received: by 2002:a17:90a:3b04:: with SMTP id
 d4mr10433113pjc.48.1611398453341; 
 Sat, 23 Jan 2021 02:40:53 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id a5sm10575463pgl.41.2021.01.23.02.40.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Jan 2021 02:40:52 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v2 11/25] hw/sd: ssi-sd: Use macros for the dummy value and
 tokens in the transfer
Date: Sat, 23 Jan 2021 18:40:02 +0800
Message-Id: <20210123104016.17485-12-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210123104016.17485-1-bmeng.cn@gmail.com>
References: <20210123104016.17485-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x631.google.com
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
X-List-Received-Date: Sat, 23 Jan 2021 10:41:02 -0000
X-List-Received-Date: Sat, 23 Jan 2021 10:41:02 -0000

From: Bin Meng <bin.meng@windriver.com>

At present the codes use hardcoded numbers (0xff/0xfe) for the dummy
value and block start token. Replace them with macros.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

---

Changes in v2:
- Move multiple write token definitions out of this patch

 hw/sd/ssi-sd.c | 26 ++++++++++++++++----------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/hw/sd/ssi-sd.c b/hw/sd/ssi-sd.c
index c1532b004b..75e76cf87a 100644
--- a/hw/sd/ssi-sd.c
+++ b/hw/sd/ssi-sd.c
@@ -79,6 +79,12 @@ OBJECT_DECLARE_SIMPLE_TYPE(ssi_sd_state, SSI_SD)
 #define SSI_SDR_ADDRESS_ERROR   0x2000
 #define SSI_SDR_PARAMETER_ERROR 0x4000
 
+/* single block read/write, multiple block read */
+#define SSI_TOKEN_SINGLE        0xfe
+
+/* dummy value - don't care */
+#define SSI_DUMMY               0xff
+
 static uint32_t ssi_sd_transfer(SSIPeripheral *dev, uint32_t val)
 {
     ssi_sd_state *s = SSI_SD(dev);
@@ -107,14 +113,14 @@ static uint32_t ssi_sd_transfer(SSIPeripheral *dev, uint32_t val)
 
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
@@ -189,15 +195,15 @@ static uint32_t ssi_sd_transfer(SSIPeripheral *dev, uint32_t val)
         } else {
             s->cmdarg[s->arglen++] = val;
         }
-        return 0xff;
+        return SSI_DUMMY;
     case SSI_SD_PREP_RESP:
         DPRINTF("Prepare card response (Ncr)\n");
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
@@ -210,16 +216,16 @@ static uint32_t ssi_sd_transfer(SSIPeripheral *dev, uint32_t val)
             DPRINTF("End of command\n");
             s->mode = SSI_SD_CMD;
         }
-        return 0xff;
+        return SSI_DUMMY;
     case SSI_SD_PREP_DATA:
         DPRINTF("Prepare data block (Nac)\n");
         s->mode = SSI_SD_DATA_START;
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
@@ -246,7 +252,7 @@ static uint32_t ssi_sd_transfer(SSIPeripheral *dev, uint32_t val)
         return val;
     }
     /* Should never happen.  */
-    return 0xff;
+    return SSI_DUMMY;
 }
 
 static int ssi_sd_post_load(void *opaque, int version_id)
-- 
2.25.1


