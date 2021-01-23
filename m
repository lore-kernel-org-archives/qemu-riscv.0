Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l3GM2-0003Qh-1j
	for mharc-qemu-riscv@gnu.org; Sat, 23 Jan 2021 05:41:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l3GLj-00037Y-H6; Sat, 23 Jan 2021 05:40:59 -0500
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:41701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l3GLd-00031J-ME; Sat, 23 Jan 2021 05:40:59 -0500
Received: by mail-pg1-x530.google.com with SMTP id i7so5588990pgc.8;
 Sat, 23 Jan 2021 02:40:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UmirUUOo4XgCFDxKI72dYVTFEGJcAFOI3F2A4yCDIsE=;
 b=LNw9GtvHw18EE5vAh3D0RUEwbKnkIdsT6mKJCs2fEKUc4jFX/NMt5VkHBwZNqCCoz1
 5sgRdCUV0r704Sw/W2jRdbMHVM/fhP3+feSyr2z4CROMp4AYcSWaY3wComf3HSFQaMe8
 u6hvrnI0qAugwrpGMF2lB3PbVL7IRIaWerOOh8DMpRzXwg4zSjhAAIwPnb11fnxBYoFn
 F2lAq4yYK3LlUurOwIBhacisW9/OZVX+/UPd2th27WnXeYXVm2d+H6N9Px9jmUsnaJ5v
 7oAj5msiIPA4LiQQkr3ydGk0IpepCL/b65FNd7cBy7ScC/Sra0JOuw1qK8EnAvfbqx7q
 fypg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UmirUUOo4XgCFDxKI72dYVTFEGJcAFOI3F2A4yCDIsE=;
 b=to6x4U78cYFMkGZKcCGJL23YwLFlU4DLXegtYW1Hytp1y9w6mXjSyGk2wCN6C0ZgSU
 H+R3mnxYK9bZw07NI/DCtpplMNP0ayT2fgfj0YHkiufx8sujGY6nd1F7u121lHh6H7rO
 x0peoO+NlRCrB2D62kHEB850dZhVEKfNf3Xmmvz7vPshwSW9cHr0UshmYeL2iRJwFUL6
 1lo3jVggV8r9sBqMl5HAet6vS0Suqlysr41XmTcxX2UX4CIS9htrSYKw+atJLety1Fn0
 IfoSOTJj61ZLyhf/4vVEzsdhMpvakiFJv35Yb/jBHcTpG6Ps+s9m9S/PotIpBUUM+CPA
 p3/w==
X-Gm-Message-State: AOAM530RPDB8zDL7v8tBwWsmJShvuuabujF1IP1yJFhnHyCrRL10ryAG
 rOeAZxpk+gd568chN+qc+8EX6w4whKWpjQ==
X-Google-Smtp-Source: ABdhPJzyCq25Q/DRU2NyWXeZI41Q2iQ5thb0Uqyf0vCB+jFIx17lRMZU3AhKRthm5pAoS4zOAp/6dg==
X-Received: by 2002:a65:6a12:: with SMTP id m18mr3050066pgu.178.1611398450873; 
 Sat, 23 Jan 2021 02:40:50 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id a5sm10575463pgl.41.2021.01.23.02.40.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Jan 2021 02:40:50 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v2 10/25] hw/sd: ssi-sd: Support multiple block read
Date: Sat, 23 Jan 2021 18:40:01 +0800
Message-Id: <20210123104016.17485-11-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210123104016.17485-1-bmeng.cn@gmail.com>
References: <20210123104016.17485-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pg1-x530.google.com
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
X-List-Received-Date: Sat, 23 Jan 2021 10:41:00 -0000

From: Bin Meng <bin.meng@windriver.com>

In the case of a multiple block read operation every transferred
block has its suffix of CRC16. Update the state machine logic to
handle multiple block read.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>

---

