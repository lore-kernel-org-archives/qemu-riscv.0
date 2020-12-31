Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kuwAt-0008Ex-56
	for mharc-qemu-riscv@gnu.org; Thu, 31 Dec 2020 06:31:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kuwAo-00083R-Mv; Thu, 31 Dec 2020 06:31:18 -0500
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:40159)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kuwAm-0007O4-So; Thu, 31 Dec 2020 06:31:18 -0500
Received: by mail-pf1-x435.google.com with SMTP id x126so11130465pfc.7;
 Thu, 31 Dec 2020 03:31:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EmlivLosd2IMSstdGdEwY8MJ34lojrakc2lBg6ahP/o=;
 b=uohyBcVeMZS8uMAZ4kY/C/T7T+df2jofTIxc7Q+ilvlHmZUb7hUWJ9GakjXUgnHkJI
 BK4COW3ph8uWa1k/z62ARdkSYhOhL8ioOFeWkkT7b9F8p2VH01ACUSoGvKuvBbHQpB3H
 I31D1ONyNXxMdl1178Cp4UvktzFyqjEZXWFCry0Tk7LsGqYybrBHxZlfnLo70CvW/SP6
 amHuwQu9u1MZrqKPxrI+ptOtdGi7qxHSsV/upPXP88Evtm7nDu0NrEU/hA+N7bevOp2R
 pjEHWjYt9TghkiZXoyx/BjMl3i5a3oUF+PDKKqvJn3IeqEEHyWfDAm5OrOmBdfxbh6TT
 GMHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EmlivLosd2IMSstdGdEwY8MJ34lojrakc2lBg6ahP/o=;
 b=o8HoWOp/uE/2m9+YdDDQqCZv5cG2JBjjflIo6e06csDr2jjlHOfVDo4Tf9Gs15iynp
 e7T2OIhaABrcQYo3vqYO+2gNFvEkrs6Egccj6lQC+j/Q52hZR+oA8Ml/IKMexkoi+IwD
 t+5cdvhD73iUCUq+hXVIogpOp5ckIhQIbXPdfgKqBw1wFsA3uK6q5EU53J+fG24FDFsN
 zqcaH6hJswWslFfVHL36r5JRyvASNehzUnsG5QlcCeeXEtMi71I15FNXV1nrstluS9Z8
 IQj5gYnngtwOBtMsJ2g6xmsPasWd5lOA6AVtv7YcCLV6riDV2SHFfYTjYLhUVJsEpVZS
 O+lw==
X-Gm-Message-State: AOAM530WE22owFphSNPGrVHN38iEU7XWqoYkNPi/eREtbRno6fJT3vGj
 nPA38GpUa7ank1CWtDZmoWM=
X-Google-Smtp-Source: ABdhPJyHoLL//vNwiS2Z0vOqWI8Yyp30V7LbvaTavaywmCKlm0iWurqIARlJ4XS94xOrdX12WtSkaA==
X-Received: by 2002:a62:b415:0:b029:1a6:8b06:68f4 with SMTP id
 h21-20020a62b4150000b02901a68b0668f4mr52849271pfn.43.1609414271520; 
 Thu, 31 Dec 2020 03:31:11 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id t23sm45957591pfc.0.2020.12.31.03.31.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Dec 2020 03:31:11 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>
Subject: [PATCH 15/22] hw/sd: ssi-sd: Support multiple block write
Date: Thu, 31 Dec 2020 19:30:03 +0800
Message-Id: <20201231113010.27108-16-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201231113010.27108-1-bmeng.cn@gmail.com>
References: <20201231113010.27108-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pf1-x435.google.com
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
X-List-Received-Date: Thu, 31 Dec 2020 11:31:19 -0000

From: Bin Meng <bin.meng@windriver.com>

For a multiple block write operation, each block begins with a multi
write start token. Unlike the SD mode that the multiple block write
ends when receiving a STOP_TRAN command (CMD12), a special stop tran
tocken is used to signal the card.

Emulating this by manually sending a CMD12 to the SD card core, to
bring it out of the receiving data state.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 hw/sd/ssi-sd.c | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/hw/sd/ssi-sd.c b/hw/sd/ssi-sd.c
index 21a96e91f0..6cf5d749c7 100644
--- a/hw/sd/ssi-sd.c
+++ b/hw/sd/ssi-sd.c
@@ -99,6 +99,8 @@ OBJECT_DECLARE_SIMPLE_TYPE(ssi_sd_state, SSI_SD)
 static uint32_t ssi_sd_transfer(SSIPeripheral *dev, uint32_t val)
 {
     ssi_sd_state *s = SSI_SD(dev);
+    SDRequest request;
+    uint8_t longresp[16];
 
     /* Special case: allow CMD12 (STOP TRANSMISSION) while reading data.  */
     if (s->mode == SSI_SD_DATA_READ && val == 0x4c) {
@@ -115,9 +117,31 @@ static uint32_t ssi_sd_transfer(SSIPeripheral *dev, uint32_t val)
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
@@ -126,8 +150,6 @@ static uint32_t ssi_sd_transfer(SSIPeripheral *dev, uint32_t val)
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


