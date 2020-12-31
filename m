Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kuwAj-0007ri-2U
	for mharc-qemu-riscv@gnu.org; Thu, 31 Dec 2020 06:31:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kuwAX-0007nl-RO; Thu, 31 Dec 2020 06:31:04 -0500
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:46595)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kuwAQ-0007Io-Pp; Thu, 31 Dec 2020 06:30:58 -0500
Received: by mail-pf1-x42f.google.com with SMTP id s21so11118962pfu.13;
 Thu, 31 Dec 2020 03:30:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jsU6NpntSKPMJW0vV49hST2wNWRYHt6Bs3yCHxVUloM=;
 b=oYG/KfH4vL55XCFWv3pnEdaJDmUfOccpHUbnHlEMqTrE8hXaYXpH2hhk2E6Z12+MoP
 Di6w3MbnMOG3tND0yOG21IdtI6amkc0yWDTrHTi9NFVMibZwBPt9C5nM/vvQUiLRRvWz
 oLRWymYFnInhcFPNxkLwVvpCbfg8DhpMzRKrHVU9u/6YJ/CJW/ov/eMPswoaVlVl3+3U
 /UzwCdw1RYcoVX6jISH8XBPc19Hrb5EqXosfEkzHX7EHU4wZ9zEyqgezKN81bj8NIjrZ
 DLjElCj7HHJP15l67AdElbVzJIALDKdizfNbyd16krYDlz7nEIVVcO1IPx/JHYyUdyJ/
 5gmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jsU6NpntSKPMJW0vV49hST2wNWRYHt6Bs3yCHxVUloM=;
 b=CVxXrQ3KiVN1BFeuzA8dd7MdpkfLlxNv6gcW7JwQlyYK+W+d7EfULUpuMz9w7zGfsP
 CfKmM6FpJjGhLDbQ6UVbXikQNYAW3JvQaiQw4tFu2/D3WgqRb0fpnVwvTWcz3YrXqMyX
 Zmn9AZG1xM/cj2IJuRyJsPvALyxTZwE7gopSRzWoWn3Yf2z5z4/1H/6HdJaJE0/1vc8Z
 AHCBILYvuVaRicJqwuMGCqw5icss1kYgW6ukWGmpF8bGlnuryGygX44t/+N/F5nc9ltH
 vJFULLdSe4SS6W//0uhsZtNaerGhRY9rFVHatt8oKbdYC9Couko2foorEZm2Tgvs3Crz
 ZRCg==
X-Gm-Message-State: AOAM532XfcT+b9TLfLfk936+2Tuh0zc/79EmpJC8rx6ZF+fNn/lLODOx
 LNKvWZYmRNWMhDkgOlxKTeU=
X-Google-Smtp-Source: ABdhPJwPi3QvJRiEGKOClVEzk6+sMBoCq9jSm/Sz2L5Fa/4Oc3OX7fvtGP1aMU2VvkhCiJFObK955w==
X-Received: by 2002:a65:6713:: with SMTP id u19mr44219954pgf.364.1609414251527; 
 Thu, 31 Dec 2020 03:30:51 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id t23sm45957591pfc.0.2020.12.31.03.30.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Dec 2020 03:30:51 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>
Subject: [PATCH 08/22] hw/sd: ssi-sd: Support multiple block read (CMD18)
Date: Thu, 31 Dec 2020 19:29:56 +0800
Message-Id: <20201231113010.27108-9-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201231113010.27108-1-bmeng.cn@gmail.com>
References: <20201231113010.27108-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pf1-x42f.google.com
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
X-List-Received-Date: Thu, 31 Dec 2020 11:31:08 -0000

From: Bin Meng <bin.meng@windriver.com>

In the case of a multiple block read operation every transfered
block has its suffix of CRC16. Update the state machine logic to
handle multiple block read.

This also fixed the wrong command index for STOP_TRANSMISSION,
the required command to interupt the multiple block read command,
in the old codes. It should be CMD12 (0x4c), not CMD13 (0x4d).

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 hw/sd/ssi-sd.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/hw/sd/ssi-sd.c b/hw/sd/ssi-sd.c
index 10b0ac2eaf..889260bd8f 100644
--- a/hw/sd/ssi-sd.c
+++ b/hw/sd/ssi-sd.c
@@ -51,6 +51,7 @@ struct ssi_sd_state {
     uint8_t cmdarg[4];
     uint8_t response[5];
     uint16_t crc16;
+    int32_t read_bytes;
     int32_t arglen;
     int32_t response_pos;
     int32_t stopping;
@@ -82,7 +83,7 @@ static uint32_t ssi_sd_transfer(SSIPeripheral *dev, uint32_t val)
     ssi_sd_state *s = SSI_SD(dev);
 
     /* Special case: allow CMD12 (STOP TRANSMISSION) while reading data.  */
-    if (s->mode == SSI_SD_DATA_READ && val == 0x4d) {
+    if (s->mode == SSI_SD_DATA_READ && val == 0x4c) {
         s->mode = SSI_SD_CMD;
         /* There must be at least one byte delay before the card responds.  */
         s->stopping = 1;
@@ -200,8 +201,9 @@ static uint32_t ssi_sd_transfer(SSIPeripheral *dev, uint32_t val)
         return 0xfe;
     case SSI_SD_DATA_READ:
         val = sdbus_read_byte(&s->sdbus);
+        s->read_bytes++;
         s->crc16 = crc_ccitt_false(s->crc16, (uint8_t *)&val, 1);
-        if (!sdbus_data_ready(&s->sdbus)) {
+        if (!sdbus_data_ready(&s->sdbus) || s->read_bytes == 512) {
             DPRINTF("Data read end\n");
             s->mode = SSI_SD_DATA_CRC16;
         }
@@ -212,7 +214,12 @@ static uint32_t ssi_sd_transfer(SSIPeripheral *dev, uint32_t val)
         s->response_pos++;
         if (s->response_pos == 2) {
             DPRINTF("CRC16 read end\n");
-            s->mode = SSI_SD_CMD;
+            if (s->read_bytes == 512 && s->cmd != 17) {
+                s->mode = SSI_SD_DATA_START;
+            } else {
+                s->mode = SSI_SD_CMD;
+            }
+            s->read_bytes = 0;
             s->response_pos = 0;
         }
         return val;
@@ -252,6 +259,7 @@ static const VMStateDescription vmstate_ssi_sd = {
         VMSTATE_UINT8_ARRAY(cmdarg, ssi_sd_state, 4),
         VMSTATE_UINT8_ARRAY(response, ssi_sd_state, 5),
         VMSTATE_UINT16(crc16, ssi_sd_state),
+        VMSTATE_INT32(read_bytes, ssi_sd_state),
         VMSTATE_INT32(arglen, ssi_sd_state),
         VMSTATE_INT32(response_pos, ssi_sd_state),
         VMSTATE_INT32(stopping, ssi_sd_state),
@@ -304,6 +312,7 @@ static void ssi_sd_reset(DeviceState *dev)
     memset(s->cmdarg, 0, sizeof(s->cmdarg));
     memset(s->response, 0, sizeof(s->response));
     s->crc16 = 0;
+    s->read_bytes = 0;
     s->arglen = 0;
     s->response_pos = 0;
     s->stopping = 0;
-- 
2.25.1


