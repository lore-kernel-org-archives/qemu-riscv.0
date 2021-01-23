Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l3GMv-0003iJ-It
	for mharc-qemu-riscv@gnu.org; Sat, 23 Jan 2021 05:42:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l3GME-0003T2-I0; Sat, 23 Jan 2021 05:41:33 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:46474)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l3GLv-000373-6S; Sat, 23 Jan 2021 05:41:23 -0500
Received: by mail-pl1-x62e.google.com with SMTP id u11so4696559plg.13;
 Sat, 23 Jan 2021 02:41:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vMwNDhJzrNnSIXeq99hgPETYS9nHQnoJ/lsGNQKjl7o=;
 b=vAI90+uwkyzo2TYV1wvomtQHmfqHHOOKuB4LWWwQznOie+wU0RWBOntQ+uLne6RQ+G
 K/ab8eaWxpEVpM5kAR9yzAJVWKqKOqQXr6fri+6i/9CUXn/L6AqvEhAwuWFDDkvxU/kC
 3jbguS7amRH6HEgqpEtInI8yV2Khzv9zL68WoUxL4fUQp5n2HlwCaNAf5+Bl1OmMqnVy
 s6geM66MHxX6yl7mzCS7QS3T5bycJ7q+iFeo1i5RKw3jXOavRHsdyFAF6McrVURXyFFl
 7Z3iOPGdFumC6tAxKUDJhxuITTKIvhB28AZVV9gyzN5S7fWvJRnC3a8XB25+iRMefBSh
 2S9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vMwNDhJzrNnSIXeq99hgPETYS9nHQnoJ/lsGNQKjl7o=;
 b=O15PsXbhA5JUdLoFrPTn0LBAb1fbCBQVAqSrzuIQUeNWFZBSZkrECDudBQWO/utguE
 uaqmHNZgU9Dt1/lWq/MLjZW5dXtxiSBwts1/PTzYcYcpM5jIo0fdNG1a75a04IbnRV6y
 hjFLlet7mimF2fC7YNQCSdFKMo6+G1jMReOClg2IrNsv3PrVeDoelTBJxCu9mgGqGmBz
 eZn6RNtYZbUebrzANCKQQVzbfx9Frqsv2JMh0e8HzcMci9TILgVuUXerAxMG5yH/zgNC
 03Vtt4InQLFbimPn/e2T2nrLiGLfzQK7oIbdfchal5bxCk0he2AXBCrdUdi0ozyvogTK
 3eAA==
X-Gm-Message-State: AOAM533+B19/gTtZP3XKmti16IDRS6oBOyRLxrkPm+Bce4YvZkdgRhMW
 WAE0bD/7olbMnaoqKnUVRe4=
X-Google-Smtp-Source: ABdhPJwZWEaCFEbOKJjbxN+lhiPTuX0P6CzH8k0lDuOf6RGXRAzrkoRhgrv9yX5CNU42pFdcmXQhZQ==
X-Received: by 2002:a17:90a:7e82:: with SMTP id
 j2mr1850999pjl.217.1611398466523; 
 Sat, 23 Jan 2021 02:41:06 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id a5sm10575463pgl.41.2021.01.23.02.41.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Jan 2021 02:41:05 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v2 16/25] hw/sd: ssi-sd: Support single block write
Date: Sat, 23 Jan 2021 18:40:07 +0800
Message-Id: <20210123104016.17485-17-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210123104016.17485-1-bmeng.cn@gmail.com>
References: <20210123104016.17485-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Sat, 23 Jan 2021 10:41:45 -0000

From: Bin Meng <bin.meng@windriver.com>

Add 2 more states for the block write operation. The SPI host needs
to send a data start token to start the transfer, and the data block
written to the card will be acknowledged by a data response token.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>

---

Changes in v2:
- Correct the "token" typo in the commit message
- Add 'write_bytes' in vmstate_ssi_sd

 hw/sd/ssi-sd.c | 38 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 37 insertions(+), 1 deletion(-)

diff --git a/hw/sd/ssi-sd.c b/hw/sd/ssi-sd.c
index 75e76cf87a..240cfd919c 100644
--- a/hw/sd/ssi-sd.c
+++ b/hw/sd/ssi-sd.c
@@ -43,6 +43,8 @@ typedef enum {
     SSI_SD_DATA_START,
     SSI_SD_DATA_READ,
     SSI_SD_DATA_CRC16,
+    SSI_SD_DATA_WRITE,
+    SSI_SD_SKIP_CRC16,
 } ssi_sd_mode;
 
 struct ssi_sd_state {
@@ -53,6 +55,7 @@ struct ssi_sd_state {
     uint8_t response[5];
     uint16_t crc16;
     int32_t read_bytes;
+    int32_t write_bytes;
     int32_t arglen;
     int32_t response_pos;
     int32_t stopping;
@@ -85,6 +88,9 @@ OBJECT_DECLARE_SIMPLE_TYPE(ssi_sd_state, SSI_SD)
 /* dummy value - don't care */
 #define SSI_DUMMY               0xff
 
+/* data accepted */
+#define DATA_RESPONSE_ACCEPTED  0x05
+
 static uint32_t ssi_sd_transfer(SSIPeripheral *dev, uint32_t val)
 {
     ssi_sd_state *s = SSI_SD(dev);
@@ -113,10 +119,17 @@ static uint32_t ssi_sd_transfer(SSIPeripheral *dev, uint32_t val)
 
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
@@ -250,6 +263,27 @@ static uint32_t ssi_sd_transfer(SSIPeripheral *dev, uint32_t val)
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
@@ -287,6 +321,7 @@ static const VMStateDescription vmstate_ssi_sd = {
         VMSTATE_UINT8_ARRAY(response, ssi_sd_state, 5),
         VMSTATE_UINT16(crc16, ssi_sd_state),
         VMSTATE_INT32(read_bytes, ssi_sd_state),
+        VMSTATE_INT32(write_bytes, ssi_sd_state),
         VMSTATE_INT32(arglen, ssi_sd_state),
         VMSTATE_INT32(response_pos, ssi_sd_state),
         VMSTATE_INT32(stopping, ssi_sd_state),
@@ -340,6 +375,7 @@ static void ssi_sd_reset(DeviceState *dev)
     memset(s->response, 0, sizeof(s->response));
     s->crc16 = 0;
     s->read_bytes = 0;
+    s->write_bytes = 0;
     s->arglen = 0;
     s->response_pos = 0;
     s->stopping = 0;
-- 
2.25.1