Changes in v2:
- Fix 2 typos in the commit message
- Add a comment block to explain the CMD12 timing
- Catch CMD12 in all of the data read states per the timing requirement

 hw/sd/ssi-sd.c | 38 +++++++++++++++++++++++++++++++-------
 1 file changed, 31 insertions(+), 7 deletions(-)

diff --git a/hw/sd/ssi-sd.c b/hw/sd/ssi-sd.c
index 9e2f13374a..c1532b004b 100644
--- a/hw/sd/ssi-sd.c
+++ b/hw/sd/ssi-sd.c
@@ -52,6 +52,7 @@ struct ssi_sd_state {
     uint8_t cmdarg[4];
     uint8_t response[5];
     uint16_t crc16;
+    int32_t read_bytes;
     int32_t arglen;
     int32_t response_pos;
     int32_t stopping;
@@ -82,11 +83,26 @@ static uint32_t ssi_sd_transfer(SSIPeripheral *dev, uint32_t val)
 {
     ssi_sd_state *s = SSI_SD(dev);
 
-    /* Special case: allow CMD12 (STOP TRANSMISSION) while reading data.  */
-    if (s->mode == SSI_SD_DATA_READ && val == 0x4c) {
-        s->mode = SSI_SD_CMD;
-        /* There must be at least one byte delay before the card responds.  */
-        s->stopping = 1;
+    /*
+     * Special case: allow CMD12 (STOP TRANSMISSION) while reading data.
+     *
+     * See "Physical Layer Specification Version 8.00" chapter 7.5.2.2,
+     * to avoid conflict between CMD12 response and next data block,
+     * timing of CMD12 should be controlled as follows:
+     *
+     * - CMD12 issued at the timing that end bit of CMD12 and end bit of
+     *   data block is overlapped
+     * - CMD12 issued after one clock cycle after host receives a token
+     *   (either Start Block token or Data Error token)
+     *
+     * We need to catch CMD12 in all of the data read states.
+     */
+    if (s->mode >= SSI_SD_PREP_DATA && s->mode <= SSI_SD_DATA_CRC16) {
+        if (val == 0x4c) {
+            s->mode = SSI_SD_CMD;
+            /* There must be at least one byte delay before the card responds */
+            s->stopping = 1;
+        }
     }
 
     switch (s->mode) {
@@ -206,8 +222,9 @@ static uint32_t ssi_sd_transfer(SSIPeripheral *dev, uint32_t val)
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
@@ -218,7 +235,12 @@ static uint32_t ssi_sd_transfer(SSIPeripheral *dev, uint32_t val)
         s->response_pos++;
         if (s->response_pos == 2) {
             DPRINTF("CRC16 read end\n");
-            s->mode = SSI_SD_CMD;
+            if (s->read_bytes == 512 && s->cmd != 17) {
+                s->mode = SSI_SD_PREP_DATA;
+            } else {
+                s->mode = SSI_SD_CMD;
+            }
+            s->read_bytes = 0;
             s->response_pos = 0;
         }
         return val;
@@ -258,6 +280,7 @@ static const VMStateDescription vmstate_ssi_sd = {
         VMSTATE_UINT8_ARRAY(cmdarg, ssi_sd_state, 4),
         VMSTATE_UINT8_ARRAY(response, ssi_sd_state, 5),
         VMSTATE_UINT16(crc16, ssi_sd_state),
+        VMSTATE_INT32(read_bytes, ssi_sd_state),
         VMSTATE_INT32(arglen, ssi_sd_state),
         VMSTATE_INT32(response_pos, ssi_sd_state),
         VMSTATE_INT32(stopping, ssi_sd_state),
@@ -310,6 +333,7 @@ static void ssi_sd_reset(DeviceState *dev)
     memset(s->cmdarg, 0, sizeof(s->cmdarg));
     memset(s->response, 0, sizeof(s->response));
     s->crc16 = 0;
+    s->read_bytes = 0;
     s->arglen = 0;
     s->response_pos = 0;
     s->stopping = 0;
-- 
2.25.1


